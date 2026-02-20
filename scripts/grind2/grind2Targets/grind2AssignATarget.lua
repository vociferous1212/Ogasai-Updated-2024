grind2AssignATarget = {



}


--[[

assign target will check valid enemy and safepull and blacklisted targets and return that target
run object manager here


	assign a target and check if enemy is valid and if a safe pull - check elite - check blacklist --- return the target!

	return bestTarget
	else
	return closestTarget
	
]]

function grind2AssignATarget:run()

	-- clear any target not in combat with us that we have targeted
	-- and get nearest enemy
	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
		if IsInCombat() and not grind2IsTargetingMe:target(grind2.enemyTarget) and not grind2IsTargetingPet:target(grind2.enemyTarget) and (not grind2.enemyTarget:IsCasting() and grind2.enemyTarget:IsTappedByMe()) then
			grind2.enemyTarget = nil;
			grind2.lastTargetTargeted = nil;
			grind2.lastTargetTargetedGUID = nil;
		end
	end

	local i, t = GetFirstObject();

	local bestDistance = 1000;

	local bestTarget = nil;

	local bestHealth = 100;

	local bestMana = 100;

	local targetDistance = 0;

	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
		if not grind2.enemyTarget:CanAttack() or grind2.enemyTarget:IsDead() then
			grind2.enemyTarget = nil;
			script_grind.enemyObj = nil;
			ClearTarget();
		end
	end

	-- return lowest health target in combat with us
	if IsInCombat() and NumberTargetsAttackingPlayer() >= 2 then

		local i, t = GetFirstObject();

		while i ~= 0 do

			if t == 3 and i:GetDistance() <= 65 and not i:IsDead() and not i:IsCritter() then

				if totemsList:isTargetTotem(i) then
					return i;
				end

				if i:GetUnitsTarget() ~= nil and i:GetUnitsTarget() ~= 0 then
				
					if grind2IsTargetingMe:target(i) or grind2IsTargetingPet:target(i) or (i:IsCasting() and i:IsTappedByMe()) then
						
						local health = i:GetHealthPercentage();

						local mana = CurrentTargetsMana(i);

						if bestHealth > health then
				
							bestHealth = health;

							if bestHealth <= health then

								bestTarget = i;
								bestHealth = health;
							end

							if mana > 1 then
							
								if bestMana > mana then

									bestMana = mana;

									if bestMana <= mana then

										bestTarget = i;

										bestmana = mana;
										return i;
									end
								end
							end
							-- bot is not wanting to stick to 1 target?
							if bestTarget ~= nil then
								grind2.obtainNewTargetTimer = GetTimeEX() + 1000;
								return bestTarget;
							end
						end
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end

	-- return the last target if we are in combat with it
	if grind2.enemyTarget ~= nil then
		if not grind2.enemyTarget:IsDead() and (grind2.enemyTarget:GetHealthPercentage() <= 99
			or grind2IsTargetingMe:target(grind2.enemyTarget)) then

			return grind2.enemyTarget;
		end
	end

	while i ~= 0 do

		if t == 3 then

			-- if we have a valid target for the grinder
			if grind2IsTargetValid:target(i) then

				-- check by distance and find closest
				if not i:IsDead() and not i:IsCritter() and i:CanAttack() and i:GetDistance() <= grind2.findTargetDistance then
					
					targetDistance = i:GetDistance();

					if IsInCombat() then
						if totemsList:isTargetTotem(i) then
							return i;
						end
					end

					if bestDistance > targetDistance then
					
						bestDistance = targetDistance;
		
						bestTarget = i;
					end
				end
			end

			-- target is attacking me, pet, or group then return the target
			if i:GetDistance() < 75 and i:CanAttack() then
				
				if grind2IsTargetingGroup:target(i) or grind2IsTargetingMe:target(i) or grind2IsTargetingPet:target(i) or (i:IsCasting() and i:IsTappedByMe()) then

					bestTarget = i;

				end
			end

			-- target is not dead but is tapped by player
			if not i:IsDead() and i:IsTapped() and i:IsTappedByMe() then

				return i;
			end

		end
	i, t = GetNextObject(i);
	end

return bestTarget;
end
