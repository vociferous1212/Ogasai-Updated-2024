script_mageCheckFrostNova = {}

-- used to check for ANY target in range that has frost nova, not just selected target
function script_mageCheckFrostNova:checkFrostNova()
	local localObj = GetLocalPlayer()
	local searchRadius = 15 -- 15 yard radius for detection
	local minSafeDistance = 8 -- Minimum distance to move away
	local closestFrostTarget = 0
	local closestDist = 999
	local currentObj, typeObj = GetFirstObject()

	-- Check for targets with Frostbite or Frost Nova within 15 yards
	while currentObj ~= 0 do
		if typeObj == 3 or typeObj == 4 then -- NPC type
			if currentObj:GetDistance() <= searchRadius then
				if currentObj:CanAttack()
					and (not currentObj:IsDead())
					and (not currentObj:IsCritter())
					and (currentObj:HasDebuff("Frostbite") or currentObj:HasDebuff("Frost Nova"))
				then
					local dist = currentObj:GetDistance()
					if dist < closestDist then
						closestDist = dist
						closestFrostTarget = currentObj
					end
				end
			end
		end
		currentObj, typeObj = GetNextObject(currentObj)
	end

	-- If a valid target with frost debuff is found
	if closestFrostTarget ~= 0 then
		local xT, yT, zT = closestFrostTarget:GetPosition()
		local xP, yP, zP = localObj:GetPosition()
		local distance = closestFrostTarget:GetDistance()
		local xV, yV, zV = xP - xT, yP - yT, zP - zT
		local vectorLength = math.sqrt(xV^2 + yV^2 + zV^2)
		local xUV, yUV, zUV = (1/vectorLength)*xV, (1/vectorLength)*yV, (1/vectorLength)*zV

		-- Stop if already 8 yards or further from the target
		if distance >= minSafeDistance then
			return false -- No need to move further
		end

		-- Calculate movement distance: ensure at least 8 yards
		local moveDistance = minSafeDistance + 2 -- Move to 8 yards plus a small buffer
		local moveX, moveY, moveZ = xT + xUV*moveDistance, yT + yUV*moveDistance, zT + zUV

		if (distance <= searchRadius)
			and (closestFrostTarget:IsInLineOfSight())
			and (not script_checkDebuffs:hasDisabledMovement())
		then
			script_grind.tickRate = 75 -- Set tick rate as in runBackwards
			if Move(moveX, moveY, moveZ) then
				return true;
			end
			return 4;
		end
	return 4;
	end

	return false
end