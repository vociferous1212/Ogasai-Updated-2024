_questDBHandleDB = {

	currentIndexQuest = 0,

	waitTimer = GetTimeEX(),

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

				if _questDB.questList[i]['questName'] == _questDB.curListQuest and _questDB.questList[i]['desc'] == _questDB.curDesc then
					if _questDB.questList[i]['completed'] == "no" and _questDB.questList[i]['questName'] ~= "nnil" then
						DEFAULT_CHAT_FRAME:AddMessage("Quest marked as complete - ".._questDB.curListQuest);

						--ToFile("".._questDB.curListQuest.." - completed");

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
return false;
end

function _questDBHandleDB:turnOldQuestCompleted()

	_questDBHandleDB:sortThroughQuestBasedOnCurrentQuestLogQuest()

	if (not _quest.isQuestCompleted) then

		for i=0, _questDB.numQuests -1 do

		local questDescription, questObjectives = GetQuestLogQuestText(i);
			local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(i);



				if _questDB.questList[i]['questName'] ~= "nnil" then

					if _questDB.questList[i]['questName'] == _questDB.curListQuest then

						if _questDB.questList[i]['desc'] == _questDB.curDesc then

							if _questDB.questList[i]['questName'] ~= title then

								if _quest.currentDesc ~= _questDB.curDesc then

									if _questDB.questList[i]['desc'] ~= _quest.currentDesc and GetNumQuestLogEntries() > 0 then

										if questObjectives ~= _questDB.questList[i]['desc'] and GetObjectiveText(i) ~= _questDB.questList[i]['desc'] then

											local questToComplete = i

											DEFAULT_CHAT_FRAME:AddMessage("Old quest marked as complete - ".._questDB.questList[i]['questName']);

											_questDB.questList[questToComplete]['completed'] = "nnil";

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
return false;
end

function _questDBHandleDB:sortThroughQuestBasedOnCurrentQuestLogQuest()

	if self.waitTimer > GetTimeEX() then return; end
	local currentIndex = -1

	-- Safety checks
	if not _questDB or type(_questDB) ~= "table" then
		DEFAULT_CHAT_FRAME:AddMessage("|cffff0000ERROR: _questDB missing/invalid|r")
		return
	end
	if not _questDB.questList or type(_questDB.questList) ~= "table" then
		DEFAULT_CHAT_FRAME:AddMessage("|cffff0000ERROR: questList missing/invalid|r")
		return
	end
	if not _questDB.numQuests or _questDB.numQuests < 1 then
		DEFAULT_CHAT_FRAME:AddMessage("|cffff0000ERROR: No quests in DB|r")
		return
	end

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
			   and (dbQuest.completed or "") ~= "nnil"
			   and GetMapID() == dbMapID
			then
				DEFAULT_CHAT_FRAME:AddMessage(
					"Current Index == " .. self.currentIndexQuest ..
					" | Quest doesn't matches any log entry → marking complete: " ..
					"|cffff0000" .. dbName .. "|r" ..
					" (table index - " .. i .. ")"
				)

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
	