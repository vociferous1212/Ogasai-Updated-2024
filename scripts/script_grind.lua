script_grind = {
	grinderSetupIncluded = include("scripts\\script_grindSetup.lua"),
	aggroLoaded = include("scripts\\script_aggro.lua"),
	grindPartyOptionsLoaded = include("scripts\\script_grindParty.lua"),
	expExtra = include("scripts\\script_expChecker.lua"),
	unstuckLoaded = include("scripts\\script_unstuck.lua"),
	paranoiaLoaded = include("scripts\\paranoia\\script_paranoia.lua"),
	radarLoaded = include("scripts\\script_radar.lua"),
	debuffCheck = include("scripts\\script_checkDebuffs.lua"),
	drawStatusScript = include("scripts\\script_drawStatus.lua"),
	drawStatusEXScript = include("scripts\\script_drawStatusEX.lua"),
	omLoaded = include("scripts\\script_om.lua"),
	navFunctionsLoaded 	= include("scripts\\nav\\script_nav.lua"),
	runnerLoaded 	= include("scripts\\script_runner.lua"),
	includeNavEX 		= include("scripts\\nav\\script_navEX.lua"),
	includeNavEXCombat 	= include("scripts\\nav\\script_navEXCombat.lua"),
	hotspotMoveLoaded 	= include("scripts\\nav\\script_moveToHotspot.lua"),
	enchantingLoaded 	= include("scripts\\professions\\script_enchanting.lua"),
	tailoringLoaded 	= include("scripts\\professions\\script_tailoring.lua"),
	firstAidLoaded 		= include("scripts\\professions\\script_firstAid.lua"),
	--hotspotInfoLoaded 	= include("scripts\\db\\hotspotDB_setInfo_1_10.lua"),
	fpDBLoaded 		= include("scripts\\db\\fpDB.lua"),
	goToFPLoaded 		= include("scripts\\getTrainerSpells\\script_goToFP.lua"),
	prioritizeTotemsLoaded	= include("scripts\\script_killTotems.lua"),

	assignTargetFunctionLoaded = include("scripts\\script_grindAssignTarget.lua"), 
	checkValidEnemyFunctionLoaded = include("scripts\\script_grindValidEnemy.lua"), 

	helperLoaded = include("scripts\\script_helper.lua"),
	checkAddsLoaded = include("scripts\\script_checkAdds.lua"),
	talentLoaded = include("scripts\\script_talent.lua"),
	includeDrawData = include("scripts\\script_drawData.lua"),
	vendorLoaded = include("scripts\\script_vendor.lua"),
	gatherLoaded = include("scripts\\gather\\script_gather.lua"),
	grindExtra = include("scripts\\script_grindEX.lua"),
	extraFunctionsLoaded = include("scripts\\script_extraFunctions.lua"),
	getSpellsLoaded = include("scripts\\getTrainerSpells\\script_getSpells.lua"),
	gatherEXLoaded = include("scripts\\gather\\script_gatherEX.lua"),
	gatherEX2Loaded = include("scripts\\gather\\script_gatherEX2.lua"),
	gatherRunLoaded = include("scripts\\gather\\script_gatherRun.lua"),
	deleteItemsLoaded = include("scripts\\script_deleteItems.lua"),
	buffOtherPlayersLoaded = include("scripts\\script_buffOtherPlayers.lua");

	mageMenu = include("scripts\\combat\\script_mageEX.lua"),
	warlockMenu = include("scripts\\combat\\warlock\\script_warlockEX.lua"),
	priestMenu = include("scripts\\combat\\script_priestMenu.lua"),
	warriorMenu = include("scripts\\combat\\script_warriorEX.lua"),
	rogueMenu = include("scripts\\combat\\rogue\\script_rogueEX.lua"),
	paladinMenu = include("scripts\\combat\\script_paladinEX.lua"),
	shamanMenu = include("scripts\\combat\\shaman\\script_shamanEX.lua"),
	druidMenu = include("scripts\\combat\\druid\\script_druidEX.lua"),

	paranoiaMenuLoaded = include("scripts\\menu\\script_paranoiaMenu.lua"),
	grindMenu = include("scripts\\menu\\script_grindMenu.lua"),
	gatherMenuLoaded = include("scripts\\menu\\script_gatherMenu.lua"),
	targetMenu = include("scripts\\menu\\script_targetMenu.lua"),
	grindPartyMenuIncluded = include("scripts\\menu\\script_grindPartyMenu.lua"),
	counterMenuIncluded = include("scripts\\menu\\script_counterMenu.lua"),
	debugMenuIncluded = include("scripts\\menu\\script_debugMenu.lua"),
	lootMenuIncluded = include("scripts\\menu\\script_lootMenu.lua"),
	miscMenuIncluded = include("scripts\\menu\\script_miscMenu.lua"),
	displayOptionsMenuIncluded = include("scripts\\menu\\script_displayOptionsMenu.lua"),
	vendorMenuIncluded = include("scripts\\menu\\script_vendorMenu.lua"),
	pathMenuIncluded = include("scripts\\menu\\script_pathMenu.lua"),
	getObjectsIncluded = include("scripts\\getObjectsAroundMe.lua"),

	pathName = 0,
	pathLoaded = 0,
	getSpells = false,
	jump = true,	-- enable jumping out of combat
	jumpRandomFloat = 99,	-- jump > than 
	jumpCheck = false,
	useVendor = true,	-- use vendor
	repairWhenYellow = true,	-- repair when yellow
	stopWhenFull = false,	-- stop when bags are full
	hsWhenFull = false,	-- hearthstone when bags are full
	useMount = false,	-- use mount
	checkBagTimer = GetTimeEX(),
	mountTimer = GetTimeEX(),	-- defunct setting
	enemyObj = nil,	-- enemyObj stops a bug
	lootObj = nil,	-- lootObj stops a bug
	timer = GetTimeEX(),	-- blacklist timer
	tickRate = 1550,		-- reaction time / speed of scripts
	waitTimer = GetTimeEX(),	-- wait timer
	pullDistance = 225,	-- find target distance
	avoidElite = true,	-- avoid elites ( currently not working )
	avoidRange = 40,	-- aboid elites range
	findLootDistance = 75,
	lootDistance = 3.05,
	skipLooting = false,
	lootCheck = {},
	minLevel = GetLocalPlayer():GetLevel()-5,
	maxLevel = GetLocalPlayer():GetLevel()+2,
	ressDistance = 29,
	combatError = 0,
	autoTalent = false,
	myX = 0,
	myY = 0,
	myZ = 0,
	myTime = GetTimeEX(),
	message = 'Starting the grinder...',
	skipUnknown = false, -- skip not specified npc - ooze, etc
	skipHumanoid = false,
	skipElemental = false,
	skipUndead = false,
	skipDemon = false,
	skipBeast = false,
	skipAberration = false,
	skipDragonkin = false,
	skipGiant = false,
	skipMechanical = false,	
	skipElites = true,
	paranoidRange = 75,	-- paranoia range
	nextToNodeDist = 3.05, -- (Set to about half your nav smoothness)
	blacklistedTargets = {},	-- GUID table of blacklisted targets
	blacklistedNum = 0,	-- number of blacklisted targets
	hardBlacklistedTargets = {},	-- GUID table of blacklisted targets
	hardBlacklistedNum = 0,	-- number of blacklisted targets
	lootBlacklistedTargets = {},
	lootBlacklistedNum = 0,
	isSetup = false,	-- is setup function run
	drawUnits = true,	-- draw unit data on screen
	Name = "", -- set to e.g. "paths\1-5 Durator.xml" for auto load at startup
	pathLoaded = "",	-- path that is loaded
	drawPath = true,	-- draw path
	autoPath = true,	-- use nav 
	drawAutoPath = true,	-- draw walk path
	distToHotSpot = 500,	-- distance to target enemies from hotspot
	staticHotSpot = true,	-- use hotspots
	hotSpotTimer = GetTimeEX(),	-- timer to hotspot
	currentLevel = GetLocalPlayer():GetLevel(),	-- current player level
	skinning = false,	-- use skinning
	gather = true,		-- use gatherer script
	lastTarget = 0,		-- last target targeted
	newTargetTime = GetTimeEX(),	-- set new target wait time
	blacklistTime = 30,	-- time to blacklist mobs
	drawEnabled = true,	-- draw on screen menus
	showClassOptions = true,	-- setup function to show menu
	pause = true,		-- pause script
	bagsFull = false,	-- are bags full
	vendorRefill = false,	-- refill at vendor FOOD AND DRINK REFIL
	useMana = true,		-- does player use mana
	drawGather = false,	-- draw gather nodes
	hotspotReached = false,	-- is hotspot reached
	drawAggro = false,	-- draw aggro range circles
	safeRess = true,	-- ressurect in safe area
	skipHardPull = true,	-- skip adds
	useUnstuck = true,	-- use unstuck script
	blacklistAdds = 1,	-- blacklist targets when there are x adds
	blacklistedNameNum = 0,	-- number of blacklisted targets
	hardBlacklistedNameNum = 0,	-- number of blacklisted targets
	lootBlacklistedNameNum = 0,
	useExpChecker = true,	-- run exp checker
	paranoidSetTimer = 22,	-- time to wait after paranoia has needed
	useString = true,	-- message to send to log players in range run once
	useOtherString = true,	-- message to send to log players targeting us run once
	useLogoutTimer = false,	-- use logout timer true/false
	logoutSetTime = GetTimeEX() / 1000,	-- set the logout time in seconds
	logoutTime = 2,	-- logout time in hours
	adjustTickRate = false,	-- adjust script tick rate
	lootCheckTime = 0,	-- loot check time
	afkActionSlot = "24",	-- /afk slot for paranoia
	playerParanoidDistance = 0,	-- paranoid player check their distance
	paranoidTarget = "",	-- name of paranoid players
	currentTime2 = GetTimeEX() / 1000,	-- paranoia logout timer
	setParanoidTimer = 213,		-- time added to paranoid logout timer
	playerName = "",	-- paranoid player name
	otherName = player,	-- paranoid player name
	playerPos = 0,	-- paranoid player pos
	blacklistLootTime = 0,	-- blacklist loot time
	blacklistLootTimeCheck = 0,
	blacklistLootTimeVar = 45,
	timerSet = false,	-- blacklist loot timer set
	messageOnce = true,	-- message once blacklist loot obj
	perHasTarget = false,	-- used to check pet target during rest
	extraSafe = true,
	monsterKillCount = 0,
	useAnotherVar = false,
	currentMoney = GetMoney(),
	moneyObtainedCount = 0,
	lastAvoidTarget = GetLocalPlayer(),
	paranoiaCounter = 0,
	usedParanoiaCounter = false,
	omTimer = GetTimeEX(),
	drawChests = true,
	deleteItems = true,
	stealthRanOnce = false,	-- used for checking if we have stealth and need to turn auto attack on then off
	needRest = false,
	attackTimer = 0,
	useAutoHotspotDist = false,	-- auto hotspot distance for each area
	autoSelectTargets = false,	-- auto select target type for each area
	autoSelectVendors = true,	-- auto select vendors when moving to new areas
	myLastX = 0,		-- set coords for auto reload vendors DB. can cause lag with continous reloading...
	myLastY = 0,		-- set coords
	myLastZ = 0,		-- set coords
	vendorMessageSent = false,	-- send message to chat frame - vendors loaded from DB...
	safePullAvoidTargets = false,	-- TODO try to safe pull avoided targets with adds nearby...
	swimJumpTimer = 0,	-- jump when swimming
	buffTimer = 0,		-- timer to buff other players in range
	restMana = 1,
	restHealth = 1,
	killStuffAroundGatherNodes = true,
	timeToSit = GetTimeEX(),
	sitTimerSet = false,
	afkUsed = false,
	combatScriptRange = 30,
	--attackTargetsOnRoutes = true,
	drawAggroAtStart = true,
	showOM = false,
	useFirstAid = true,
	blacklistTargetName = "",
	blacklistTargetName2 = "",
	moveTimer = 0,		-- timer for movement when stuck
	lastTargetKilled = 0,	-- last target killed by grinder
	fpPause = false,	-- was script paused by fp script
	useFPS = false,		-- use flight paths
	eatHealth = 50,
	drinkMana = 50,
	autoAttackActionSlot = 0,
	targetHasRangedWeaponTable = {},
	targetHasRangedWeaponTableNum = 0,
	autoBlacklistTimer = 0,
	autoBlacklistTimerSet = false,
	checkTotemKillTimer = GetTimeEX(),

}			

