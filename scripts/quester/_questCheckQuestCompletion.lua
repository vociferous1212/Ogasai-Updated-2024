_questCheckQuestCompletion = {}

function _questCheckQuestCompletion:checkQuestForCompletion()

	local isItCompleted = false;

-- check quest for completion
	if _quest.currentQuest ~= nil and (not IsInCombat()) then
		for i=0, _questDB.numQuests -1 do
			if _questDB.questList[i]['completed'] ~= "nnil" then
				
				if _quest.currentQuest == _questDB.questList[i]['questName'] then
					for y=0, GetNumQuestLogEntries() do
						local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(y);
						if title == _questDB.questList[i]['questName'] then
							if isComplete == 1 then
								isItCompleted = true;
							end
						end
					end	
					if _questDB.questList[i]['type'] == 0 or isItCompleted then
						_quest.isQuestComplete = true;
					end
					if _questDB.questList[i]['type'] == 1 then
						if _questDB.questList[i]['targetName'] ~= 0 and _questDB.questList[i]['targetName2'] == 0 then
							if _quest.targetKilledNum >= _questDB.questList[i]['numKill'] or isItCompleted then
								_quest.isQuestComplete = true;
							end
						end
						if _questDB.questList[i]['targetName'] ~= 0 and _questDB.questList[i]['targetName2'] ~= 0 then
							if _questDB.questList[i]['numKill'] == _quest.targetKilledNum and _questDB.questList[i]['numKill2'] == _quest.targetKilledNum2 then	
								if (_quest.targetKilledNum >= _questDB.questList[i]['numKill'] and _quest.targetKilledNum2 >= _questDB.questList[i]['numKill2']) or isItCompleted then
									_quest.isQuestComplete = true;
								end
							end
						end
					end
					--if _questDB.questList[i]['gatherName'] ~= 0 and _questDB.questList[i]['gatherName2'] == 0 then
					-- if _questDB.questList[i]['numGather'] == _quest.targetGatherNum then
					--end
					--if _questDB.questList[i]['gatherName'] ~= 0 and _questDB.questList[i]['gatherName2'] ~= 0 then
					-- if _questDB.questList[i]['numGather'] == _quest.targetGatherNum and _questDB.questList[i]['numGather2'] == _quest.targetGatherNum2 then		
					--end
			
				end
			end	
		end
	end
end