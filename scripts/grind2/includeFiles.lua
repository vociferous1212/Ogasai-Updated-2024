includeFiles = {

	-- TEMPORARY 
	grinderIncluded = include("scripts\\script_grind.lua"),
	combatHelperIncluded = include("scripts\\script_combatHelper.lua"),
	tempSetRestVarsIncluded = include("scripts\\grind2\\tempSetRestVars.lua"),
	tempCombatScriptMessage = include("scripts\\grind2\\tempCombatMessage.lua"),

	grinder2PreChecks = include("scripts\\grind2\\grind2PreChecks.lua"),
	grinder2PreChecks2 = include("scripts\\grind2\\grind2PreChecks2.lua"),
	grinder2PreChecks3 = include("scripts\\grind2\\grind2PreChecks3.lua"),
	grinder2RunRestState = include("scripts\\grind2\\grind2RunRestState.lua"),
	grinder2Setup = include("scripts\\grind2\\grind2Setup.lua"),
	grinder2RunCombatState = include("scripts\\grind2\\grind2RunCombatState.lua"),
	grinder2PreCombatChecks = include("scripts\\grind2\\grind2PreCombatChecks.lua"),

	grinder2Unstuck = include("scripts\\grind2\\grind2Unstuck\\grind2Unstuck.lua"),
	grinder2CheckUnstuck = include("scripts\\grind2\\grind2Unstuck\\grind2CheckUnstuck.lua"),

	grinder2CanSkinTarget = include("scripts\\grind2\\grind2Loot\\grind2CanSkinTarget.lua"),
	grinder2DoLoot = include("scripts\\grind2\\grind2Loot\\grind2DoLoot.lua"),
	grinder2FindLoot = include("scripts\\grind2\\grind2Loot\\grind2FindLoot.lua"),
	grinder2FindSkinTarget = include("scripts\\grind2\\grind2Loot\\grind2FindSkinTarget.lua"),

	grinderIncludeFiles2 = include("scripts\\grind2\\includeFiles2.lua")
}