script_grindDoLoot = {

		timerWhileLooting = 0, -- set a time while looting a target to give the game/bot time to update looting
		movingToLootTimer = 0,
}


function script_grindDoLoot:doLoot(localObj)

-- set the timer if not already set
	if self.timerWhileLooting == 0 then

		self.timerWhileLooting = GetTimeEX();
	end

	if script_grind.lootObj == nil then
		return false; end

	-- return if we are skinning or casting
	if IsCasting() or IsChanneling() then return true; end
	
	if not IsStanding() then local x, y, z = GetLocalPlayer():GetPosition(); Move(x+.1, y, z); end

	-- reset targeting while we loot
	if not IsInCombat() and not script_grind:isAnyTargetTargetingMe() then script_grind.enemyObj = nil; end

-- get loot position
	local _x, _y, _z = script_grind.lootObj:GetPosition();

-- get distance to loot object from my position
	local dist = script_grind.lootObj:GetDistance();

-- get player object
	local localObj = GetLocalPlayer();

-- set script speed
	if (not script_grind.adjustTickRate) then
		script_grind.tickRate = 250;
	end

-- if our bags are full then set loot object to nil
	if script_grind.bagsFull or script_hunter.bagsFull or AreBagsFull() or script_grind.skipLooting then

		script_grind.lootObj = nil;
	end

-- if we have a loot object and it is blacklisted then turn loot object to nil
	if (script_grind.lootObj ~= nil) then

		if (script_grind:isTargetLootBlacklisted(script_grind.lootObj:GetGUID())) then

			script_grind.lootObj = nil;	
		end
	end

-- Loot checking/reset target
	if (script_grind.lootCheck['timer'] ~= 0 and script_grind.lootCheck['timer'] ~= nil) and script_grind.lootObj ~= nil then

		-- if timer has ran out / we had the loot target for too long
		if (GetTimeEX() > script_grind.lootCheck['timer']) then

			-- if out target is the right target to check
			if (script_grind.lootCheck['target'] == script_grind.lootObj:GetGUID()) then

				-- blacklist if timers ran out
				if script_grind.lootObj:GetDistance() <= script_grind.lootDistance or script_grind.lootCheckTime == 0 then

					DEFAULT_CHAT_FRAME:AddMessage("1- Blacklisting loot - " ..script_grind.lootObj:GetUnitName().. " " ..math.floor(script_grind.lootObj:GetDistance()).. " (yd)");

					-- black list the target
					script_grind:addTargetToLootBlacklist(script_grind.lootObj:GetGUID());

					-- set loot object to nil
					script_grind.lootObj = nil;

					-- reset loot check time
					script_grind.lootCheckTime = 10000;

					-- reset blacklist loot timer
					script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
				
				end

				-- start/restart the timer
				script_grind.lootCheck['timer'] = GetTimeEX() + 10000;

				 -- reset lootObj
				script_grind.lootObj = nil;
				ClearTarget();
				script_grind.message = 'Reseting loot target...';

			end

			
		end
	end

-- close enough to loot range then do these
	if (dist <= script_grind.lootDistance)
	and script_grind.lootObj ~= nil
	and script_grind.lootObj ~= 0
	
	then

		script_grind.message = "Looting...";

		if IsEating() or IsDrinking() or IsChanneling() or IsCasting() then

			script_grind.lootCheckTime = 10000;

			script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);

		end
		if not IsEating() and not IsDrinking() and not IsStanding() and not script_grind:shouldWeRest() then
			JumpOrAscendStart();
		end

		if (GetTimeEX() >= script_grind.blacklistLootTimeCheck) or script_grind.lootObj:GetDistance() <= 3 and not script_grind.lootObj:IsInLineOfSight() then

			-- add to blacklist
			if (script_grind.lootObj ~= nil and script_grind.loobObj ~= 0) then

				DEFAULT_CHAT_FRAME:AddMessage("2- Blacklisting loot - " ..script_grind.lootObj:GetUnitName().. " " ..math.floor(script_grind.lootObj:GetDistance()).. " (yd)");
				script_grind:addTargetToLootBlacklist(script_grind.lootObj:GetGUID());
				script_grind.lootObj = nil;
				script_grind.lootCheckTime = 10000;
				script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);

			end
		end

	-- Dismount
		if (IsMounted()) then
			DisMount();
			script_grind.waitTimer = GetTimeEX() + 350;
			return;
		end

	-- loot attempt #1
		if (IsLooting()) and GetNumPartyMembers() == 0 then
				LootTarget(); CloseLoot(); self.timerWhileLooting = GetTimeEX() + 500;
			if StaticPopup1:IsVisible() then
				StaticPopup1Button1:Click()
			end
		end

	-- interact with object if we are not looting
			-- backup line 2 (and not IsLooting())
		if script_grind.lootObj ~= nil and not IsMoving() then
			if (not script_grind.lootObj:UnitInteract()) and not IsLooting() then
				if GetTimeEX() > self.timerWhileLooting then
					LootTarget();
					CloseLoot();
					self.timerWhileLooting = GetTimeEX() + 750;
				end
			elseif script_grind.lootObj:UnitInteract() or (IsLooting() and self.timerWhileLooting < GetTimeEX()) then 
				LootTarget();
				CloseLoot();
				self.timerWhileLooting = GetTimeEX() + 750;
				script_grind:setWaitTimer(500);
			elseif self.timerWhileLooting < GetTimeEX() then
				LootTarget();
				CloseLoot();
				self.timerWhileLooting = GetTimeEX() + 750;
			end

		end
			
