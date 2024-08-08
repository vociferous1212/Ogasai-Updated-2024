script_shamanMenuEX = {

}


-- script character limit - needed to make a new one to add more...
function script_shamanMenuEX:alternateEnhanceMenu()
	local a = script_shaman.useRock; local b = script_shaman.useFlame; local c = script_shaman.useFrost; local d = script_shaman.useWind;
	local e = HasSpell("Rockbiter Weapon"); local f = HasSpell("Flametongue Weapon"); local g = HasSpell("Frostbrand Weapon"); local h = HasSpell("Windfury Weapon");

	Separator();
	-- show checkboxes
	if not (b) and not (c) and not (d) and (e) then
		wasClicked, script_shaman.useRock = Checkbox("Rockbiter", script_shaman.useRock);
		script_shaman.enhanceWeapon = "Rocbiter Weapon";
	end
	if not (a) and not (c) and not (d) and (f) then
			SameLine();
		wasClicked, script_shaman.useFlame = Checkbox("Flametongue", script_shaman.useFlame);
		script_shaman.enhanceWeapon = "Flametongue Weapon";
	end
	if not (a) and not (b) and not (d) and (g) then
		wasClicked, script_shaman.useFrost = Checkbox("Frostbrand", script_shaman.useFrost);
		script_shaman.enhanceWeapon = "Frostbrand Weapon";
	end
	if not (a) and not (b) and not (c) and (h) then
		SameLine();
		wasClicked, script_shaman.useWind = Checkbox("Windfury", script_shaman.useWind);
		script_shaman.enhanceWeapon = "Windfury Weapon";
	end
end

-- show EARTH totem menu
function script_shamanMenuEX:alternateTotemMenuEarth()
	local z = HasItem("Earth Totem");
	local aa = HasSpell("Stoneskin Totem"); local bb = HasSpell("Strength of Earth Totem");
	local cc = HasSpell("Stoneclaw Totem"); local dd = HasSpell("Earthbind Totem");
	local ee = HasSpell("Tremor Totem");
	local a = script_shamanTotems.stoneskinTotem; local b = script_shamanTotems.strengthOfEarthTotem;
	local c = script_shamanTotems.stoneclawTotem; local d = script_shamanTotems.earthbindTotem; local e = script_shamanTotems.tremorTotem;
	
	-- set totems
	if (z) then
		if (a) and (aa) then
			script_shaman.totem = "Stoneskin Totem";
		end
		if (b) and (bb) then
			script_shaman.totem = "Strength of Earth";
		end
		if (c) and (cc) then
			script_shaman.totem = "Stoneclaw Totem";
		end
		if (d) and (dd) then
			script_shaman.totem = "Earthbind Totem";
		end
		if (e) and (ee) then
			script_shaman.totem = "Tremor Totem";
		end
	end
	
	-- show checkboxes
	if (z) then
		-- if a
		if not (b) and not (c) and not (d) and not (e) and (aa) then
			wasClicked, script_shamanTotems.stoneskinTotem = Checkbox("Stoneskin", script_shamanTotems.stoneskinTotem);
			SameLine();
		end
		-- if b
		if not (a) and not (c) and not (d) and not (e) and (bb) then
			wasClicked, script_shamanTotems.strengthOfEarthTotem = Checkbox("Strength of Earth", script_shamanTotems.strengthOfEarthTotem);
		end
		-- if c
		if not (a) and not (b) and not (d) and not (e) and (cc) then
			wasClicked, script_shamanTotems.stoneclawTotem = Checkbox("Stoneclaw", script_shamanTotems.stoneclawTotem);
		SameLine();
		end
		-- if d
		if not (a) and not (b) and not (c) and not (e) and (dd) then
			wasClicked, script_shamanTotems.earthbindTotem = Checkbox("Earthbind", script_shamanTotems.earthbindTotem);
		end
		-- if e
		if not (a) and not (b) and not (c) and not (d) and (ee) then
			SameLine();
			wasClicked, script_shamanTotems.tremorTotem = Checkbox("Tremor", script_shamanTotems.tremorTotem);
		end
	end
end


