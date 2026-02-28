_questDBHandleDB = {}

function _questDBHandleDB:turnQuestCompleted()

	local questDescription, questObjectives = GetQuestLogQuestText();

	if _questDB.curListQuest ~= nil then

		for i=0, _questDB.numQuests -1 do

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
	local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(1);


	if (not _quest.isQuestCompleted) then

		for i=0, _questDB.numQuests -1 do

		local questDescription, questObjectives = GetQuestLogQuestText(i);

			if _questDB.questList[i]['completed'] == "no" then

				if _questDB.questList[i]['questName'] ~= "nnil" then

					if _questDB.questList[i]['questName'] == _questDB.curListQuest then

						if _questDB.questList[i]['desc'] == _questDB.curDesc and _quest.currentDesc ~= questObjectives then

							if _questDB.questList[i]['questName'] ~= title then

								if _quest.currentDesc ~= _questDB.curDesc then

									if _questDB.questList[i]['desc'] ~= _quest.currentDesc and GetNumQuestLogEntries() > 0 then

										if questObjectives ~= _questDB.questList[i]['desc'] and GetObjectiveText(i) ~= _questDB.questList[i]['desc'] and questObjectives ~= _questDB.questList[i]['desc'] then

											local questToComplete = i

											DEFAULT_CHAT_FRAME:AddMessage("Old quest marked as complete - ".._questDB.curListQuest);

											_questDB.questList[questToComplete]['completed'] = "nnil";

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