function script_grind:setup()

	script_grindSetup:setup();

	-- we are setup don't reload these items here
	self.isSetup = true;

end

-- draw grinder window
function script_grind:window()
	EndWindow();
	if(NewWindow("Grinder", 320, 300)) then
		script_grindMenu:menu();
	end
end

-- set timer for grind script to run
function script_grind:setWaitTimer(ms)
	self.waitTimer = (GetTimeEX() + (ms));
end

-- add target to blacklist table by GUID
function script_grind:addTargetToBlacklist(targetGUID)
	if (targetGUID ~= nil and targetGUID ~= 0 and targetGUID ~= '') then	
		self.blacklistedTargets[self.blacklistedNum] = targetGUID;
		self.blacklistedNum = self.blacklistedNum + 1;
	end
end

-- check if target is blacklisted by table GUID
function script_grind:isTargetBlacklisted(targetGUID) 
	for i=0,self.blacklistedNum do
		if (targetGUID == self.blacklistedTargets[i]) then
			return true;
		end
	end
	return false;
end

-- add target to hard blacklist table by GUID
function script_grind:addTargetToHardBlacklist(targetGUID)
	if (targetGUID ~= nil and targetGUID ~= 0 and targetGUID ~= '') then	
		self.hardBlacklistedTargets[self.hardBlacklistedNum] = targetGUID;
		self.hardBlacklistedNum = self.hardBlacklistedNum + 1;
	end
end

function script_grind:addTargetToLootBlacklist(targetGUID)
	if (targetGUID ~= nil and targetGUID ~= 0 and targetGUID ~= '') then	
		self.lootBlacklistedTargets[self.lootBlacklistedNum] = targetGUID;
		self.lootBlacklistedNum = self.lootBlacklistedNum + 1;
	end
end

-- check if target is hard blacklisted by table GUID
function script_grind:isTargetHardBlacklisted(targetGUID) 
	for i=0,self.hardBlacklistedNum do
		if (targetGUID == self.hardBlacklistedTargets[i]) then
			return true;
		end
	end
	return false;
end

-- check if target is loot blacklisted by table GUID
function script_grind:isTargetLootBlacklisted(targetGUID) 
	for i=0,self.lootBlacklistedNum do
		if (targetGUID == self.lootBlacklistedTargets[i]) then
			return true;
		end
	end
	return false;
end

-- run grinder
function script_grind:run()

	-- show grinder window
	script_grind:window();


	-- forcing return; on navmesh causes some loading errors... returning true makes it run real slow.. we have to let maps load though...
	if (not IsUsingNavmesh()) then UseNavmesh(true);
		if (GetLoadNavmeshProgress() ~= 1) then
			script_grind.message = "Loading Nav Mesh! Please Wait!";
			return true;
		end
	end
	if (not LoadNavmesh()) and (GetLoadNavmeshProgress() ~= 1) then script_grind.message = "Make sure you have mmaps-files...";
		return true;
	end
	
	if GetLoadNavmeshProgress() ~= 1 then return true; end

	-- draw object manager and end debug window
	if (self.showOM) then
		EndWindow();

		getObjectsAroundMe:GetObjectsAroundMe();
	end

	if (script_warlock2.usingThisScript) then
			EndWindow();
		if (NewWindow("Warlock 2", 320, 320)) then
			script_warlock2:menu();
		end
	end

	if (script_grindMenu.showGarbageBox) then
		collectgarbage(collect);
	end

	if (not HasSpell("First Aid")) then
		script_grind.useFirstAid = false;
	end

	-- loot quick disenchanting
	--if (self.waitTimer > GetTimeEX()) then
	--	return;
	--end
	--if (IsLooting()) then
	--	if (LootTarget()) then
	--	self.waitTimer = GetTimeEX() + 500;
	--	return;
	--	end
	--end
	--if (script_enchanting:doEnchant()) then
	--	--self.waitTimer = GetTimeEX() + 5000;
	--end
	--ReplaceEnchant();

	-- display radar
	if (script_radar.showRadar) then
		script_radar:draw()
	end

	-- display exp checker
	if (self.useExpChecker) then
		script_expChecker:menu();
	end
	
	-- draw chests
	if (self.drawChests) then
		script_gather:drawChestNodes();
	end
	-- draw fishing pools
	if (script_gatherEX.drawFishingPools) then
		script_gatherEX:drawFishNodes();
	end	

	-- logout timer
	if (self.useLogoutTimer) then

		-- set logout time
		local currentTime = GetTimeEX() / 1000;

		-- logout when timer is set
		if (currentTime >= self.logoutSetTime + self.logoutTime * 3600) then
			Exit();
		end
	end

	-- check inventory for bag every 3 minutes... if we have none in slot 4 already
	if not IsInCombat() and not IsMoving() and GetTimeEX() > self.checkBagTimer and GetBagName(4) == nil then
		_questEquipItems:checkInventoryForBags();
		self.checkBagTimer = GetTimeEX() + 180000;
	end
	
	-- if bags full then set true
	if (AreBagsFull()) then
		self.bagsFull = true;
	end
		localObj = GetLocalPlayer();

	 -- Set next to node distance and nav-mesh smoothness to double that number
	if (IsMounted()) then
		script_nav:setNextToNodeDist(11); NavmeshSmooth(self.nextToNodeDist*1.8);
	elseif (localObj:HasBuff("Sprint")) or (localObj:HasBuff("Aspect of the Cheetah")) or (localObj:HasBuff("Dash")) or (localObj:HasBuff("Cat Form")) then
		script_nav:setNextToNodeDist(6.5); NavmeshSmooth(self.nextToNodeDist*1.8);
	elseif (race == 'Night Elf') and (localObj:IsDead()) then
		script_nav:setNextToNodeDist(8);
		NavmeshSmooth(self.nextToNodeDist*1.6);
	elseif (localObj:IsDead() or IsGhost()) then
		script_nav:setNextToNodeDist(5);
		NavmeshSmooth(self.nextToNodeDist*1.6);
	elseif (IsIndoors()) then
		script_nav:setNextToNodeDist(2.2); NavmeshSmooth(self.nextToNodeDist*1.2);
	else
		script_nav:setNextToNodeDist(self.nextToNodeDist); NavmeshSmooth(self.nextToNodeDist*1.6);
	end
	
	-- run setup function if not ran yet
	if (not self.isSetup) then
		script_grind:setup();
	end

	--check nav function loaded
	if (not self.navFunctionsLoaded) then
		self.message = "Error script_nav not loaded...";
		return;
	end

	-- check if helper is loaded
	if (not self.helperLoaded) then
		self.message = "Error script_helper not loaded...";
		return;
	end

	-- use unstuck feature ----and (not self.pause) 
	if (self.useUnstuck) and (IsMoving()) and (not self.pause) then
		if (not script_unstuck:pathClearAuto(2)) then
			script_unstuck:unstuck();
			return true;
		end
	end

	-- hotspot reached distance
	if (script_nav:getDistanceToHotspot() > self.distToHotSpot) and (self.hotspotReached) then
		self.hotspotReached = false;
		self.message = "Moving back to hotspot";
	end	

	-- go to FP buttons
	if (fpDB.goTo) and (not GetLocalPlayer():IsDead()) and (not IsEating()) and (not IsDrinking()) then	
		if (IsInCombat() and self.pause) then
			if (GetLocalPlayer():GetUnitsTarget() ~= 0 and GetLocalPlayer():GetUnitsTarget() ~= nil) then
				if (RunCombatScript(GetLocalPlayer():GetUnitsTarget():GetGUID())) then
					self.pause = false;
					return true;
				end
			end
		elseif (not IsInCombat()) then

		local x, y, r, g, b = 0, 0, 0, 0, 0;
		

			self.pause = true;
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






	-- very quick pickpocketing WORKS WHEN GRINDER IS NOT PAUSED
	--if (not self.pause) and (not IsInCombat()) and (GetLocalPlayer():HasBuff("Stealth")) and (GetLocalPlayer():GetUnitsTarget() ~= 0 and GetLocalPlayer():GetUnitsTarget() ~= nil) then
		if (GetLocalPlayer():HasBuff("Stealth")) and (PlayerHasTarget()) and (not IsInCombat()) then
			if (GetLocalPlayer():GetUnitsTarget():GetDistance() < 3) then
				if (IsLooting()) then
					if (not LootTarget()) then
						return;
					end
				end
				--if (self.waitTimer > GetTimeEX()) then
				--	return;
				--end
				--if (not CastHeal("Pick Pocket", GetLocalPlayer():GetUnitsTarget())) then
				--	self.waitTimer = GetTimeEX() + 1550;
				--end
				
			end
		end
	--end

	-- buff other players
	if (not self.pause) and (not script_getSpells:cityZones()) and (not IsInCombat()) and (GetTimeEX() > self.buffTimer) and (script_buffOtherPlayers.enableBuffs) and (GetLocalPlayer():GetManaPercentage() >= 40) and (script_vendor.status == 0) and (IsStanding()) and (not self.afkUsed) then
		if (HasSpell("Arcane Intellect") or HasSpell("Mark of the Wild") or HasSpell("Power Word: Fortitude") or HasSpell("Blessing of Might")) then
			self.buffTimer = GetTimeEX() + 5500;
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
	if (not IsMoving()) and (IsStanding()) and (not self.sitTimerSet) and (not IsInCombat()) and (not IsCasting()) and (not IsChanneling()) then
		self.sitTimerSet = true;
		self.timeToSit = GetTimeEX() + 300000;
	end
	if (not IsMoving()) and (IsStanding()) and (not IsInCombat()) and (not IsCasting()) and (not IsChanneling()) then
		local px, py, pz = GetLocalPlayer():GetPosition();
		local _tX, _tY, onScreen = WorldToScreen(px, py, pz);
		local timer = math.floor(((self.timeToSit - GetTimeEX())/1000));
		DrawText("Time to sit - "..timer.." Seconds", _tX+ 50, _tY-70, 0, 255, 0);
		DrawText("Add /afk macro to action bar '2' slot '='", _tX+50, _tY-86, 0, 255, 0);
	end
	-- reset sit timer when moving or sitting
	if (IsMoving()) or (not IsStanding()) or (IsInCombat()) then
		self.sitTimerSet = false;
		self.timeToSit = GetTimeEX() + 300000;
		if (self.afkUsed) then
			--undo afk
			self.afkUsed = false;
			UseAction(script_grind.afkActionSlot, 0, 0);
		end
	end
	-- sit when we aren't doing anything - the bot doesn't do /afk automatically...
	if (GetTimeEX() > self.timeToSit) and (IsStanding()) and (self.sitTimerSet) and (not IsInCombat()) and (not IsMoving()) then
		SitOrStand();
		UseAction(script_grind.afkActionSlot, 0, 0);
		self.timeToSit = GetTimeEX() + 300000;
		self.afkSet = true;
		self.sitTimerSet = false;
	end

	if (self.useFPS) then
		if (UnitOnTaxi('player')) and (self.getSpells) then
			self.fpPause = true;
			self.pause = true;
		end
		if (self.getSpells) and (not UnitOnTaxi('player')) and (self.pause) and (self.fpPause) then
			self.fpPause = false;
			self.pause = false;
		end
	end

	-- pause bot
	if (self.pause) then self.message = "Paused by user...";
		-- set paranoid used to off to reset paranoia
		script_paranoia.paranoiaUsed = false;
		--reset new target time for blacklisting
		script_grind.newTargetTime = GetTimeEX();
		self.blacklistLootTimeCheck = GetTimeEX() + (self.blacklistLootTimeVar * 1000);
		script_gather.blacklistTime = GetTimeEX() + (script_gather.blacklistSetTime * 1000);
		self.autoBlacklistTimer = GetTimeEX() + 15000;
		return;
	end

	if not IsInCombat() and not IsEating() and not IsDrinking() and IsStanding() and GetTimeEX() > script_helper.gateTimer then script_helper:openGates(); end

	-- Check: Spend talent points
	if (not IsInCombat() and not GetLocalPlayer():IsDead() and self.autoTalent) then
		if (script_talent:learnTalents()) then
			self.message = "Checking/learning talent: " .. script_talent:getNextTalentName();
			return;
		end
	end

	-- try to stop spell casting so we can use wand if target is really low health.. waste of mana
	-- or stop spell casting so we can frost nova and run away
	if not GetLocalPlayer():IsStunned() and not IsMoving() and IsInCombat() and script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil then
		local target = script_grind.enemyObj;
		if script_mage.useWand and GetLocalPlayer():HasRangedWeapon() and IsCasting() and target:GetDistance() <= 9 and not target:HasDebuff("Frost Nova") and not target:HasDebuff("Frostbite") then
			if (GetLocalPlayer():GetManaPercentage() <= script_mage.useWandMana or target:GetHealthPercentage() <= script_mage.useWandHealth)
			or (HasSpell("Frost Nova") and not IsSpellOnCD("Frost Nova"))
			or (HasSpell("Cone of Cold") and not IsSpellOnCD("Cone of Cold")) then
					-- stop spell casting frostbolt and fireball
				if GetLocalPlayer():GetCasting() == 8407 or GetLocalPlayer():GetCasting() == 8401 then
					SpellStopCasting();
					-- timer needed for bot to check everything and not recast frostbolt over and over...
					script_grind.waitTimer = GetTimeEX() + 500;
					script_mage.waitTimer = GetTimeEX() + 500;
				end
			end
		end
	end

