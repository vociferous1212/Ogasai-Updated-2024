script_grindAssignTarget = {}

function script_grindAssignTarget:assignTarget()

	-- set quester target if using quester
	if _quest.usingQuester then
		if _quest.enemyTarget ~= nil then
			script_grind.enemyObj = _quest.enemyTarget;
		end
	end

	local bestTarget = nil;
	local bestHP = 100;
	
-- return a target attacking player or players pet
	local i, targetType = GetFirstObject();

	while i ~= 0 do
	
		-- NPC type 3
		if (targetType == 3) or targetType == 4 then
		
			-- acceptable targets limited check by range
			if (i:GetDistance() < 50) and i:CanAttack() then
				
				-- run another object manager
				if (script_grind:isTargetingGroup(i) or script_grind:isTargetingMe(i) or script_grind:isTargetingPet(i)) then

					-- return target
					return i;
				end
			end
		end

	-- get next target
	i, targetType = GetNextObject(i);
	end

		-- get the target with the lowest health attacking us and not with blade flurry active, rogue, drops combo points
	if GetLocalPlayer():HasBuff("Blade Flurry") and IsInCombat() then

		local i, t = GetFirstObject()

		while i ~= 0 do

			if t == 3 or t == 4 then

				if not i:IsCritter() and not i:IsDead() and i:CanAttack() and (script_grind:isTargetingMe(i) or script_grind:isTargetingGroup(i) or script_grind:isTargetingPet(i)) then

					local hp = i:GetHealthPercentage();

					if bestHP > hp then
						bestHP = hp;
						if bestHP < hp then
							bestTarget = i;
						end
					end
				end
			end

		i, t = GetNextObject(i);

		end
	return bestTarget;
	end

	-- Find the closest valid target if we have no target or we are not in combat
	local mobDistance = script_grind.pullDistance;
	local closestTarget = nil;

	local i, targetType = GetFirstObject();

	-- run object manager
	while i ~= 0 do

		-- acceptable targets
		if ((targetType == 3 or targetType == 4) and not i:IsCritter() and not i:IsDead() and i:CanAttack()) then

			-- if that enemy is valid
			if (script_grindValidEnemy:enemyIsValid(i)) then

				-- get my position to compare
				local x, y, z = GetLocalPlayer();

				-- save the closest mob or mobs attacking us
				if mobDistance > i:GetDistance() and ((i:GetDistance() < script_grind.distToHotSpot and not _quest.usingQuester)

					or (_quest.usingQuester and i:GetDistance() < GetDistance3D(x, y, z, _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ)))

				then

					-- get taret position
					local _x, _y, _z = i:GetPosition();

					-- is nav node valid?
					if(not IsNodeBlacklisted(_x, _y, _z, script_grind.nextNavNodeDistance)) then

						-- return closest target
						mobDistance = i:GetDistance();	

					closestTarget = i;

					end
				end
			end
		end

	-- get next target
	i, targetType = GetNextObject(i);
	end

	
	-- Instantly return the last target if we attacked it and it's still alive and we are in combat
	if ((script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil and not script_grind.enemyObj:IsDead())

		or (_quest.enemyTarget ~= 0 and _quest.enemyTarget ~= nil and not _quest.enemyTarget:IsDead()))

		and IsInCombat() and not script_grind:isTargetHardBlacklisted(script_grind.enemyObj:GetGUID())

	then

		-- if we have a good grinder target
		if script_grind.enemyObj ~= nil and script_grind.enemyObj ~= 0 then

			-- check if enemyObj is targeting me
			if script_grind:isTargetingMe2(script_grind.enemyObj) 

				-- is targeting pet
				or script_grind:isTargetingPet(script_grind.enemyObj)

				-- already tapped by me
				or script_grind.enemyObj:IsTappedByMe()

			then
	
		-- return the enemy target
		return script_grind.enemyObj;

			end
		end
		
		-- if we have a good quester target
		if _quest.enemyTarget ~= nil and _quest.enemyTarget ~= 0 then

			-- check if enemyObj is targeting me
			if script_grind:isTargetingMe2(_quest.enemyTarget)

				-- is targeting pet
				or script_grind:isTargetingPet(_quest.enemyTarget)

				-- already tapped by me
				or _quest.enemyTarget:IsTappedByMe()

			then

		-- return the enemy target
		return _quest.enemyTarget;

			end
		end
	end

	-- run object manager to find anything targeting me
	while i ~= 0 do

		if (targetType == 3 or targetType == 4) and not i:IsCritter() and not i:IsDead() and i:CanAttack()
			and (script_grind:isTargetingMe(i) or script_grind:isTargetingGroup(i) or script_grind:isTargetingPet(i))
			and (not script_grind:isTargetHardBlacklisted(i:GetGUID()) or i:GetHealthPercentage() <= 92) then

		return i;

		end

	-- get next target
	i, targetType = GetNextObject(i);
	
	end
	
	-- Check: If we are in combat but no valid target, kill the "unvalid" target attacking us
	if (closestTarget == nil and IsInCombat()) then

		-- make sure we have a target
		if (GetTarget() ~= 0) then
		
			-- need to check for loot first...
		if not script_grind.adjustTickRate then script_grind.tickRate = 100; end

			-- return target
			return GetTarget();
		end
	end

-- Return the closest valid target or nil
return closestTarget;
end
