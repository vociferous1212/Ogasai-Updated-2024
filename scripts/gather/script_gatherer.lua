script_gatherer = {
	
	isSetup = false,
	enemyTarget = 0,
	waitTimer = 0,
	message = "Starting the gatherer...",
	lootTimer = GetTimeEX(),

	gathererPathsLoaded = include("scripts\\gather\\script_gathererPaths.lua"),

}


function script_gatherer:setup()

	script_gather.gatherDistance = 250;
	script_grind:setup();

	darkshoreGatherPaths:setupDarkshorePaths();
	ashenvaleGatherPaths:setupAshenvalePaths();

	self.isSetup = true;
end

function script_gatherer:run()

	script_grind.message = self.message;

	script_gatherer:window()

	if not self.isSetup then
		script_gatherer:setup();
	end

-- pause bot
	if script_grind.pause then
		-- set paranoid used to off to reset paranoia
		script_paranoia.paranoiaUsed = false;
		--reset new target time for blacklisting
		script_grind.newTargetTime = GetTimeEX();
		script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
		script_gather.blacklistTime = GetTimeEX() + (script_gather.blacklistSetTime * 1000);
		script_grind.autoBlacklistTimer = GetTimeEX() + 15000;
	return;
	end

	if script_gather.nodeObj ~= 0 and script_gather.nodeObj ~= nil and not IsInCombat() and not IsCasting() and not IsChanneling() then
			self.message = "Gathering - "..script_gather.nodeObj:GetUnitName().. " - "..math.floor(script_gather.nodeObj:GetDistance()).." (yd)";
		end


-- if timer isn't done then return
	if self.waitTimer > GetTimeEX() or script_grind.waitTimer > GetTimeEX() then
		return;
	end

	-- check intial unstuck
	if not script_grind.pause and script_grind.useUnstuck and GetTimeEX() > script_grind.unstuckTimer then
		if script_unstuck:checkUnstuck() then
			script_grind.unstuckTimer = GetTimeEX() + 350;
			self.message = "Checking unstuck #1";
		end
	end

-- our position must be changing and we must still be stuck so try another unstuck
-- use unstuck feature
	if (script_grind.useUnstuck) and (IsMoving()) and (not script_grind.pause) and GetTimeEX() > script_grind.unstuckTimer then
		if (not script_unstuck:pathClearAuto(2)) then
			script_grind.unstuckTimer = GetTimeEX() + 750;
			self.message = "Checking unstuck #2";
			script_unstuck:unstuck();
		end
	end

-- if we are dead do corpse walk
	if script_grindEX:doChecks() then
		return;
	end
	if GetLocalPlayer():IsDead() then
		return;
	end

-- do loot
	if not script_grind.skipLooting and not AreBagsFull() and not script_grind.bagsFull then
			
		if (not IsInCombat()
			or (not script_grind:isAnyTargetTargetingMe()
			and not script_grindIsAnyTargetTargetingPet:isAnyTargetTargetingPet()))
		
		then

			--if not IsStanding() then JumpOrAscendStart(); end

			-- find loot target
			script_grindFindLootTarget:findLootTarget();
			
			if script_grindEX:isLootSafeToLoot() or not script_grind:shouldWeRest() then
				if script_grind.lootObj == nil and HasSpell("Skinning") and script_grind.skinning and HasItem("Skinning Knife") then

					script_grind.lootObj = script_grind:getSkinTarget(script_grind.findLootDistance);
						
				end

				if (script_grind.lootObj ~= nil or not script_grind:isAnyTargetTargetingMe())
				and not IsEating()
				and not IsDrinking()
				and not IsCasting()
				and not IsChanneling()
				
				then

					if script_grindDoLoot:doLoot(GetLocalPlayer()) then

						if IsEating() or IsDrinking() or IsChanneling() or IsCasting() then
							script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
						end
					return true;
					end
			
				end
			end	
		end
	end
	
	--if a target is near my aggro range and we choose to attack stuff then
	--	attack it first
	--end

