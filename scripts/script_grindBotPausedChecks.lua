script_grindBotPausedChecks = {}

function script_grindBotPausedChecks:botPausedChecks()

-- draw object manager and end debug window
	if (script_grind.showOM) then
		EndWindow();

		getObjectsAroundMe:GetObjectsAroundMe();
	end

-- temporary 2nd warlock script
	if (script_warlock2.usingThisScript) then
			EndWindow();
		if (NewWindow("Warlock 2", 320, 320)) then
			script_warlock2:menu();
		end
	end

-- show collect garbage lua
	if (script_grindMenu.showGarbageBox) then
		collectgarbage(collect);
	end

-- if we do not have first aid spell then turn off first aid
	if (not HasSpell("First Aid")) then
		script_grind.useFirstAid = false;
	end

-- loot quick disenchanting
	--if (script_grind.waitTimer > GetTimeEX()) then
	--	return;
	--end
	--if (IsLooting()) then
	--	if (LootTarget()) then
	--	script_grind.waitTimer = GetTimeEX() + 500;
	--	return;
	--	end
	--end
	--if (script_enchanting:doEnchant()) then
	--	--script_grind.waitTimer = GetTimeEX() + 5000;
	--end
	--ReplaceEnchant();	

-- logout timer
	if (script_grind.useLogoutTimer) then

		-- set logout time
		local currentTime = GetTimeEX() / 1000;

		-- logout when timer is set
		if (currentTime >= script_grind.logoutSetTime + script_grind.logoutTime * 3600) then
			Exit();
		end
	end

-- check inventory for bag every 3 minutes... if we have none in slot 4 already, only level 10 or lower
	if not IsInCombat()
	and not IsMoving()
	and GetTimeEX() > script_grind.checkBagTimer
	and (
		(GetBagName(4) == nil and GetMyClass() ~= "HUNTER")

		-- quiver should be in slot 4
		or  (GetBagName(3) == nil and GetMyClass() == "HUNTER")
		)
	and GetLocalPlayer():GetLevel() < 10
	
	then
		_questEquipItems:checkInventoryForBags();
		script_grind.checkBagTimer = GetTimeEX() + 180000;
	end
	
-- if bags full then set true
	if (AreBagsFull()) then
		script_grind.bagsFull = true;
	end

-- Set next to node distance and nav-mesh smoothness to double that number
	if (IsMounted()) then
		script_nav:setNextToNodeDist(11); NavmeshSmooth(script_grind.nextToNodeDist*1.8);
	elseif (localObj:HasBuff("Sprint")) or (localObj:HasBuff("Aspect of the Cheetah")) or (localObj:HasBuff("Dash")) or (localObj:HasBuff("Cat Form")) then
		script_nav:setNextToNodeDist(6.5); NavmeshSmooth(script_grind.nextToNodeDist*1.8);
	elseif (race == 'Night Elf') and (localObj:IsDead()) then
		script_nav:setNextToNodeDist(8);
		NavmeshSmooth(script_grind.nextToNodeDist*1.6);
	elseif (localObj:IsDead() or IsGhost()) then
		script_nav:setNextToNodeDist(5);
		NavmeshSmooth(script_grind.nextToNodeDist*1.6);
	elseif (IsIndoors()) then
		script_nav:setNextToNodeDist(2.2); NavmeshSmooth(script_grind.nextToNodeDist*1.2);
	else
		--script_nav:setNextToNodeDist(script_grind.nextToNodeDist); NavmeshSmooth(script_grind.nextToNodeDist*1.6);
		script_grind.nextToNodeDist = script_grind.nextToNodeDist;
		NavmeshSmooth(2);
	end
	
-- run setup function if not ran yet
	if (not script_grind.isSetup) then
		script_grind:setup();
	end

-- hotspot reached distance
	if not IsInCombat() and (script_nav:getDistanceToHotspot() > script_grind.distToHotSpot) and (script_grind.hotspotReached) then
		script_grind.hotspotReached = false;
		if PlayerHasTarget() then ClearTarget(); end
		script_grind.enemyObj = nil;
		script_grind.message = "Moving back to hotspot";
	end	

-- clear our target if we are needing to move to vendor. combat script will stick to a target and enemyObj var needs cleared
	if script_vendor.status ~= 0 and not IsInCombat() and script_grind.enemyObj ~= nil then
		script_grind.enemyObj = nil;
		ClearTarget();
	end

-- go to FP buttons
	if (fpDB.goTo) and (not GetLocalPlayer():IsDead()) and (not IsEating()) and (not IsDrinking()) then	
		if (IsInCombat() and script_grind.pause) then
			if (GetLocalPlayer():GetUnitsTarget() ~= 0 and GetLocalPlayer():GetUnitsTarget() ~= nil) then
				if (RunCombatScript(GetLocalPlayer():GetUnitsTarget():GetGUID())) then
					script_grind.pause = false;
					return true;
				end
			end
		elseif (not IsInCombat()) then

		local x, y, r, g, b = 0, 0, 0, 0, 0;
		

			script_grind.pause = true;
			if (fpDB.goToAshenvaleBool) then
				fpDB:goToAshenvale();
			end
			if (fpDB.goToNearestFPBool) then
				fpDB:goToNearestFP();
				DrawText("Moving To Closest Flight Path... ",  x+800, y+300, r+255, g+255, b+0);
			end
			return true;
		end
	end



