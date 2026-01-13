grind2RunCombatState = {

	autoAttackTimer = GetTimeEX(),		-- timer for auto attack default 1.5seconds set in script

	timer = GetTimeEX(),

	blacklistTargetTimer = GetTimeEX(),

	blacklistTargetTimerSet = false,

	timeToBlacklistTarget = 10


}

function grind2RunCombatState:run()

-- set variables

	local currentTime = GetTimeEX();
	
	local player = GetLocalPlayer();

	local x, y, z = player:GetPosition();

	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
		_x, _y, _z = grind2.enemyTarget:GetPosition();
	end

	local enemyTarget = nil;

-- if target is not dead and we can attack it
	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then

		enemyTarget = grind2.enemyTarget;

		_x, _y, _z = enemyTarget:GetPosition();

		-- TEMPORARY - old combat helper to make combat scripts run somewhat decent
		if IsInCombat() then
			script_combatHelper:run()
		end

		if enemyTarget:CanAttack() and not enemyTarget:IsDead() then

			-- stand up if sitting
			if not IsStanding() then

				JumpOrAscendStart();
			end

			-- auto attack / target the target
			if ( (GetMyClass() ~= "HUNTER" and not IsAutoCasting("Auto Shot")) or (GetMyClass() ~= "HUNTER" and not IsStealth() and not IsAutoCasting("Attack")) ) and currentTime > self.autoAttackTimer then

				enemyTarget:AutoAttack();
				self.autoAttackTimer = currentTime + 2000;
			end

			-- reset blacklist target timer
			if IsInCombat() or IsMoving() then
				self.blacklistTargetTimerSet = false;
				self.blacklistTargetTimer = currentTime * 2;
			end

			-- add target to blacklist
			if PlayerHasTarget() and not IsMoving() and not IsInCombat() and currentTime >= self.blacklistTargetTimer then
				if not IsCasting() and not IsChanneling() and not IsEating() and not IsDrinking() and (enemyTarget:GetDistance() > grind2.combatScriptRange or not enemyTarget:IsInLineOfSight()) then
					if not grind2Blacklisting:isTargetBlacklisted(enemyTarget:GetGUID()) then
						grind2Blacklisting:addTargetToBlacklist(enemyTarget:GetGUID())
						self.blacklistTargetTimer = currentTime + self.timeToBlacklistTarget * 1000;
						ClearTarget();
					end
				end
			end

			-- set blacklist target timer
			if PlayerHasTarget() and not self.blacklistTargetTimerSet then
				self.blacklistTargetTimerSet = true;
				self.blacklistTargetTimer = currentTime + self.timeToBlacklistTarget * 1000;
			end

			-- move to target
			--if x ~= nil and _x ~= nil then
			--	if enemyTarget:GetDistance() > grind2.combatScriptRange or not enemyTarget:IsInLineOfSight() then			--		grind2MoveToTarget:run(localObj, _x, _y, _z);
			--	end
			--end

			-- TEMPORARY move to target
			-- stop moving when we get to target and in melee range
			if GetMyClass() ~= "HUNTER" and GetMyClass() ~= "MAGE" and enemyTarget:GetHealthPercentage() >= 97 and enemyTarget:GetDistance() <= grind2.combatScriptRange - 2 and enemyTarget:IsInLineOfSight() then
				if IsMoving() then
					StopMoving();
				end
			elseif script_grind.combatError == 3 or grind2.combatScriptReturn == "MOVE TO TARGET" or GetDistance3D(x, y, z, _x, _y, _z) > grind2.combatScriptRange then
				if _x ~= 0 and x ~= 0 then
					grind2MoveToTarget:run(player, _x, _y, _z);
				end
			else
				script_grind.combatError = nil;
			end

			-- last target targeted
			if enemyTarget ~= nil and enemyTarget ~= 0 then
				grind2.lastTargetTargetedGUID = enemyTarget:GetGUID();
				grind2.lastTargetTargeted = enemyTarget;
			end

			-- TEMPORARY run old combat helper
			if IsInCombat() then
				script_combatHelper:run()
			end

			-- TEMPORARY run old combat error
			script_grind.combatError = RunCombatScript(enemyTarget:GetGUID());

			-- run currently loaded combat script
			--RunCombatScript(enemyTarget:GetGUID());
		end
	end

	self.timer = currentTime + grind2AdjustTimersMenu.combatScriptTimer;
return true;
end