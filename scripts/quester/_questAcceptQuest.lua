_questAcceptQuest = {

	noQuestTimer = GetTimeEX();
}

function _questAcceptQuest:run()

	if IsMoving() or not PlayerHasTarget() then

		self.noQuestTimer = GetTimeEX() + 7000;
	end

	if (_quest.distToGiver <= 4) and (_quest.currentQuest == nil) and not IsMoving() then

		if HasForm() then
			RemoveForm();
			return true;
		end

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

			_quest:setTimer(600); 

			_quest.curQuestGiver = GetTarget();

			if PlayerHasTarget() then

				if GetTarget():GetUnitName() == _quest.curQuestGiver then
					if GetTimeEX() >= self.noQuestTimer then
						_questDBHandleDB:turnQuestCompleted();
						self.noQuestTimer = GetTimeEX() + 7000;
					end
				end

				if (GetTarget():UnitInteract()) then

					_quest:setTimer(600);

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
		
		if GetTarget() == _questDB:getQuestGiverName() and GetTarget():IsInLineOfSight() then
			_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = GetTarget():GetPosition();
		end

		return;
	end
end