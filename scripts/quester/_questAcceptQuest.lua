_questAcceptQuest = {}

function _questAcceptQuest:run()

	if (_quest.distToGiver <= 4) and (_quest.currentQuest == nil) and not IsMoving() then

		if HasForm() then RemoveForm(); return true; end

		local px, py, pz = GetLocalPlayer():GetPosition();
			-- set return target name
			local name = _quest.curQuestGiver;

			if GetTarget() ~= 0 and GetTarget() ~= nil then
	
			-- if target is quest return target
				if GetTarget():GetUnitName() == name and GetTarget():IsInLineOfSight() then
	
					-- chase moving quest targets... get their position again
				_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = GetTarget():GetPosition();
	
				end
			end
		
		if _quest.curQuestGiver ~= nil then
			TargetByName(_quest.curQuestGiver);
			_quest:setTimer(1200); 
			_quest.curQuestGiver = GetTarget();

			if (GetTarget() ~= nil) and (GetTarget() ~= 0) then
				if (GetTarget():UnitInteract()) then
					_quest:setTimer(1200);

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

	if GetTarget() == _questDB:getQuestGiverName() and GetTarget():IsInLineOfSight() then
		_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = GetTarget():GetPosition();
	end


end