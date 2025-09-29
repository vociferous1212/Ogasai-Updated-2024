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
	useItemsInInvetoryLoaded = include("scripts\\script_useItemsInInventory.lua"),

	-- nav folder
	includeNavEX 		= include("scripts\\nav\\script_navEX.lua"),
	includeNavEXCombat 	= include("scripts\\nav\\script_navEXCombat.lua"),
	hotspotMoveLoaded 	= include("scripts\\nav\\script_moveToHotspot.lua"),
	--hotspotInfoLoaded 	= include("scripts\\db\\hotspotDB_setInfo_1_10.lua"), -- auto set specific valid targets for each hotspot

	-- professions folder
	enchantingLoaded 	= include("scripts\\professions\\script_enchanting.lua"),
	tailoringLoaded 	= include("scripts\\professions\\script_tailoring.lua"),
	firstAidLoaded 		= include("scripts\\professions\\script_firstAid.lua"),

	-- get trainer spells folder
	fpDBLoaded 		= include("scripts\\db\\fpDB.lua"),
	goToFPLoaded 		= include("scripts\\getTrainerSpells\\script_goToFP.lua"),

	prioritizeTotemsLoaded	= include("scripts\\script_killTotems.lua"),
	combatHelperLoaded	= include("scripts\\script_combatHelper.lua"),

	assignTargetFunctionLoaded = include("scripts\\script_grindAssignTarget.lua"), 
	checkValidEnemyFunctionLoaded = include("scripts\\script_grindValidEnemy.lua"), 
	checkSpentTalentPointsLoaded = include("scripts\\script_grindCheckSpentTalentPoints.lua"),

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

	-- combat script menus
	   mageMenu = include("scripts\\combat\\mage\\script_mageEX.lua"),
	warlockMenu = include("scripts\\combat\\warlock\\script_warlockEX.lua"),
	 priestMenu = include("scripts\\combat\\priest\\script_priestMenu.lua"),
	warriorMenu = include("scripts\\combat\\warrior\\script_warriorEX.lua"),
	  rogueMenu = include("scripts\\combat\\rogue\\script_rogueEX.lua"),
	paladinMenu = include("scripts\\combat\\paladin\\script_paladinMenu.lua"),
	 shamanMenu = include("scripts\\combat\\shaman\\script_shamanEX.lua"),
	  druidMenu = include("scripts\\combat\\druid\\script_druidEX.lua"),
	 hunterMenu = include("scripts\\combat\\hunter\\script_hunterMenu.lua"),

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
	runOutOfCombatIncluded = include("scripts\\script_grindRunOutOfCombat.lua"),
	ifBagsFullIncluded = include("scripts\\script_grindIfBagsFull.lua"),
	doVendorLogicIncluded = include("scripts\\script_grindDoVendorLogic.lua"),
	botPausedChecksIncluded = include("scripts\\script_grindBotPausedChecks.lua"),
	grindDoLootIncluded = include("scripts\\script_grindDoLoot.lua"),

	-- grindFunctions folder
	grindFindLootTargetIncluded = include("scripts\\grindFunctions\\script_grindFindLootTarget.lua"),
	grindAttackTargetAttackingMeIncluded = include("scripts\\grindFunctions\\script_grindAttackTargetAttackingMe.lua"),
	grindIsAnyTargetTargetingPetIncluded = include("scripts\\grindFunctions\\script_grindIsAnyTargetTargetingPet.lua"),
	grindAddTargetToAggroBlacklistLoaded = include("scripts\\grindFunctions\\script_grindAddTargetToAggroBlacklist.lua"),
	grindAreWeSwimmingLoaded = include("scripts\\grindFunctions\\script_grindAreWeSwimming.lua"),
	grindReturnTargetNearMyAggroRangeLoaded = include("scripts\\grindFunctions\\script_grindReturnTargetNearMyAggroRange.lua"),
	grindIsTargetAggroBlacklistedLoaded = include("scripts\\grindFunctions\\script_grindIsTargetAggroBlacklisted.lua"),
	grindBlacklistAreaWithEliteLoaded = include("scripts\\grindFunctions\\script_grindBlacklistAreaWithElite.lua"),


	
	-- pathing
	pathName = 0,
	pathLoaded = 0,
	nextToNodeDist = 3, -- (Set to about half your nav smoothness)
	Name = "", -- set to e.g. "paths\1-5 Durator.xml" for auto load at startup
	pathLoaded = "",	-- path that is loaded
	autoPath = true,	-- use nav 

	-- display data
	drawUnits = true,	-- draw unit data on screen
	drawPath = true,	-- draw path
	drawAutoPath = true,	-- draw walk path



	-- grinder settings
	isSetup = false,	-- is setup function run
	ressDistance = 29,
	combatError = 0,
	myX = 0,
	myY = 0,
	myZ = 0,
	jump = true,	-- enable jumping out of combat
	jumpRandomFloat = 99,	-- jump > than 
	jumpCheck = false,
	useMount = true,	-- use mount
	message = 'Starting the grinder...',
	distToHotSpot = 500,	-- distance to target enemies from hotspot
	staticHotSpot = true,	-- use hotspots
	hotSpotTimer = GetTimeEX(),	-- timer to hotspot
	currentLevel = GetLocalPlayer():GetLevel(),	-- current player level
	skinning = false,	-- use skinning
	gather = true,		-- use gatherer script
	lastTarget = 0,		-- last target targeted guid
	lastTargetTargeted = 0, -- last target unit token
	minLevel = GetLocalPlayer():GetLevel()-5,
	maxLevel = GetLocalPlayer():GetLevel()+2,


	-- other scripts
	getSpells = false,
	autoTalent = false,



	-- targeting
	enemyObj = nil,
	pullDistance = 225,	-- find target distance
	avoidElite = true,	-- avoid elites ( currently not working )
	avoidRange = 40,	-- aboid elites range
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
	blacklistedTargets = {},	-- GUID table of blacklisted targets
	blacklistedNum = 0,	-- number of blacklisted targets
	hardBlacklistedTargets = {},	-- GUID table of blacklisted targets
	hardBlacklistedNum = 0,	-- number of blacklisted targets

	-- loot and vendoring
	lootObj = nil,
	useVendor = true,	-- use vendor
	repairWhenYellow = true,	-- repair when yellow
	stopWhenFull = false,	-- stop when bags are full
	hsWhenFull = false,	-- hearthstone when bags are full
	findLootDistance = 75,
	lootDistance = 3,
	skipLooting = false,
	lootCheck = {},
	lootBlacklistedTargets = {},
	lootBlacklistedNum = 0,

	-- timers
	tickRate = 1550,		-- reaction time / speed of scripts
	waitTimer = GetTimeEX(),	-- wait timer
	checkBagTimer = GetTimeEX(),
	mountTimer = GetTimeEX(),	-- defunct setting
	timer = GetTimeEX(),	-- blacklist timer
	myTime = GetTimeEX(),
	unstuckTimer = GetTimeEX(),
	resetBlacklistLootTableTimer = 0,
	useItemsTimer = 0,

	-- paranoia
	paranoidRange = 75,	-- paranoia range
	paranoidSetTimer = 22,	-- time to wait after paranoia has needed
	useString = true,	-- message to send to log players in range run once
	useOtherString = true,	-- message to send to log players targeting us run once
	useLogoutTimer = false,	-- use logout timer true/false
	logoutSetTime = GetTimeEX() / 1000,	-- set the logout time in seconds
	logoutTime = 2,	-- logout time in hours
	

	
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
	blacklistLootTime = 0,	-- blacklist loot time timer GetTimeEX()
	blacklistLootTimeCheck = 0, -- timer to blacklist loot
	blacklistLootTimeVar = 20, -- how long until loot is blacklisted
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
	timeToSit = 0,
	sitTimerSet = false,
	afkUsed = false,
	combatScriptRange = 30,
	drawAggroAtStart = true,
	showOM = false,
	useFirstAid = true,
	blacklistTargetName = "",
	blacklistTargetName2 = "",
	moveTimer = 0,		-- timer for movement when stuck
	lastTargetKilled = 0,	-- last target killed by grinder
	fpPause = false,	-- was script paused by fp script
	useFPS = false,		-- use flight paths
	eatHealth = 1,
	drinkMana = 1,
	autoAttackActionSlot = 0,
	targetHasRangedWeaponTable = {},
	targetHasRangedWeaponTableNum = 0,
	autoBlacklistTimer = 0,
	autoBlacklistTimerSet = false,
	checkTotemKillTimer = GetTimeEX(),
	currentCastingTime = 0,
	stopBotWhenInvFull = false,
	hasAMount = true,
}			

