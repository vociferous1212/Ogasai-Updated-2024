script_grindEX = {
	currMapID = GetMapID(), 
	avoidBlacklisted = false,
	unstuckTime = GetTimeEX(),
	deathCounter = 0,
	logoutOnHearth = false,
	allowSwim = true,
	useThisVar = true,	-- used to ensure death counter counts only once per mob kill
	waitTimer = 0,
	tryTavelFormTimer = 0,
	swimTimer = 0,
	deleteItemTimer = GetTimeEX(),
}


-- if there is any valid enemy being returned within our set parameters, i.e. skip humanoid or target level 45 - 47 or is elite
function script_grindEX:isThereAnyValidEnemyNearby()

	-- there are no valid enemies when we are grinding and hotspot isn't reached...
	if script_grind.hotspotReached then

		local i, t = GetFirstObject();

		while i ~= 0 do

			if t == 3 then

				if i:GetDistance() <= script_grind.pullDistance and not i:IsDead() and not i:IsCritter() and i:CanAttack() then	

					if script_grindValidEnemy:enemyIsValid(i) then

					return true;
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end
return false;
end

-- count how many enemies are targeting the bot
function script_grindEX:howManyEnemiesTargetingMe()

	local i, t = GetFirstObject();

	local numTargetingMe = 0;

	while i ~= 0 do

		if t == 3 then

			-- limit the range. anything over 40 yards must move closer so anything over 40 can't attack
			if i:GetDistance() <= 40 then

				if i:GetUnitsTarget() ~= 0 and i:GetUnitsTarget() ~= nil then

					if i:GetUnitsTarget():GetGUID() == GetLocalPlayer():GetGUID() then

						-- don't count them if they are about to die or too low level to matter
						-- another function will take care of the out of bounds here when needed
						if i:GetHealthPercentage() > 15 and i:GetLevel() >= GetLocalPlayer():GetLevel() -3 then

						numTargetingMe = numTargetingMe + 1;
						end
					end
				end
			end
		end
	i, t = GetNextObject(i);
	end
return numTargetingMe;
end


-- check the area to see if it is safe to loot a target or not, and rest if it is not. safety fallback for badly set eat and drink sliders
function script_grindEX:isLootSafeToLoot()

local numberOfEnemiesInRange = 0;
local i, t = GetFirstObject();

	-- make sure we even have lootable loot
	if script_grind.lootObj ~= nil then

		while i ~= 0 do

			if t == 3 then

				if i:CanAttack() and not i:IsCritter() and not i:IsDead() and i:GetGUID() ~= script_grind.lootObj:GetGUID() then

					local x, y, z = script_grind.lootObj:GetPosition();

					local tx, ty, tz = i:GetPosition();

					local dist = GetDistance3D(x, y, z, tx, ty, tz);

					if dist <= 25 then

						numberOfEnemiesInRange = numberOfEnemiesInRange + 1;
						
					end

					if numberOfEnemiesInRange >= 1 then

					return false;
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end
return true;
end




-- main run of this script. doChecks() returns until completed
function script_grindEX:doChecks() 

	localObj = GetLocalPlayer();
		
-- reset blacklist loot table every 7 mintues. it uses GUID... when mobs respawn it won't loot them
	if GetTimeEX() > script_grind.resetBlacklistLootTableTimer and not IsLooting() and not IsInCombat() then
		script_grind:resetLootBlacklistTable();
		script_grind.resetBlacklistLootTableTimer = GetTimeEX() + 420000;
		--DEFAULT_CHAT_FRAME:AddMessage("Blacklist loot table reset");
	end


-- Load vendors if we move into a new map zone
	if (GetMapID() ~= self.currMapID) then
		self.currMapID = GetMapID();
		vendorDB:loadDBVendors();
	end

-- turn vendor status to 0 if we aren't using vendor'
	if not script_grind.useVendor then
		script_vendor.status = 0;
	end

-- skip looting if we aren't using vendor and bags are full, if we are not already skipping looting'
	if (script_grind.bagsFull or AreBagsFull() or script_hunter.bagsFull) and not script_grind.useVendor and not script_grind.skipLooting then
		script_grind.skipLooting = true;
	end
	if script_grind.skipLooting and script_grind.useVendor then
		script_grind.useVendor = false;
		DEFAULT_CHAT_FRAME:AddMessage("Cannot skip looting and use vendoring together - disabling vendoring");
	end
		
	-- load hotspot stuff
	-- TODO - auto set specific mobs in certain grind zones for easier botting
		-- set specific targets to kill by name or by creature type
	--hotspotDB_setInfo_1_10_checkMobs();

	if script_vendor.status > 0 and script_grind.enemyObj ~= nil and not IsInCombat() then
		script_gring.enemyObj = nil
	end
	
	-- ensure we wait with the grind script
	if (script_grind.waitTimer > GetTimeEX() or IsCasting() or IsChanneling()) then

		-- force casters to face the targets... useful for mage/warlock especially when pulling
		if IsStanding() and IsCasting() and not IsMoving() and PlayerHasTarget() then
			if GetTarget():GetDistance() <= script_grind.combatScriptRange and GetTarget():IsInLineOfSight() then
				if not IsMoving() and IsCasting() and not script_checkAdds:checkAdds() then
					GetTarget():FaceTarget();
				end
			end
		end

		return;
	end
		
	-- avoid elite now defunct
	--if (script_grind.avoidElite and not localObj:IsDead()) then 
	--	if (script_extraFunctions:avoidElite()) then
	--		self.message = script_extraFunctions:runBackwards(1, 50);
	--		script_grind.message = "Elite within " .. script_grind.avoidRange .. " yd. running away...";
	--		return true; 
	--	end 
	--end

		
