script_shamanEX3 = {

	stoneskinTotem = false,
	strengthOfEarthTotem = false,
	stoneclawTotem = false,
	earthbindTotem = false,
	searingTotem = false,
	fireNovaTotem = false,
	  

}

-- run object manager to find if we have STONECLAW totem placed...
function script_shamanEX3:isStoneclawTotemAlive()
	local i, t = GetFirstObject(); 

	while i ~= 0 do
		if t == 3 then
			if (i:GetDistance() <= 18) then
				if (i:GetUnitName() == "Stoneclaw Totem") then
				return true;
				end
			end
		end
	i, t = GetNextObject(i); 
	end
return false;
end

-- run object manager to find if we have EARTHBIND totem placed...
function script_shamanEX3:isEarthbindTotemAlive()
	local i, t = GetFirstObject(); 

	while i ~= 0 do
		if t == 3 then
			if (i:GetDistance() <= 18) then
				if (i:GetUnitName() == "Earthbind Totem") then
				return true;
				end
			end
		end
	i, t = GetNextObject(i); 
	end
return false;
end

-- run object manager to find if we have a totem placed...
function script_shamanEX3:isFireTotemAlive()
	local i, t = GetFirstObject(); 

	while i ~= 0 do
		if t == 3 then
			if (i:GetDistance() <= 18) then
				if (i:GetUnitName() == "Searing Totem") or (i:GetUnitName() == "Fire Nova Totem")
				--or (i:GetUnitName() == "Searing Totem")
				--or (i:GetUnitName() == "Searing Totem")
				then

				return true;
				end
			end
		end
	i, t = GetNextObject(i); 
	end
return false;
end

-- run object manager to find if we have a totem placed...
function script_shamanEX3:isEarthTotemAlive()
	local i, t = GetFirstObject(); 

	while i ~= 0 do
		if t == 3 then
			if (i:GetDistance() <= 20) then
				if (i:GetUnitName() == "Stoneskin Totem") or (i:GetUnitName() == "Strength of Earth Totem") or (i:GetUnitName() == "Earthbind Totem") or (i:GetUnitName() == "Stoneclaw Totem") then
					return true;
				end
			end
		end
	i, t = GetNextObject(i); 
	end
return false;
end

-- run object manager to find if we have a totem placed...
function script_shamanEX3:isWaterTotemAlive()
	local i, t = GetFirstObject(); 

	while i ~= 0 do
		if t == 3 then
			if (i:GetDistance() <= 20) then
				if (i:GetUnitName() == "Healing Stream Totem") or (i:GetUnitName() == "Mana Spring Totem") 
				--or (i:GetUnitName() == "Earthbind Totem")
				--or (i:GetUnitName() == "Stoneclaw Totem")
				then
					return true;
				end
			end
		end
	i, t = GetNextObject(i); 
	end
return false;
end
				
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
		-- if a
		if not (b) and not (c) and not (d) and (aa) then
			wasClicked, self.stoneskinTotem = Checkbox("Stoneskin", self.stoneskinTotem);
			SameLine();
		end
		-- if b
		if not (a) and not (c) and not (d) and (bb) then
			wasClicked, self.strengthOfEarthTotem = Checkbox("Strength of Earth", self.strengthOfEarthTotem);
		end
		-- if c
		if not (a) and not (b) and not (d) and (cc) then
			script_shaman.totem = "Strength of Earth Totem";
			wasClicked, self.stoneclawTotem = Checkbox("Stoneclaw", self.stoneclawTotem);
		SameLine();
		end
		-- if d
		if not (a) and not (b) and not (c) and (dd) then
			wasClicked, self.earthbindTotem = Checkbox("Earthbind", self.earthbindTotem);
		end
	end
end

function script_shamanEX3:alternateTotemMenuFire()
local z = HasItem("Fire Totem"); local aa = HasSpell("Searing Totem"); local bb = HasSpell("Fire Nova Totem");
	--local cc = HasSpell("Stoneclaw Totem"); local dd = HasSpell("Earthbind Totem");
	local a = self.searingTotem; local b = self.fireNovaTotem;
	--c = self.stoneclawTotem; d = self.earthbindTotem;
	
	-- set totems
	if (z) then
		if (a) and (aa) then
			script_shaman.totem2 = "Searing Totem";
		end
		if (b) and (bb) then
			script_shaman.totem2 = "Fire Nova Totem";
		end
		--if (c) and (cc) then
		--	script_shaman.totem2 = "";
		--	script_shaman.totemBuff2 = "";
		--end
		--if (d) and (dd) then
		--	script_shaman.totem2 = "";
		--	script_shaman.totemBuff2 = "";
		--end
	end

	-- show checkboxes
	if (z) then
		-- if a
		if not (b) and not (c) and not (d) and (aa) then
			wasClicked, self.searingTotem = Checkbox("Searing", self.searingTotem);
		end
		-- if b
		if not (a) and not (c) and not (d) and (bb) then
			SameLine();
			wasClicked, self.fireNovaTotem = Checkbox("Fire Nova", self.fireNovaTotem);
		end
		-- if c
		--if not (a) and not (b) and not (d) and (cc) then
		--	wasClicked, self. = Checkbox("", self.);
		--SameLine();
		--end
		-- if d
		--if not (a) and not (b) and not (c) and (dd) then
		--	wasClicked, self. = Checkbox("", self.);
		--end
	end
end

function script_shamanEX3:alternateTotemMenuWater()
end
function script_shamanEX3:alternateTotemMenuWind()
end