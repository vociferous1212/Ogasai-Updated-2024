script_shamanEX3 = {

	stoneskinTotem = false,
	strengthOfEarthTotem = false,
	stoneclawTotem = false,
	earthbindTotem = false,

}


-- XD XD :)
function script_shamanEX3:alternateEnhanceMenu()
	local a = script_shaman.useRock; local b = script_shaman.useFlame; local c = script_shaman.useWind;
	local d = HasSpell("Rockbiter Weapon"); local e = HasSpell("Flametongue Weapon"); local f = HasSpell("Windfury Weapon");
	
	-- set rockbiter
	if (a) and (d) then
		script_shaman.enhanceWeapon = "Rockbiter Weapon";
	end
	-- set flametongue
	if (b) and (e) then
		script_shaman.enhanceWeapon = "Flametongue Weapon";
	end
	-- set windfury
	if (c) and (f) then
		script_shaman.enhanceWeapon = "Windfury Weapon";
	end
	
	-- show checkboxes
	if not (b) and not (c) and (d) then
		wasClicked, script_shaman.useRock = Checkbox("Rockbiter", script_shaman.useRock);
			SameLine();
	end
	if not (a) and not (c) and (e) then
		wasClicked, script_shaman.useFlame = Checkbox("Flametongue", script_shaman.useFlame);
			SameLine();

	end
	if not (a) and not (b) and (f) then
		wasClicked, script_shaman.useWind = Checkbox("Windfury", script_shaman.useWind);
	end
end

function script_shamanEX3:alternateTotemMenuEarth()
	local z = HasItem("Earth Totem"); local aa = HasSpell("Stoneskin Totem"); local bb = HasSpell("Strength of Earth Totem");
	local cc = HasSpell("Stoneclaw Totem"); local dd = HasSpell("Earthbind Totem");
	local a = self.stoneskinTotem; local b = self.strengthOfEarthTotem; c = self.stoneclawTotem; d = self.earthbindTotem;
	
	-- set totems
	if (z) then
		if (a) and (aa) then
			script_shaman.totem = "Stoneskin Totem";
			script_shaman.totemBuff = "Stoneskin";
		end
		if (b) and (bb) then
			script_shaman.totem = "Strength of Earth Totem";
			script_shaman.totemBuff = "Strength of Earth";
		end
		if (c) and (cc) then
			script_shaman.totem = "Stoneclaw Totem";
			script_shaman.totemBuff = "";
		end
		if (d) and (dd) then
			script_shaman.totem = "Earthbind Totem";
			script_shaman.totemBuff = "";
		end
	end

	-- show checkboxes
	if (z) then
		if not (b) and not (c) and not (d) and (aa) then
			wasClicked, self.stoneskinTotem = Checkbox("Stoneskin", self.stoneskinTotem);
			SameLine();
		end
		if not (a) and not (c) and not (d) and (bb) then
			wasClicked, self.strengthOfEarthTotem = Checkbox("Strength of Earth", self.strengthOfEarthTotem);
		end
		if not (a) and not (b) and not (d) and (cc) then
			wasClicked, self.stoneclawTotem = Checkbox("Stoneclaw", self.stoneclawTotem);
		SameLine();
		end
		if not (a) and not (b) and not (c) and (dd) then
			wasClicked, self.earthbindTotem = Checkbox("Earthbind", self.earthbindTotem);
		end
	end

Separator();
end

function script_shamanEX3:alternateTotemMenuFire()
end
function script_shamanEX3:alternateTotemMenuWater()
end
function script_shamanEX3:alternateTotemMenuWind()
end