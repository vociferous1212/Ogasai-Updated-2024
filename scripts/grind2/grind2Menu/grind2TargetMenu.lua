grind2TargetMenu = {

}

function grind2TargetMenu:run()

	if CollapsingHeader("Target Menu") then

		wasClicked, grind2SafePull.skipSafePull = Checkbox("Pull Targets With Adds  (Skip Safe Pulls)", grind2SafePull.skipSafePull);

		Separator();

		Text("Distance find a new target to attack")
		grind2.findTargetDistance = SliderInt("Find target distance", 1, 300, grind2.findTargetDistance);

		Separator();

		Text("Minimum / Maximum target level to attack");
		Separator();
		Text("Min"); SameLine(); grind2IsTargetValid.minLevel = SliderInt("Min level", 1, 62, grind2IsTargetValid.minLevel);
		Text("Max"); SameLine(); grind2IsTargetValid.maxLevel = SliderInt("Max level", 1, 62, grind2IsTargetValid.maxLevel);

		Separator();

		if CollapsingHeader("| + | Blacklist Options | + |") then

			if Button("Add Target To Blacklist") then
				if PlayerHasTarget() then
					grind2Blacklisting:addTargetToBlacklist(GetLocalPlayer():GetUnitsTarget():GetGUID())
					ClearTarget();
				end
				if grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil then
					grind2Blacklisting:addTargetToBlacklist(grind2.enemyTarget:GetGUID())
					ClearTarget();
				end
			end

			Separator();

				Text("Time to blacklist target - (seconds)");
			grind2RunCombatState.timeToBlacklistTarget = SliderInt("Blacklist Time", 0, 30, grind2RunCombatState.timeToBlacklistTarget);
		end

		if CollapsingHeader("| + | Skip Creature By Type | + |") then

			Text("			SKIP UNIT BY TYPE");
			Separator();
			
			wasClicked, grind2IsTargetValid.skipBeast = Checkbox("Beast   ", grind2IsTargetValid.skipBeast);
			SameLine();
			wasClicked, grind2IsTargetValid.skipHumanoid = Checkbox("Humanoid  ", grind2IsTargetValid.skipHumanoid);
			SameLine();
			wasClicked, grind2IsTargetValid.skipUndead = Checkbox("Undead    ", grind2IsTargetValid.skipUndead);
			SameLine();
			wasClicked, grind2IsTargetValid.skipDemon = Checkbox("Demon ", grind2IsTargetValid.skipDemon);
			Separator();
			wasClicked, grind2IsTargetValid.skipUnknown = Checkbox("Unknown ", grind2IsTargetValid.skipUnknown);
			SameLine();
			wasClicked, grind2IsTargetValid.skipDragonkin = Checkbox("Dragonkin ", grind2IsTargetValid.skipDragonkin);
			SameLine();
			wasClicked, grind2IsTargetValid.skipElemental = Checkbox("Elemental ", grind2IsTargetValid.skipElemental);
			SameLine();
			wasClicked, grind2IsTargetValid.skipGiant = Checkbox("Giant ", grind2IsTargetValid.skipGiant);
			Separator();
			wasClicked, grind2IsTargetValid.skipMechanical = Checkbox("Mechanical ", grind2IsTargetValid.skipMechanical);
			SameLine();
			wasClicked, grind2IsTargetValid.skipAbberation = Checkbox("Abberation ", grind2IsTargetValid.skipAbberation);
			SameLine();
			wasClicked, grind2IsTargetValid.skipElites = Checkbox("Elites ", grind2IsTargetValid.skipElites);

		end
		Text("")
		Separator();
	end
end