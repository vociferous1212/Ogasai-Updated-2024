_questSetQuest = {}

function _questSetQuest:setOurCurrentQuest()

	-- set our current quest
	for y=0, _questDB.numQuests -1 do

		-- get our quest log entry number to check (bot currently only does 1 at a time)
		for i=0, GetNumQuestLogEntries()  do

			-- get the objectives for the quest to match in DB
			local questDescription, questObjectives = GetQuestLogQuestText();

			-- if the quest is not completed
			if _questDB.questList[y]['completed'] == "no" then

				-- if the quest hasn't been completed double check
				if _questDB.questList[y]['questName'] ~= "nnil" then

					-- bot doesn't seem to want to do a proper check without calling the title again
					for i=0, GetNumQuestLogEntries()  do

						-- get quest information
						local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(i);

						-- if quest log title
						if title == _questDB.questList[y]['questName'] then
							_quest.currentDesc = questObjectives; _quest.gossipOption = _questDB.questList[i]['gossipOption'];
							_quest.currentQuest = title;
							_quest.weHaveQuest = true;
						end
					end
				end	
			end
		end
	end
end