-- try to use soulstone if we have one
	if (localObj:IsDead()) and (localObj:HasBuff("Soulstone Resurrection")) then
		if (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) then
		script_grind:addTargetToHardBlacklist(script_grind.enemyObj:GetGUID());
		end
		-- wow in-game api
		if (HasSoulstone()) then
			UseSoulstone();
			return;
		end
	end

	-- return and don't do anything if we are dead and paranoia is active - player in 40 yard range
	if (localObj:IsDead()) and (script_paranoia:checkParanoia(40)) then
		return;
	end



-- we are dead so retrieve corpse
	if (localObj:IsDead()) and (not script_paranoia:checkParanoia(40)) then

		script_grind.message = "Waiting to ressurect...";

		-- wait for a moment before anything
		if localObj:IsDead() and not IsGhost() then
			script_grind.waitTimer = GetTimeEX() + 2000;
		end

		-- Release body
		if (not IsGhost()) and (not script_paranoia:checkParanoia(30)) then

			-- try to wait before releasing to ghost
			script_grind.waitTimer = GetTimeEX() + 4000;

			-- release to ghost
			if (not RepopMe()) then
		
				-- set the death counter +1
				if (self.useThisVar) then
					script_grindEX.deathCounter = script_grindEX.deathCounter + 1;
					self.useThisVar = false;
				end

				-- wait a moment for the game to load before moving
				script_grind.waitTimer = GetTimeEX() + 1500;
				script_grind.message = "Walking to corpse...";
			return true;
			end
		return true;
		end

		-- make sure we are ghost before moving on to finding corpse
		if IsGhost() then

			-- Ressurrect within the ress distance to our corpse
			local _lx, _ly, _lz = localObj:GetPosition();

			-- our distance is greater than set ress distance
			if(GetDistance3D(_lx, _ly, _lz, GetCorpsePosition()) > script_grind.ressDistance) then
				script_nav:moveToNav(localObj, GetCorpsePosition());
				return true;
			else
				-- if we are close enough and want to safetly res in the area
				if (script_grind.safeRess) then
					local rx, ry, rz = GetCorpsePosition();
					if (script_aggro:safeRess(rx, ry, rz, script_grind.ressDistance)) then
						script_grind.message = "Finding a safe spot to ress...";
						return true;
					else
						if (script_aggro.rTime > GetTimeEX()) then
							script_nav:moveToNav(localObj, script_aggro.rX, script_aggro.rY, script_aggro.rZ);	
							script_grind.message = "Finding a safe spot to ress...";
							return true;
						end
					end
				end
			RetrieveCorpse();
			self.useThisVar = true;
			end
		return true;
		end
	end

-- run back if has vanish
	if (localObj:HasBuff("Vanish")) then
		script_navEX:moveToTarget(localObj, script_nav.savedLocations[script_nav.currentGoToLocation]['x'], script_nav.savedLocations[script_nav.currentGoToLocation]['y'], script_nav.savedLocations[script_nav.currentGoToLocation]['z']); 
		script_grind.enemyObj = nil;
		ClearTarget()
	return;
	end

		
	--check to see if we need to rest or not
	local rest = true;
	if (script_grind.enemyObj ~= nil and script_grind.enemyObj ~= 0) and GetLocalPlayer():GetHealthPercentage() > script_grind.eatHealth and GetLocalPlayer():GetManaPercentage() > script_grind.drinkMana then
		if (script_grind:enemiesAttackingUs() > 0 or script_grind.enemyObj:IsFleeing() or script_grind.enemyObj:IsStunned()) then
			rest = false;
		end
	end

	-- Check to see if we are a mana use and need to refill at Vendor
	if (script_grind.useVendor and script_grind.vendorRefill and not IsInCombat()) then
		if (script_vendorMenu:checkVendor(script_grind.useMana)) then
			script_grind.message = "Going to vendor for water/food";
			return true;
		end
	end

	if (IsInCombat()) and (GetTimeEX() > script_grind.omTimer) and (script_grind.enemyObj ~= nil and script_grind.enemyObj ~= 0) then
		if (script_grind.enemyObj:GetHealthPercentage() >= 20) then
			script_om:FORCEOM();
			script_grind.omTimer = GetTimeEX() + 5000;
			return true;
		end
	end

-- delete inventory items 
	if (not IsInCombat()) and (not IsMoving()) and (script_grind.deleteItems) and GetTimeEX() > self.deleteItemTimer then
		script_deleteItems:checkDeleteItems();
		self.deleteItemTimer = GetTimeEX() + 60000;
	end

