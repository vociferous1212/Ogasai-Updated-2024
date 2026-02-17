grind2ShowCombatMenu = {



}

function grind2ShowCombatMenu:run()

	-- show combat menu
	local _ , class = UnitClass("player");

	if (class == 'MAGE') then			script_mageEX:menu();

	elseif (class == 'HUNTER') then		script_hunterMenu:menu();

	elseif (class == 'ROGUE') then		script_rogueEX:menu();

	elseif (class == 'DRUID') then		script_druidEX:menu();

	elseif (class == 'PRIEST') then		script_priestMenu:menu();

	elseif (class == 'WARRIOR') then	script_warriorEX:menu();

	elseif (class == 'PALADIN') then	script_paladinMenu:menu();

	elseif (class == 'SHAMAN') then		script_shamanMenu:menu();

	elseif (class == 'WARLOCK') then	script_warlockEX:menu();

		--wasClicked, self.useOtherWarlockScript = Checkbox("Use Warlock 2", self.useOtherWarlockScript);
		--if (not self.useOtherWarlockScript) then	script_warlockEX:menu();
		--elseif (self.useOtherWarlockScript) then	script_warlock2:menu();
		--end
	end

	if CollapsingHeader("Grinder Combat Menu") then
		
		Text("Combat script range to attack targets");
		grind2.combatScriptRange = SliderInt("Combat Range", 1, 40, grind2.combatScriptRange);

		Separator();
		
		Text("Mana to rest and drink");
		grind2.restMana = SliderInt("Mana percent to rest", 1, 100, grind2.restMana);

		Separator()

		Text("Health to rest and eat");
		grind2.restHealth = SliderInt("Health percent to rest", 1, 100, grind2.restHealth);

		Separator();

-- avoid adds when moving through nav
		Text("Avoid target while moving through nav - not in combat");
		wasClicked, grind2.avoidTargets = Checkbox("Avoid Adds", grind2.avoidTargets);

		SameLine();

		Text(" | ");

		Separator();

		Text("Flee Combat - run to previously killed targets until out of combat")

		Text("Hardcore servers...")

		wasClicked, grind2FleeCombat.fleeCombat = Checkbox("Flee Combat  ", grind2FleeCombat.fleeCombat);

		if grind2FleeCombat.fleeCombat then

			SameLine();

			Text(" | ");

			SameLine();

			wasClicked, grind2FleeCombat.fleeWithAdds = Checkbox("Flee combat 2 or more targets", grind2FleeCombat.fleeWithAdds);
		end
		if grind2FleeCombat.fleeCombat then
			Text("Health"); SameLine(); grind2FleeCombat.healthToFlee = SliderInt("Health To Flee", 10, 60, grind2FleeCombat.healthToFlee)
			Text("Mana  "); SameLine(); grind2FleeCombat.manaToFlee = SliderInt("Mana To Flee", 0, 40, grind2FleeCombat.manaToFlee);
			
		end

		Text("Saved locations in current path = "..grind2SaveCoordinates.numberOfLocations);

		Text("")
		Separator();
	end


	SameLine();

	Text("		| "..tempCombatMessage:getClassScriptMessage())

end