-- if looting and not moving then wait
		if (not IsLooting()) then
			self.timerWhileLooting = GetTimeEX() + 500;
			LootTarget();
			if StaticPopup1:IsVisible() then
				StaticPopup1Button1:Click()
			end
			CloseLoot();
			script_grind:setWaitTimer(1500);

		else
	
-- else we are done looting - load cloest vendors
			if (script_grind.autoSelectVendors) and (IsLooting()) then
				if self.timerWhileLooting < GetTimeEX() then 
					LootTarget(); CloseLoot(); self.timerWhileLooting = GetTimeEX() + 500;
				end

				script_grind.waitTimer = GetTimeEX() + 450;
				_quest.waitTimer = GetTimeEX() + 450;

				local bX, bY, bZ = GetLocalPlayer():GetPosition();
				if (GetDistance3D(script_grind.myLastX, script_grind.myLastY, script_grind.myLastZ, bX, bY, bZ) > 500) then
					if (not script_grind.vendorMessageSent) then
						--DEFAULT_CHAT_FRAME:AddMessage("Closest vendors loaded from vendorDB. - " ..GetTimeStamp());
						script_grind.vendorMessageSent = true;
						script_grind.myLastX, script_grind.myLastY, script_grind.myLastZ = GetLocalPlayer():GetPosition();

						script_grind:setWaitTimer(500);
						_quest.waitTimer = GetTimeEX() + 2500;
						if (script_grind.vendorMessageSent) then
							vendorDB:loadDBVendors();
							script_grind.vendorMessageSent = false;
						end
					end
				end 
			end
		end

		-- we looted so reset variables
		--script_grind.vendorMessageSent = false;
		--script_grind.waitTimer = GetTimeEX() + 250;
		--_quest.waitTimer = GetTimeEX() + 250;
		--if not IsLooting() then
		--	script_grind.lootCheckTime = 0;
		--	end
		
			
	
-- If we reached the loot object, reset the nav path
		if script_grind.lootObj ~= nil then
			if script_grind.lootObj:GetDistance() <= script_grind.lootDistance then
				script_grind:setWaitTimer(500);
				script_nav:resetNavigate();
			end
		end

	return true;
	end


-- jump while swimming
	handleSwimming();

-- Blacklist loot target if swimming or we are close to aggro blacklisted targets and not close to loot target
	if (script_grind.lootObj ~= nil) then
		if (IsSwimming()) and (not script_grindEX.allowSwim) and (script_aggro:closeToBlacklistedTargets() and script_grind.lootObj:GetDistance() > 5) then
			script_grind:addTargetToLootBlacklist(script_grind.lootObj:GetGUID());
		end
	end

-- blacklisting loot after x time
	if (not IsInCombat()) then

		if IsEating() or IsDrinking() or IsInCombat() then
			script_grind.lootCheckTime = 10000;
			script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
		end

		if (GetTimeEX() >= script_grind.blacklistLootTimeCheck + 5000) then

			-- add to blacklist
			if (script_grind.lootObj ~= nil and script_grind.loobObj ~= 0) then
				DEFAULT_CHAT_FRAME:AddMessage("3- Blacklisting loot - " ..script_grind.lootObj:GetUnitName().. " " ..math.floor(script_grind.lootObj:GetDistance()).. " (yd)");
				script_grind:addTargetToLootBlacklist(script_grind.lootObj:GetGUID());
				script_grind.lootObj = nil;
				script_grind.lootCheckTime = 10000;
				script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
			end
		end
	end

-- move to loot object

	if (script_grind.lootObj ~= nil) then
		script_grind.message = "Moving to loot...";
	end

	if (script_grind.lootObj ~= nil)
	and not (script_grind:isTargetLootBlacklisted(script_grind.lootObj:GetGUID()))
	and not IsEating()
	and not IsDrinking()
	then

		if not IsStanding() then JumpOrAscendStart(); local x, y, z = GetLocalPlayer():GetPosition(); Move(x+1, y, z); end
		
		script_grind.message = "Moving To Target Loot - " ..math.floor(script_grind.lootObj:GetDistance()).. " (yd) "..script_grind.lootObj:GetUnitName().. "";
		
		-- move to loot object
		if GetTimeEX() > self.movingToLootTimer then
			if script_navEXCombat:moveToTarget(GetLocalPlayer(), _x, _y, _z) then
				self.movingToLootTimer = GetTimeEX() + 150;
				-- clear our target to loot
				if not script_grind:isAnyTargetTargetingMe() and not script_grindIsAnyTargetTargetingPet:isAnyTargetTargetingPet() then
					script_grind.enemyObj = nil;
				end
				return true;
			end
		end
		if not IsMoving() then Move(_x, _y, _z); self.moveTimer = GetTimeEX() + 150; end

		if (GetTimeEX() >= script_grind.blacklistLootTimeCheck) then

				DEFAULT_CHAT_FRAME:AddMessage("asdf Blacklisting loot - " ..script_grind.lootObj:GetUnitName().. " " ..math.floor(script_grind.lootObj:GetDistance()).. " (yd)");
				script_grind:addTargetToLootBlacklist(script_grind.lootObj:GetGUID());
				script_grind.lootObj = nil;
				script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
			
		end

	return true;

	end
return false;
end
