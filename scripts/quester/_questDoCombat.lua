_questDoCombat = {waitTimer = 0, blacklistTimer = 0, targetingTimer = 0}

function _questDoCombat:doCombat()

	-- don't do anything if we are busy
	if IsChanneling() or IsCasting() then
	
	return;
	end

if not _quest.isQuestComplete and script_grind:enemiesAttackingUs() > 2 or (GetLocalPlayer():GetHealthPercentage() < 5 and IsInCombat()) then if script_navEX:moveToTarget(GetLocalPlayer(), _quest.curQuestX, _quest.curQuestY, _quest.curQuestZ) then _quest.message = "Running out of combat"; return true; end return true; end


	-- run combat on good targets
	if (_quest.enemyTarget ~= nil and _quest.enemyTarget ~= 0) or IsInCombat() then

		-- get a target if we have none
		if (PlayerHasTarget()) and _quest.enemyTarget == nil or _quest.enemyTarget == 0 then

			_quest.enemyTarget = GetTarget();

		end

		-- reset blacklist target timer
		if (PlayerHasTarget() and IsInCombat()) or (PlayerHasTarget() and GetTarget():IsDead()) or IsMoving() then
			self.blacklistTimer = GetTimeEX() + 10000;
		end

		-- we are in combat or we have a target
		if IsInCombat() and (_quest.enemyTarget ~= nil or _quest.enemyTarget == nil) then

			-- clear target if it is not tapped by me (don't attack others targets)
			if GetTarget() ~= 0 and GetTarget() ~= nil then
				if GetTarget():IsTapped() and not GetTarget():IsTappedByMe() then

					ClearTarget();
				
					_quest.enemyTarget = nil;
				
				end

			end

			if (_quest.enemyTarget ~= nil) and (_questDBTargets:getTargetAttackingUs() ~= nil) and not script_grind:isTargetingMe(_quest.enemyTarget) and script_grind:enemiesAttackingUs() < 3 then

				if (_questDBTargets:getTargetAttackingUs() ~= _quest.enemyTarget:GetGUID()) then

					_quest.enemyTarget = _questDBTargets:getTargetAttackingUs();

				end

			elseif (_quest.enemyTarget == nil) and _quest.currentType ~= 3 and _quest.currentType ~= 4 then

				_quest.enemyTarget = _questDBTargets:getTargetAttackingUs();

			end
		end

		-- if target is a quest target then count +1
		if _quest.currentQuest ~= 0 and _quest.enemyTarget ~= nil then

			for i=0, _questDB.numQuests -1 do

				if _quest.currentQuest == _questDB.questList[i]['questName'] then

					if _quest.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName']

						or _quest.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName2'] then

						if _quest.enemyTarget:IsDead() and not _questDBTargets:isTargetAddedToKilledTable(_quest.enemyTarget:GetGUID()) then

							if _quest.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName'] then

								_questDBTargets:addTargetToKilledTable(_quest.enemyTarget:GetGUID());

								_quest.targetKilledNum = _quest.targetKilledNum + 1;

							end

							if _quest.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName2'] then

								_questDBTargets:addTargetToKilledTable(_quest.enemyTarget:GetGUID());

								_quest.targetKilledNum2 = _quest.targetKilledNum2 + 1;

							end

							if _quest.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName3'] then

								_questDBTargets:addTargetToKilledTable(_quest.enemyTarget:GetGUID());

								_quest.targetKilledNum3 = _quest.targetKilledNum3 + 1;

							end

						end
					end
				end
			end
		end


		-- if target is dead then clear enemytarget var
		if (_quest.enemyTarget ~= nil and _quest.enemyTarget ~= 0) and (_quest.enemyTarget:IsDead()) then

			local x, y, z = _quest.enemyTarget:GetPosition();

			if (_quest.enemyTarget:GetDistance() > 5) then

				script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);

				return;

			else

				if not script_grind:isAnyTargetTargetingMe() then
				_quest:setTimer(500);
				ClearTarget();
				_quest.enemyTarget = nil;
				end

			end
		end
		
		-- get a new target if it's closer
		if GetTimeEX() > self.targetingTimer and self.enemyTarget == nil then

			self.enemyTarget = _questDBTargets:getTarget();

			self.targetingTimer = GetTimeEX() + 3500;

		end

		_questDoCombat:getLowestHealthTargetAttackingUs();

		if GetPet() ~= 0 and GetPet() ~= nil and GetPet():GetUnitsTarget() ~= nil and GetPet():GetUnitsTarget() ~= 0 and  GetTarget() ~= 0 and GetTarget() ~= nil then
			if GetPet():GetUnitsTarget():GetGUID() ~= GetTarget():GetGUID() then
				_quest.enemyTarget = GetPet():GetUnitsTarget();
			end
		end

		-- do something
		if _quest.enemyTarget ~= nil and _quest.enemyTarget ~= 0 then

			if not _quest.enemyTarget:IsDead() and _quest.enemyTarget:CanAttack() then

				_quest.message = "Running Combat ".._quest.enemyTarget:GetUnitName()..", "..math.floor(_quest.enemyTarget:GetDistance()).." (yd)";

				if IsInCombat() and not IsMoving() then

					if _quest.enemyTarget:GetDistance() <= script_grind.combatScriptRange then

						_quest.enemyTarget:AutoAttack();

					end

				_quest.enemyTarget:FaceTarget();

				end

				RunCombatScript(_quest.enemyTarget:GetGUID());

				-- move to target
				if (_quest.enemyTarget ~= nil and _quest.enemyTarget:GetDistance() > script_grind.combatScriptRange) or (not _quest.enemyTarget:IsInLineOfSight() and _quest.enemyTarget:GetDistance() > 6) and not IsCasting() and not IsChanneling() then

					local x, y, z = _quest.enemyTarget:GetPosition();

					script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);

					if not IsMoving() and not IsInCombat() and _quest.enemyTarget ~= nil and GetTimeEX() > self.blacklistTimer then

						script_grind:addTargetToHardBlacklist(_quest.enemyTarget:GetGUID())

						DEFAULT_CHAT_FRAME:AddMessage("Cannot find a path to target and 10 seconds have passed... Automatically Blacklisting ".._quest.enemyTarget:GetUnitName()..", "..math.floor(_quest.enemyTarget:GetDistance()).." (yd), Time: "..GetTimeStamp().."");

						ClearTarget();

						_quest.enemyTarget = nil;

						self.blacklistTimer = GetTimeEX() + 10000;
	
					end

				return;
				end
			end
		end
	
	end
end

-- get the lowest health target in combat with us
function _questDoCombat:getLowestHealthTargetAttackingUs()

	local bestTarget = nil;


	local i, t = GetFirstObject();

	while i ~= 0 do

		if t == 3 and not i:IsCritter() and not i:IsDead() and i:GetHealthPercentage() >= 1 and i:CanAttack() and script_grind:isTargetingMe(i) and script_grind:enemiesAttackingUs() > 1 and _quest.enemyTarget ~= 0 and _quest.enemyTarget ~= nil and not _quest.enemyTarget:IsDead() then

			local hp = _quest.enemyTarget:GetHealthPercentage();

			local ihp = i:GetHealthPercentage();

			if ihp < hp then

				if PlayerHasTarget() and GetLocalPlayer():GetUnitsTarget():GetGUID() ~= i:GetGUID() then

					_quest.enemyTarget = i;

					bestTarget = i;

				end

			end

		end

	i, t = GetNextObject(i);

	end

return bestTarget;
end