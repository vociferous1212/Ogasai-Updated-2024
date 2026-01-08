includeFiles = {

	-- TEMPORARY 
	grinderIncluded = include("scripts\\script_grind.lua"),
	combatHelperIncluded = include("scripts\\script_combatHelper.lua"),
	tempSetRestVarsIncluded = include("scripts\\grind2\\tempSetRestVars.lua"),
	tempCombatScriptMessage = include("scripts\\grind2\\tempCombatMessage.lua"),




	-- main folder
	grinder2RunRestState = include("scripts\\grind2\\grind2RunRestState.lua"),
	grinder2Setup = include("scripts\\grind2\\grind2Setup.lua"),
	grinder2RunCombatState = include("scripts\\grind2\\grind2RunCombatState.lua"),

	-- unstuck folder
	grinder2Unstuck = include("scripts\\grind2\\grind2Unstuck\\grind2Unstuck.lua"),
	grinder2CheckUnstuck = include("scripts\\grind2\\grind2Unstuck\\grind2CheckUnstuck.lua"),

	-- loot folder
	grinder2CanSkinTarget = include("scripts\\grind2\\grind2Loot\\grind2CanSkinTarget.lua"),
	grinder2DoLoot = include("scripts\\grind2\\grind2Loot\\grind2DoLoot.lua"),
	grinder2FindLoot = include("scripts\\grind2\\grind2Loot\\grind2FindLoot.lua"),
	grinder2FindSkinTarget = include("scripts\\grind2\\grind2Loot\\grind2FindSkinTarget.lua"),

	-- targets folder
	grinder2AssignATarget = include("scripts\\grind2\\grind2Targets\\grind2AssignATarget.lua"),
	grinder2Blacklisting = include("scripts\\grind2\\grind2Targets\\grind2Blacklisting.lua"),
	grinder2IsTargetingGroup = include("scripts\\grind2\\grind2Targets\\grind2IsTargetingGroup.lua"),
	grinder2IsTargetingMe = include("scripts\\grind2\\grind2Targets\\grind2IsTargetingMe.lua"),
	grinder2IsTargetingPet = include("scripts\\grind2\\grind2Targets\\grind2IsTargetingPet.lua"),
	grinder2IsTargetValid = include("scripts\\grind2\\grind2Targets\\grind2IsTargetValid.lua"),
	grinder2SafePull = include("scripts\\grind2\\grind2Targets\\grind2SafePull.lua"),

	-- helper folder
	grinder2Bandage =	include("scripts\\grind2\\grind2Helper\\grind2Bandage.lua"),
	grinder2Food =		include("scripts\\grind2\\grind2Helper\\grind2Food.lua"),
	grinder2Mounts =	include("scripts\\grind2\\grind2Helper\\grind2Mounts.lua"),
	grinder2OpenGates = include("scripts\\grind2\\grind2Helper\\grind2OpenGates.lua"),
	grinder2Potions =	include("scripts\\grind2\\grind2Helper\\grind2Potions.lua"),
	grinder2Water =		include("scripts\\grind2\\grind2Helper\\grind2Water.lua"),

	-- draw on screen folder drawOnScreen
	grinder2DrawAggroCircles =	include("scripts\\grind2\\grind2DrawOnScreen\\grind2DrawAggroCircles.lua"),
	grinder2SelectDrawTargets = include("scripts\\grind2\\grind2DrawOnScreen\\grind2SelectDrawTargets.lua"),
	grinder2DrawUnitData =		include("scripts\\grind2\\grind2DrawOnScreen\\grind2DrawUnitData.lua"),
	grinder2DrawScreenData =	include("scripts\\grind2\\grind2DrawOnScreen\\grind2DrawScreenData.lua"),
	grinder2Draw = include("scripts\\grind2\\grind2DrawOnScreen\\grind2Draw.lua"),
	grinder2Messages = include("scripts\\grind2\\grind2DrawOnScreen\\grind2Messages.lua"),


	-- menu folder
	grinder2Menu =				include("scripts\\grind2\\grind2Menu\\grind2Menu.lua"),
	grinder2DisplayOptions =	include("scripts\\grind2\\grind2Menu\\grind2DisplayOptions.lua"),
	grinder2ShowCombatMenu =	include("scripts\\grind2\\grind2Menu\\grind2ShowCombatMenu.lua"),
	grinder2TargetMenu =		include("scripts\\grind2\\grind2Menu\\grind2TargetMenu.lua"),
	grinder2NavMenu =			include("scripts\\grind2\\grind2Menu\\grind2NavMenu.lua"),
	grinder2AdjustTimersMenu = include("scripts\\grind2\\grind2Menu\\grind2AdjustTimersMenu.lua"),

	-- nav folder
	grinder2Nav =				include("scripts\\grind2\\grind2Nav\\grind2Nav.lua"),
	grinder2MoveToTarget =		include("scripts\\grind2\\grind2Nav\\grind2MoveToTarget.lua"),

	-- talents folder
	grinder2SelectTalents =				include("scripts\\grind2\\grind2Talents\\grind2SelectTalents.lua"),
	grinder2CheckSpentTalentPoints =	include("scripts\\grind2\\grind2Talents\\grind2CheckSpentTalentPoints.lua")

}

function includeFiles:run()

end