-- run setup function
function script_grind:setup()

	script_grindSetup:setup();

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

-- add target to loot blacklist
function script_grind:addTargetToLootBlacklist(targetGUID)
	if (targetGUID ~= nil and targetGUID ~= 0 and targetGUID ~= '') then	
		self.lootBlacklistedTargets[self.lootBlacklistedNum] = targetGUID;
		self.lootBlacklistedNum = self.lootBlacklistedNum + 1;
	end
end

function script_grind:resetLootBlacklistTable()
self = script_grind;
	for i=0, self.lootBlacklistedNum -1 do
		self.lootBlacklistedTargets[i] = nil;
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

-- should we rest and eat/drink
function script_grind:shouldWeRest()

	if not IsDrinking() and not IsEating() and not IsCasting() and not IsChanneling() and not IsLooting() then
	
		-- some servers are returning ''undefined'' for mana percentage

		-- if we aren't warrior or rogue then check for mana
		if GetMyClass() ~= "ROGUE" and GetMyClass() ~= "WARRIOR" then
			if (GetLocalPlayer():GetManaPercentage() <= script_grind.drinkMana or GetLocalPlayer():GetHealthPercentage() <= script_grind.eatHealth) then
				return true;
			end
		-- if we are warrior or rogue then check for health only
		elseif (GetMyClass() == "ROGUE" or GetMyClass() == "WARRIOR") and GetLocalPlayer():GetHealthPercentage() <= script_grind.eatHealth then

			return true;
		end
	end
return false;
end

-- example of object manager iteration
function script_grind:objectManagerExample()

	-- GetFirstObject() returns args 'valid game object' and 'type of game object'
	-- iterate first object
	local i, t = GetFirstObject();

	-- placeholder
	local target = nil;

	-- we have a valid object
	while i ~= 0 do

		-- NPC
		if t == 3
		-- Player
		or t == 4
		-- Game object
		or t == 5

		then

			-- iterate through all objects less than 100 yards
			if i:GetDistance() < 100 then

				-- iterate all names within 100 yards
				if i:GetUnitName() == "name" then

					-- iterate all objects within 100 yards by name and now iterate through their health
					if i:GetHealthPercentage() > 0 then

						-- save this target for the next iteration
						target = i;
					end
				end

			-- iterate through all objects within 100 yards and check their distance to my target
				if target ~= nil and target:GetDistance() > i:GetDistance() then
					target = i;
				end
			end

			-- we still have local target variable set from above
			if target ~= nil and i:GetDistance() <= target:GetDistance() then

				-- set our new target variable if i distance < target distance
				target = i;
			end
		end

	-- we are done iterating that single object, get the next object to check
	i, t = GetNextObject(i);
	end

	-- return the target after all iterations done
return target;
end
						
-- RUN GRINDER
function script_grind:run()


-- show grinder window
	script_grind:window();

-- set localObj var
	localObj = GetLocalPlayer();

-- load navmesh
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
	
	if GetLoadNavmeshProgress() ~= 1 then
		return true;
	end

-- pre checks and stuff while bot is paused

	if script_grindBotPausedChecks:botPausedChecks() then self.message = "Paused... Running checks while bot paused..."; return; end

-- PAUSE BOT
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

	-- reset timers if eating/drinking
	if IsEating() or IsDrinking() or IsLooting() or IsMoving() then
		self.autoBlacklistTimer = GetTimeEX() + 15000;
		self.lootCheckTimer = 10000;
		script_grind.lootCheck['timer'] = 0;
	end
	if IsEating() or IsDrinking() or IsChanneling() or IsCasting() and not IsInCombat()then
		script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
		if PlayerHasTarget() and script_grind.enemyObj ~= nil then if GetTarget():GetGUID() ~= script_grind.enemyObj:GetGUID() then
		ClearTarget(); script_grind.enemyObj = nil; end end
	end

-- Check: Spend talent points
	if (not IsInCombat() and not GetLocalPlayer():IsDead() and self.autoTalent) then
		if (script_talent:learnTalents()) then
			self.message = "Checking/learning talent: " .. script_talent:getNextTalentName();
			return;
		end
	end
	

-- tick rate - if wait timer isn't finished then return. add tick rate time
	if (self.waitTimer > GetTimeEX()) then
		return;
	end

	if localObj:IsFleeing() or localObj:IsStunned() or localObj:IsConfused() and not HasSpell("Will of the Forsaken") then
		self.waitTimer = GetTimeEX() + 1000;
		self.message = "Stunned... waiting...";
		return;
	end

	-- redundancy - bot will get stuck looting nothing or stuck in loot window...
	if IsLooting() and GetTimeEX() > script_grindDoLoot.timerWhileLooting then
		LootTarget();
		script_grindDoLoot.timerWhileLooting = GetTimeEX() + 1000; 
		self.waitTimer = GetTimeEX() + 500;
	end

	-- use items in inventory
	if not IsInCombat() and not IsLooting() and GetTimeEX() > self.useItemsTimer then
		if script_useItemsInInventory:useItems() then
			self.waitTimer = GetTimeEX() + 500;
			return true;
		end
	-- 5 mins, bot should return until done
	self.useItemsTimer = GetTimeEX() + 300000;
	end

-- check intial unstuck
	if not self.pause and self.useUnstuck and GetTimeEX() > self.unstuckTimer then
		if script_unstuck:checkUnstuck() then
			self.unstuckTimer = GetTimeEX() + 750;
			self.message = "Checking unstuck #1";
		end
	end

