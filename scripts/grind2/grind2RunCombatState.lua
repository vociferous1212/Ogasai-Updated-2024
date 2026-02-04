grind2RunCombatState = {

	autoAttackTimer = GetTimeEX(),		-- timer for auto attack default 1.5seconds set in script

	timer = GetTimeEX(),

	blacklistTargetTimer = GetTimeEX(),		-- blacklist if we have had a target for too long and not in combat

	blacklistTargetTimerSet = false,

	timeToBlacklistTarget = 30,

	blacklistTargetTimer2 = GetTimeEX() * 2		-- blacklist if we haven't moved for too long


}

function grind2RunCombatState:run()

-- set variables
	-- current game time
	local currentTime = GetTimeEX();
	
	--player
	local player = GetLocalPlayer();

	-- my position
	local x, y, z = player:GetPosition();

	-- enemy position
	local _x, _y, _z = 0, 0, 0;

	-- local script enemy target
	local enemyTarget = nil;

-- if target is not dead and we can attack it
	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then

		-- the grind2 script enemy target is this scripts enemyTarget
		enemyTarget = grind2.enemyTarget;

		-- TEMPORARY - old combat helper to make combat scripts run somewhat decent
		if IsInCombat() then
			
			-- run the combat helper
			script_combatHelper:run()
		end

		-- stuck looting?
		if IsLooting() then

			-- do loot
			LootTarget();
		end

		-- if we can attack the target and it is not dead
		if enemyTarget:CanAttack() and not enemyTarget:IsDead() then

			-- stand up if sitting
			if not IsStanding() then

				-- jump
				JumpOrAscendStart();
			end

			-- auto attack / target the target
			if ( (GetMyClass() ~= "HUNTER" and not IsAutoCasting("Auto Shot")) or (GetMyClass() ~= "HUNTER" and not IsStealth() and not IsAutoCasting("Attack")) ) and currentTime > self.autoAttackTimer then

				-- auto attack the target
				enemyTarget:AutoAttack();

				-- reset the timer so we don't spam auto attack
				self.autoAttackTimer = currentTime + 2000;
			end
			
			-- set blacklist target timer if we have a target and not in combat
			if PlayerHasTarget() and not IsInCombat() and not self.blacklistTargetTimerSet then

				-- set timer
				self.blacklistTargetTimer = currentTime + self.timeToBlacklistTarget * 1000;

				-- timer has been set
				self.blacklistTargetTimerSet = true;
			end

			-- if we are in combat then reset blacklist target timer
			if IsInCombat() then

				-- timer has not been set
				self.blacklistTargetTimerSet = false;

				-- reset the timer
				self.blacklistTargetTimer = currentTime * 2;
			end

			-- if we haven't moved for greater than 15 seconds then blacklist the target anyways
			if PlayerHasTarget() and not IsInCombat() and not IsMoving() and currentTime >= self.blacklistTargetTimer2 then
				
				-- if target is not already blacklisted
				if not grind2Blacklisting:isTargetBlacklisted(enemyTarget:GetGUID()) then

					-- add target to blacklist
					grind2Blacklisting:addTargetToBlacklist(enemyTarget:GetGUID())

					-- reset timer to 15 seconds
					self.blacklistTargetTimer2 = currentTime + 15 * 1000;

					-- clear the blacklisted target
					ClearTarget();
				end

			-- else if we are moving or in combat then reset the timer back to 15 seconds
			elseif IsMoving() or IsInCombat() or IsCasting() or IsChanneling() or IsEating() or IsDrinking() or not IsStanding() then

				-- reset the blacklist timer
				self.blacklistTargetTimer2 = currentTime + 15 * 1000;
			end


			-- add target to blacklist if we have a target and are not in combat
			if PlayerHasTarget() and not IsInCombat() and currentTime >= self.blacklistTargetTimer then

				-- if we are not casting or channeling a spell and not eating or drinking, or anything else
				if not IsCasting() and not IsChanneling() and not IsEating() and not IsDrinking() then

					-- if target is not already blacklisted
					if not grind2Blacklisting:isTargetBlacklisted(enemyTarget:GetGUID()) then

						-- add that target to blacklist
						grind2Blacklisting:addTargetToBlacklist(enemyTarget:GetGUID())

						-- reset the blacklist timer
						self.blacklistTargetTimer = currentTime + self.timeToBlacklistTarget * 1000;

						-- clear the blacklisted target
						ClearTarget();
					end
				end
			end

			-- last target targeted if we have a good target
			if enemyTarget ~= nil and enemyTarget ~= 0 then

				-- and last target is valid
				if grind2.lastTargetTargeted ~= 0 and grind2.lastTargetTargeted ~= nil then

					-- and last target is not dead
					if not grind2.lastTargetTargeted:IsDead() then

						-- last target is current target
						-- set GUID
						grind2.lastTargetTargetedGUID = enemyTarget:GetGUID();

						-- wow units, object manager target
						grind2.lastTargetTargeted = enemyTarget;
					end
				end
			end

			-- TEMPORARY run old combat helper
			if IsInCombat() then

				-- run combat helper
				script_combatHelper:run()
			end

			-- TEMPORARY run old combat error
			script_grind.combatError = RunCombatScript(enemyTarget:GetGUID());

			-- run currently loaded combat script
			--RunCombatScript(enemyTarget:GetGUID());
		end

		-- TEMPORARY move to target
		-- if we are not casting or channeling or looting, and standing and can move then
		if not IsCasting() and not IsChanneling() and not IsLooting() and IsStanding() and not script_checkDebuffs:hasDisabledMovement() then

			-- have a valid enemy target
			if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then

				-- get the targets positions
				_x, _y, _z = grind2.enemyTarget:GetPosition();
			end

			-- stop moving if we have reached a target
			if IsInCombat() and PlayerHasTarget() then
				if GetTarget():GetDistance() <= 1.5 then
					if GetTarget():GetDistance() > .5 then
						if GetTarget():GetHealthPercentage() >= 20 then
							if IsMoving() then
								StopMoving();
								script_grind.combatError = nil;
								return false;
							end
						end
					end
				end
			end

			-- combat error == 3 from combat script
			if script_grind.combatError == 3 then

				-- valid coordinates and target distance is greater than .5 yards, enemy is not dead and we can attack it then
				if _x ~= 0 and x ~= 0 and enemyTarget:GetDistance() > .5 and not enemyTarget:IsDead() and enemyTarget:CanAttack() then

					-- move to the target
					grind2MoveToTarget:run(player, _x, _y, _z);

					-- no timer while moving
					grind2.timer = 0;

					-- no timer while moving
					self.timer = 0;

					-- reset combat script error
					script_grind.combatError = nil;
				end

				-- return back
				return false;
			else

				-- reset combat error
				script_grind.combatError = nil;
			end
		end
	end

	-- timer per each time script is ran + combat script
	self.timer = currentTime + grind2AdjustTimersMenu.combatScriptTimer + 50;

--return true;
end