-- show FIRE totem menu
function script_shamanMenuEX:alternateTotemMenuFire()
	local z = HasItem("Fire Totem");
	local aa = HasSpell("Searing Totem"); local bb = HasSpell("Fire Nova Totem");
	local cc = HasSpell("Magma Totem"); local dd = HasSpell("Flametongue Totem");
	local a = script_shamanTotems.searingTotem; local b = script_shamanTotems.fireNovaTotem;
	local c = script_shamanTotems.magmaTotem; local d = script_shamanTotems.flametongueTotem;

	-- set totems
	if (z) then
		if (a) and (aa) then
			script_shaman.totem2 = "Searing Totem";
		end
		if (b) and (bb) then
			script_shaman.totem2 = "Fire Nova Totem";
		end
		if (c) and (cc) then
			script_shaman.totem2 = "Magma Totem";
		end
		if (d) and (dd) then
			script_shaman.totem2 = "Flametongue Totem";
		end
	end

	
	-- show checkboxes
	if (z) then
		-- if a
		if not (b) and not (c) and not (d) and (aa) then
			wasClicked, script_shamanTotems.searingTotem = Checkbox("Searing", script_shamanTotems.searingTotem);
		end
		-- if b
		if not (a) and not (c) and not (d) and (bb) then
			SameLine();
			wasClicked, script_shamanTotems.fireNovaTotem = Checkbox("Fire Nova", script_shamanTotems.fireNovaTotem);
		end
		-- if c
		if not (a) and not (b) and not (d) and (cc) then
			wasClicked, script_shamanTotems.magmaTotem = Checkbox("Magma", script_shamanTotems.magmaTotem);
		end
		-- if d
		if not (a) and not (b) and not (c) and (dd) then
			SameLine();
			wasClicked, script_shamanTotems.flametongueTotem = Checkbox("Flametongue", script_shamanTotems.flametongueTotem);
		end
	end
end

-- show WATER totem menu
function script_shamanMenuEX:alternateTotemMenuWater()
local z = HasItem("Water Totem");
	local aa = HasSpell("Healing Stream Totem"); local bb = HasSpell("Mana Spring Totem");
	local cc = HasSpell("Mana Tide Totem");
	local a = script_shamanTotems.healingStreamTotem; local b = script_shamanTotems.manaSpringTotem; local c = script_shamanTotems.manaTideTotem;

	-- set totems
	if (z) then
		if (a) and (aa) then
			script_shaman.totem3 = "Healing Stream Totem";
		end
		if (b) and (bb) then
			script_shaman.totem3 = "Mana Spring Totem";
		end
		if (c) and (cc) then
			script_shaman.totem3 = "Mana Tide Totem";
		end
	end

	
	-- show checkboxes
	if (z) then
		-- if a
		if not (b) and not (c) and (aa) then
			wasClicked, script_shamanTotems.healingStreamTotem = Checkbox("Healing Stream", script_shamanTotems.healingStreamTotem);
		end
		-- if b
		if not (a) and not (c) and (bb) then
			SameLine();
			wasClicked, script_shamanTotems.manaSpringTotem = Checkbox("Mana Spring", script_shamanTotems.manaSpringTotem);
		end
		-- if c
		if not (a) and not (b) and (cc) then
			wasClicked, script_shamanTotems.manaTideTotem = Checkbox("Mana Tide", script_shamanTotems.manaTideTotem);
		SameLine();
		end
	end

end

-- show AIR totem menu
function script_shamanMenuEX:alternateTotemMenuWind()
local z = HasItem("Air Totem");
	local aa = HasSpell("Grace of Air Totem"); local bb = HasSpell("Windfury Totem");
	local a = script_shamanTotems.graceOfAirTotem; local b = script_shamanTotems.windfuryTotem;

-- set totems
	if (z) then
		if (a) and (aa) then
			script_shaman.totem4 = "Grace of Air Totem";
		end
		if (b) and (bb) then
			script_shaman.totem4 = "Windfury Totem";
		end
	end

	
	-- show checkboxes
	if (z) then
		-- if a
		if not (b) and (aa) then
			wasClicked, script_shamanTotems.graceOfAirTotem = Checkbox("Grace of Air", script_shamanTotems.graceOfAirTotem);
		end
		-- if b
		if not (a) and (bb) then
			SameLine();
			wasClicked, script_shamanTotems.windfuryTotem = Checkbox("Windfury", script_shamanTotems.windfuryTotem);
		end
	end

end