-- our position must be changing and we must still be stuck so try another unstuck
-- use unstuck feature
	if (self.useUnstuck) and (IsMoving()) and (not self.pause) and GetTimeEX() > self.unstuckTimer then
		if (not script_unstuck:pathClearAuto(2)) then
			self.unstuckTimer = GetTimeEX() + 750;
			self.message = "Checking unstuck #2";
			script_unstuck:unstuck();
		end
	end

-- open gates/doors while grinding
	if not IsInCombat()
	and not IsEating()
	and not IsDrinking()
	and IsStanding() and GetTimeEX() > script_helper.gateTimer

	then
	
	script_helper:openGates();
	
	end

-- override combat scripts for certain conditions like moving, stop casting, etc.
	if IsInCombat() then
		script_combatHelper:run();
	end
	
	if (GetTarget() ~= 0 and GetTarget() ~= nil) and (GetTarget():CanAttack()) and (not GetTarget():IsDead()) then
		TargetHasRangedWeapon(target);
	end
		
-- check party members for their targets/distance/mana/buffs/heals
	if (GetNumPartyMembers() >= 1) then
		script_grindParty:partyOptions();
	end

-- check object manager for adds
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

-- paranoia counter
	if (not script_paranoia.paranoiaUsed) then
		script_paranoiaCheck:playersWithinRange2(self.paranoidRange);
	end
	if (script_paranoia.paranoiaUsed) and (not self.usedParanoiaCounter) then
		self.paranoiaCounter = self.paranoiaCounter + 1
		self.usedParanoiaCounter = true;
	end

-- do paranoia
	if not GetLocalPlayer():IsDead()
	and GetLocalPlayer():GetHealthPercentage() >= 1
	and not script_getSpells:cityZones()
	and self.hotspotReached
	and script_nav:getDistanceToHotspot() <= self.distToHotSpot
	and not IsLooting()
	and not IsInCombat()
	and not IsMounted()
	and not IsCasting()
	and not IsChanneling()
	and script_grind.playerName ~= "Unknown"
	and script_grind.otherName ~= "Unknown"
	and script_vendor.status == 0
	and (self.getSpells or script_getSpells.getSpellsStatus == 0)
	
	then	
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

		-- send the combat script messages to the grinder
	if (not IsMoving()) and (IsInCombat() or PlayerHasTarget()) and not IsMounted() then
	
		local messageTable = {
			["ROGUE"] = true,
			["PALADIN"] = true,
			["WARRIOR"] = true,
			["DRUID"] = true,
			["SHAMAN"] = true,
			["HUNTER"] = true,
			["MAGE"] = true,
			["PRIEST"] = true,
			["WARLOCK"] = true
								}

		local combatScriptMessage = GetMyClass()
	
		if messageTable[combatScriptMessage] then
	
			if combatScriptMessage == "ROGUE" then
				self.message = script_rogue.message
			elseif combatScriptMessage == "PALADIN" then
				self.message = script_paladin.message
			elseif combatScriptMessage == "WARRIOR" then
				self.message = script_warrior.message
			elseif combatScriptMessage == "DRUID" then
				self.message = script_druid.message
			elseif combatScriptMessage == "SHAMAN" then
				self.message = script_shaman.message
			elseif combatScriptMessage == "HUNTER" then
				self.message = script_hunter.message
			elseif combatScriptMessage == "MAGE" then
				self.message = script_mage.message
			elseif combatScriptMessage == "PRIEST" then
				self.message = script_priest.message
			elseif combatScriptMessage == "WARLOCK" then
				self.message = script_warlock.message
			end

		else
	
			self.message = combatScriptMessage.." waiting for combat conditions."

		end
	end

-- Clear dead/blacklisted/tapped targets
	if (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) and not IsMounted() then
		-- Save location for auto pathing
		if (script_grind.hotspotReached and script_grind.enemyObj:IsDead() and script_grind.enemyObj:GetLevel() >= script_grind.minLevel and script_grind.enemyObj:GetLevel() <= script_grind.maxLevel) then 
			script_nav:saveTargetLocation(script_grind.enemyObj, script_grind.enemyObj:GetLevel());
			script_grind.waitTimer = GetTimeEX() + 1000;
			script_nav:resetNavigate();
			script_nav:resetNavPos();
		end
		if (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) then
			if ((script_grind.enemyObj:IsTapped() and not script_grind.enemyObj:IsTappedByMe()) 
			or (script_grind:isTargetHardBlacklisted(script_grind.enemyObj:GetGUID()) and not IsInCombat())
			or script_grind.enemyObj:IsDead()) then
				script_nav:resetNavigate();
				script_nav:resetNavPos();
				script_grind.enemyObj = nil;
				ClearTarget();
			end
		end
	end

-- we are being attacked by something so attack it - we have a pet
	if not IsMounted() and (IsInCombat()) and HasPet() and (self.enemyObj == 0 or self.enemyObj == nil) and GetTimeEX() > script_hunter.petAttackTimer then		
			script_hunter:petAttackTargetAttackingMe();
			script_hunter.petAttackTimer = GetTimeEX() + 2000;
	end
	if IsInCombat() and HasPet() and self.enemyObj ~= nil and self.enemyObj ~= 0 then
		if PetHasTarget() and PlayerHasTarget() then
			if not script_grind:isTargetingMe(script_grind.enemyObj) and self.enemyObj:GetHealthPercentage() >= 99 then
				ClearTarget();
				GetPet():GetUnitsTarget():AutoAttack();
				if not script_grind:isTargetHardBlacklisted(GetPet():GetUnitsTarget():GetGUID()) then
					script_grind.enemyObj = GetPet():GetUnitsTarget();
					self.message = "Assisting Pet";
				end
			end
		end
	end

-- we are being attacked by something so attack it - we have NO pet
	if not IsMounted() and (IsInCombat()) and (self.enemyObj == 0 or self.enemyObj == nil) and (script_grind:isAnyTargetTargetingMe() or script_grindIsAnyTargetTargetingPet:isAnyTargetTargetingPet()) then
		if (not PlayerHasTarget()) or (not HasPet()) then
			script_grindAttackTargetAttackingMe:attackTargetAttackingMe();
			if HasPet() then self.enemyObj = GetPet():GetUnitsTarget(); end
			if HasPet() then AssistUnit("pet"); end
			self.message = "Getting nearest target";
		end
	end

-- reset loot blacklist timer
	if (not IsInCombat()) and (not IsLooting()) and self.lootObj == nil then
		self.blacklistLootTime = GetTimeEX();
	end

-- reset target timer if not reached hotspot
	if (not self.hotspotReached) or IsEating() or IsDrinking() or not IsStanding() then
		self.newTargetTime = GetTimeEX();
	end

-- reset vendor message after selling/repairing
	if (script_vendor.status == 0) and (self.hotspotReached) then
		script_vendor.message = "idle...";
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

-- close trade skills... first aid, etc
	if (script_firstAid.bookOpen) and (not IsChanneling()) and (not IsCasting()) then
		script_firstAid.bookOpen = false;
		CloseTradeSkill();
	end

-- reset timers
	if (IsInCombat()) then
		self.blacklistLootTimeCheck = GetTimeEX() + (self.blacklistLootTimeVar * 1000);
		script_gather.blacklistTime = GetTimeEX() + (script_gather.blacklistSetTime * 1000);
		self.lootCheckTime = 10000;
	end