-- heroic strike or maul stuck on and target moved away or we stopped casting auto attack

	local hstable = {[78] = true, [284] = true, [285] = true, [1605] = true, [1606] = true, [1607] = true, [1608] = true, [1610] = true, [1611] = true, [6158] = true, [11564] = true, [11565] = true, [11566] = true, [11567] = true, [11570] = true, [11571] = true, [25286] = true, [25354] = true, [25710] = true, [25712] = true, [25958] = true, [12282] = true, [12663] = true, [12664] = true, [6807] = true, [6808] = true, [6809] = true, [7092] = true, [8972] = true, [9745] = true, [9880] = true, [9881] = true, [12161] = true, [20751] = true};

		if (HasSpell("Heroic Strike") or HasSpell("Maul")) and (IsInCombat()) and (PlayerHasTarget()) and (GetLocalPlayer():GetUnitsTarget():GetDistance() > self.combatScriptRange) and (not script_checkAdds:checkAdds()) and (not IsMoving()) then
			GetTarget():FaceTarget();
			if hstable[GetLocalPlayer():GetCasting()] then
				SpellStopCasting();
			end

			-- check for auto attack slot
			if (IsAttackAction(self.autoAttackActionSlot) ~= 1) and (not IsMoving()) then
				for i=0, 100 do
					if IsAttackAction(i) then
						self.autoAttackActionSlot = i;
					end
				end
			end
			if (IsCurrentAction(self.autoAttackActionSlot) ~= 1) and (self.enemyObj ~= 0 and self.enemyObj ~= nil) and (not script_checkAdds:checkAdds()) then
				self.enemyObj:AutoAttack();
			end
		end

	-- run backwards target has frost nova
	if (GetLocalPlayer():GetUnitsTarget() ~= 0) and GetNumPartyMembers() < 1 then
		if (GetLocalPlayer():GetUnitsTarget():GetHealthPercentage() > 10 or GetLocalPlayer():GetHealthPercentage() < 35) and (GetLocalPlayer():GetUnitsTarget():HasDebuff("Frostbite") or GetLocalPlayer():GetUnitsTarget():HasDebuff("Frost Nova")) and (not GetLocalPlayer():HasBuff('Evocation')) and (not script_checkDebuffs:hasDisabledMovement()) and (not script_grindEX:areWeSwimming()) and (GetLocalPlayer():GetUnitsTarget():IsInLineOfSight()) then
		if (script_mage:runBackwards(targetObj, 8)) then -- Moves if the target is closer than 7 yards
			script_grind.tickRate = 0;
			script_grind.waitTimer = GetTimeEX();
			self.message = "Moving away from target...";
			if (GetLocalPlayer():GetUnitsTarget():GetDistance() >= 9) and (not IsMoving()) then
				GetLocalPlayer():GetUnitsTarget():FaceTarget();
			end
		return;
		end
	end
	end
	-- run backwards target has entangling roots
	if (GetLocalPlayer():GetUnitsTarget() ~= 0) and (GetLocalPlayer():GetManaPercentage() >= 25) and not IsBearForm() and not IsCatForm() then
		if (GetLocalPlayer():GetUnitsTarget():GetHealthPercentage() > 10 or GetLocalPlayer():GetHealthPercentage() < 35) and (GetLocalPlayer():GetUnitsTarget():HasDebuff("Entangling Roots")) and (not script_checkDebuffs:hasDisabledMovement()) and (not script_grindEX:areWeSwimming()) and (GetLocalPlayer():GetUnitsTarget():IsInLineOfSight()) then
		if (script_druid:runBackwards(targetObj, 10)) then -- Moves if the target is closer than 7 yards
			script_grind.tickRate = 0;
			script_grind.waitTimer = GetTimeEX();
			self.message = "Moving away from target...";
			if (GetLocalPlayer():GetUnitsTarget():GetDistance() >= 9) and (not IsMoving()) then
				GetLocalPlayer():GetUnitsTarget():FaceTarget();
			end
		return;
		end
	end
	end


	if (GetTarget() ~= 0 and GetTarget() ~= nil) and (GetTarget():CanAttack()) and (not GetTarget():IsDead()) then
		TargetHasRangedWeapon(target);
	end
		
	-- check party members
	if (GetNumPartyMembers() >= 1) then
		script_grindParty:partyOptions();
	end

	if (IsInCombat()) and (GetLocalPlayer():GetHealthPercentage() >= 1) and (self.skipHardPull) then
		if (self.enemyObj ~= nil and self.enemyObj ~= 0) then
			if (self.enemyObj:GetHealthPercentage() >= 20) then
				script_om:FORCEOM();
			end
		end
	end

	-- check paranoia	
		-- jump when player in range in combat
	if (IsInCombat()) and (not script_grind.undoAFK) and (script_paranoia.paranoidOn) then
		if (script_paranoiaCheck:playersWithinRange2(60)) and (script_grind.playersTargetingUs() >= 1 and script_paranoiaCheck:playersWithinRange2(25)) or (script_paranoiaCheck:playersWithinRange2(20)) then
			if (not IsCasting()) and (not IsChanneling()) then
				local moreJumping = math.random(0, 901);
				if (moreJumping >= 900) then
					JumpOrAscendStart();
					
				end
			end
		end
	end

	if (not script_paranoia.paranoiaUsed) then
		script_paranoiaCheck:playersWithinRange2(self.paranoidRange);
	end
	if (script_paranoia.paranoiaUsed) and (not self.usedParanoiaCounter) then
		self.paranoiaCounter = self.paranoiaCounter + 1
		self.usedParanoiaCounter = true;
	end


	-- do paranoia
	if (not GetLocalPlayer():IsDead() and GetLocalPlayer():GetHealthPercentage() >= 1) and (not script_getSpells:cityZones()) and (self.hotspotReached and script_nav:getDistanceToHotspot() <= self.distToHotSpot) and (not IsLooting()) and (not IsInCombat()) and (not IsMounted()) and (not IsCasting()) and (not IsChanneling()) and (script_grind.playerName ~= "Unknown") and (script_grind.otherName ~= "Unknown") and (script_vendor:getStatus() == 0) and ( (self.getSpells and script_getSpells.getSpellsStatus == 0) or not self.getSpells) then	
				-- set paranoid used as true
		if (script_paranoia:checkParanoia()) and (not self.pause) then
				script_paranoia.paranoiaUsed = true;
				script_grind:setWaitTimer(3850);
				-- reset blacklist timer
				self.newTargetTime = GetTimeEX();
			
			-- if player is within distance <= 30 then do this
			if (script_grind.playerParanoidDistance <= 30) and (script_grind:playersTargetingUs() >= 1) and (not IsInCombat()) then
				-- target player targeting us
				if (not PlayerHasTarget()) then	
					TargetByName(script_grind.playerName);
				end
			end

			-- try to target player if they are attacking you
			if (IsInCombat()) and (script_grind.playerParanoidDistance <= 8) then
				local pX, pY, pZ = script_grind.playerPos;
				FacePosition(pX, pY, pZ);
			return;
			end
	
			-- logout timer reached then logout
			if (script_paranoia.currentTime >= script_grind.currentTime2 + script_grind.setParanoidTimer) then
					-- reset paranoia timer
				script_grind.currentTime2 = GetTimeEX() + (45*1000);
				StopBot();
				Logout();
				return 4;
			end

			-- do stealth
			if (not IsMounted()) then
				script_paranoiaEX:checkStealth();
			end

			-- set timer to stop after paranoid player leaves
			self.waitTimer = GetTimeEX() + (self.paranoidSetTimer * 1000) + 2000;
		return true;

			-- else reset all conditions
		else
			script_paranoia.currentTime = 0;
			script_grind.currentTime2 = GetTimeEX() / 1000;
			script_paranoia.paranoiaUsed = false;
			self.usedParanoiaCounter = false;
			script_paranoia.doEmote = true;
			script_paranoia.didEmote = false;
			self.useAnotherVar = false;
		end
	end

	-- undo /afk when pressed during paranoid and sitting
	if (self.undoAFK) and (IsStanding()) and (not localObj:IsDead()) and (localHealth >= 85) then
		UseAction(script_grind.afkActionSlot, 0, 0);
		self.waitTimer = GetTimeEX() + 2500;
		script_grind:setWaitTimer(2500);
		script_grind.undoAFK = false;
		return true;
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
						script_grind.waitTimer = GetTimeEX() + 1200;
						script_grind.enemyObj = nil;
						ClearTarget();
				end
			end
		end

	-- we are being attacked by something so attack it - we have a pet
	if (IsInCombat()) and (self.enemyObj == 0 or self.enemyObj == nil) then		
		if (not PlayerHasTarget()) or (HasPet() and not PetHasTarget()) then
			script_warlockFunctions:petAttackTargetAtackingMe();
		end
	end
	-- we are being attacked by something so attack it - we have NO pet
	if (IsInCombat()) and (self.enemyObj == 0 or self.enemyObj == nil) then
		if (not PlayerHasTarget()) and (not HasPet()) then
			script_grind:attackTargetAttackingMe();
		end
	end

	if (not IsInCombat()) and (not IsLooting()) then
		self.blacklistLootTime = GetTimeEX();
	end

	if (not self.hotspotReached) then
		self.newTargetTime = GetTimeEX();
	end

	-- reset vendor message after selling/repairing
	if (script_vendor.status == 0) and (self.hotspotReached) then
		script_vendor.message = "idle...";
	end


 -- ready to run rest of script - navigation / combat / gathering / vendoring / etc

	-- set tick rate for scripts
	if (self.waitTimer > GetTimeEX() + self.tickRate) then
		return;
	end

	-- close trade skills...
	if (script_firstAid.bookOpen) and (not IsChanneling()) and (not IsCasting()) then
		script_firstAid.bookOpen = false;
		CloseTradeSkill();
	end

	if (IsInCombat()) and (not IsMoving()) and (not HasSpell("Shadow Bolt")) and (not script_checkAdds:checkAdds()) then
		if (self.enemyObj ~= 0 and self.enemyObj ~= nil) then
			if (self.enemyObj:GetDistance() <= 30) then
				--self.enemyObj:FaceTarget();
				self.blacklistLootTime = GetTimeEX();
				self.blacklistLootTimeCheck = GetTimeEX();
			end
		end
	end



		-- Do all checks
		if (script_grindEX:doChecks()) then
			return;
		end

	--if (script_helper:weAreStandingInFire()) then
	--	return true;
	--end

		-- Check: If our gear is yellow
		for i = 1, 16 do
		local status = GetInventoryAlertStatus('' .. i);
			if (status ~= nil) then 
				if (status >= 3 and script_grind.repairWhenYellow and script_grind.useVendor and script_vendor.repairVendor ~= 0 and not IsInCombat()) then
					script_vendor:repair(); 
					self.newTargetTime = GetTimeEX();
					return true;
				end
			end
		end
				
		--Mount up
		if (not self.hotspotReached or script_vendor:getStatus() >= 1) and (not IsInCombat())
		and (not IsMounted()) and (not IsIndoors()) and (not HasForm()) and (script_grind.useMount)
		then
			if (IsMoving()) then
				StopMoving();
				return;
			end
			if (not IsIndoors()) and (not IsMoving()) then
				if (script_helper:mountUp()) then
					script_grind:setWaitTimer(4500);
					return;
				end
			end
		return true;
		end

		if (not self.hotspotReached or script_vendor:getStatus() >= 1) and (not IsInCombat())
			and (not IsMounted()) and (not IsIndoors()) and (not HasForm()) and (script_grind.useMount)
		then
			return;
		end

		-- reset gather blacklist timer if we enter combat
		if (IsInCombat()) or (script_vendor:getStatus() > 0) then
			script_gather.blacklistTime = GetTimeEX()*2;
			script_gather.timerSet = false;
		end
		
		-- Gather
		if (self.gather and not AreBagsFull() and not self.bagsFull) and (not IsChanneling()) and (not IsCasting()) and (not IsEating()) and (not IsDrinking()) and (not self.needRest) and (not IsInCombat()) then


			if (not IsStealth()) and (script_gather.safeGather) and (script_grindEX:returnTargetNearMyAggroRange() ~= nil) then
				if (not IsStealth()) and (self.enemyObj == nil or self.enemyObj == 0 and not IsInCombat()) then
					self.enemyObj = script_grindEX:returnTargetNearMyAggroRange();
				end
			
			elseif (script_grindEX:returnTargetNearMyAggroRange() == nil) and (self.enemyObj == nil or self.enemyObj == 0 or self.enemyObj:GetDistance() > 25) or (IsStealth())  or (not script_gather.safeGather) then
			if (script_gatherRun:gather()) then

					-- turn off jump for gathering...
					if (self.jump) then
						self.jumpCheck = true;
						self.jump = false;
					end
					-- bot was blacklisting targets after gathering
					self.newTargetTime = GetTimeEX();
					if (script_gather.dist ~= 0 and script_gather.dist ~= nil and script_gather.dist > 20) and (not script_druid.useBear) then
						CastStealth();
					end

				

				if (not script_grind.adjustTickRate) then
					script_grind.tickRate = 135;
				end

				self.message = 'Gathering ' .. script_gather:currentGatherName() .. ' ' ..script_gather.messageToGrinder.."";
				if (IsLooting()) then
					script_grind:setWaitTimer(1000);
				end
			return true;
			
			end
			end
		end
		-- turn jump back on once gathering is done
		if (self.jumpCheck) then
			self.jump = true;
			self.jumpCheck = false;
			script_gather.gathering = false;
		end

		-- reset to allow bot to continue if we don't have the checkbox clicked...
		if (not self.getSpells or GetLocalPlayer():IsDead() or IsGhost()) then
			script_getSpells.getSpellsStatus = 0;
		end
		
		-- go to trainer and get spells
		if (self.getSpells) and (not self.pause) and (not IsInCombat()) then
			if (script_getSpells:checkForSpellsNeeded()) then
			script_grind.message = "Moving to class trainer for spells";
				if (self.useUnstuck) and (IsMoving()) and (not self.pause) then
					if (not script_unstuck:pathClearAuto(2)) then
						script_unstuck:unstuck();
							return true;
					end
				end
			return;
			end
		end

		if (self.useFPS) and (script_getSpells:cityZones()) and (script_getSpells.getSpellsStatus == 0) and (script_goToFP.getFPStatus ~= 3) then
			script_goToFP:run();
			return;
		end

		-- force bot to keep path to trainer
		if (self.getSpells) and (script_getSpells.getSpellsStatus > 0) and (not IsInCombat()) then
			return;
		end
		
		-- use kills to level tracker
		if (self.useExpChecker) then
			script_expChecker:targetLevels();
		end

		-- Assign the next valid target to be killed within the pull range
		if (self.enemyObj ~= 0 and self.enemyObj ~= nil) and (not IsInCombat()) then
			if (not self.enemyObj:IsDead()) then
				self.lastTarget = self.enemyObj:GetGUID();
			end
		end

		-- prioritize totems
		if IsInCombat() and GetTimeEX() > self.checkTotemKillTimer then
			script_killTotems:checkForTotems(10);
			self.checkTotemKillTimer = GetTimeEX() + 5000;
		end
	
		-- force enemy obj var
		if (IsInCombat()) then
			if (PlayerHasTarget()) then
				self.enemyObj = GetLocalPlayer():GetUnitsTarget();
				self.lastTarget = self.enemyObj:GetGUID();
			end

			-- get the lowest health target in combat with us
			local i, t = GetFirstObject();
			while i ~= 0 do
				if t == 3 and not i:IsCritter() and not i:IsDead() and i:GetHealthPercentage() >= 1 and i:CanAttack() and script_grind:isTargetingMe(i) and (script_grind:enemiesAttackingUs() > 1 or HasPet()) and self.enemyObj ~= 0 and self.enemyObj ~= nil and not self.enemyObj:IsDead() then
					local hp = script_grind.enemyObj:GetHealthPercentage();
					local ihp = i:GetHealthPercentage();
					if (ihp < hp) and PlayerHasTarget() then
						if (GetLocalPlayer():GetUnitsTarget():GetGUID() ~= i:GetGUID()) then
							self.enemyObj = i;
							self.lastTarget = i:GetGUID();
						end
					end
				end
			i, t = GetNextObject(i);
			end
		end

		-- don't assign targets  until we get to hotspot
		if (self.hotspotReached) and GetTimeEX() > self.newTargetTime then
			self.enemyObj = script_grindAssignTarget:assignTarget();
			self.newTargetTime = GetTimeEX() + 2500;
		end

		-- if we are close to aggro range of targets marked as 'adds' then we need to avoid or attack them first
		-- since avoid is buggy we are just going to try to kill them instead of running into them
		if (self.enemyObj == 0 or self.enemyObj == nil) then
			if script_aggro:closeToAdds() then
				self.enemyObj = script_aggro:returnClosestAddsTarget();
				self.newTargetTime = GetTimeEX() + 2500;
			end
		end

		if (IsInCombat()) or (not PlayerHasTarget()) then
			self.stealthRanOnce = false;
		end

		if (self.enemyObj ~= 0 and self.enemyObj ~= nil) then
			if (not PlayerHasTarget()) and (not script_grind:isTargetHardBlacklisted(self.enemyObj)) and (not IsAutoCasting("Attack")) and (self.enemyObj:GetDistance() <= self.pullDistance) then

				-- this should target the target, turn auto attack on and then auto attack off to allow for stealth opener
				if (not GetLocalPlayer():HasBuff("Stealth") and not GetLocalPlayer():HasBuff("Prowl")) then
					self.enemyObj:AutoAttack();
				end
				if (GetLocalPlayer():HasBuff("Stealth") or GetLocalPlayer():HasBuff("Prowl")) and (not self.stealthRanOnce) and (GetTimeEX() > self.attackTimer) then
					self.enemyObj:AutoAttack();
					self.stealthRanOnce = true;
					CastSpellByName("Attack");
					self.attackTimer = GetTimeEX() + 5000;
				end
			end

			-- Fix bug, when not targeting correctly
			if (self.lastTarget ~= self.enemyObj:GetGUID()) then
				if (not IsMoving()) then
					self.newTargetTime = GetTimeEX();
					ClearTarget();
				end
			-- blacklist the target if we had it for a long time and hp is high
			elseif (((GetTimeEX()-self.newTargetTime)/1000) > self.blacklistTime and self.enemyObj:GetHealthPercentage() > 92) then
				script_grind:addTargetToHardBlacklist(self.enemyObj:GetGUID());
				self.newTargetTime = GetTimeEX();
				ClearTarget();
				script_nav:resetNavigate();
				script_grind:setWaitTimer(2000);
			elseif (IsInCombat()) and (self.enemyObj ~= nil and self.enemyObj ~= 0) and (self.enemyObj:IsInLineOfSight()) and (self.lastTarget == self.enemyObj:GetGUID()) then
				self.newTargetTime = GetTimeEX();
			end
			
		end

	-- try to run out of combat
