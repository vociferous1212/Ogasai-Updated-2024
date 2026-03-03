_questSetQuest = {}

function _questSetQuest:setOurCurrentQuest()

	-- set our current quest
	for y=0, _questDB.numQuests -1 do

		if GetNumQuestLogEntries() ~= nil and GetNumQuestLogEntries() ~= 0 then
			for u=0, GetNumQuestLogEntries() do
				local questDescription, questObjectives2 = GetQuestLogQuestText(u);				
					if _questDB.questList[y]['desc'] == _questDB.curDesc then
				end
			end
		end
			-- get the objectives for the quest to match in DB
			local questDescription, questObjectives = GetQuestLogQuestText(y);

			-- if the quest is not completed
			if _questDB.questList[y]['completed'] == "no" then

				-- if the quest hasn't been completed double check
				if _questDB.questList[y]['questName'] ~= "nnil" then

					-- bot doesn't seem to want to do a proper check without calling the title again
					for i=0, GetNumQuestLogEntries() do

						-- get quest information
						local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(i);

						-- if quest log title
						if title == _questDB.questList[y]['questName'] then

							-- set our variables for bot to run quester on ( it may already do this )

							_quest.currentDesc = questObjectives;

							_quest.gossipOption = _questDB.questList[i]['gossipOption'];

							_quest.currentMapID = _questDB.questList[i]['mapID'];

							_quest.currentType = _questDB.questList[i]['type'];

							_quest.usingItem = _questDB.questList[i]['useItem'];

							if _questMenuEX.questToRunByIndex == -1 then
								if _quest.currentQuest ~= title then
									DEFAULT_CHAT_FRAME:AddMessage(
									"1Quest Started - |cffffa500" ..
									(title or "Unknown") ..
									"|r  (index |cffffff00" .. y .. "|r)"
								)
								end

								_quest.currentQuest = title;
								_questDB.currentIndex = y;
							elseif _questMenuEX.questToRunByIndex ~= -1 then
								if _questDB.curDesc ~= _questDB.questList[_questMenuEX.questToRunByIndex]['desc'] then
									DEFAULT_CHAT_FRAME:AddMessage(
									"2Quest Started - |cffffa500" ..
									(_questDB.questList[_questMenuEX.questToRunByIndex]['questName'] or "Unknown") ..
									"|r  (index |cffffff00" .. _questMenuEX.questToRunByIndex .. "|r)"
								)
								end

							_quest.currentQuest = _questDB.questList[_questMenuEX.questToRunByIndex]['questName'];
							_questDB.currentIndex = _questMenuEX.questToRunByIndex;
							end

							

							--[[
							if not _quest.weHaveQuest then
								DEFAULT_CHAT_FRAME:AddMessage(
								"Quest Started - |cffffa500" ..
								(_quest.currentQuest or "Unknown") ..
								"|r  (index |cffffff00" .. _questDB.currentIndex .. "|r)"
								)
							end
							--]]

							_quest.weHaveQuest = true;

							_questDBGatherGetInventory:getItemsInInventory();

						end
					end
				end	
			
		end
	end
end