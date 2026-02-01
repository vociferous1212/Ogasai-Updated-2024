script_gatherer = {
	
	isSetup = false,
	enemyTarget = 0,
	waitTimer = 0,
	message = "Starting the gatherer...",
	lootTimer = GetTimeEX(),
	usingGatherer = false,

	gathererPathsLoaded = include("scripts\\gather\\script_gathererPaths.lua"),
	tempWindowLoaded = include("scripts\\gather\\tempSetupWindow.lua"),
	getCurrentAreaAndPathLoaded = include("scripts\\gather\\getCurrentAreaAndPath.lua"),

}

function script_gatherer:setup()

	script_gather.gatherDistance = 250;
	if GetMapID() == 331 then script_gather.gatherDistance = 100; end
	script_grind.drawGather = true;
	script_gather.collectChests = false;
	script_grind.useVendor = false;
	script_grind.drawUnits = false;
	script_grind.stopBotWhenInvFull = true;

	script_grind:setup();

	-- setup gather paths folder
	alteracGatherPaths:setupAlteracPaths(); arathiGatherPaths:setupArathiPaths(); ashenvaleGatherPaths:setupAshenvalePaths();
	azsharaGatherPaths:setupAzsharaPaths(); badlandsGatherPaths:setupBadlandsPaths(); barrensGatherPaths:setupBarrensPaths();
	blastedlandsGatherPaths:setupBlastedlandsPaths(); burningsteppesGatherPaths:setupBurningsteppesPaths(); darkshoreGatherPaths:setupDarkshorePaths();
	deadwindGatherPaths:setupDeadwindPaths(); desolaceGatherPaths:setupDesolacePaths(); dunmoroghGatherPaths:setupDunmoroghPaths();
	durotarGatherPaths:setupDurotarPaths(); duskwoodGatherPaths:setupDuskwoodPaths(); dustwallowGatherPaths:setupDustwallowPaths();
	easternplaguelandsGatherPaths:setupEasternplaguelandsPaths(); elwynnGatherPaths:setupElwynnPaths(); felwoodGatherPaths:setupFelwoodPaths();
	feralasGatherPaths:setupFeralasPaths(); hillsbradGatherPaths:setupHillsbradPaths(); hinterlandsGatherPaths:setupHinterlandsPaths();
	lochmodanGatherPaths:setupLochmodanPaths(); moongladeGatherPaths:setupMoongladePaths(); mulgoreGatherPaths:setupMulgorePaths();
	redridgeGatherPaths:setupRedridgePaths(); searinggorgeGatherPaths:setupSearinggorgePaths(); silithusGatherPaths:setupSilithusPaths();
	silverpineGatherPaths:setupSilverpinePaths(); stonetalonGatherPaths:setupStonetalonPaths(); stranglethornGatherPaths:setupStranglethornPaths();
	swampofsorrowsGatherPaths:setupSwampofsorrowsPaths(); tanarisGatherPaths:setupTanarisPaths(); teldrassilGatherPaths:setupTeldrassilPaths();
	thousandneedlesGatherPaths:setupThousandneedlesPaths(); tirisfalGatherPaths:setupTirisfalPaths(); ungoroGatherPaths:setupUngoroPaths();
	westernplaguelandsGatherPaths:setupWesternplaguelandsPaths(); westfallGatherPaths:setupWestfallPaths(); wetlandsGatherPaths:setupWetlandsPaths();
	winterspringGatherPaths:setupWinterspringPaths();

	self.isSetup = true;
end

function script_gatherer:run()

	self.usingGatherer = true;

	script_grind.message = self.message;

	script_gatherer:window()

	if not self.isSetup then
		script_gatherer:setup();
	end

	-- Set next to node distance and nav-mesh smoothness to double that number
	if (IsMounted()) then
		script_nav:setNextToNodeDist(5); NavmeshSmooth(script_grind.nextToNodeDist*2.5);
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
		NavmeshSmooth(3);
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

-- if timer isn't done then return
	if self.waitTimer > GetTimeEX() or script_grind.waitTimer > GetTimeEX() then
		return;
	end

	if IsLooting() and GetTimeEX() > self.lootTimer then LootTarget(); self.lootTimer = GetTimeEX() + 500; return; end

	-- check intial unstuck
	if not script_grind.pause and script_grind.useUnstuck and GetTimeEX() > script_grind.unstuckTimer then
		if script_unstuck:checkUnstuck() then
			script_grind.unstuckTimer = GetTimeEX() + 350;
		end
	end

-- our position must be changing and we must still be stuck so try another unstuck
-- use unstuck feature
	if (script_grind.useUnstuck) and (IsMoving()) and (not script_grind.pause) and GetTimeEX() > script_grind.unstuckTimer then
		if (not script_unstuck:pathClearAuto(2)) then
			script_grind.unstuckTimer = GetTimeEX() + 750;
			script_unstuck:unstuck();
		end
	end

-- we are dead so retrieve corpse
	if (localObj:IsDead()) then

		-- wait for a moment before anything
		if localObj:IsDead() and not IsGhost() then
			script_grind.waitTimer = GetTimeEX() + 2000;
		end

		-- Release body
		if (not IsGhost()) then

			-- try to wait before releasing to ghost
			script_grind.waitTimer = GetTimeEX() + 4000;

			-- release to ghost
			if (not RepopMe()) then
		
				-- set the death counter +1
				if (script_grind.useThisVar) then
					script_grindEX.deathCounter = script_grindEX.deathCounter + 1;
					script_grind.useThisVar = false;
				end

				-- wait a moment for the game to load before moving
				script_grind.waitTimer = GetTimeEX() + 1500;
			return true;
			end
		return true;
		end

		-- make sure we are ghost before moving on to finding corpse
		if IsGhost() then

						script_grind.message = "Walking to corpse...";

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
			script_grind.useThisVar = true;
			end
		return true;
		end
	end

	-- early check to see if bags are full
	script_grindIfBagsFull:checkBagsIfTheyAreFull()