-- need to change this to account for mana users that can heal.. check to make sure we have low low mana
	if IsInCombat() and not script_checkDebuffs:hasDisabledMovement() then
 		if RunOutOfCombat() then
			return true;
		end
	end

		-- distance to hotspot
		if (script_nav:getDistanceToHotspot() <= 80) then
			self.hotspotReached = true;
		end

		-- Dont pull mobs before we reached our hotspot unless we are in aggro range
		if (not IsInCombat()) then
			if (not self.hotspotReached or script_vendor.status > 0 or script_getSpells.getSpellsStatus > 0) and (script_grindEX:returnTargetNearMyAggroRange() == nil) then
				self.enemyObj = nil;
				if (PlayerHasTarget()) and (script_grind.enemyObj == nil or script_grind.enemyObj == 0) then
					ClearTarget();
				end	
			elseif (not IsInCombat()) and (not IsStealth()) and (GetLocalPlayer():GetLevel() > 5) and (not self.hotspotReached or script_vendor.status > 0 or script_getSpells.getSpellsStatus > 0) and (script_grindEX:returnTargetNearMyAggroRange() ~= nil) and (not self.hotspotReached) then
				self.enemyObj = script_grindEX:returnTargetNearMyAggroRange();
			end
		end

		-- Dont pull if more than 1 add will be pulled check SafePull aggro
		if (self.enemyObj ~= nil and self.enemyObj ~= 0 and self.skipHardPull) and (self.hotspotReached) then
			if (not script_aggro:safePull(self.enemyObj)) and (not IsInCombat())
			and (not script_grind:isTargetingMe2(self.enemyObj)) then
				script_grind:addTargetToBlacklist(self.enemyObj:GetGUID());
			end
		end

		-- move away from adds script conditions
		if (IsInCombat()) and (self.safePull)
			and (GetLocalPlayer():GetHealthPercentage() >= 1)
			and (script_grind.skipHardPull)
			and (script_grind:isTargetingMe2(self.enemyObj))
			and (self.enemyObj:IsInLineOfSight())
			and (not self.enemyObj:IsCasting())
			and (not self.enemyObj:IsFleeing())
			and (self.enemyObj:GetHealthPercentage() >= 20)
			--and (not self.enemyObj:HasRangedWeapon())
		 then
		
			-- force reset of closestEnemy
			if (self.enemyObj ~= nil) then
			script_om:FORCEOM2();
			end

			-- check and do move away from adds during combat
			if (script_checkAdds:checkAdds()) and (self.enemyObj:GetHealthPercentage() >= 20) and (self.enemyObj:GetManaPercentage() <= 5) then
				script_om:FORCEOM();
				script_grind.waitTimer = GetTimeEX() + 1000
				return true;
			end
		end	
		
		if self.skipLooting then self.lootObj = nil; end