-- very quick pickpocketing WORKS WHEN GRINDER IS PAUSED
	--if (not script_grind.pause) and (not IsInCombat()) and (GetLocalPlayer():HasBuff("Stealth")) and (GetLocalPlayer():GetUnitsTarget() ~= 0 and GetLocalPlayer():GetUnitsTarget() ~= nil) then
		if (GetLocalPlayer():HasBuff("Stealth")) and (PlayerHasTarget()) and (not IsInCombat()) then
			if (GetLocalPlayer():GetUnitsTarget():GetDistance() <= script_grind.lootDistance) then
				if (IsLooting()) then
					if (not LootTarget()) then
						return;
					end
				end
				--if (script_grind.waitTimer > GetTimeEX()) then
				--	return;
				--end
				--if (not CastHeal("Pick Pocket", GetLocalPlayer():GetUnitsTarget())) then
				--	script_grind.waitTimer = GetTimeEX() + 1550;
				--end
				
			end
		end
	--end

-- buff other players
	if (not script_grind.pause)
	and (not script_getSpells:cityZones())
	and (not IsInCombat())
	and (GetTimeEX() > script_grind.buffTimer)
	and (script_buffOtherPlayers.enableBuffs)
	and (GetLocalPlayer():GetManaPercentage() >= 40)
	and (script_vendor.status == 0)
	and (IsStanding())
	and (not script_grind.afkUsed)
	
	then

		if (HasSpell("Arcane Intellect") or HasSpell("Mark of the Wild") or HasSpell("Power Word: Fortitude") or HasSpell("Blessing of Might")) then
			script_grind.buffTimer = GetTimeEX() + 5500;
			if (not HasSpell("Blessing of Might")) then
				if (script_buffOtherPlayers:doBuffs()) then
					if (not IsStanding()) then
						JumpOrAscendStart();
					end
					return true;
				end
			elseif (HasSpell("Blessing of Might")) then
				if (script_buffOtherPlayers:doBuffsPaladin()) then
					if (IsStanding()) then
						JumpOrAscendStart();
					end
					return true;
				end
			end
		end	
	end

-- sit timer
	-- set sit timer
	if (not IsMoving()) and (IsStanding()) and (not script_grind.sitTimerSet) and (not IsInCombat()) and (not IsCasting()) and (not IsChanneling()) then
		script_grind.sitTimerSet = true;
		script_grind.timeToSit = GetTimeEX() + 300000;
	end
	if (not IsMoving()) and (IsStanding()) and (not IsInCombat()) and (not IsCasting()) and (not IsChanneling()) then
		local px, py, pz = GetLocalPlayer():GetPosition();
		local _tX, _tY, onScreen = WorldToScreen(px, py, pz);
		local timer = math.floor(((script_grind.timeToSit - GetTimeEX())/1000));
		DrawText("Time to sit - "..timer.." Seconds", _tX+ 50, _tY-70, 0, 255, 0);
		DrawText("Add /afk macro to action bar '2' slot '='", _tX+50, _tY-86, 0, 255, 0);
	end

-- reset sit timer when moving or sitting
	if (IsMoving()) or (not IsStanding()) or (IsInCombat()) then
		script_grind.sitTimerSet = false;
		script_grind.timeToSit = GetTimeEX() + 300000;
		if (script_grind.afkUsed) then
			--undo afk
			script_grind.afkUsed = false;
			UseAction(script_grind.afkActionSlot, 0, 0);
		end
	end

-- sit when we aren't doing anything - the bot doesn't do /afk automatically...
	if (GetTimeEX() > script_grind.timeToSit) and (IsStanding()) and (script_grind.sitTimerSet) and (not IsInCombat()) and (not IsMoving()) then
		SitOrStand();
		UseAction(script_grind.afkActionSlot, 0, 0);
		script_grind.timeToSit = GetTimeEX() + 300000;
		script_grind.afkSet = true;
		script_grind.sitTimerSet = false;
	end

-- use flight paths
	if (script_grind.useFPS) then
		if (UnitOnTaxi('player')) and (script_grind.getSpells) then
			script_grind.fpPause = true;
			script_grind.pause = true;
		end
		if (script_grind.getSpells) and (not UnitOnTaxi('player')) and (script_grind.pause) and (script_grind.fpPause) then
			script_grind.fpPause = false;
			script_grind.pause = false;
		end
	end

-- Update pull levels if we leveled up
	if (script_grind.currentLevel < GetLocalPlayer():GetLevel()) then
		script_grind.currentLevel = GetLocalPlayer():GetLevel();
		script_grind.minLevel = script_grind.minLevel + 1;
		script_grind.maxLevel = script_grind.maxLevel + 1;
	end

return false;
end