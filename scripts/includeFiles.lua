includeFiles = {

	isSetup = false,
	
	aggroLoaded = include("scripts\\script_aggro.lua"),
	grindPartyOptionsLoaded = include("scripts\\script_grindParty.lua"),
	expExtra = include("scripts\\script_expChecker.lua"),
	unstuckLoaded = include("scripts\\script_unstuck.lua"),
	paranoiaLoaded = include("scripts\\script_paranoia.lua"),
	radarLoaded = include("scripts\\script_radar.lua"),
	debuffCheck = include("scripts\\script_checkDebuffs.lua"),
	drawStatusScript = include("scripts\\script_drawStatus.lua"),
	drawStatusEXScript = include("scripts\\script_drawStatusEX.lua"),
	omLoaded = include("scripts\\script_om.lua"),
	navFunctionsLoaded 	= include("scripts\\nav\\script_nav.lua"),
	includeNavEX 		= include("scripts\\nav\\script_navEX.lua"),
	includeNavEXCombat 	= include("scripts\\nav\\script_navEXCombat.lua"),
	hotspotMoveLoaded 	= include("scripts\\nav\\script_moveToHotspot.lua"),

	helperLoaded = include("scripts\\script_helper.lua"),
	checkAddsLoaded = include("scripts\\script_checkAdds.lua"),
	talentLoaded = include("scripts\\script_talent.lua"),
	includeDrawData = include("scripts\\script_drawData.lua"),
	vendorLoaded = include("scripts\\script_vendor.lua"),
	gatherLoaded = include("scripts\\script_gather.lua"),
	grindExtra = include("scripts\\script_grindEX.lua"),
	extraFunctionsLoaded = include("scripts\\script_extraFunctions.lua"),
	getSpellsLoaded = include("scripts\\getTrainerSpells\\script_getSpells.lua"),
	gatherEXLoaded = include("scripts\\script_gatherEX.lua"),
	deleteItemsLoaded = include("scripts\\script_deleteItems.lua"),
	buffOtherPlayersLoaded = include("scripts\\script_buffOtherPlayers.lua");

	mageMenu = include("scripts\\combat\\script_mageEX.lua"),
	warlockMenu = include("scripts\\combat\\warlock\\script_warlockEX.lua"),
	priestMenu = include("scripts\\combat\\script_priestEX.lua"),
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

}

function includeFiles:setup()

	if not self.isSetup() then
		self.isSetup = true;
		return;
	
	return false;
	end
end