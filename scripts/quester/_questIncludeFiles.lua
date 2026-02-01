_questIncludeFiles = {
	
	isSetup = false,


	grindIncluded = include("scripts\\script_grind.lua"),
	grindMenu = include("scripts\\menu\\script_grindMenu.lua"),
	questerMenuIncluded = include("scripts\\quester\\_questMenu.lua"),
	questerMenuEXIncluded = include("scripts\\quester\\_questMenuEX.lua"),
	questerMenuEX2Included = include("scripts\\quester\\_questMenuEX2.lua"),

	questerDBIncluded = include("scripts\\db\\questDB\\_questDB.lua"),
	questerDBTargetsIncluded = include("scripts\\db\\questDB\\_questDBTargets.lua"),
	questerDBReturnQuestIncluded = include("scripts\\db\\questDB\\_questDBReturnQuest.lua"),
	questerDBGatherIncluded = include("scripts\\db\\questDB\\_questDBGather.lua"),
	questDBGatherGetObjectIncluded = include("scripts\\db\\questDB\\_questDBGatherGetObject.lua"),
	questDBGatherGetInventoryIncluded = include("scripts\\db\\questDB\\_questDBGatherGetInventory.lua"),
	questDBHandleDBIncluded = include("scripts\\db\\questDB\\_questDBHandleDB.lua"),


	questerHandleVendorIncluded = include("scripts\\quester\\_questHandleVendor.lua"),
	questerEXIncluded = include("scripts\\quester\\_questEX.lua"),
	questerEX2Included = include("scripts\\quester\\_questEX2.lua"),
	questerCheckQuestCompletionIncluded = include("scripts\\quester\\_questCheckQuestCompletion.lua"),
	questerDoCombatIncluded = include("scripts\\quester\\_questDoCombat.lua"),
	questerRunRestIncluded = include("scripts\\quester\\_questRunRest.lua"),
	questerEdgeCaseQuestIncluded = include("scripts\\quester\\_questEdgeCaseQuest.lua"),
	questerEdgeCaseQuest2Included = include("scripts\\quester\\_questEdgeCaseQuest2.lua"),
	questerWindowIncluded = include("scripts\\quester\\_questWindow.lua"),
	setCurrentQuestIncluded = include("scripts\\quester\\_questSetQuest.lua"),

	questerDoOtherQuestTypesLoaded = include("scripts\\quester\\_questDoOtherQuestTypes.lua"),

	questGetTargetAttackingUsLoaded = include("scripts\\quester\\_questGetTargetAttackingUs.lua"), 
	questDoOtherQuestTypes2Loaded = include("scripts\\quester\\_questDoOtherQuestTypes2.lua"),
	questDoOtherQuestTypes2Loaded = include("scripts\\quester\\_questDoOtherQuestTypes3.lua"),

	questRessAtGYLoaded = include("scripts\\quester\\_questRessAtGY.lua"),
	questEquipItemsLoaded = include("scripts\\quester\\_questEquipItems.lua"),
	questSetupLoaded = include("scripts\\quester\\_questSetup.lua"),
	questSortQuest = include("scripts\\quester\\_questSortCurrentQuest.lua"),
	questGetQuestGiver = include("scripts\\quester\\_questGetQuestGiver.lua"),
	questRetrieveQuest = include("scripts\\quester\\_questRetrieveQuest.lua"),
	questMoveToGrindSpot = include("scripts\\quester\\_questMoveToGrindSpot.lua"),
	questAcceptQuest = include("scripts\\quester\\_questAcceptQuest.lua"),

_questAcceptQuest.lua
}

function _questIncludeFiles:setup()

self.isSetup = true;

end