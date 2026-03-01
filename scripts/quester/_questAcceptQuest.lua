_questAcceptQuest = {

	noQuestTimer = GetTimeEX();
}

function _questAcceptQuest:run()

	if IsMoving() or not PlayerHasTarget() or _quest.curQuestGiver == nil then

		self.noQuestTimer = GetTimeEX() + 8000;
	end

	if _quest.curQuestGiver ~= nil then
		if PlayerHasTarget() then
			if GetTarget():GetUnitName() == _quest.curQuestGiver then
				if GetTimeEX() >= self.noQuestTimer then
					_questDBHandleDB:turnQuestCompleted();
					self.noQuestTimer = GetTimeEX() + 10000;
				end
			end
		end
	end

	if (_quest.distToGiver <= 4) and (_quest.currentQuest == nil) and not IsMoving() then

		_quest.grindSpotReached = false;

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

				
				if (GetTarget():UnitInteract()) then

					_quest:setTimer(1000);

					if GetTarget() == nil then

						StopMoving();

					return;
					end

					local quest1, quest1Level, quest2, quest2Level, quest3, quest3Level, _, _, _, _ = GetGossipAvailableQuests()
					local gossipOption = 1;
					if PlayerHasTarget() then

						if (quest1 ~= nil and (quest1 and quest2 and quest3) ~= _questDB.curListQuest)
						and (GetObjectiveText() ~= nil and _questDB.curDesc ~= GetObjectiveText()) then
							CloseQuest();
						--	_questDBHandleDB:turnQuestCompleted();
							--_quest.waitTimer = GetTimeEX() + 3000;
						_questAcceptQuest.noQuestTimer = 7000;
						end

						if GetGossipAvailableQuests() ~= nil and quest2 == nil then
							gossipOption = 1;
						end

						if quest2 ~= nil then
							if quest1 == _questDB.curListQuest then
								gossipOption = 1;
							elseif quest2 == _questDB.curListQuest then
								gossipOption = 2;
							elseif quest3 == _questDB.curListQuest then
								gossipOption = 3;
							end
						end
					end

					if GetGossipAvailableQuests() == nil then
						gossipOption = _quest.gossipOption
					end

					if PlayerHasTarget() then 
						if (AcceptQuest()) then

							local questDescription, questObjectives = GetQuestLogQuestText(1);
							_quest.currentQuest = _quest.curQuestName;
							_quest.currentDesc = questObjectives;
							_questDB.curDesc = questObjectives;

						else

							SelectGossipAvailableQuest(gossipOption);
							SelectAvailableQuest(gossipOption);
						end
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