-- stuck in combat phase
		if (GetLocalPlayer():GetManaPercentage() > self.drinkMana and GetLocalPlayer():GetHealthPercentage() > self.eatHealth) and (script_hunter.waitAfterCombat or script_warlock.waitAfterCombat) and (IsInCombat()) and (not PetHasTarget()) and (script_grind.enemiesAttackingUs() == 0 and not script_grind:isAnyTargetTargetingMe()) and not script_rotation.usingRotation and not script_hunterEX.quickGrind then
			self.message = "Waiting... Server says we are InCombat()";
			self.lootObj = script_nav:getLootTarget(self.findLootDistance);
			if (self.lootObj ~= 0 and self.lootObj ~= nil) and (self.lastTargetKilled ~= 0 and self.lastTargetKilled ~= nil) and (self.lastTargetKilled:GetPosition() > 3) then
				ex, ey, ez = self.lastTargetKilled:GetPosition();
				Move(ex, ey, ez);
				self.autoBlacklistTimer = GetTimeEX() + 15000;
				return;
			end
			if (self.lootObj ~= 0 and self.lootObj ~= nil) and not self.skipLooting and not AreBagsFull() and not self.bagsFull and not script_grind:isTargetLootBlacklisted(self.lootObj:GetGUID()) then
				if (script_grind:doLoot(localObj)) then
					self.waitTimer = GetTimeEX() + 1000;

				end
			end
		return 4;
		end
-- stuck in combat phase
		if (GetLocalPlayer():GetManaPercentage() > self.drinkMana and GetLocalPlayer():GetHealthPercentage() > self.eatHealth) and (IsInCombat() or localObj:HasBuff("Bloodrage")) and (not HasPet() or (HasPet() and not PetHasTarget())) and (script_grind.enemiesAttackingUs() == 0 and not script_grind:isAnyTargetTargetingMe()) and (PlayerHasTarget() and self.enemyObj:GetHealthPercentage() >= 99) and (self.enemyObj:GetDistance() >= 20) and not script_rotation.usingRotation and not script_hunterEX.quickGrind then
			self.message = "Waiting... Server says we are InCombat()";
			self.lootObj = script_nav:getLootTarget(self.findLootDistance);
			if (self.lootObj ~= 0 and self.lootObj ~= nil) and (self.lastTargetKilled ~= 0 and self.lastTargetKilled ~= nil) and (self.lastTargetKilled:GetPosition() > 3) then
				ex, ey, ez = self.lastTargetKilled:GetPosition();
				Move(ex, ey, ez);
				self.autoBlacklistTimer = GetTimeEX() + 15000;
				return;
			end
			if (self.lootObj ~= 0 and self.lootObj ~= nil) and not self.skipLooting and not AreBagsFull() and not self.bagsFull then
				if (script_grind:isTargetLootBlacklisted(self.lootObj:GetGUID())) then
					self.lootObj = nil; -- don't loot blacklisted targets	
				end
				if (script_grind:doLoot(localObj)) then
				self.waitTimer = GetTimeEX() + 1000;
				end
			end
						self.autoBlacklistTimer = GetTimeEX() + 15000;

		return 4;
		end	

		-- Finish loot before we engage new targets or navigate - return
		if (self.lootObj ~= nil and self.lootObj ~= 0 and (not IsInCombat() or script_grind:enemiesAttackingUs() ==0)) then
			return;
		else

			-- blacklist loot message
			self.messageOnce = true;

			-- blacklist loot timer
			self.timerSet = false;

			-- reset the combat status
			self.combatError = nil; 

			-- avoid blacklisted and avoided targets
			if (script_grindEX.avoidBlacklisted)then

				-- check blacklisted targets around me
				if not IsInCombat() and (script_aggro:closeToBlacklistedTargets()
					or script_aggro:closeToHardBlacklistedTargets()) then
					self.message = "Close To Blacklisted Target.. Moving...";

					-- do blacklist avoid
					if (not IsEating()) and (not IsDrinking()) then
						if (script_runner:avoidToAggro(8)) then
							script_nav:resetNavPos(); script_nav:resetNavigate();
							script_grind.addTargetToBlacklist(self.enemyObj:GetGUID());
							return true;
						end

					-- avoid if we are drinking or eating
					elseif (IsEating() or IsDrinking()) then
						if (script_runner:avoidToAggro(10)) then
							script_nav:resetNavPos(); script_nav:resetNavigate();
							self.waitTimer = GetTimeEX() + 2000;
							return;
						end
					end
				return true;
				end
	
			end

	-- Run the combat script and retrieve combat script status if we have a valid target

			if (self.enemyObj ~= nil and self.enemyObj ~= 0) then
				self.combatError = RunCombatScript(self.enemyObj:GetGUID());
			end
		end



	-- in combat phase or we have an enemy
		if (self.enemyObj ~= nil or self.enemyObj ~= 0) then

			-- don't avoid our current target check adds script
			self.lastAvoidTarget = self.enemyObj;

			-- pet stays in combat on some server cores while returning to player
				-- force bot to finish combat...
			if (UnitClass('player') == "WARLOCK" or GetMyClass() == "WARLOCK") or (UnitClass('player') == "HUNTER" or GetMyClass() == "HUNTER") and (GetNumPartyMembers() == 0) and not script_rotation.usingRotation then

				-- force bot to attack pets target
				if (script_warlock.waitAfterCombat or script_hunter.waitAfterCombat)
					and (IsInCombat())
					and (GetPet() ~= 0
						and GetPet():GetHealthPercentage() > 1
						and not PetHasTarget())
					and (not PlayerHasTarget())
					and (HasPet())
				then

					-- if pet has a target then assist and do combat
						-- recall pet for safety
			 		if (PetHasTarget()) then
						if (GetPet():GetDistance() > 10) then
							AssistUnit("pet");
							PetFollow();
						end

					-- if pet doesn't have a target then return until out of combat phase
					elseif (not PlayerHasTarget() and not PetHasTarget() and script_grind.enemiesAttackingUs() == 0) and (IsInCombat()) and not script_rotation.usingRotation then
						--AssistUnit("pet");
						self.message = "Stuck in combat! WAITING!";
						self.autoBlacklistTimer = GetTimeEX() + 15000;
						if (IsMoving()) then
							StopMoving();
							return;
						end
						return;
					end
				end
			end

			--if (HasSpell("Lightning Bolt")) and (IsInCombat()) and (script_grind:enemiesAttackingUs() == 0) and (not PlayerHasTarget()) then
			--	self.message = "Stuck in combat! WAITING!";
			--	if (IsMoving()) then
			--		StopMoving();
			--		return;
			--	end
			--	return 4;
			--end

			if (not IsMoving()) then
			-- reset object manager and check adds enemies
			script_checkAdds.closestEnemy = 0;
			script_checkAdds.intersectEnemy = nil;
			end

			if (IsInCombat()) and (self.enemyObj == 0 or self.enemyObj == nil) and GetTimeEX() > self.newTargetTime then
				self.enemyObj = script_grindAssignTarget:assignTarget();
				self.newTargetTime = GetTimeEX() + 2500;
				if (self.enemyObj ~= 0 and self.enemyObj ~= nil) then
					self.lastTarget = self.enemyObj:GetGUID();
				end
			end
			

			-- need to run a check for last target and current target to see if we have targeted the same target over and over again...
			-- bot will target, move to target, leave range of target, move to auto path node, gain same target, move to target, leave target range....		

			-- if we have a valid enemy
			if (self.enemyObj ~= nil) and (not IsInCombat()) then
				
			elseif (self.hotspotReached) and (self.enemyObj == nil or self.enemyObj == 0) and GetTimeEX() > self.newTargetTime then
				-- else assign a target
				script_grindAssignTarget:assignTarget();
				self.newTargetTime = GetTimeEX() + 2500;
			end

			if (not IsMoving()) then
				-- combat script message
				self.message = "Running the combat script...";
			end

			-- death counter turning variable on and off for 2 or more enemies attacking us
			if (self.enemyObj ~= 0 and self.enemyObj ~= nil) then
				if (IsInCombat()) then
					if (self.enemyObj:GetHealthPercentage() > 20) then
						self.useAnotherVar = false;
					end
				end
				if (self.enemyObj ~= 0 and self.enemyObj ~= nil) then
					if (self.enemyObj:GetHealthPercentage() <= 90 or self.enemyObj:IsDead()) then
						self.lastTargetKilled = self.enemyObj;
					end
				end
			end
			-- monster kill variable on and off
			if (self.enemyObj ~= nil and self.enemyObj ~= 0) and (not self.useAnotherVar) then
				if (self.enemyObj:GetHealthPercentage() <= 20 or self.enemyObj:IsDead()) then
					self.lastTargetKilled = self.enemyObj;
					self.monsterKillCount = self.monsterKillCount + 1;
					self.useAnotherVar = true;
				end
			end

		-- check return combat errors

			-- clear own player if targeted for some reason
			if (PlayerHasTarget()) and (IsInCombat()) and (GetLocalPlayer():GetUnitsTarget():GetGUID() == GetLocalPlayer():GetGUID()) then
				ClearTarget();
			end
			
			-- In range: attack the target, combat script returns 0 STOP MOVING
			if (self.combatError == 0) then

				-- we stopped moving so reset navigate
				script_nav:resetNavigate();

				-- return 0 stops movement
				if IsMoving() then StopMoving();
					return;
				end
			end

			-- Invalid target: combat script return 2
			if (self.combatError == 2) then

				-- add target to blacklist
				script_grind.addTargetToBlacklist(self.enemyObj:GetGUID());
	
				-- reset enemyObj
				self.enemyObj = nil;
				ClearTarget();
				return;
			end

			-- Move in range: combat script return 3
			if (self.combatError == 3) and (not localObj:IsMovementDisabed())
				and (not script_checkDebuffs:hasDisabledMovement()) and (self.enemyObj ~= 0 and self.enemyObj ~= nil) then
				self.message = "Moving to target return 3 trying to find a path...";
				--if (self.enemyObj:GetDistance() < self.disMountRange) then
				--end

