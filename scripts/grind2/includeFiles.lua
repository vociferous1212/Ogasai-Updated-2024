includeFiles = {


	-- TEMPORARY 
	grinderIncluded = include("scripts\\script_grind.lua"),
	combatHelperIncluded = include("scripts\\script_combatHelper.lua"),
	tempSetRestVarsIncluded = include("scripts\\grind2\\tempSetRestVars.lua"),



	grinder2Draw = include("scripts\\grind2\\grind2Draw.lua"),
	grinder2Rest = include("scripts\\grind2\\grind2Rest.lua"),


	-- combat scripts can be moved to menu file
	druidMenu = include("scripts\\combat\\druid\\script_druidEX.lua"),
	mageMenu = include("scripts\\combat\\mage\\script_mage.lua"),


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

	-- menu folder
	grinder2Menu =				include("scripts\\grind2\\grind2Menu\\grind2Menu.lua"),
	grinder2DisplayOptions =	include("scripts\\grind2\\grind2Menu\\grind2DisplayOptions.lua"),
	grinder2ShowCombatMenu =	include("scripts\\grind2\\grind2Menu\\grind2ShowCombatMenu.lua"),
	grinder2TargetMenu =		include("scripts\\grind2\\grind2Menu\\grind2TargetMenu.lua"),
	grinder2NavMenu =			include("scripts\\grind2\\grind2Menu\\grind2NavMenu.lua"),

	-- nav folder
	grinder2Nav =				include("scripts\\grind2\\grind2Nav\\grind2Nav.lua"),
	grinder2MoveToTarget =		include("scripts\\grind2\\grind2Nav\\grind2MoveToTarget.lua"),

	-- talents folder
	grinder2SelectTalents =				include("scripts\\grind2\\grind2Talents\\grind2SelectTalents.lua"),
	grinder2CheckSpentTalentPoints =	include("scripts\\grind2\\grind2Talents\\grind2CheckSpentTalentPoints.lua")

}

function includeFiles:run()

end