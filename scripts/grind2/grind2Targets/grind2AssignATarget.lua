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

	local targetDistance = 0;

		-- return the last target if we are in combat with it
	if grind2.enemyTarget ~= nil then
		if IsInCombat() and not grind2.enemyTarget:IsDead() and (grind2.enemyTarget:GetHealthPercentage() <= 99
			or grind2IsTargetingMe:target(grind2.enemyTarget)) then

			return grind2.enemyTarget;
		end
	end

	-- return last target if it is not dead and we are still in combat
	if IsInCombat() and grind2.lastTargetTargeted ~= nil then
		if not grind2.lastTargetTargeted:IsDead() and grind2IsTargetingMe:target(grind2.lastTargetTargeted) then
			return grind2.lastTargetTargeted;
		end
	end

	while i ~= 0 do

		if t == 3 then

			-- if we have a valid target for the grinder
			if grind2IsTargetValid:target(i) then

				-- check by distance and find closest
				if not i:IsDead() and not i:IsCritter() and i:CanAttack() and i:GetDistance() <= grind2.findTargetDistance then
					
					targetDistance = i:GetDistance();

					if bestDistance > targetDistance then
					
						bestDistance = targetDistance;
					end
				
					if targetDistance <= bestDistance then
					
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
			
			--if IsInCombat() and more than 1 target attacking then
			--	sort health
			--	bestTarget = lowest health;
			--end

		end
	i, t = GetNextObject(i);
	end

return bestTarget;
end