-- check party members and run grind party script
	if (GetNumPartyMembers() >= 1) then
		if (script_grindParty:partyOptions()) then
			return true;
		end
	end

-- Jump - paranoia menu
	if (script_grind.jump) and IsMoving() and not IsInCombat() then
		local jumpRandom = random(1, 100);
		if jumpRandom > script_grind.jumpRandomFloat then
			JumpOrAscendStart();
		end
	end

-- Move out of water before resting/mounting
	if (not IsInCombat()) and (not localObj:HasBuff('Feign Death')) then
		if (script_grindAreWeSwimming:areWeSwimming()) and (not script_grindEX.allowSwim) then 
			script_grind.message = "Moving out of the water..."; 
			if (script_grind.autoPath) then
				script_grind.message = script_nav:moveToSavedLocation(localObj, script_grind.minLevel, script_grind.maxLevel, script_grind.staticHotSpot);
			else
				script_nav:navigate(GetLocalPlayer());
				return true;
			end
		end
		if (rest) then
			if (script_grind:runRest()) then
				return true;
			end
		end
		--if (script_grind:lootAndSkin()) then
			--return true;
		--end
	end

	-- Update/load hot spot distance and location
	if (script_grind.autoPath) then 
		script_nav:updateHotSpot(GetLocalPlayer():GetLevel(), GetFaction(), script_grind.staticHotSpot);
		script_nav:setHotSpotDistance(script_grind.distToHotSpot); 
	end

	return false;
end

function script_grindEX:howManyEnemiesInRange(range)
	local i, t = GetFirstObject();
	local numberNearby = 0;
	while i ~= 0 do
		if t == 3 then
			if (i:GetDistance() <= range) and (i:CanAttack()) and (not i:IsDead()) and (not i:IsCritter()) then
				numberNearby = numberNearby + 1;
			end
		end
	i, t = GetNextObject(i);
	end
return numberNearby;
end

-- used for safe pulling - check for how many targets are around it before pulling it... especially humanoids
function script_grindEX:howManyEnemiesInRangeOfTarget(target)

	local i, t = GetFirstObject();
	local x, y, z = target:GetPosition();
	local numberNearby = 0;
	local targetToCheck = 0;
	local range = 0;
	local distToOtherTarget = 0;

	while i ~= 0 do
		if t == 3 then
			if (i:GetDistance() <= 40) and (i:CanAttack()) and (not i:IsDead()) and (not i:IsCritter()) then

				-- get other targets pos
				local _x, _y, _z = i:GetPosition()

				-- distance of target to other target
				distToOtherTarget = GetDistance3D(x, y, z, _x, _y, _z);
	
				-- if they are within my aggro range
				range = i:GetLevel() - GetLocalPlayer():GetLevel() + 19.5;
	
				if (distToOtherTarget <= range) then
					targetToCheck = i;
				end
			end
		end
	i, t = GetNextObject(i);
	end

	while i ~= 0 do
		if t == 3 then
			if (i:GetGUID() ~= targetToCheck:GetGUID()) and (distToOtherTarget <= 30) and (i:CanAttack()) and (not i:IsDead()) and (not i:IsCritter()) then
				if (targetToCheck ~= 0) then
					local cx, cy, cz = targetToCheck:GetPosition();
					local vx, vy, vz = i:GetPosition();

					checkThisTarDistance = GetDistance3D(cx, cy, cz, vx, vy, vz);
			
					-- if that target is in range if I pull it or move to it...
					if (checkThisTarDistance >= range) then
						numberNearby = numberNearby + 1;
					end
				end
			end
		end
	i, t = GetNextObject(i);
	end		
return numberNearby;
end

-- return the target...
function script_grindEX:getTargetWithinAggroRange()

	i, t = GetFirstObject();
	aggro = 0;

	while i ~= 0 do
		if t == 3 then
			local aggro = (i:GetLevel() - GetLocalPlayer():GetLevel() + 22);
			if i:GetDistance() <= aggro then
				return i;
			end
		end	
	i, t = GetNextObject(i);
	end
return nil;
end

function handleSwimming()
    local localObj = GetLocalPlayer();
    if not localObj then return false end

    -- Initialize swim timer if not set
    if script_grindEX.swimTimer == nil then
        script_grindEX.swimTimer = 0
    end

    -- Check if swimming and not casting/channeling
    if script_grindAreWeSwimming:areWeSwimming() and not IsCasting() and not IsChanneling() then
        -- Surface every 10 seconds to avoid drowning
        if GetTimeEX() > script_grindEX.swimTimer then
            JumpOrAscendStart() -- Swim upward
            script_grindEX.swimTimer = GetTimeEX() + 3000 -- 3s interval
            script_grind.waitTimer = GetTimeEX() + 1000 -- Brief pause to reach surface
            return true
        end
        return true -- Stay in swimming state
    else
        -- Reset timer when not swimming
        script_grindEX.swimTimer = GetTimeEX() + 10000
        return false
    end
end