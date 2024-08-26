script_grindEX = {
	currMapID = GetMapID(), 
	avoidBlacklisted = false,
	unstuckTime = GetTimeEX(),
	deathCounter = 0,
	logoutOnHearth = false,
	allowSwim = true,
	useThisVar = true,
	waitTimer = 0,
	blacklistAggroTargets = {},
	blacklistAggroNum = 0,
}

function script_grindEX:addTargetToAggroBlacklist(targetGUID)
	if (targetGUID ~= nil and targetGUID ~= 0 and targetGUID ~= '') then	
		self.blacklistAggroTargets[self.blacklistAggroNum] = targetGUID;
		self.blacklistAggroNum = self.blacklistAggroNum + 1;
	end
end

-- check if target is blacklisted by table GUID
function script_grindEX:isTargetAggroBlacklisted(targetGUID) 
	for i=0,self.blacklistAggroNum do
		if (targetGUID == self.blacklistAggroTargets[i]) then
			return true;
		end
	end
	return false;
end


function script_grindEX:returnTargetNearMyAggroRange()
	local i, t = GetFirstObject();
	local mx, my, mz = GetLocalPlayer():GetPosition();
	local tx, ty, tz = 0, 0, 0;

	while i ~= 0 do
		if t == 3 then
			if i:GetDistance() <= 30 and i:CanAttack() and not i:IsDead() and not i:IsCritter() and i:IsInLineOfSight() and not script_grindEX:isTargetAggroBlacklisted(i:GetGUID()) then
				tx, ty, tz = i:GetPosition();
				local range = GetDistance3D(mx, my, mz, tx, ty, tz);
				local aggro = i:GetLevel() - GetLocalPlayer():GetLevel() + 21;
				if range <= aggro and (not PlayerHasTarget()) then
					name = i:GetUnitName();
					TargetByName(name);
					if (UnitIsEnemy("target","player")) then
						i:AutoAttack();
						return i;
					end
				elseif (not script_grind.hotspotReached) and (not IsInCombat()) then	
					script_grindEX:addTargetToAggroBlacklist(i:GetGUID());
					if (PlayerHasTarget()) then
						ClearTarget();
					end
				return nil;
				end
			end
		end
	i, t = GetNextObject(i);
	end
return nil;
end

function script_grindEX:areWeSwimming()
	if (GetLocalPlayer():GetHealthPercentage() >= 1) and (not GetLocalPlayer():IsDead()) then
		if (IsSwimming()) then
			return true;
		end
	end
return false;
end