-- Do all checks
	if script_grindEX:doChecks() then
		return;
	end

-- if we are dead then return do dochecks function
	if localObj:IsDead() then
		return;
	end


-- VENDOR LOGIC


-- run vendor logic to check for vendor status and run it, etc
	if (not IsInCombat() or IsMounted()) and not PetHasTarget() and not IsCasting() and not IsChanneling() and not script_grind:shouldWeRest() then
		if script_grindDoVendorLogic:run() then
			return true;
		end
	end

-- attempt to move out of fire. was locking up nav but since nav is fixed it should work properly. can also be used to detect AoE if done right
	--if (script_helper:weAreStandingInFire()) then
	--	return true;
	--end

-- Mount up
	if  self.hasAMount and not IsSwimming() and (not self.hotspotReached or script_vendor:getStatus() >= 1) and (not IsInCombat())
	and (not IsMounted()) and (not IsIndoors()) and (not HasForm()) and (script_grind.useMount)
	and (self.lootObj == nil or self.skipLooting or AreBagsFull() or self.bagsFull or script_hunter.bagsFull)
	and not IsCasting() and not IsChanneling()
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

-- make sure we mount
	if self.hasAMount and not IsSwimming() and (not self.hotspotReached or script_vendor:getStatus() >= 1) and (not IsInCombat())
		and (not IsMounted()) and (not IsIndoors()) and (not HasForm()) and (script_grind.useMount)
		and (self.lootObj == nil or self.skipLooting or AreBagsFull() or self.bagsFull or script_hunter.bagsFull)
		and not IsCasting() and not IsChanneling()

	then
		return;
	end

	-- reset gather blacklist timer if we enter combat
	if (IsInCombat()) or (script_vendor:getStatus() > 0) then
		script_gather.blacklistTime = GetTimeEX()*2;
		script_gather.timerSet = false;
	end
		
	-- Gather
	if (script_grind.lootObj == nil or self.skipLooting)
	and (self.gather and not AreBagsFull() and not self.bagsFull)
	and (not IsChanneling())
	and (not IsCasting())
	and (not IsEating())
	and (not IsDrinking())
	and (not self.needRest)
	and (not IsInCombat())
	and script_vendor.status == 0
		
	then

		if (not IsStealth()) and (script_gather.safeGather) and (script_grindReturnTargetNearMyAggroRange:returnTargetNearMyAggroRange() ~= nil) and not IsInCombat() then
			if (not IsStealth()) and (self.enemyObj == nil or self.enemyObj == 0 and not IsInCombat()) then
				self.enemyObj = script_grindReturnTargetNearMyAggroRange:returnTargetNearMyAggroRange();
			end
			
		elseif not IsInCombat() and self.lootObj == nil and (script_grindReturnTargetNearMyAggroRange:returnTargetNearMyAggroRange() == nil) and (self.enemyObj == nil or self.enemyObj == 0 or self.enemyObj:GetDistance() > 25) or (IsStealth())  or (not script_gather.safeGather) then
			
			if (script_gatherRun:gather()) then

					

					if not IsInCombat() and not script_grind:isAnyTargetTargetingMe() then
						if PlayerHasTarget() then
							ClearTarget();
						end
					end

				if not script_grind.adjustTickRate then
					script_grind.tickRate = 135;
				end

				-- turn off jump for gathering...
				if (self.jump) then
					self.jumpCheck = true;
					self.jump = false;
				end

				-- bot was blacklisting targets after gathering
				self.newTargetTime = GetTimeEX();

				if (script_gather.dist ~= 0 and script_gather.dist ~= nil and script_gather.dist > 20) and (not script_druid.useBear)
				and (HasSpell("Prowl") or HasSpell("Stealth")) then
					CastStealth();
				end

				if (not script_grind.adjustTickRate) then
					script_grind.tickRate = 135;
				end

				self.message = 'Gathering ' .. script_gather:currentGatherName() .. ' ' ..script_gather.messageToGrinder.."";
				if (IsLooting()) then
					script_grind:setWaitTimer(1000);
				end
			return;
			end
		end
	end

	-- we are mounted so don't do combat or anything
	if script_vendor.status >= 1 and IsMounted() then
		return;
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
	if (self.getSpells)
	and (not self.pause)
	and (not IsInCombat())
	and (self.lootObj == nil or AreBagsFull() or self.bagsFull or self.skipLooting)
	and script_vendor.status == 0

	then

		if (script_getSpells:checkForSpellsNeeded()) and not IsInCombat() then
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

-- run flight paths
	if (self.useFPS) and (script_getSpells:cityZones())
	and (script_getSpells.getSpellsStatus == 0)
	and (script_goToFP.getFPStatus ~= 3)
		
	then

		script_goToFP:run();
		return;
	end

-- force bot to keep path to trainer
	if (self.getSpells) and script_vendor.status == 0 
	and (script_getSpells.getSpellsStatus > 0) and (not IsInCombat()) then
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
	--if IsInCombat() and GetTimeEX() > self.checkTotemKillTimer then
	--	script_killTotems:checkForTotems(10);
	--	self.checkTotemKillTimer = GetTimeEX() + 5000;
	--end
	
-- force enemy obj var
	if (IsInCombat()) then
		if (PlayerHasTarget()) then
			if not script_grind:isTargetHardBlacklisted(GetTarget():GetGUID()) then
			self.enemyObj = GetLocalPlayer():GetUnitsTarget();
			self.lastTarget = self.enemyObj:GetGUID();
			end
		end
	end

-- find loot before gaining a new target... rogue likes to break stealth
	script_grindFindLootTarget:findLootTarget();

	-- make sure the grinder cannot run if we are resting...
	if (not IsInCombat()) and (not PetHasTarget()) then
		if self.lootObj == nil then
			if script_grind:shouldWeRest() then
				script_grind:runRest()
				self.newTargetTime = GetTimeEX();
				self.autoBlacklistTimer = 15000;
				--self.blacklistLootTimeCheck = GetTimeEX() + (self.blacklistLootTimeVar * 1000);
				script_gather.blacklistTime = GetTimeEX() + (script_gather.blacklistSetTime * 1000);
				return true;
			end
		end
	end

	-- LOOTING PHASE

-- loot the target - do loot 
	if not script_grind.skipLooting and not AreBagsFull() and not script_grind.bagsFull and not self.needRest then
			
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
						--return true;
					end
			
				end
			end	
		end
	end

-- if we have a loot target but can't loot then loot object = nil
	if self.skipLooting or AreBagsFull() or self.bagsFull or script_hunter.bagsFull then
		self.lootObj = nil;
	end

-- don't assign targets  until we get to hotspot
	if script_vendor.status == 0
	and self.hotspotReached
	and GetTimeEX() > self.newTargetTime
	and not IsLooting()
	and not IsEating()
	and not IsDrinking()
	and (script_grind.lootObj == nil or AreBagsFull() or self.bagsFull or self.skipLooting)
	and not IsCasting()
	and not IsChanneling()
	and not script_grind:shouldWeRest()

	then

		self.enemyObj = script_grindAssignTarget:assignTarget();
	end

