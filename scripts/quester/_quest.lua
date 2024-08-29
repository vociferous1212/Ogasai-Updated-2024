--GetQuestItemLink - Returns an itemLink for a quest reward item.
--itemLink = GetQuestItemLink("type", index);

--GetQuestLogItemLink
--itemLink = GetQuestLogItemLink("type", index);

--AcceptQuest - Accept the specified quest.
--AcceptQuest()

--CompleteQuest - Complete the specified quest.
--CompleteQuest();

--GetNumQuestChoices - Returns the number of rewards for a completed quest.
--num = GetNumQuestChoices();

--GetNumQuestItems - Returns the number of items nessecary to complete a particular quest.
--GetNumQuestItems();

--GetNumQuestLeaderBoards([questIndex])   - Returns the number of available quest objectives.
--local numQuestLogLeaderBoards = GetNumQuestLeaderBoards([questID])

--GetNumQuestLogChoices - Returns the number of options someone has when getting a quest item.
--GetNumQuestLogChoices();

--GetNumQuestLogEntries - Returns the number of entries in the quest log.
--numEntries, numQuests = GetNumQuestLogEntries();

--GetNumQuestLogRewards - Returns the count of the rewards for a particular quest.
--GetNumQuestLogRewards();

--GetProgressText()
--GetProgressText();

--GetQuestGreenRange()   - Return for how many levels below you quests and mobs remain "green" (i.e. yield xp)
--

--GetQuestIndexForTimer - ?.
--

--GetQuestItemInfo - Returns basic information about the quest items.
--

--GetQuestItemLink - Returns an itemLink for a quest reward item.
--

--GetQuestLogChoiceInfo - Returns a bunch of data about a quest reward choice from the quest log.
--GetQuestLogItemLink - ?.
--GetQuestLogLeaderBoard(ldrIndex[, questIndex])   - Gets information about the objectives for a quest.
--GetQuestLogQuestText - Returns the description and objectives required for the specified quest.
--GetQuestLogRewardInfo - Returns a pile of reward item info.

--GetQuestLogTitle - Returns the string which is associated with the specific QuestLog Title in the game.
--GetTitleText - Retrieves the title of the quest while talking to the NPC about it.
--IsQuestCompletable - Returns true if a quest is possible to complete.
--IsUnitOnQuest(questIndex, "unit")   - Determine if the specified unit is on the given quest.

_quest = {

	message = "Quester",
	pause = true,
	isSetup = false,
	currentDebugStatus = "Nothing",
	waitTimer = 0,
	tickRate = 500,

	aggroLoaded = include("scripts\\script_aggro.lua"),
	expExtra = include("scripts\\script_expChecker.lua"),
	unstuckLoaded = include("scripts\\script_unstuck.lua"),
	paranoiaLoaded = include("scripts\\paranoia\\script_paranoia.lua"),
	radarLoaded = include("scripts\\script_radar.lua"),
	debuffCheck = include("scripts\\script_checkDebuffs.lua"),
	drawStatusScript = include("scripts\\script_drawStatus.lua"),
	drawStatusEXScript = include("scripts\\script_drawStatusEX.lua"),
	omLoaded = include("scripts\\script_om.lua"),
	navFunctionsLoaded 	= include("scripts\\nav\\script_nav.lua"),
	runnerLoaded = include("scripts\\script_runner.lua"),
	includeNavEX 		= include("scripts\\nav\\script_navEX.lua"),
	includeNavEXCombat 	= include("scripts\\nav\\script_navEXCombat.lua"),
	hotspotMoveLoaded 	= include("scripts\\nav\\script_moveToHotspot.lua"),
	firstAidLoaded 		= include("scripts\\professions\\script_firstAid.lua"),
	fpDBLoaded 		= include("scripts\\db\\fpDB.lua"),
	goToFPLoaded 		= include("scripts\\getTrainerSpells\\script_goToFP.lua"),

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

	questerMenuIncluded = include("scripts\\quester\\_questMenu.lua"),
	questerGetItemToGatherIncluded = include("scripts\\quester\\_questGetItemToGather.lua"),
	questerHandleVendorIncluded = include("scripts\\quester\\_questHandleVendor.lua"),
	questerDBIncluded = include("scripts\\db\\_questDB.lua"),

}

-- for some reason the .dll requires it to be named draw() without an error...
function _quest:draw() end

-- draw the window
function _quest:window()
	EndWindow();
	if(NewWindow("Quester", 320, 300)) then
		_questMenu:menu();
	end
	-- color
	local r, g, b = 0, 0, 0;
	-- position
	local y, x, width = 120, 25, 370;
	local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition());
	if (onScreen) then
		y, x = tY-25, tX+75;
	end
		DrawText("Quester", x, y-4, r+255, g+255, b+0) y = y + 15;
		DrawText("Quester Status:", x, y, r+255, g+255, b+0);
		DrawText(self.message or "error", x + 115, y, 255, 255, 255);
		DrawText("_______________", x, y+3, r+255, g+255, b);
		y = y + 20; DrawText('Combat Script Status:', x, y, r+255, g+255, b+0); y = y + 15;
		if (script_grind.showClassOptions) then RunCombatDraw(); end
		DrawText("_____________________", x, y-12, r+255, g+255, b);
		DrawText('Vendor - ' .. script_vendorMenu:getInfo(), x, y, r+255, g+255, b+0); y = y + 15;
		DrawText('Vendor Status: ', x, y, r+255, g+255, b+0);
		DrawText(script_vendor:getMessage(), x+105, y, 0, 255, 255);
end

function _quest:setTimer(miliSeconds)
	self.waitTimer = GetTimeEX() + miliSeconds;
end

--run setup
function _quest:setup()

	script_vendor:setup();
	vendorDB:setup();
	vendorDB:loadDBVendors();

	self.waitTimer = GetTimeEX();

self.isSetup = true;
end

-- run the quester
function _quest:run()

	-- draw the window
	_quest:window();

	if (not IsUsingNavmesh()) then UseNavmesh(true);
		return true;
	end
	if (GetLoadNavmeshProgress() ~= 1) then
		self.message = "Loading Nav Mesh! Please Wait!";
		self.currentDebugStatus = "Loading Nav";
		return;
	end

	-- return if we pause bot
	if (self.pause) then
		return;
	end

	if (self.waitTimer + self.tickRate > GetTimeEX()) then
		return;
	end

	-- run setup function once
	if (not self.isSetup) then
		_quest:setup();
		self.currentDebugStatus = "Running Setup";
	end

	-- handle vendor stuff through vendor scripts
	if (not IsInCombat()) then
		local vendorStatus = script_vendor:getStatus();
		if (vendorStatus > 1) then
			_questHandleVendor:vendor();
			return;
		end
	end






	-- do something
	if (GetTarget() ~= nil and GetTarget() ~= 0) and (not GetTarget():IsDead()) and (GetTarget():CanAttack()) then
		RunCombatScript(GetTarget():GetGUID());
		self.currentDebugStatus = "Running combat script";
		if (GetTarget() ~= 0 and GetTarget() ~= nil and GetTarget():GetDistance() > script_grind.combatScriptRange) then
			local x, y, z = GetTarget():GetPosition();
			script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);
			self.currentDebugStatus = "Moving to target";
			return true;
		end
	return true;
	end	

end

function _quest:getQuestFromDB()
end
function _quest:addQuestToDB()
end
function _quest:runGather()
end
function _quest:getQuestArea()
end
function _quest:getQuestTarget()
end
function _quest:checkCurrentQuestStatus()
end
function _quest:checkInventoryItems()
end