-- heroic strike stuck on and target moved away or we stopped casting auto attack

	local hstable = {[78] = true, [284] = true, [285] = true, [1605] = true, [1606] = true, [1607] = true, [1608] = true, [1610] = true, [1611] = true, [6158] = true, [11564] = true, [11565] = true, [11566] = true, [11567] = true, [11570] = true, [11571] = true, [25286] = true, [25354] = true, [25710] = true, [25712] = true, [25958] = true, [12282] = true, [12663] = true, [12664] = true};

		if (IsInCombat()) and (PlayerHasTarget()) and (GetLocalPlayer():GetUnitsTarget():GetDistance() > script_warrior.meleeDistance) then
			if hstable[GetLocalPlayer():GetCasting()] then
				SpellStopCasting();
			
			end
if (not IsAutoCasting("Attack")) then
				self.enemyObj:AutoAttack();
			end
		end


				-- check positions
				local _x, _y, _z = self.enemyObj:GetPosition();
				local localObj = GetLocalPlayer();
				local mX, mY, mZ = localObj:GetPosition();

				-- adjust tick rate to make targeting and movement quicker
				if (not script_grind.adjustTickRate) and (PlayerHasTarget() and (script_grind:isTargetingMe(self.enemyObj) or targetObj:GetHealthPercentage() < 20)) then
					script_grind.tickRate = 50;
				end
	
				-- if we are already close to the target and they are stuck behind a wall then return false
				if (not self.enemyObj:IsInLineOfSight() and self.enemyObj:GetDistance() <= 3) then
					if (script_mage:runBackwards(targetObj, 8)) then
						return true;
					end
				end

				-- if we have a valid position coordinates
				if (_x ~= 0 and x ~= 0) then

					-- move to target
						self.message = script_navEX:moveToTarget(localObj, _x, _y, _z);
						self.message = "Moving To Target Combat NavEX - " ..math.floor(self.enemyObj:GetDistance()).. " (yd) "..self.enemyObj:GetUnitName().. "";
						if (not IsMoving()) and (self.enemyObj:GetDistance() > self.combatScriptRange+1) then script_navEX:moveFallback(_x, _y, _z); end
					
					if (IsMoving()) or (IsInCombat()) then
						self.autoBlacklistTimer = GetTimeEX() + 15000;
						self.autoBlacklistTimerSet = false;
					end
					if IsEating() or IsDrinking() or IsLooting() or (PlayerHasTarget() and IsMoving()) then
						self.autoBlacklistTimer = GetTimeEX() + 15000;
					end
					if IsMoving() then self.autoBlacklistTimer = GetTimeEX() + 15000; end

					if (not IsInCombat()) and (not IsMoving()) and not IsDrinking() and not IsEating() and not IsLooting() and not IsCasting() and not IsChanneling() and (self.autoBlacklistTimerSet) and (GetTimeEX() > self.autoBlacklistTimer) then
						self.autoBlacklistTimerSet = false;
						script_grind:addTargetToHardBlacklist(self.enemyObj:GetGUID());
						DEFAULT_CHAT_FRAME:AddMessage("Cannot find a path to target and we have not moved for 15 seconds... Automatically Blacklisting "..self.enemyObj:GetUnitName()..", "..math.floor(self.enemyObj:GetDistance()).." (yd), Time: "..GetTimeStamp().."");
						script_nav:resetNavigate();
					end
					if (not IsInCombat()) and (not IsMoving()) and (not self.autoBlacklistTimerSet) then
						self.autoBlacklistTimerSet = true;
						self.autoBlacklistTimer = GetTimeEX() + 15000;
					end
					
				end
			return;
			end

			-- Do nothing, return : combat script return 4
			if (self.combatError == 4) then
				return;
			end
			
			-- Target player : pause for 5 seconds, combat script should add target to blacklist
			if (self.combatError == 5) then
		
				-- reset target
				ClearTarget();
				self.message = "Targeted a player pet pausing 3s...";
				self.waitTimer = GetTimeEX()+3000;
				return;
			end
			
			-- Stop bot, request from a combat script
			if (self.combatError == 6) then 
				self.message = "Combat script request stop bot...";
			
				-- stop and loglout
		 		Logout();
				StopBot();
				return;
			end

			-- attempt to run away from adds in combat
			if (IsInCombat()) and (not script_checkDebuffs:hasDisabledMovement()) and (self.safePull)
				and (GetLocalPlayer():GetHealthPercentage() >= 1)
				and (script_grind.skipHardPull)
				and (script_grind:isTargetingMe2(self.enemyObj))
				and (self.enemyObj:IsInLineOfSight())
				and (not self.enemyObj:IsCasting())
				and (not self.enemyObj:IsFleeing())
				and (self.enemyObj:GetHealthPercentage() >= 20)
				--and (not self.enemyObj:HasRangedWeapon())
			then

				if (self.enemyObj ~= nil) then
				-- force reset or closestEnemy
				script_om:FORCEOM2();
				end
				-- check and avoid adds
				if (script_checkAdds:checkAdds()) and (self.enemyObj:GetHealthPercentage() >= 20) then
					script_om:FORCEOM();
				 	script_grind.waitTimer = GetTimeEX() + 2000;
					return true;
				end

				-- try unstuck script
				if (not script_unstuck:pathClearAuto(2)) then
					script_unstuck:unstuck();
					return true;
				end
			end
		end

		-- Pre checks before navigating
		if (IsLooting() or IsCasting() or IsChanneling() or IsDrinking() or IsEating() or IsInCombat()) then
			script_grind:setWaitTimer(350);
			return;
		end

		-- Mount before we navigate through the path, error check to get around indoors
		if (script_grind.useMount) and (not IsMounted()) then
			if (script_druidEX:removeCatForm()) or (script_druidEX:removeBearForm())
			or (script_druidEX:removeTravelForm()) or (script_druidEX:removeMoonkinForm()) then
				return;
			end
		end

		--Mount up
		if (not self.hotspotReached or script_vendor:getStatus() >= 1) and (not IsInCombat())
		and (not IsMounted()) and (not IsIndoors()) and (not HasForm()) and (self.useMount) then
			if (IsMoving()) then
				StopMoving();
				return;
			end

			-- use helper mount function
			if (not IsIndoors()) and (not IsMoving()) then
				if (script_helper:mountUp()) then
					script_grind:setWaitTimer(4500);
					return;
				end
			end
		return true;
		end

		-- travel forms
		if (not self.hotspotReached or script_vendor:getStatus() >= 1) and (not IsInCombat())
		and (not IsMounted()) and (not IsIndoors()) and (not HasForm()) and (not self.useMount) and (GetTimeEX() > script_grindEX.tryTravelFormTimer) then
			if (HasSpell("Ghost Wolf")) or (HasSpell("Travel Form")) then
				if (IsMoving()) then
					StopMoving();
					return true;
				end
		
				-- use travel form function
				if (HasSpell("Travel Form")) and (not localObj:HasBuff("Cat Form")) then
					if (script_druidEX:travelForm()) then
						--script_grind:setWaitTimer(2500);
						script_grindEX.tryTravelFormTimer = GetTimeEX() + 5000;
					end
				end
		
				-- use ghost wolf function
				if (HasSpell("Ghost Wolf")) then
					if (script_shamanEX2:ghostWolf()) then
						script_grind:setWaitTimer(4000);
						script_grindEX.tryTravelFormTimer = GetTimeEX() + 15000;
					end
				end
			end
		end


		-- Auto path: keep us inside the distance to the current hotspot, if mounted keep running even if in combat
		if (script_vendor:getStatus() == 0) and ((not IsInCombat() or IsMounted()) and (self.autoPath) and (script_nav:getDistanceToHotspot() > self.distToHotSpot or self.hotSpotTimer > GetTimeEX() or not self.hotspotReached)) and (not IsLooting()) and (self.enemyObj == nil or self.enemyObj == 0) then
			if (not (self.hotSpotTimer > GetTimeEX())) then
				self.hotSpotTimer = GetTimeEX() + 20000;
			end

			--Mount up
			if (not self.hotspotReached or script_vendor:getStatus() >= 1) and (not IsInCombat())
			and (not IsMounted()) and (not IsIndoors()) and (not HasForm())
			and (script_grind.useMount)
			then
				if (IsMoving()) then
					StopMoving();
					return;
				end
				if (not IsIndoors()) and (not IsMoving()) then
					if (script_helper:mountUp()) then
						script_grind:setWaitTimer(4500);
						self.waitTimer = GetTimeEX() + 4500;
						return;
					end
				end
			return true;
			end

			-- druid cat form
			if (not IsMounted()) and (not self.useMount) and (not HasSpell("Travel Form")) and (HasSpell("Cat Form")) and (not localObj:HasBuff("Cat Form")) and (not localObj:IsDead()) and (GetLocalPlayer():GetHealthPercentage() >= 95) then
				if (CastSpellByName("Cat Form")) then
					self.waitTimer = GetTimeEX() + 500;
					return 0;
				end
			end

			-- Shaman Ghost Wolf 
			--if (not IsMounted()) and (not self.useMount) and (not script_grind.useMount) and (HasSpell('Ghost Wolf')) and (not localObj:HasBuff('Ghost Wolf')) and (not localObj:IsDead()) and (not IsIndoors()) then
			--		CastSpellByName('Ghost Wolf');
			--		self.waitTimer = GetTimeEX() + 1500;
			--		script_grind:setWaitTimer(1500);
			--		return;
			--	
			--end
			if (IsLooting()) or (IsCasting()) or (IsChanneling()) or (self.lootObj ~= 0 and self.lootObj ~= nil) then
				return;
			end

			if (self.lootObj ~= nil and self.lootObj ~= 0) and not self.skipLooting and not AreBagsFull() and not self.bagsFull then
				if (script_grind:isTargetLootBlacklisted(self.lootObj:GetGUID())) then
					self.lootObj = nil; -- don't loot blacklisted targets	
				else
					if (script_grind:doLoot(localObj)) then
						self.waitTimer = GetTimeEX() + 1000;
						return true;
					end
				end
			end

			if (not self.hotspotReached) and (not IsInCombat()) and (script_vendor.status == 0) then
				self.message = script_moveToHotspot:moveToHotspot(localObj);
				return true;
			end
		end


	-- Use auto pathing or walk paths

	-- this is our navigation if we can't complete conditions set above

		-- make sure we have don't have an enemy before moving... probably what caused nav crashes over the years of ogasai.....
			-- doubled up on move to target in combat and navigate....
		-- Use auto pathing or walk paths
		if (self.autoPath) then
			if (script_nav:getDistanceToHotspot() < 50 and not self.hotspotReached) then
				self.message = "Hotspot reached... (No targets around?)";
				self.hotspotReached = true;
				return;
			else
				self.message = script_nav:moveToSavedLocation(localObj, self.minLevel, self.maxLevel, self.staticHotSpot);
				script_grind:setWaitTimer(100);
			end
		else
			-- Check: Load/Refresh the walk path
			if (self.pathName ~= self.pathLoaded) then
				if (not LoadPath(self.pathName, 0)) then self.message = "No walk path has been loaded..."; return; end
				self.pathLoaded = self.pathName;
			end
		-- Navigate
		self.message = script_nav:navigate(localObj);
		end
