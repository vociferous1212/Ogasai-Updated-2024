_questDBHandleDB = {

	currentIndexQuest = 0,

	waitTimer = GetTimeEX(),

	currentQuestBeingChecked = nil,

}

function _questDBHandleDB:turnQuestCompleted()

	local questDescription, questObjectives = GetQuestLogQuestText();

	if _questDB.curListQuest ~= nil then

		for i=0, _questDB.numQuests -1 do

			local questDescription, questObjectives = GetQuestLogQuestText(i);


			if (_questDB.questList[i]['desc'] == _quest.currentDesc)

			or (_questDB.questList[i]['desc'] == _questDB.curDesc and _quest.currentQuest == nil)

			or (questObjectives == nil and _quest.currentQuest ~= _questDB.curListQuest)

			or (_quest.isQuestCompleted and GetNumQuestLogEntries() < 1) then

				local title = nil;
				for a = 0, GetNumQuestLogEntries() do
					title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(a);
				end
				if title ~= _questDB.curListQuest then
					if _questDB.questList[i]['questName'] == _questDB.curListQuest and _questDB.questList[i]['desc'] == _questDB.curDesc then
						if _questDB.questList[i]['completed'] == "no" and _questDB.questList[i]['questName'] ~= "nnil" then
						DEFAULT_CHAT_FRAME:AddMessage(
						"Quest marked as complete - |cffff0000" .. 
						(_questDB.curListQuest or "Unknown") .. 
						"|r  (index |cff00aaff" .. i .. "|r) - Check Log Files"
						)
							ToFile("	QUESTER - Completed - ".._questDB.curListQuest);

							_questDB.curListQuest = nil;

							_questDB.curDesc = nil;

							_quest.currentQuest = nil;

							_questDB.questList[i]['completed'] = "nnil";
			
							CloseQuest();

							_quest.weHaveQuest = false;

							_quest.questIsComplete = false;

							_quest.grindSpotReached = false;

							--_questDB.questList[i]['questName'] = "nnil";
							_quest.curGrindX, _quest.curGrindY, _quest.curGrindZ = _questDB:getQuestGrindPos();
							_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = _questDB:getQuestStartPos();

						return true;
						end
					end
				end
			end
		end
	end
return false;
end

function _questDBHandleDB:turnOldQuestCompleted()

	if _questMenuEX.questToRunByIndex == -1 then
		_questDBHandleDB:sortThroughQuestBasedOnCurrentQuestLogQuest()
	end

	if (not _quest.isQuestCompleted) then

		for i=0, _questDB.numQuests -1 do

		local questDescription, questObjectives = GetQuestLogQuestText(i);
			local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(i);


				if _questMenuEX.questToRunByIndex ~= i then
				if _questDB.questList[i]['completed'] ~= "nnil" then

					if _questDB.questList[i]['questName'] == _questDB.curListQuest then

						if _questDB.questList[i]['desc'] == _questDB.curDesc then

							if _questDB.questList[i]['questName'] ~= title then

								if _quest.currentDesc ~= _questDB.curDesc then

									if _questDB.questList[i]['desc'] ~= _quest.currentDesc and GetNumQuestLogEntries() > 0 then

										if questObjectives ~= _questDB.questList[i]['desc'] and GetObjectiveText(i) ~= _questDB.questList[i]['desc'] then

											self.currentQuestBeingChecked = _questDB.questList[i]['name'];

											DEFAULT_CHAT_FRAME:AddMessage("Old quest marked as complete - |cffff0000" .. _questDB.questList[i]['questName'] .. "|r")
											
											_questDB.questList[i]['completed'] = "nnil";

											_questDB.curListQuest = nil;

											_questDB.curDesc = nil;

											_quest.currentQuest = nil;
	
											_quest.curGrindX, _quest.curGrindY, _quest.curGrindZ = _questDB:getQuestGrindPos();

											_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = _questDB:getQuestStartPos();

											_quest:setTimer(25)

										return true;
										end
									end
								end
							end
						end
					end
				end
			end	
		end
	end
return false;
end

function _questDBHandleDB:sortThroughQuestBasedOnCurrentQuestLogQuest()

	if self.waitTimer > GetTimeEX() then return; end
	local currentIndex = -1



	-- Helper: safe normalize (collapse whitespace, trim)
	local function normalize_text(text)
		if not text or text == "" then return "" end
		text = string.gsub(text, "%s+", " ")
		text = string.gsub(text, "^%s+", "")
		text = string.gsub(text, "%s+$", "")
		return text
	end

	-- Find current quest index
	for i = 0, _questDB.numQuests - 1 do
		local entry = _questDB.questList[i]
		if entry and entry.desc and entry.desc == _quest.currentDesc then
			currentIndex = i
			self.currentIndexQuest = i;
			break
		end
	end

	if currentIndex == -1 then
		return
	end

	-- Scan log: title → set of normalized descs seen under this title
	local logByTitle = {}
	local numLogEntries = GetNumQuestLogEntries()

	for logIdx = 1, numLogEntries do
		SelectQuestLogEntry(logIdx)
		local title, _, _, isHeader = GetQuestLogTitle(logIdx)
		if title and title ~= "" and not isHeader then
			local _, objectives = GetQuestLogQuestText(logIdx)
			local normObj = normalize_text(objectives or "")

			if not logByTitle[title] then
				logByTitle[title] = {}
			end

			if normObj ~= "" then
				logByTitle[title][normObj] = true
			else
				-- If objectives empty but title present → mark title as "seen" (fallback protection)
				logByTitle[title]["_title_only_"] = true
			end
		end
	end

	-- Check DB quests after current
	for i = currentIndex + 1, _questDB.numQuests - 1 do
		local dbQuest = _questDB.questList[i]
		if not dbQuest or type(dbQuest) ~= "table" then
			-- skip
		else
			local dbName  = dbQuest.questName or "???"
			local dbDesc  = dbQuest.desc or ""
			local dbMapID = dbQuest.mapID or 0

			local normDbDesc = normalize_text(dbDesc)

			local isStillInLog = false

			if logByTitle[dbName] then
				local descsForTitle = logByTitle[dbName]

				if descsForTitle[normDbDesc] then
					-- Exact desc match under this title → definitely still present
					isStillInLog = true
				elseif descsForTitle["_title_only_"] then
					-- Objectives were empty for some entry with this title → conservative: assume possibly still there
					isStillInLog = true
				end
				-- If neither → and title exists but no matching desc → treat as gone (different quest with same title)
			end

			if not isStillInLog
				and _quest.currentQuest ~= nil
			   and (dbQuest.completed or "") ~= "nnil"
			   and GetMapID() == dbMapID
			then
				DEFAULT_CHAT_FRAME:AddMessage(
				"|cffff9900" .. _quest.currentQuest .. "|r  " ..
				"Index == |cff00ff00" .. self.currentIndexQuest .. "|r" ..
				" | Quest in DB index order doesn't match any quest log entry → marking previous quests complete in numerical order: " ..
				"Completed |cffff0000" .. dbName .. "|r" ..
				" Index == |cff00aaff" .. i .. "|r"
				)

				self.currentQuestBeingChecked = dbQuest.name;
				dbQuest.completed = "nnil"

				_quest.curGrindX, _quest.curGrindY, _quest.curGrindZ = _questDB:getQuestGrindPos()
				_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = _questDB:getQuestStartPos()
				_quest.grindSpotReached = false;

				_quest.waitTimer = GetTimeEX() + 200;
				self.waitTimer = GetTimeEX() + 200;
				_quest.tickRate = 0
				return true
			end
		end
	end
return false;
end
	