function script_grindEX:doChecks() 

		-- Load vendors if we move into a new map zone
		if (GetMapID() ~= self.currMapID) then
			self.currMapID = GetMapID();
			vendorDB:loadDBVendors();
		end
		
		-- load hotspot stuff
		--hotspotDB_setInfo_1_10_checkMobs();

	
		if (script_grind.waitTimer > GetTimeEX() or IsCasting() or IsChanneling()) then
			return true;
		end
		
		localObj = GetLocalPlayer();
		--if (script_grind.avoidElite and not localObj:IsDead()) then 
		--	if (script_extraFunctions:avoidElite()) then
		--		self.message = script_extraFunctions:runBackwards(1, 50);
		--		script_grind.message = "Elite within " .. script_grind.avoidRange .. " yd. running away...";
		--		return true; 
		--	end 
		--end

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

		if (localObj:IsDead()) and (script_paranoia:checkParanoia(40)) then
			return;
		end

		if (localObj:IsDead()) and (not script_paranoia:checkParanoia(40)) then

			script_grind.message = "Waiting to ressurect...";

			-- use soul stone
			--if (localObj:HasBuff("Soul Stone")) and (localObj:IsDead()) and (not IsGhost()) then
				--accept text
			--return
			--end

			-- Release body
			if (not IsGhost()) and (not script_paranoia:checkParanoia(30)) then
				if (not RepopMe()) then
					if (self.useThisVar) then
						script_grindEX.deathCounter = script_grindEX.deathCounter + 1;
						self.useThisVar = false;
					end
					script_grind.message = "Walking to corpse...";
					return true;
				end
				return true;
			end

			-- Ressurrect within the ress distance to our corpse
			local _lx, _ly, _lz = localObj:GetPosition();
			if(GetDistance3D(_lx, _ly, _lz, GetCorpsePosition()) > script_grind.ressDistance) then
				script_nav:moveToNav(localObj, GetCorpsePosition());
				return true;
			else
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

		-- run back if has vanish
		if (localObj:HasBuff("Vanish")) then
			script_navEX:moveToTarget(localObj, script_nav.savedLocations[script_nav.currentGoToLocation]['x'], script_nav.savedLocations[script_nav.currentGoToLocation]['y'], script_nav.savedLocations[script_nav.currentGoToLocation]['z']); 
			return;
		end
		
		local rest = true;
		if (script_grind.enemyObj ~= nil and script_grind.enemyObj ~= 0) then
			if (script_grind:enemiesAttackingUs() > 0 or script_grind.enemyObj:IsFleeing() or script_grind.enemyObj:IsStunned()) then
				rest = false;
			end
		end

		local vendorStatus = script_vendor:getStatus();

		if (vendorStatus >= 1 and not IsInCombat()) then
			script_grind.currentTime2 = GetTimeEX();
			if (script_grind:runRest()) then
				if (IsMoving()) then
					StopMoving();
					return;
				end
				return true;
			end

			if (script_grind:lootAndSkin()) then
				return true;
			end

			if (script_grind.useMount) and (not IsMounted()) and (GetLocalPlayer():GetLevel() >= 40) then
				if (script_helper:useMount()) then
				end
			end
			if (GetLocalPlayer():GetLevel() <= 40) and (IsMoving()) and (HasSpell("Bear Form")) then
				if (not HasSpell("Travel Form")) and (HasSpell("Cat Form")) then
					script_druidEX2:catForm();
				elseif (HasSpell("Travel Form")) then
					script_druidEX:travelForm();
				end
			end
			if (script_druid.useStealth) and (IsCatForm()) and (HasSpell("Prowl")) and (not IsSpellOnCD("Prowl")) and (not GetLocalPlayer():HasBuff("Prowl")) then
				CastSpellByName("Prowl");
				script_grind:setWaitTimer(1500);
			end
			if (script_rogue.useStealth) and (not GetLocalPlayer():HasBuff("Stealth")) and (not IsSpellOnCD("Stealth")) and (HasSpell("Stealth")) then
				CastSpellByName("Stealth");
				script_grind:setWaitTimer(1500);
			end
		end

		if (script_grindEX:areWeSwimming()) or (IsSwimming()) and (IsMoving()) and (not IsCasting()) and (not IsChanneling()) then
			local x, y, z = GetLocalPlayer():GetPosition();
			if (GetTimeEX() > script_grind.swimJumpTimer) then
				local x2, y2, z2 = GetLocalPlayer():GetPosition();
				if (GetDistance3D(x, y, z, x2, y2, z2) > 5) then
					JumpOrAscendStart();
					script_grind.swimJumpTimer = GetTimeEX() + 1200;
					Move(x, y, z+10)
					return true;
				end
				
			end
		end

		if (IsInCombat()) and (GetTimeEX() > script_grind.omTimer) and (script_grind.enemyObj ~= nil and script_grind.enemyObj ~= 0) then
			if (script_grind.enemyObj:GetHealthPercentage() >= 20) then
				script_om:FORCEOM();
				script_grind.omTimer = GetTimeEX() + 5000;
				return true;
			end
		end

		-- delete items 
		if (not IsInCombat()) and (not IsMoving()) and (script_grind.deleteItems) then
			script_deleteItems:checkDeleteItems();
		end

		-- check party members
		if (GetNumPartyMembers() >= 1) then
			if (script_grindParty:partyOptions()) then
				return true;
			end
		end

		-- Jump
		if (script_grind.jump) then
			local jumpRandom = random(1, 100);
			if (jumpRandom > script_grind.jumpRandomFloat and IsMoving() and not IsInCombat()) then
				JumpOrAscendStart();
			end
		end

		if (not IsInCombat() or IsMounted()) then
			if (vendorStatus == 1) then

				if (script_grind.enemyObj ~= nil and script_grind.enemyObj ~= 0) then
					self.message = "Killing stuff in our path.";
					script_grind.combatError = RunCombatScript(script_grind.enemyObj:GetGUID());	
				else

					script_grind.message = "Repairing at vendor...";

					if (script_vendor:repair()) then script_grind:setWaitTimer(100);
						return true;
					end

				end
			elseif (vendorStatus == 2) then
			
				if (script_grind.enemyObj ~= nil and script_grind.enemyObj ~= 0) then
					self.message = "Killing stuff in our path.";
					script_grind.combatError = RunCombatScript(script_grind.enemyObj:GetGUID());	
				else

					script_grind.message = "Selling to vendor...";

					if (script_vendor:sell()) then script_grind:setWaitTimer(100);
						return true;
					end
				end
			elseif (vendorStatus == 3) then
				script_grind.message = "Buying ammo at vendor...";
				if (script_vendor:continueBuyAmmo()) then 
					script_grind:setWaitTimer(100);
					return true; 
				end
			elseif (vendorStatus == 4) then
				script_grind.message = "Buying food/drink at vendor...";
				if (script_vendor:continueBuy()) then script_grind:setWaitTimer(100);
					return true;
				end
			end
		end

		-- Clear dead/blacklisted/tapped targets
		if (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) then
			-- Save location for auto pathing
			if (script_grind.hotspotReached and script_grind.enemyObj:IsDead() and script_grind.enemyObj:GetLevel() >= script_grind.minLevel and script_grind.enemyObj:GetLevel() <= script_grind.maxLevel) then 
				script_nav:saveTargetLocation(script_grind.enemyObj, script_grind.enemyObj:GetLevel());
			end
			if (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) then
				if ((script_grind.enemyObj:IsTapped() and not script_grind.enemyObj:IsTappedByMe()) 
					or (script_grind:isTargetHardBlacklisted(script_grind.enemyObj:GetGUID()) and not IsInCombat())
					or script_grind.enemyObj:IsDead()) then
						script_grind.enemyObj = nil;
						ClearTarget();
				end
			end
		end

		if (not IsInCombat()) and (not localObj:HasBuff('Feign Death')) then
			-- Move out of water before resting/mounting
			if (script_grindEX:areWeSwimming()) and (not script_grindEX.allowSwim) then 
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
			
			if (script_grind:lootAndSkin()) then
				return true;
			end
		end

		if ((AreBagsFull() or script_grind.bagsFull) and not IsInCombat()) then
			if(script_grind.useVendor and script_vendor:sell()) then
				script_grind.message = "Running the vendor routine: sell..."; 
				return true;
			elseif (script_grind.hsWhenFull and HasItem("Hearthstone")) then
				script_vendor:removeShapeShift();
				script_grind.message = 'Inventory is full, using Hearthstone...';
				if (IsMounted()) then DisMount(); script_grind.waitTimer = GetTimeEX()+3000;
					return true;
				end
				if (UseItem("Hearthstone")) then
					self.waitTimer = GetTimeEX() + 15000;
					return true;
				end
				if (self.logoutOnHearth) then
					Exit();
				end
				return;
			elseif (script_grind.stopWhenFull) then
				script_grind.message = 'Bags are full, stopping...';
				Logout(); StopBot(); return true;
			else	
				script_grind.message = 'Warning bags are full...';
				if (script_grind.hsWHenFull) then script_grind.message = 'Warning bags are full, pausing...';
					return true;
				end 
			end
		end

		-- Check: Vendor refill
		if (script_grind.useVendor and script_grind.vendorRefill and not IsInCombat()) then
			if (script_vendorMenu:checkVendor(script_grind.useMana)) then
				return true;
			end
		end

		-- Update pull levels if we leveled up
		if (script_grind.currentLevel < GetLocalPlayer():GetLevel()) then
			script_grind.currentLevel = GetLocalPlayer():GetLevel();
			script_grind.minLevel = script_grind.minLevel + 1;
			script_grind.maxLevel = script_grind.maxLevel + 1;
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
	x, y, z = GetLocalPlayer():GetPosition();
	tx, ty, tz = 0, 0, 0;
	target = 0;

	while i ~= 0 do
		if t == 3 then
			local aggro = ((i:GetLevel() - GetLocalPlayer():GetLevel()) + 22);
return target;
		end

			

	i, t = GetNextObject(i);
	end
return nil;
end