-- we used stealth
	if (IsInCombat()) or (not PlayerHasTarget()) then
		self.stealthRanOnce = false;
	end

-- target the enemyObj
	if (self.enemyObj ~= 0 and self.enemyObj ~= nil) then

		if (not PlayerHasTarget())
		and (not script_grind:isTargetHardBlacklisted(self.enemyObj))
		and (not IsAutoCasting("Attack"))
		and (self.enemyObj:GetDistance() <= self.pullDistance)
		
		then

			-- this should target the target, turn auto attack on and then auto attack off to allow for stealth opener
			if (not GetLocalPlayer():HasBuff("Stealth")
			and not GetLocalPlayer():HasBuff("Prowl"))
			
			then
				self.enemyObj:AutoAttack();
			end

			if (GetLocalPlayer():HasBuff("Stealth") or GetLocalPlayer():HasBuff("Prowl"))
			and (not self.stealthRanOnce)
			and (GetTimeEX() > self.attackTimer)
			
			then

				self.enemyObj:AutoAttack();
				self.stealthRanOnce = true;
				CastSpellByName("Attack");
				self.attackTimer = GetTimeEX() + 5000;
			end
		end

		-- Fix bug, when not targeting correctly
		if (self.lastTarget ~= self.enemyObj:GetGUID()) then
			if (not IsMoving()) and not IsInCombat() then
				self.newTargetTime = GetTimeEX();
				ClearTarget();
			end

			-- blacklist the target if we had it for a long time and hp is high
		elseif (((GetTimeEX()-self.newTargetTime)/1000) > self.blacklistTime and self.enemyObj:GetHealthPercentage() > 92) then
			script_grind:addTargetToHardBlacklist(self.enemyObj:GetGUID());
			DEFAULT_CHAT_FRAME:AddMessage("Target time ran out - blacklisting target")
			self.newTargetTime = GetTimeEX();
			ClearTarget();
			script_nav:resetNavigate();
			script_grind:setWaitTimer(2000);

		elseif (IsInCombat() or IsEating() or IsDrinking()) and (self.enemyObj ~= nil and self.enemyObj ~= 0)
		and (self.enemyObj:IsInLineOfSight())
		and (self.lastTarget == self.enemyObj:GetGUID())
		
		then

			self.newTargetTime = GetTimeEX();
		end	
	end



-- check to see if we need to move back to hotspot area...
	if script_nav:getDistanceToHotspot() > self.distToHotSpot then
		self.hotspotReached = false;
	end

-- we reached hotspot
	-- and not if map changed
	if script_nav:getDistanceToHotspot() < self.distToHotSpot and not self.hotspotReached then
		self.hotspotReached = true;
	end

-- Dont pull mobs before we reached our hotspot unless we are in aggro range
		--if (not IsInCombat()) then
		--	if (not self.hotspotReached or script_vendor.status > 0 or script_getSpells.getSpellsStatus > 0) and (script_grindReturnTargetNearMyAggroRange:returnTargetNearMyAggroRange() == nil) then
		--		self.enemyObj = nil;
		--		if (PlayerHasTarget()) and (script_grind.enemyObj == nil or script_grind.enemyObj == 0) then
		--			ClearTarget();
		--		end	
		--	elseif (not IsInCombat()) and (not IsStealth()) and (GetLocalPlayer():GetLevel() > 5) and (not self.hotspotReached or script_vendor.status > 0 or script_getSpells.getSpellsStatus > 0) and (script_grindReturnTargetNearMyAggroRange:returnTargetNearMyAggroRange() ~= nil) then
		--		self.enemyObj = script_grindReturnTargetNearMyAggroRange:returnTargetNearMyAggroRange();
		--	end
		--end

-- Dont pull if more than 1 add will be pulled check SafePull aggro
	if (self.enemyObj ~= nil and self.enemyObj ~= 0 and self.skipHardPull) and (self.hotspotReached)
	and not script_grind:isTargetBlacklisted(self.enemyObj:GetGUID())
	
	then
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
		-- some servers return -1IND# some return nil some return 0... don't use while target is casting.
		-- was set to a mana percentage <=5 mana then we can move. don't run back and forth with casters
		if (script_checkAdds:checkAdds()) and (self.enemyObj:GetHealthPercentage() >= 20) and (not self.enemyObj:IsCasting()) then
			script_om:FORCEOM();
			script_grind.waitTimer = GetTimeEX() + 1500
			return true;
		end
	end	

-- ENTERING COMBAT PHASE


-- Finish loot before we engage new targets or navigate - return
	if self.lootObj ~= nil and (not IsInCombat() or (not script_grind:isAnyTargetTargetingMe() and not script_grindIsAnyTargetTargetingPet:isAnyTargetTargetingPet())) then
		return;
	else

		-- blacklist loot message
		self.messageOnce = true;

		if self.lootObj == nil or self.lootObj == 0 then
			-- blacklist loot timer
			self.timerSet = false;
		end

		-- reset the combat status
		self.combatError = nil; 

		-- avoid blacklisted and avoided targets
		if (script_grindEX.avoidBlacklisted) then

			-- check blacklisted targets around us and avoid
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


		-- if we are close to aggro range of targets marked as 'adds' then we need to avoid or attack them first
		-- since avoid is buggy we are just going to try to kill them instead of running into them
		if not script_grindEX.avoidBlacklisted
		and not IsInCombat()
		and not script_grind:isAnyTargetTargetingMe()
		and not script_grindIsAnyTargetTargetingPet:isAnyTargetTargetingPet()
		and self.hotspotReached and script_vendor.status == 0
		and not IsStealth()
			
		then
	
			if script_aggro:closeToAdds() then
				self.enemyObj = script_aggro:returnClosestAddsTarget();

				self.message = "Trying to attack target with adds...";
				
				if self.enemyObj ~= nil and self.enemyObj ~= 0 then
				if not IsAutoCasting("Attack") then
					self.enemyObj:AutoAttack();
				end
				end

				self.newTargetTime = GetTimeEX() + 1500;
			end
		end
	
		-- we are in combat so get a target sooner based on if anything is attacking us
		if not IsLooting()
		and not IsCasting()
		and not IsChanneling()
		and IsInCombat()
		and GetTimeEX() > self.newTargetTime
		and not script_grind:isAnyTargetTargetingMe()
		and not script_grindIsAnyTargetTargetingPet:isAnyTargetTargetingPet()
			
		then
	
			self.enemyObj = script_grindAssignTarget:assignTarget();
			self.newTargetTime = GetTimeEX();
		end
	
		-- get a target in combat with us if we have a target that is not targeting us
		if IsInCombat() and self.enemyObj == nil or self.enemyObj == 0 then
			
				self.enemyObj = script_grindAssignTarget:assignTarget();
				self.newTargetTime = GetTimeEX();
		end
	
		-- if we have a target and it's not around us anymore - we left range or it left range or etc
		if script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil then
			if not script_grind:isTargetingMe(script_grind.enemyObj)
			and not script_grind:isTargetingPet(script_grind.enemyObj)
			and not script_grindEX:isThereAnyValidEnemyNearby()
			
			then

				self.enemyObj = nil;
			end
		end
			
		-- sometimes bot will lose the target or the target will drop targeting us when fleeing, causing us to drop target
		if IsInCombat() and self.lastTargetTargeted ~= nil and self.lastTargetTargeted ~= 0 then 

			-- if the target is not dead and not targeting us then target it
			if not self.lastTargetTargeted:IsDead() and not script_grind:isTargetingMe(self.lastTargetTargeted)
			and not script_grind:isTargetingPet(self.lastTargetTargeted)
			and not script_grind:isTargetHardBlacklisted(self.lastTargetTargeted:GetGUID())
				
			then
				
				self.enemyObj = self.lastTargetTargeted;
			end	
		end	
	end