end


-- just return enemyObj
function script_grind:getTarget()
	return self.enemyObj;
end


-- get a target attacking us returns a currentObj:GetGUID()
function script_grind:getTargetAttackingUs() 

	local currentObj, typeObj = GetFirstObject(); 

	-- run object manager
	while currentObj ~= 0 do 
		
		-- NPC type 3
    		if typeObj == 3 then
	
			-- acceptable targets
			if (currentObj:CanAttack() and not currentObj:IsDead()) and (currentObj:IsInLineOfSight()) and (not currentObj:IsCritter()) then

			-- get targets target - target of target
			local localObj = GetLocalPlayer();
			local targetTarget = currentObj:GetUnitsTarget();

				-- target has a target and distance less than 50 (limit object manager by distance)
				if (targetTarget ~= 0 and targetTarget ~= nil) and (currentObj:GetDistance() < 50) then

					-- if target is targeting me then
					if (targetTarget:GetGUID() == localObj:GetGUID()) then
	
						-- return target
						return currentObj:GetGUID();
					end
				end	

				-- acceptable target is targeting our group members (limited by distance)
				if (GetNumPartyMembers() > 1) and (currentObj:GetDistance() < 50) and (script_grindParty.forceTarget) then

					-- run another object manager script to get a different target 
                			if (script_grind:isTargetingGroup(currentObj)) then 
					
						-- return target
                				return currentObj:GetGUID();
                			end
				end
            		end 
       		end

	-- get next target
	currentObj, typeObj = GetNextObject(currentObj); 
	end

	-- return nil if no target
	return nil;
end

-- assign a valid target

function script_grind:isTargetingPet(i) 
	local pet = GetPet();

	-- if we have a pet
	if (pet ~= nil and pet ~= 0 and not pet:IsDead()) then

		-- if target is targeting pet then
		if (i:GetUnitsTarget() ~= nil and i:GetUnitsTarget() ~= 0) then

			-- return true
			return i:GetUnitsTarget():GetGUID() == pet:GetGUID();
		end
	end
	return false;
end

function script_grind:isTargetingGroup(y) 
	local partyMember = 0;

	-- get partymembers
	for i = 1, GetNumPartyMembers()+1 do
		local partyMember = GetPartyMember(i);
	end
		
	-- if we have party members and conditions valid (limited object manager by range)
	if (partyMember ~= nil and partyMember ~= 0 and not partyMember:IsDead() and partyMember:GetDistance() < 50) then

		local y, typeObj = GetFirstObject(); 

		-- run object manager
		while y ~= 0 do 

			-- acceptable targets
    			if (typeObj == 3)
				and (y:GetDistance() < 50)
				and (not y:IsCritter())
				and (not y:IsDead())
				and (y:CanAttack())
				and (y:IsInLineOfSight())
			then
				-- if target has a target then
				if (y:GetUnitsTarget() ~= nil and y:GetUnitsTarget() ~= 0) then

					-- if target is targeting a party member then
					if (y:GetUnitsTarget():GetGUID() == partyMember:GetGUID()) then

						-- return target
						self.enemyObj = y;
					end
				end
			end

		-- get next target
		y, typeObj = GetNextObject(y); 
		end
	end
return false;
end

-- if any enemy is targeting group true or false
function script_grind:isTargetingGroupBool()

	local partyMember = GetPartyMember();

	-- get party members 
	for i = 1, GetNumPartyMembers() do

		local partyMember = GetPartyMember(i);
	end

	-- if we have valid party members
	if (partyMember ~= nil and partyMember ~= 0 and not partyMember:IsDead()) then

		local unitsAttackingUs = 0; 
		local currentObj, typeObj = GetFirstObject(); 

		-- run object manager
		while currentObj ~= 0 do 

			-- NPC type 3
    			if typeObj == 3 then
				
				-- acceptable targets
				if (currentObj:CanAttack() and not currentObj:IsDead()) then

					-- if target has a target
                			if (currentObj:GetUnitsTarget() ~= nil and currentObj:GetUnitsTarget() ~= 0) then

						-- is target targeting party member
						if (currentObj:GetUnitsTarget():GetGUID() == partyMember:GetGUID()) then
							return true;
						end
					end
	                	end
			end

		-- get next target
		currentObj, typeObj = GetNextObject(currentObj); 
       		end
    	end
    return false;
end


function script_grind:isTargetingMe(target) 
	local localPlayer = GetLocalPlayer();
	if (localPlayer ~= nil and localPlayer ~= 0 and not localPlayer:IsDead()) then
		if (target) ~= nil and target ~= 0 then
			if (target:GetUnitsTarget() ~= nil and target:GetUnitsTarget() ~= 0) then
				return target:GetUnitsTarget():GetGUID() == localPlayer:GetGUID();
			end
		end
	end
	return false;
end
function script_grind:isTargetingMe3(currentObj) 
	local localPlayer = GetLocalPlayer();
	if (localPlayer ~= nil and localPlayer ~= 0 and not localPlayer:IsDead()) then
		if (currentObj:GetUnitsTarget() ~= nil and currentObj:GetUnitsTarget() ~= 0) then
			return currentObj:GetUnitsTarget():GetGUID() == localPlayer:GetGUID();
		end
	end
	return false;
end
function script_grind:isTargetingMe2(target) -- self.enemyObj
	local localPlayer = GetLocalPlayer();
	local target = script_grind.enemyObj;
	if (script_grind.enemyObj ~= 0) and (script_grind.enemyObj ~= nil) and (localPlayer ~= nil and localPlayer ~= 0 and not localPlayer:IsDead()) then
		if (target:GetUnitsTarget() ~= nil and target:GetUnitsTarget() ~= 0) then
			return target:GetUnitsTarget():GetGUID() == localPlayer:GetGUID();
		end
	end
	return false;
end

function script_grind:enemiesAttackingUs() -- returns number of enemies attacking us
	local unitsAttackingUs = 0; 
	local currentObj, typeObj = GetFirstObject(); 
	while currentObj ~= 0 do 
    		if typeObj == 3 then
			if (currentObj:CanAttack() and not currentObj:IsDead()) then
        	        	if (script_grind:isTargetingMe(currentObj) or script_grind:isTargetingPet(currentObj)) then 
        	        		unitsAttackingUs = unitsAttackingUs + 1; 
        	        	end 
        	    	end 
       		end
        currentObj, typeObj = GetNextObject(currentObj); 
    	end
    return unitsAttackingUs;
end

function script_grind:enemiesWithinRange() -- returns number of enemies within range
	local unitsInRange = 0; 
	local currentObj, typeObj = GetFirstObject(); 
	while currentObj ~= 0 do 
    	if (typeObj == 3) and (PlayerHasTarget()) then
		if (currentObj:CanAttack()) and (not currentObj:IsDead()) and (not currentObj:IsCritter()) then
                	if (currentObj:GetDistance() < GetLocalPlayer():GetUnitsTarget():GetDistance() + script_checkAdds.addsRange - 20) then 
                		unitsInRange = unitsInRange + 1; 
                	end 
            	end 
       	end
        currentObj, typeObj = GetNextObject(currentObj); 
    end
    return unitsInRange;
end


function script_grind:playersTargetingUs() -- returns number of players attacking us
	local nrPlayersTargetingUs = 0; 
	local currentObj, typeObj = GetFirstObject(); 
	while currentObj ~= 0 do 
		if typeObj == 4 then
			if (script_grind:isTargetingMe(currentObj)) then 
                		nrPlayersTargetingUs = nrPlayersTargetingUs + 1;
			end 
		end
		currentObj, typeObj = GetNextObject(currentObj); 
	end
	return nrPlayersTargetingUs;
end

function script_grind:getDistanceDif()
	local x, y, z = GetLocalPlayer():GetPosition();
	local xV, yV, zV = self.myX-x, self.myY-y, self.myZ-z;
	return math.sqrt(xV^2 + yV^2 + zV^2);
end

function script_grind:drawStatus()
	script_drawStatusEX:drawSetup();
	script_drawStatus:draw();
end

function script_grind:draw()
	script_grind:drawStatus();
end

function script_grind:doLoot(localObj)
	local _x, _y, _z = self.lootObj:GetPosition();
	local dist = self.lootObj:GetDistance();
	local localObj = GetLocalPlayer();

	if (not self.adjustTickRate) then
		script_grind.tickRate = 50;
	end

	if GetLocalPlayer():GetHealthPercentage() < 75 then
		if not script_grindEX:isLootSafeToLoot() then
			script_grind:runRest();
			_quest.message = "Loot is not safe to gather... resting..."
			script_grind.message = "Loot is not safe to gather... resting..."
			return true;
		end
		
	end

	if (not self.timerSet) and (not IsEating()) and (not IsDrinking()) and (IsStanding()) and (not IsInCombat()) then
		self.blacklistLootTimeCheck = GetTimeEX() + (self.blacklistLootTimeVar * 1000);
		self.timerSet = true;
	end

	if (self.lootObj ~= nil) then
		if (script_grind:isTargetLootBlacklisted(self.lootObj:GetGUID())) then
			self.lootObj = nil; -- don't loot blacklisted targets	
		end
	end

	-- Loot checking/reset target
	if (self.lootCheck['timer'] ~= 0 and self.lootCheck['timer'] ~= nil) and self.lootObj ~= nil then
		if (GetTimeEX() > self.lootCheck['timer']) then
			if (self.lootCheck['target'] == self.lootObj:GetGUID()) then
				self.lootObj = nil; -- reset lootObj
				ClearTarget();
				self.message = 'Reseting loot target...';
			end
			self.lootCheck['timer'] = GetTimeEX() + 10000; -- 10 sec
			if (self.lootObj ~= nil) then 
				self.lootCheck['target'] = self.lootObj:GetGUID();
			else
				self.lootCheck['target'] = 0;
			end
			return;
		end
	end

	if self.lootObj ~= nil and self.lootObj ~= 0 then
		local _x, _y, _z = self.lootObj:GetPosition();
	end
	-- close enough to loot range then do these
	if (dist <= self.lootDistance) then
		self.message = "Looting...";
		
		-- stop moving
		if(IsMoving() and not localObj:IsMovementDisabed()) then
			StopMoving();
			return;
		end

		-- stand if we are sitting
		if(not IsStanding()) then
			StopMoving();
			self.waitTimer = GetTimeEX() + 350;
			return;
		end

		-- Dismount
		if (IsMounted()) then
			DisMount();
			self.waitTimer = GetTimeEX() + 350;
			return;
		end

		if (IsLooting()) then
			self.waitTimer = GetTimeEX() + 950;
			_quest.waitTimer = GetTimeEX() + 950;
		end

		if StaticPopup1:IsVisible() then StaticPopup1Button1:Click() end

		-- interact with object if we are not looting
		if self.lootObj ~= 0 and self.lootObj ~= nil then
			if (not self.lootObj:UnitInteract() and not IsLooting()) and (not IsMoving()) then
				self.waitTimer = GetTimeEX() + 1050;
				_quest.waitTimer = GetTimeEX() + 1050;
				return;
			end

			lastError = GetLastError();
			if lastError == 78 then
				script_grind:addTargetToLootBlacklist(self.lootObj);
				self.lootObj = nil;
				ClearLastError();
			end
			--if lastError == 22828 or lastError == 16864 then
			--	script_grind:addTargetToLootBlacklist(self.lootObj);
			--	self.lootObj = nil;
			--	ClearLastError();
			--end
	
			-- if looting and not moving then wait
			if (not LootTarget()) and (not IsMoving()) then
				self.waitTimer = GetTimeEX() + 350;
				_quest.waitTimer = GetTimeEX() + 350;
				return;
			else
	
				if (self.autoSelectVendors) and (IsLooting()) then
					local bX, bY, bZ = GetLocalPlayer():GetPosition();
					if (GetDistance3D(self.myLastX, self.myLastY, self.myLastZ, bX, bY, bZ) > 500) then
						if (not self.vendorMessageSent) then
							DEFAULT_CHAT_FRAME:AddMessage("Closest vendors loaded from vendorDB. - " ..GetTimeStamp());
							self.vendorMessageSent = true;
							self.myLastX, self.myLastY, self.myLastZ = GetLocalPlayer():GetPosition();
	
							script_grind:setWaitTimer(2500);
							_quest.waitTimer = GetTimeEX() + 2500;
							if (self.vendorMessageSent) then
								vendorDB:loadDBVendors();
								self.vendorMessageSent = false;
							end
						end
					end 
				end
			end

			-- we looted so reset variables
			--self.vendorMessageSent = false;
			self.waitTimer = GetTimeEX() + 350;
			_quest.waitTimer = GetTimeEX() + 350;
			self.lootCheckTime = 0;
			self.lootObj = nil;
		return;
		end

