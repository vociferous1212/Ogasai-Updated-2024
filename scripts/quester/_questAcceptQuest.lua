_questAcceptQuest = {}

function _questAcceptQuest:run()

	if (_quest.distToGiver <= 4) and (_quest.currentQuest == nil) then
		if _quest.curQuestGiver ~= nil then
			TargetByName(_quest.curQuestGiver);
			_quest:setTimer(2000); 
			_quest.curQuestGiver = GetTarget();

			if (GetTarget() ~= nil) and (GetTarget() ~= 0) then
				if (GetTarget():UnitInteract()) then
					_quest:setTimer(2000);

					if GetTarget() == nil then
						StopMoving();
					return;
					end

					if (AcceptQuest()) then
						local questDescription, questObjectives = GetQuestLogQuestText(1);
						_quest.currentQuest = _quest.curQuestName;
						_quest.currentDesc = questObjectives;
						_questDB.curDesc = questObjectives;
					else
						SelectGossipAvailableQuest(_quest.gossipOption);
						SelectAvailableQuest(_quest.gossipOption);
					end
				end
			end
		end
	return;
	end

	if GetTarget() == _questDB:getQuestGiverName() then
		_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = GetTarget():GetPosition();
	end


end