grind2RunCombatState = {

	autoAttackTimer = GetTimeEX(),		-- timer for auto attack default 1.5seconds set in script

	timer = GetTimeEX(),

	blacklistTargetTimer = GetTimeEX(),

	blacklistTargetTimerSet = false,

	timeToBlacklistTarget = 30


}

function grind2RunCombatState:run()

-- set variables

	local currentTime = GetTimeEX();
	
	local player = GetLocalPlayer();

	local x, y, z = player:GetPosition();

	local _x, _y, _z = 0, 0, 0;

	local enemyTarget = nil;

-- if target is not dead and we can attack it
	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then

		enemyTarget = grind2.enemyTarget;

		-- TEMPORARY - old combat helper to make combat scripts run somewhat decent
		if IsInCombat() then
			script_combatHelper:run()
		end

		-- stuck looting?
		if IsLooting() then LootTarget(); end

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
			
			-- set blacklist target timer
			if PlayerHasTarget() and not IsInCombat() and not self.blacklistTargetTimerSet then
				self.blacklistTargetTimer = currentTime + self.timeToBlacklistTarget * 1000;
				self.blacklistTargetTimerSet = true;
			end

			-- reset blacklist target timer
			if IsInCombat() then
				self.blacklistTargetTimerSet = false;
				self.blacklistTargetTimer = currentTime * 2;
			end

			-- add target to blacklist
			if PlayerHasTarget() and not IsInCombat() and currentTime >= self.blacklistTargetTimer then
				if not IsCasting() and not IsChanneling() and not IsEating() and not IsDrinking() then
					if not grind2Blacklisting:isTargetBlacklisted(enemyTarget:GetGUID()) then
						grind2Blacklisting:addTargetToBlacklist(enemyTarget:GetGUID())
						self.blacklistTargetTimer = currentTime + self.timeToBlacklistTarget * 1000;
						ClearTarget();
					end
				end
			end

			-- last target targeted
			if enemyTarget ~= nil and enemyTarget ~= 0 then
				if grind2.lastTargetTargeted ~= 0 and grind2.lastTargetTargeted ~= nil then
					if not grind2.lastTargetTargeted:IsDead() then
						grind2.lastTargetTargetedGUID = enemyTarget:GetGUID();
						grind2.lastTargetTargeted = enemyTarget;
					end
				end
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

		-- TEMPORARY move to target
		-- stop moving when we get to target and in melee range
		if not IsCasting() and not IsChanneling() and not IsLooting() and IsStanding() and not script_checkDebuffs:hasDisabledMovement() then
			if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
				_x, _y, _z = grind2.enemyTarget:GetPosition();
			end
			if script_grind.combatError == 3 then
				if _x ~= 0 and x ~= 0 and enemyTarget:GetDistance() > .5 and not enemyTarget:IsDead() and enemyTarget:CanAttack() then
					grind2MoveToTarget:run(player, _x, _y, _z);
					grind2.timer = 0;
					self.timer = 0;
					script_grind.combatError = nil;
				end
				return false;
			else
				script_grind.combatError = nil;
			end
		end
	end

	self.timer = currentTime + grind2AdjustTimersMenu.combatScriptTimer + 50;

return true;
end