-- RUN COMBAT SCRIPT ON TARGET
	--	 run the combat script
	if (self.enemyObj ~= nil and self.enemyObj ~= 0) then

		if not self.enemyObj:CanAttack() then
			self.enemyObj = nil;
			ClearTarget();
		end

				
		if self.enemyObj ~= nil and self.enemyObj ~= 0 and not IsLooting() then

			if IsMounted() and script_vendor.status == 0 then DisMount(); end

			-- run the combat script
			self.combatError = RunCombatScript(self.enemyObj:GetGUID());
		end

		if IsInCombat() then
			script_grindAssignTarget:assignTarget();
		end

		-- don't avoid our current target check adds script
		self.lastAvoidTarget = self.enemyObj;
				
		if not PlayerHasTarget() and PetHasTarget() and IsInCombat() and HasPet() then
			if not GetPet():IsDead() then
				AssistUnit("pet");
				if script_hunter:getPetsTarget() ~= nil then
					script_grind.enemyObj = script_hunter:getPetsTarget();
				end
			end
		end

			-- Check: Do we have the right target (in UI) ??
		if (GetTarget() ~= 0 and GetTarget() ~= nil) then
			if (GetTarget():GetGUID() ~= self.enemyObj:GetGUID()) then
				ClearTarget();
			end
		end

		
		
			-- reset object manager and check adds enemies
		if (not IsMoving()) then
			script_checkAdds.closestEnemy = 0;
			script_checkAdds.intersectEnemy = nil;
		end

		-- we are in combat so get a target
		if not IsLooting
		and not IsCasting()
		and not IsChanneling()
		and IsInCombat()
		and (self.enemyObj == 0 or self.enemyObj == nil)
		and GetTimeEX() > self.newTargetTime
				
		then
	
		-- assign a target
		self.enemyObj = script_grindAssignTarget:assignTarget();
		self.newTargetTime = GetTimeEX();

			if (self.enemyObj ~= 0 and self.enemyObj ~= nil) then

				self.lastTarget = self.enemyObj:GetGUID();
				self.lastTargetTargeted = self.enemyObj:GetGUID();
			end
		end
	end
					
	-- assign a target
	if (self.enemyObj ~= nil and self.enemyObj ~= 0) and (not IsInCombat() and not script_grind:shouldWeRest()) then
			
		-- find loot before gaining a new target... rogue likes to break stealth
		script_grindFindLootTarget:findLootTarget();

	elseif (self.hotspotReached)
		and (self.enemyObj == nil or self.enemyObj == 0)
		and GetTimeEX() > self.newTargetTime
		and not IsLooting()
		and not IsEating()
		and not IsDrinking()
		and not IsCasting()
		and not IsChanneling()
		and (script_grind.lootObj == nil or AreBagsFull() or self.bagsFull or self.skipLooting)
		and script_vendor.status == 0
		
		then

		-- else assign a target
		self.enemyObj = script_grindAssignTarget:assignTarget();			
	end

-- try to walk closer to hotspot area... if we cannot find a target... even if distToHotspot is set
	if script_nav.numSavedLocation < 3
	and self.hotspotReached
	and not script_grindEX:isThereAnyValidEnemyNearby()
	and script_nav:getDistanceToHotspot() > 50
	and script_vendor.status == 0
	and not script_grind:shouldWeRest()
	and not IsInCombat()
	and not IsCasting()
	and not IsChanneling()
	and not script_grind:shouldWeRest()
				
	then
			script_moveToHotspot:moveToHotspot(localObj);
			self.message = "no enemies in range and not enough path nodes to run";
	return;
	end

-- monster kill counter turning variable on and off 
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
-- COMBAT errors


-- clear own player if targeted for some reason
	if (PlayerHasTarget()) and (IsInCombat()) and (GetLocalPlayer():GetUnitsTarget():GetGUID() == GetLocalPlayer():GetGUID()) then
		ClearTarget();
	end
			
-- return 0 In range: attack the target, combat script returns 0 STOP MOVING
	if (self.combatError == 0) then

		-- we stopped moving so reset navigate
		--script_nav:resetNavigate();
		--script_nav:resetNavPos();

		-- return 0 stops movement
		self.waitTimer = GetTimeEX() + 250;
	end

-- return 2 Invalid target: combat script return 2
	if (self.combatError == 2) then

		-- add target to blacklist
		script_grind.addTargetToBlacklist(self.enemyObj:GetGUID());
	
		-- reset enemyObj
		self.enemyObj = nil;
		ClearTarget();
		return;
	end

-- MOVE TO TARGET
-- return 3 Move in range: combat script return 3
	if self.combatError == 3
	and not localObj:IsMovementDisabed()
	and not (script_grind:shouldWeRest() and not IsInCombat())
	and not script_checkDebuffs:hasDisabledMovement()
	and self.enemyObj ~= 0
	and self.enemyObj ~= nil
	and not self.enemyObj:IsDead()
		-- we only want to move to a target if we are done looting or we are being attacked
	and (self.lootObj == nil
		or AreBagsFull()
		or self.bagsFull
		or self.skipLooting
		or script_grind:isAnyTargetTargetingMe()
		or script_grindIsAnyTargetTargetingPet:isAnyTargetTargetingPet())
				
	then

		self.message = "Moving to target return 3 trying to find a path...";
	
		-- check positions
		local _x, _y, _z = self.enemyObj:GetPosition();
		local localObj = GetLocalPlayer();
		local mX, mY, mZ = localObj:GetPosition();

		-- adjust tick rate to make targeting and movement quicker
		if not script_grind.adjustTickRate and PlayerHasTarget()
		and (script_grind:isTargetingMe(self.enemyObj) or self.enemyObj:GetHealthPercentage() < 20) then
			script_grind.tickRate = 50;
		else
			script_grind.tickRate = 150;
		end
	
-- find a loot target
		--script_grindFindLootTarget:findLootTarget();

