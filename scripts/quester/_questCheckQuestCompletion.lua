_questCheckQuestCompletion = {}

-- 0 already completed quest

-- 1 killing quest

-- 2 gather/killing combined if there is a target listed it will prioritize them

-- 3 regular use item at x, y, z pos quest then return

-- 4 use item then go to quest pos which is return

-- 5 have an item but need to use it elsewhere to complete

function _questCheckQuestCompletion:checkQuestForCompletion()

	local isItCompleted = false;

	local questDescription, questObjectives = GetQuestLogQuestText();

	-- check quest for completion
	if _quest.currentQuest ~= nil and (not IsInCombat()) then

		for i=0, _questDB.numQuests -1 do

			if _questDB.questList[i]['completed'] == "no" then
				
				if _quest.currentQuest == _questDB.questList[i]['questName'] and questObjectives == _questDB.curDesc then
					for y=0, GetNumQuestLogEntries() do

						local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, sfrequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(y);

						if title == _questDB.questList[i]['questName'] then

							if (isComplete == 1) or (_questDB.questList[i]['type'] == 0) or (_quest.currentType == 5 and not HasItem(_quest.usingItem) and _quest.currentQuest == title) then


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
				