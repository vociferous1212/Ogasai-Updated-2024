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

	elseif (class == 'SHAMAN') then		script_shamanEX:menu();

	elseif (class == 'WARLOCK') then	script_warlockEX:menu();

		--wasClicked, self.useOtherWarlockScript = Checkbox("Use Warlock 2", self.useOtherWarlockScript);
		--if (not self.useOtherWarlockScript) then	script_warlockEX:menu();
		--elseif (self.useOtherWarlockScript) then	script_warlock2:menu();
		--end
	end

end