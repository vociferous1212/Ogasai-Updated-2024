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

	local xx, yy, zz = 0, 0, 0;

	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
		xx, yy, zz = grind2.enemyTarget:GetPosition();
	end

	local localObj = GetLocalPlayer();

	local enemyTarget = nil;

-- if target is not dead and we can attack it
	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then

		enemyTarget = grind2.enemyTarget;

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
			--if x ~= nil and xx ~= nil then
			--	if enemyTarget:GetDistance() > grind2.combatScriptRange or not enemyTarget:IsInLineOfSight() then			--		grind2MoveToTarget:run(localObj, xx, yy, zz);
			--	end
			--end

			-- TEMPORARY move to target
			if script_grind.combatError == 3 or grind2.combatScriptReturn == "MOVE TO TARGET" then
				grind2MoveToTarget:run(localObj, xx, yy, zz);
				-- causing stuttering but without a timer somewhere the nav locks up
				--grind2:setTimer(100);
			end
		
			-- last target targeted
			if enemyTarget ~= nil and enemyTarget ~= 0 then 
				grind2.lastTargetTargetedGUID = enemyTarget:GetGUID();
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