-- if bags are full and we are not using vendor
	if script_grind.useVendor and script_grind.stopBotWhenInvFull then
		script_grind.stopBotWhenInvFull = false;
	end
	if not IsInCombat() and script_grind.stopBotWhenInvFull and (AreBagsFull() or script_grind.bagsFull or script_hunter.bagsFull) then
		script_grind.message = "Bags are full... Stopping bot..."
		return;
	end	

-- if our bags are full and we aren't skipping looting and not using vendor
	if (AreBagsFull() or script_grind.bagsFull or script_hunter.bagsFull)
	and not script_grind.useVendor
	and not script_grind.stopBotWhenInvFull
	and not IsInCombat()
	and not script_grind:shouldWeRest()
	
	then

		if script_grind.hsWhenFull or script_grind.stopWhenFull then

	-- run script for when our bags are full
			script_grindIfBagsFull:ifBagsFull();

			return true;
		end
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

	if not IsInCombat() and not IsCasting() and not IsChanneling() and not IsMounted() then
		if (script_grind:runRest()) then
				RunRestScript();
			return true;
		end
	end
	
-- if we are in combat then kill stuff
	if not IsLooting() and (IsInCombat() and (script_grindIsAnyTargetTargetingPet:isAnyTargetTargetingPet() or script_grind:isAnyTargetTargetingMe())) and not IsMounted() then

		-- well, if we are in combat we need to dismount but don't dismount if we are in combat!
		if IsMounted() then
			DisMount();
		end

		-- reset timers
		script_grind.newTargetTime = GetTimeEX();
		script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
		script_gather.blacklistTime = GetTimeEX() + (script_gather.blacklistSetTime * 1000);
		script_grind.autoBlacklistTimer = GetTimeEX() + 15000;

		if self.enemtTarget ~= nil and self.enemtTarget ~= 0 then
			self.enemyTarget:AutoAttack();
		end
		-- get a target
		if GetTarget() ~= nil and GetTarget() ~= 0 then
			if GetTarget():CanAttack() and not GetTarget():IsDead() then
				self.enemyTarget = GetTarget();
			end
			if GetTarget():IsDead() then
				ClearTarget();
			end
		end
	
		if HasPet() and PetHasTarget() then
			AssistUnit("pet");
			if GetTarget() ~= nil and GetTarget() ~= 0 then
				self.enemyTarget = GetTarget();
			end
		end

			local _x, _y, _z = self.enemyTarget:GetPosition();
		if self.enemyTarget:GetDistance() > script_grind.combatScriptRange then
			script_navEXCombat:moveToTarget(localObj, _x, _y, _z);
			self.message = "Moving To Target Combat NavEX - " ..math.floor(self.enemyTarget:GetDistance()).. " (yd) "..self.enemyTarget:GetUnitName().. "";
			return false;
		end

		-- run combat script
		if self.enemyTarget ~= nil and self.enemyTarget ~= 0 and not IsLooting() and not IsCasting() and not IsChanneling() then
			if self.enemyTarget:IsDead() then ClearTarget(); return; end
			RunCombatScript(self.enemyTarget:GetGUID());
			self.message = "Running combat script || "..self.enemyTarget:GetUnitName().." - "..math.floor(self.enemyTarget:GetDistance()).." (yd)";
		end

	-- return until done
	return true;
	end

	-- mount up
	if ((script_gather.nodeObj == nil or script_gather.nodeObj == 0) or (script_gather.nodeObj ~= nil and script_gather.nodeObj ~= 0 and script_gather.nodeObj:GetDistance() > 40)) and
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
				if not IsSwimming() then
					if not IsSwimming() then
						script_grind:setWaitTimer(4500);
					end
				end
				return;
			end
			return;
		end
	return;
	end
	
	if script_gather.nodeObj ~= 0 and script_gather.nodeObj ~= nil and (not IsInCombat() or IsMounted()) then
		script_grind.message = "Gathering - "..script_gather.nodeObj:GetUnitName().. " - "..math.floor(script_gather.nodeObj:GetDistance()).." (yd)";
	end

	if (script_grind.lootObj ~= nil and not script_grind.skipLooting and not AreBagsFull() and not script_grind.bagsFull and not script_hunter.bagsFull) then
		return;
	end

-- run the gatherer
	if (script_gatherRun:gather()) then

		-- find the closest path node after gathering
		script_gathererPaths.currentLocationInPath = script_gathererPaths:findClosestPathNode()

		return;

-- else move to new path node
	elseif not script_gather.gathering and not IsCasting() and not IsChanneling() and not IsLooting() then


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
		tempSetupWindow:tempSetupWindow()
	end

end

function script_gatherer:draw()

	script_grind:drawStatus();

	-- Draw locations on screen
	if script_gathererPaths.numPaths ~= nil and script_gathererPaths.paths ~= nil and script_grind.drawAutoPath then

	for i = 1, script_gathererPaths.numPaths -1 do
			local tX, tY, onScreen = WorldToScreen(script_gathererPaths.paths[i]['pos']['x'], script_gathererPaths.paths[i]['pos']['y'], script_gathererPaths.paths[i]['pos']['z'])
			if onScreen then
				DrawText('Path Node: '..i+1, tX, tY - 20, 0, 255, 255)
			end
	   end
	end
end

