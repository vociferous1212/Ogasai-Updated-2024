_questIncludeFiles = {
	
	isSetup = false,


	grindIncluded = include("scripts\\script_grind.lua"),
	grindMenu = include("scripts\\menu\\script_grindMenu.lua"),
	questerMenuIncluded = include("scripts\\quester\\_questMenu.lua"),



	questerDBIncluded = include("scripts\\db\\_questDB.lua"),
	questerDBTargetsIncluded = include("scripts\\db\\_questDBTargets.lua"),
	questerDBReturnQuestIncluded = include("scripts\\db\\_questDBReturnQuest.lua"),
	questerDBGatherIncluded = include("scripts\\db\\_questDBGather.lua"),


	questerHandleVendorIncluded = include("scripts\\quester\\_questHandleVendor.lua"),
	questerEXIncluded = include("scripts\\quester\\_questEX.lua"),
	questerCheckQuestCompletionIncluded = include("scripts\\quester\\_questCheckQuestCompletion.lua"),
	questerDoCombatIncluded = include("scripts\\quester\\_questDoCombat.lua"),
	questerRunRestIncluded = include("scripts\\quester\\_questRunRest.lua"),
	questerEdgeCaseQuestIncluded = include("scripts\\quester\\_questEdgeCaseQuest.lua"),
	questerWindowIncluded = include("scripts\\quester\\_questWindow.lua"),
	setCurrentQuestIncluded = include("scripts\\quester\\_questSetQuest.lua"),





}

function _questIncludeFiles:setup()

self.isSetup = true;

end