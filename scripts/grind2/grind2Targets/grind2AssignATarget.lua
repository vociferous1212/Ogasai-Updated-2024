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

	local i, t = GetFirstObject();

	local bestDistance = 1000;

	local bestTarget = nil;

	local bestHealth = 100;

	local targetDistance = 0;

	-- return lowest health target in combat with us
	if IsInCombat() and NumberTargetsAttackingPlayer() >= 2 then

		local i, t = GetFirstObject();

		while i ~= 0 do

			if t == 3 and i:GetDistance() <= 65 and not i:IsDead() and not i:IsCritter() then

				if i:GetUnitsTarget() ~= nil and i:GetUnitsTarget() ~= 0 then
				
					if i:GetUnitsTarget():GetGUID() == GetLocalPlayer():GetGUID() or (HasPet() and i:GetUnitsTarget():GetGUID() == GetPet():GetGUID()) then
						
						local health = i:GetHealthPercentage();

						if bestHealth < health then
				
							bestHealth = health;

							bestTarget = i;

							return i;
						end
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end

	--[[
	-- return the last target if we are in combat with it
	if grind2.enemyTarget ~= nil then
		if not grind2.enemyTarget:IsDead() and (grind2.enemyTarget:GetHealthPercentage() <= 99
			or grind2IsTargetingMe:target(grind2.enemyTarget)) then

			return grind2.enemyTarget;
		end
	end

	-- return last target if it is not dead and we are still in combat
	if grind2.lastTargetTargeted ~= nil then
		if not grind2.lastTargetTargeted:IsDead() and grind2IsTargetingMe:target(grind2.lastTargetTargeted) then
			return grind2.lastTargetTargeted;
		end
	end

	]]--

	-- return any target attacking me if I am not in combat yet
	if not IsInCombat() then
		if grind2GetTargetAttackingMe:run() ~= nil then
			grind2.enemyTarget = grind2GetTargetAttackingMe:run();
			return grind2GetTargetAttackingMe:run();
		end
	end

	while i ~= 0 do

		if t == 3 then

			-- target is not dead but is tapped by player
			if not i:IsDead() and i:IsTapped() and i:IsTappedByMe() then

				return i;
			end

			-- if we have a valid target for the grinder
			if grind2IsTargetValid:target(i) then

				-- check by distance and find closest
				if not i:IsDead() and not i:IsCritter() and i:CanAttack() and i:GetDistance() <= grind2.findTargetDistance then
					
					targetDistance = i:GetDistance();

					if bestDistance > targetDistance then
					
						bestDistance = targetDistance;
		
						bestTarget = i;
					end
				end
			end

			-- target is attacking me, pet, or group then return the target
			if i:GetDistance() < 75 and i:CanAttack() then
				
				if grind2IsTargetingGroup:target(i) or grind2IsTargetingMe:target(i) or grind2IsTargetingPet:target(i) then

					bestTarget = i;

				end
			end
		end
	i, t = GetNextObject(i);
	end

return bestTarget;
end