-- if we have a valid target position coordinates
		if (_x ~= 0 and x ~= 0) then

			-- turn the target to face the opposite direction it was pulled...
			local test = 0;
			if not IsStealth() then
				test = math.random(-1, 1);
			end
			-- move to target
			script_navEXCombat:moveToTarget(localObj, _x+(test/2), _y-(test/2), _z);

			self.message = "Moving To Target Combat NavEX - " ..math.floor(self.enemyObj:GetDistance()).. " (yd) "..self.enemyObj:GetUnitName().. "";
					
			if (IsMoving()) or (IsInCombat()) then
				self.autoBlacklistTimer = GetTimeEX() + 15000;
				self.autoBlacklistTimerSet = false;
			end
			
			if IsEating() or IsDrinking() or IsLooting() or (PlayerHasTarget() and IsMoving()) then
				self.autoBlacklistTimer = GetTimeEX() + 15000;
			end
					
			if IsMoving() then
				self.autoBlacklistTimer = GetTimeEX() + 15000;
			end

			if (not IsInCombat()) and (not IsMoving()) and not IsDrinking()
			and not IsEating() and not IsLooting() and not IsCasting()
			and not IsChanneling() and (self.autoBlacklistTimerSet)
			and (GetTimeEX() > self.autoBlacklistTimer) then
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
		script_grind:setWaitTimer(100);
	--return true;
	return false;
	end

-- return 4 Do nothing, return : combat script return 4
	if (self.combatError == 4) then
		return;
	end
			
-- return 5 Target player : pause for 5 seconds, combat script should add target to blacklist
	if (self.combatError == 5) then
		
		-- reset target
		ClearTarget();
		self.message = "Targeted a player pet pausing 3s...";
		self.waitTimer = GetTimeEX()+3000;
	return;
	end
			
-- return 6 Stop bot, request from a combat script
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
			script_grind.waitTimer = GetTimeEX() + 1500;
		return true;
		end

	-- try unstuck script
		if GetTimeEX() > self.unstucktimer then
			if (not script_unstuck:pathClearAuto(2)) then
				script_unstuck:unstuck();
				self.unstuckTimer = GetTimeEX() + 750;
			return true;
			end
		end
	end





-- END OF COMBAT PHASE


-- Pre checks before navigating
	if IsLooting() or IsCasting() or IsChanneling() or IsDrinking() or IsEating() or IsInCombat() or script_grind.enemyObj ~= nil then
		return;
	end

-- Mount before we navigate through the path, error check to get around indoors
	if self.hasAMount and (script_grind.useMount) and (not IsMounted()) then
		if (script_druidEX:removeCatForm()) or (script_druidEX:removeBearForm())
		or (script_druidEX:removeTravelForm()) or (script_druidEX:removeMoonkinForm()) then
			return;
		end
	end

-- Mount up
	if self.hasAMount and (not self.hotspotReached or script_vendor:getStatus() >= 1) and (not IsInCombat())
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
	and (not IsMounted()) and (not IsIndoors()) and (not HasForm()) and (not self.useMount)
	and (GetTimeEX() > script_grindEX.tryTravelFormTimer) then
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
			if not HasForm() and (HasSpell("Ghost Wolf")) then
				if (script_shamanEX2:ghostWolf()) then
					script_grind:setWaitTimer(4000);
					script_grindEX.tryTravelFormTimer = GetTimeEX() + 15000;
				end
			end
		end
	end




-- PATHING AND NAVIGATION




-- Auto path: keep us inside the distance to the current hotspot, if mounted keep running even if in combat
	if (script_vendor:getStatus() == 0) and ((not IsInCombat() or IsMounted())
	and (self.autoPath)
	and (script_nav:getDistanceToHotspot() > self.distToHotSpot or self.hotSpotTimer > GetTimeEX() or not self.hotspotReached))
	and (not IsLooting())
	
	then

		if not (self.hotSpotTimer > GetTimeEX()) then
			self.hotSpotTimer = GetTimeEX() + 20000;
		end

	--Mount up
		if self.hasAMount and (not self.hotspotReached or script_vendor:getStatus() >= 1) and (not IsInCombat())
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
		if script_vendor.status > 0 and (not IsMounted()) and (not self.useMount) and (not HasSpell("Travel Form")) and (HasSpell("Cat Form"))
		and (not localObj:HasBuff("Cat Form")) and (not localObj:IsDead())
		and (GetLocalPlayer():GetHealthPercentage() >= 95) then
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
			
	-- Loot if there is anything lootable and we are not in combat and if our bags aren't full
		if (not self.skipLooting and not AreBagsFull() and not self.bagsFull) then 
			if script_nav:getLootTarget(self.findLootDistance) ~= nil then
				script_grindFindLootTarget:findLootTarget();
			end
			if script_grind.lootObj == nil and HasSpell("Skinning") and script_grind.skinning and HasItem("Skinning Knife") then
				script_grind.lootObj = script_grind:getSkinTarget(script_grind.findLootDistance);		
			end
		end
	
	-- return if we are busy
		if (IsLooting()) or (IsCasting()) or (IsChanneling()) or IsEating() or IsDrinking() then
			return;
		end
	
	-- for some reason the bot is refusing to stop and rest when moving to hotspot (eat/drink)
		if self.autoPath and (not self.hotspotReached) and (not IsInCombat())
		and (script_vendor.status == 0) and not IsEating() and not IsDrinking()
		and not script_grind:shouldWeRest() and not IsCasting() and not IsChanneling()
				
		then
	
			script_moveToHotspot:moveToHotspot(localObj);
			script_grind.message = "Moving to hotspot : "..script_nav.currentHotSpotName.." .. "..math.floor(script_nav:getDistanceToHotspot()).." (yds)";
			--return true;
			if not IsPathLoaded(5) and script_nav.numSavedLocation >= 3 then
				Move(script_nav.currentHotSpotX, script_nav.currentHotSpotY, script_nav.currentHotSpotZ);
				script_grind.message = "Cannot find path to hotspot : "..script_nav.currentHotSpotName.." .. "..math.floor(script_nav:getDistanceToHotspot()).." (yds)";
			end
		end
	end
	
-- Use auto pathing or walk paths

	-- this is our navigation if we can't complete conditions set above

-- Pre checks before navigating
	if IsLooting() or IsCasting() or IsChanneling() or IsDrinking() or IsEating() or IsInCombat() or script_grind.enemyObj ~= nil then
		return;
	end

	-- check to see if we need to move back to hotspot area...
	if script_nav:getDistanceToHotspot() > self.distToHotSpot then
		self.hotspotReached = false;
	end

	if script_nav:getDistanceToHotspot() < self.distToHotSpot and not self.hotspotReached then
		self.hotspotReached = true;
	end