-- If we reached the loot object, reset the nav path
script_nav:resetNavigate();
end


	handleSwimming();

	-- Blacklist loot target if swimming or we are close to aggro blacklisted targets and not close to loot target
	if (self.lootObj ~= nil) then
		if (IsSwimming()) and (not script_grindEX.allowSwim) and (script_aggro:closeToBlacklistedTargets() and self.lootObj:GetDistance() > 5) then
			script_grind:addTargetToLootBlacklist(self.lootObj:GetGUID());
			return;
		end
	end

	-- blacklisting loot after x time
	if (IsStanding()) and (not IsInCombat()) then
		if (self.blacklistLootTime >= self.blacklistLootTimeCheck) then
			-- add to blacklist
			if (self.lootObj ~= nil and self.loobObj ~= 0) then
			DEFAULT_CHAT_FRAME:AddMessage("Blacklisting loot - " ..self.lootObj:GetUnitName().. " " ..math.floor(self.lootObj:GetDistance()).. " (yd)");
			end
			script_grind:addTargetToLootBlacklist(self.lootObj:GetGUID());
			self.lootObj = nil;
			-- variable on/off to stop spamming message
			if (self.messageOnce) then
			self.blacklistLootTimeCheck = GetTimeEX() + (self.blacklistLootTimeVar * 1000);
			self.messageOnce = false;
			end
		end
	end

	-- move to loot object
	self.message = "Moving to loot...";


	if (self.lootObj ~= 0 and self.lootObj ~= nil) and not (script_grind:isTargetLootBlacklisted(self.lootObj:GetGUID())) then
		local _x, _y, _z = self.lootObj:GetPosition();
		if (self.lootObj:GetDistance() > (self.lootDistance/2)) then
			if (IsPathLoaded(5)) then
				if (script_navEX:moveToLoot(localObj, _x, _y, _z)) then
				self.message = "Moving To Target Loot - " ..math.floor(self.lootObj:GetDistance()).. " (yd) "..self.lootObj:GetUnitName().. "";
				return true;
				end
			elseif (not IsMoving() or not IsPathLoaded(5)) then
				
				if (self.lootObj ~= nil and self.lootObj ~= 0) and (self.lootObj:GetDistance() ~= nil and self.lootObj:GetDistance() ~= 0) then
					self.message = "Cannot find a path to loot target";
					script_grind:addTargetToLootBlacklist(self.lootObj:GetGUID());
				end
				return true;
			end
		end
	end

	-- wait momentarily once we reached lootObj / stop moving / etc
	if (self.lootObj ~= 0 and self.lootObj ~= nil) then
		if (self.lootObj:GetDistance() ~= nil and self.lootObj:GetDistance() ~= 0) then
			if (self.lootObj:GetDistance() <= self.lootDistance) then
				if (IsMoving()) then
					StopMoving();
				end
			self.waitTimer = GetTimeEX() + 250;
			quest.waitTimer = GetTimeEX() + 250;
			--script_nav:resetNavigate();
			end
		end
	end

end

function script_grind:getSkinTarget(lootRadius)
	local targetObj, targetType = GetFirstObject();
	local bestDist = lootRadius;
	local bestTarget = nil;
	while targetObj ~= 0 do
		if (targetType == 3) then -- Unit type NPC
			if(targetObj:IsDead()) then
					-- if is skinnable and is tapped by me (I killed it)
				if (targetObj:IsSkinnable() and targetObj:IsTappedByMe() and not targetObj:IsLootable()) then
					local dist = targetObj:GetDistance();
					if(dist < lootRadius and bestDist > dist) then
						bestDist = dist;
						bestTarget = targetObj;
					end
				end
			end
		end
		targetObj, targetType = GetNextObject(targetObj);
	end
	return bestTarget;
end

function script_grind:lootAndSkin()

	-- Check bags if they are full
	if (not HasSpell("Auto Shot")) then
		local inventoryFull = true;
		for i = 1, 5 do 
			if (i ~= 0) then 
				for y=1,GetContainerNumSlots(i-1) do 
					local texture, itemCount, locked, quality, readable = GetContainerItemInfo(i-1,y);
					if (itemCount == 0 or itemCount == nil) then 
						inventoryFull = false; 
					end 
				end
			end 
		end 
	
		-- Tell the grinder we cant loot
		if (inventoryFull) then
			script_grind.bagsFull = true;
		end
		if (not inventoryFull) then
			script_grind.bagsFull = false;
		end
	end

	-- Loot if there is anything lootable and we are not in combat and if our bags aren't full
	if (not self.skipLooting and not AreBagsFull() and not self.bagsFull) then 
		self.lootObj = script_nav:getLootTarget(self.findLootDistance);
		if (not IsInCombat()) and (self.lootObj ~= nil) and (self.lootObj ~= 0) then
			script_grind.enemyObj = nil;
		end
	end
	if (self.lootObj == 0) then
		self.lootObj = nil;
	end
	if (self.lootObj ~= nil) then
		if (script_grind:isTargetLootBlacklisted(self.lootObj:GetGUID())) then
			self.lootObj = nil; -- don't loot blacklisted targets	
		end
	end
	-- do loot if there is anything lootable
	local isLoot = not IsInCombat() and not (self.lootObj == nil);
	if (isLoot and not AreBagsFull() and not self.bagsFull) and (not IsEating() or not IsDrinking()) and (not self.needRest) and not self.skipLooting then
		script_grind:doLoot(localObj);
		
		return true;
	elseif ((self.bagsFull or AreBagsFull()) and not hsWhenFull) then
		self.lootObj = nil;
		self.message = "Warning the bags are full...";
		return false;
	end
	-- Skin if there is anything skinnable within the loot radius
	if (HasSpell('Skinning') and self.skinning and HasItem('Skinning Knife')) and (not IsDrinking()) and (not IsEating()) and (IsStanding()) and (not self.needRest) then
		self.lootObj = nil;
			-- get skin target
		self.lootObj = script_grind:getSkinTarget(self.findLootDistance);
		if (not AreBagsFull() and not self.bagsFull and self.lootObj ~= nil) and (script_vendor:getStatus() == 0) then
			-- do loot

			if (self.lootObj ~= nil) and (self.lootObj ~= 0) and (not IsLooting()) and not self.skipLooting and not AreBagsFull() and not self.bagsFull then
				--if (self.lootObj:GetDistance() < self.lootDistance-1) then
				--	if (IsMoving()) then
				--		StopMoving();
				--	end
				--end			
				if (script_grind:doLoot(localObj)) then
					self.message = "Moving to skinning target - " ..math.floor(self.lootObj:GetDistance()) .. " (yd)";
					return true;
				end
			end
		end
	end
	return false;
end

function script_grind:runRest()


		local localObj = GetLocalPlayer();
		local localHealth = localObj:GetHealthPercentage();
		local localMana = localObj:GetManaPercentage();

		local myMoney = GetMoney();
		if (myMoney ~= self.currentMoney) then
			self.moneyObtainedCount = myMoney - self.currentMoney;
		end

		self.needRest = true;

		-- check for pet to stop bugs
		local pet = GetPet();
		if (pet ~= 0) then
			if (not PetHasTarget()) then
				script_grind.petHasTarget = false;
			end
		else
			script_grind.petHasTarget = false;
		end

	-- run the rest script for grind/combat
	if(RunRestScript()) then
		-- reset blacklist looting time
		script_grind.blacklistLootTimeCheck = GetTimeEX() + (self.blacklistLootTimeVar * 1000);
		script_gather.blacklistTime = GetTimeEX() + (script_gather.blacklistSetTime * 1000);
		if not PlayerHasTarget() then
			script_grind.autoBlacklistTimer = GetTimeEX() + 15000;
		end
		-- set tick rate for resting
		if (not script_grind.adjustTickRate) then
			local randomRestTick = math.random(300, 500);
			script_grind.tickRate = randomRestTick;
		end

		self.message = "Resting...";

		-- set new target time
		if (not IsInCombat() and not IsMoving()) then
			self.newTargetTime = GetTimeEX();
			
			if (IsDrinking() or IsEating()) and (not IsInCombat()) then
		
			end
		end

		-- Stop moving
		if (IsMoving()) and (not localObj:IsMovementDisabed()) then
			StopMoving();
			return true;
		end

		-- not in combat and pet doesn't have target then stop to rest if needed
		if (not IsInCombat()) and (not petHasTarget) then
			if (IsEating() and localHealth < 95)
				or (IsDrinking() and localMana < 95)
			then
				return true;
			end
		end
	
		-- if done resting then stand up
		if (IsEating() and localHealth >= 95 and IsDrinking() and localMana >= 95) 
		or (not IsDrinking() and IsEating() and localHealth >= 95)
		or (not IsEating() and IsDrinking() and localMana >= 95)
		then
			if (not IsStanding()) then
				JumpOrAscendStart();
				return false;
			end
		end

		-- Dismount
		if (IsMounted()) then
			DisMount();
			return true;
		end

	return true;	
	end
self.needRest = false;
return false;
end

function script_grind:isAnyTargetTargetingMe()
	local player = GetLocalPlayer();

	-- Return a target targeting us
	local i, targetType = GetFirstObject();
	while i ~= 0 do
		if (targetType == 3) then
			if (i:GetUnitsTarget() ~= 0 and i:GetUnitsTarget() ~= nil) then
				if (i:GetUnitsTarget():GetGUID() == player:GetGUID()) then 
					return true
				end
			end
			if GetPet() ~= 0 and GetPet() ~= nil then
				if i:GetUnitsTarget() ~= 0 and i:GetUnitsTarget() ~= nil then
					if (i:GetUnitsTarget():GetGUID() == GetPet():GetGUID()) then 
						return true
					end
				end
			end
		end
		i, targetType = GetNextObject(i);
	end

return false;
end

function script_grind:attackTargetAttackingMe()

	if (not PlayerHasTarget()) and (script_grind.enemyObj == 0 or script_grind.enemyObj == nil) then

		local i, t = GetFirstObject();
		while i ~= 0 do
			if t == 3 then
				if (script_grind:isTargetingMe(i)) then
					script_grind.enemyObj = i;
					return true;
				end
			end
		i, t = GetNextObject(i);
		end
	end
return false;
end
