_questCheckQuestCompletion = {}

function _questCheckQuestCompletion:checkQuestForCompletion()

	local isItCompleted = false;

	local questDescription, questObjectives = GetQuestLogQuestText();

	-- check quest for completion
	if _quest.currentQuest ~= nil and (not IsInCombat()) then

		for i=0, _questDB.numQuests -1 do

			if _questDB.questList[i]['completed'] == "no" then
				
				if _quest.currentQuest == _questDB.questList[i]['questName'] and questObjectives == _questDB.curDesc then
					for y=0, GetNumQuestLogEntries() do

						local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(y);

						if title == _questDB.questList[i]['questName'] then

							if isComplete == 1 or _questDB.questList[i]['type'] == 0 then

								_quest.isQuestComplete = true;

							else

								_quest.isQuestComplete = false;

							end
						end
					end
				end
			end
		end
	end

return false;
end
				