-- make sure we have don't have an enemy before moving... probably what caused nav crashes over the years of ogasai.....
		-- doubled up on move to target in combat and navigate....
	if self.enemyObj == nil then
	

		-- Use auto pathing navigation or walk paths
		if (self.autoPath) then

			-- check to see if we need to move back to hotspot area...
			if script_nav:getDistanceToHotspot() > self.distToHotSpot then
				self.hotspotReached = false;
			end

			if script_nav:getDistanceToHotspot() < self.distToHotSpot and not self.hotspotReached then
				self.hotspotReached = true;
			end
			

			-- this becomes our navigation once we have enough saved locations. the bot will move from location to location
			-- checking for targets in the area, and make a new location. if no acceptable targets are found then
			-- we navigate through the path nodes until we find a good target

			-- if we find a target we drop navigation and kill the target and make a new auto path node
			-- if no targets found, move to node 1, then 2, etc, until new node can be made

			--if we have more than 2 saved locations and cannot find a target or loot then navigate
			-- this will also double up as moveToHotspot function
			if script_nav.numSavedLocation >= 3 and not script_grindEX:isThereAnyValidEnemyNearby() and self.hotspotReached and not IsInCombat()
				and not script_grind:shouldWeRest()
				and script_vendor.status == 0
				and (script_grind.lootObj == nil or self.skipLooting or self.bagsFull or AreBagsFull() or script_hunter.bagsFull) then
					
				-- reset blacklist/target timer when moving back to hotspot
				if script_grind.enemyObj == nil and not IsInCombat() then
					self.newTargetTime = GetTimeEX();
				end

				local var = script_nav.currentGoToLocation + 1;
				self.message = "Moving to auto path node: "..var;

				script_nav:moveToSavedLocation(localObj, self.minLevel, self.maxLevel, self.staticHotSpot)
				


			return true;
			end

		-- we are not using auto path and only using walk paths
		else

			-- Check: Load/Refresh the walk path
			if (self.pathName ~= self.pathLoaded) then
				if (not LoadPath(self.pathName, 0)) then self.message = "No walk path has been loaded...";
					return;
				end

			self.pathLoaded = self.pathName;
			end

			script_nav:navigate(GetLocalPlayer());
			--return;
		end
	end
end


--	 RUN REST SCRIPT FUNCTION
function script_grind:runRest()


		local localObj = GetLocalPlayer();
		local localHealth = localObj:GetHealthPercentage();
		local localMana = localObj:GetManaPercentage();


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

 if (script_grind.lootObj == nil or AreBagsFull() or self.skipLooting or self.bagsFull) or not script_grindEX:isLootSafeToLoot() then
	if(RunRestScript()) then

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
				return true;
			end
		end

		-- Stop moving
		if not IsInCombat() and (IsMoving()) and (not localObj:IsMovementDisabed()) then
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
		if (IsEating() and localHealth >= 95 and IsDrinking() and localMana >= 95 and not IsStanding()) 
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
end
self.needRest = false;
return false;
end


-- END OF Grinder

-- GRINDER FUNCTIONS


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
			if (GetNumPartyMembers() >= 1) and (currentObj:GetDistance() < 50) and (script_grindParty.forceTarget) then

				-- run another object manager script to get a different target 
                	if (script_grind:isTargetingGroup(currentObj)) then 
					
					-- return target
                			return currentObj;
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

function script_grind:isTargetingPet(i) 
	local pet = GetPet();

	-- if we have a pet
	if (pet ~= nil and pet ~= 0 and not pet:IsDead()) and i ~= nil then

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
	local y, typeObj = GetFirstObject();

	-- seems to want to target every target around that is attacking party members
	-- need to find a way to dumb this down
	-- this works for tanking on druid and warrior though pretty well
	-- maybe if i'm not a warrior with defensive stance active or a druid without bear form active then
	-- only target them if they are closer than my current target?
	-- the intent was to keep the bot targeting mobs that are tapped by or targeting other players in the group without choosing a new target

	-- get partymembers
	for i = 1, GetNumPartyMembers() do
		local partyMember = GetPartyMember(i);
		
		-- if we have party members and conditions valid (limited object manager by range)
		if (partyMember ~= nil and partyMember ~= 0 and not partyMember:IsDead() and partyMember:GetDistance() < 50) then

		

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
				if y:GetUnitsTarget() ~= nil and y:GetUnitsTarget() ~= 0 and partyMember ~= nil then

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

function script_grind:getSkinTarget(lootRadius)

	local checkSkinTarget = 0;

		local function CanSkinTarget()

			if checkSkinTarget ~= 0 and checkSkinTarget ~= nil then
				-- Get the target's level from object manager below
				local targetLevel = checkSkinTarget:GetLevel();
		
				-- Calculate required skinning skill
				local requiredSkill
				if targetLevel <= 10 then
				    requiredSkill = 1
				else
				    requiredSkill = targetLevel * 5
				end
    
				-- Get player's skinning skill
				local skinningSkill = 0
				for i = 1, GetNumSkillLines() do
				    local skillName, _, _, skillRank = GetSkillLineInfo(i)
				    if skillName == "Skinning" then
				        skinningSkill = skillRank
				        break
				    end
				end
    
				-- Check if target is skinnable
				if skinningSkill >= requiredSkill then
					return true;
				end
			return false;
			end
		end

	local targetObj, targetType = GetFirstObject();
	local bestDist = lootRadius;
	local bestTarget = nil;
	while targetObj ~= 0 do
		if (targetType == 3) then -- Unit type NPC
			if(targetObj:IsDead()) and not script_grind:isTargetLootBlacklisted(targetObj:GetGUID()) then
					-- if is skinnable and is tapped by me (I killed it)
				if (targetObj:IsSkinnable() and targetObj:IsTappedByMe() and not targetObj:IsLootable()) then
						checkSkinTarget = targetObj;
					local dist = targetObj:GetDistance();
					if CanSkinTarget() and (dist < lootRadius and bestDist > dist) then
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
				for y = 1,GetContainerNumSlots(i - 1) do 
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
	elseif HasSpell("Auto Shot") then 
		local inventoryFull = true;

		-- skip slot 5, it's a quiver
		for i = 1, 4 do 
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
		script_grindFindLootTarget:findLootTarget();
		if (not IsInCombat()) and (self.lootObj ~= nil) then
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
	local isLoot = (not IsInCombat()) and not (self.lootObj == nil);
	if (isLoot and not AreBagsFull() and not self.bagsFull) and (not IsEating() or not IsDrinking()) and (not self.needRest) and not self.skipLooting then
		script_grindDoLoot:doLoot(localObj);
		
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

			if (self.lootObj ~= nil) and self.lootObj ~= 0 and (not IsLooting()) and not self.skipLooting and not AreBagsFull() and not self.bagsFull then		
				if script_grindDoLoot:doLoot(localObj) then
					self.message = "Moving to skinning target - " ..math.floor(script_grind.lootObj:GetDistance()) .. " (yd)";
					script_grind.lootCheckTime = 10000;
					script_grind.lootCheck['timer'] = 0;
				end
			return true;		
			end
		end
	end
	return false;
end

-- a lot of times the bot will be stuck in combat phase, even momentarily, after a target has died and it causes the bot to immedietly swtich to a new target. this helps circumvent that problem by checking to make sure nothing is targeting the bot, but when mobs flee they drop their target...
function script_grind:isAnyTargetTargetingMe()

	-- Return a target targeting us
	local i, targetType = GetFirstObject();
	while i ~= 0 do
		if (targetType == 3) then

			-- limit the check by distance... anything over 40 yards must move closer...
			if i:GetDistance() <= 50 then

				-- some servers return 0 when unit target has no target so AND ~= nil
				if (i:GetUnitsTarget() ~= 0 and i:GetUnitsTarget() ~= nil) then

					-- if target is targeting my guid
					if script_grind:isTargetingMe(i) then 
						return true;
					end
				end
			end
		end
	i, targetType = GetNextObject(i);
	end
return false;
end