-- if we are in combat then kill stuff
	if IsInCombat() and not IsMounted() then

		-- well, if we are in combat we need to dismount but don't dismount if we are in combat!
		if IsMounted() then
			DisMount();
		end

		-- reset timers
		script_grind.newTargetTime = GetTimeEX();
		script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
		script_gather.blacklistTime = GetTimeEX() + (script_gather.blacklistSetTime * 1000);
		script_grind.autoBlacklistTimer = GetTimeEX() + 15000;

		-- get a target
		if GetTarget() ~= nil and GetTarget() ~= 0 then
			if GetTarget():CanAttack() and not GetTarget():IsDead() then
				self.enemyTarget = GetTarget();
			end
			if GetTarget():IsDead() then
				ClearTarget();
			end
		end
		if HasPet() then
			if PetHasTarget() and not GetPet():GetUnitsTarget():IsDead() then
				self.enemyTarget = GetPet():GetUnitsTarget();
			end
		end

		-- run combat script
		if self.enemyTarget ~= nil and self.enemyTarget ~= 0 then
			if self.enemyTarget:IsDead() then ClearTarget(); return; end
			RunCombatScript(self.enemyTarget:GetGUID());
			self.message = "Running combat script || "..self.enemyTarget:GetUnitName().." - "..math.floor(self.enemyTarget:GetDistance()).." (yd)";

			if self.enemyTarget:GetDistance() > script_grind.combatScriptRange then
				local x, y, z = self.enemyTarget:GetPosition();
				script_navEXCombat:moveToTarget(GetLocalPlayer(), x, y, z)
				self.waitTimer = GetTimeEX() + 150;
			end
		end
	-- return until done
	return;
	end

	-- mount up
	if ((script_gather.nodeObj == nil or script_gather.nodeObj == 0) or (script_gather.nodeObj ~= nil and script_gather.nodeObj ~= 0 and script_gather.nodeObj:GetDistance() > 20)) and
	not script_gather.gathering and not IsSwimming() and GetTimeEX() > script_grind.tryMountTimer and script_grind.hasAMount and (not IsInCombat())
	and (not IsMounted()) and (not IsIndoors()) and (not HasForm()) and (script_grind.useMount)
	and not IsCasting() and not IsChanneling() and not IsLooting()
	then
		if (IsMoving()) then
			StopMoving();
			return true;
		end
						self.message = "Trying to mount...";

		if (not IsIndoors()) and (not IsMoving()) then
			if (script_helper:mountUp()) then
				script_grind:setWaitTimer(4500);
				return;
			end
			return;
		end
	return;
	end

	if IsLooting() and GetTimeEX() > self.lootTimer then LootTarget(); self.lootTimer = GetTimeEX() + 500; return; end
	if script_grind.lootObj ~= nil and not script_grind.skipLooting and not AreBagsFull() and not script_grind.bagsFull and not script_hunter.bagsFull then
		return;
	end

-- run the gatherer
	if (script_gatherRun:gather()) then

		return;

-- else move to new path node
	elseif not script_gather.gathering then


		script_gathererPaths:moveThroughPaths();

		local var = script_gathererPaths.currentLocationInPath + 1
		local dist = math.floor(GetDistance3D(_x, _y, _z, script_gathererPaths.paths[script_gathererPaths.currentLocationInPath]['pos']['x'], script_gathererPaths.paths[script_gathererPaths.currentLocationInPath]['pos']['y'], script_gathererPaths.paths[script_gathererPaths.currentLocationInPath]['pos']['z']));
		self.message = "Moving to path node - "..var.. " || "..dist.. " (yd)";

	end

end

-- draw grinder window
function script_gatherer:window()
	EndWindow();
	if(NewWindow("Gatherer", 320, 300)) then
		script_grindMenu:menu();
	end

	-- temp setup window to add paths to file
	EndWindow();
	if NewWindow("Temp Gatherer Setup", 100, 100) then
		script_gatherer:tempSetupWindow();
	end

end

function script_gatherer:draw()

	script_grind:drawStatus();

	-- Draw locations on screen
	if script_gathererPaths.numPaths ~= nil and script_gathererPaths.paths ~= nil then

    for i = 1, script_gathererPaths.numPaths -1 do
            local tX, tY, onScreen = WorldToScreen(script_gathererPaths.paths[i]['pos']['x'], script_gathererPaths.paths[i]['pos']['y'], script_gathererPaths.paths[i]['pos']['z'])
            if onScreen then
                DrawText('Path Node: '..i+1, tX, tY - 20, 0, 255, 255)
            end
       end
    end
end

function script_gatherer:tempSetupWindow()

-- add current position to file as a path node
	if Button("Add to file") then

		if GetMapID() == 148 then
			local a = "darkshoreGatherPaths:addDarkshorePath(darkshoreGatherPaths.numDarkshorePaths, "
			local b, c, d = GetLocalPlayer():GetPosition();
			local e = ");"

			ToFile(a..b..", "..c..", "..d..e);
			DEFAULT_CHAT_FRAME:AddMessage("added to log file...");
		end
		if GetMapID() == 331 then
			local a = "darkshoreGatherPaths:addDarkshorePath(darkshoreGatherPaths.numDarkshorePaths, "
			local b, c, d = GetLocalPlayer():GetPosition();
			local e = ");"

			ToFile(a..b..", "..c..", "..d..e);
			DEFAULT_CHAT_FRAME:AddMessage("added to log file...");
		end
	end
end