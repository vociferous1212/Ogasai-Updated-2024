script_shamanTotems = {

	stoneskinTotem = false,
	strengthOfEarthTotem = false,
	stoneclawTotem = false,
	earthbindTotem = false,
	tremorTotem = false,

	searingTotem = false,
	fireNovaTotem = false,
	magmaTotem = false,
	flametongueTotem = false,
	  
	healingStreamTotem = false,
	manaSpringTotem = false,
	manaTideTotem = false,

	graceOfAirTotem = false,
	windfuryTotem = false,
}

-- call to use totems based on set totem in menu
function script_shamanTotems:useTotem()

	local localMana = GetLocalPlayer():GetManaPercentage();
	local hasTarget = GetLocalPlayer():GetUnitsTarget();

	-- remove ghost wolf before combat
	if (localObj:HasBuff("Ghost Wolf")) then
		CastSpellByName("Ghost Wolf");
	end

	if (hasTarget ~= 0) then
		if (not IsAutoCasting("Attack")) then
			targetObj:AutoAttack();
			if (not IsMoving()) then
				targetObj:FaceTarget();
			end
		end
	end

-- use earth totem
	-- Totem 1
	if (script_shaman.useEarthTotem) and (PlayerHasTarget()) and (not script_shamanTotems:isEarthTotemAlive()) and (localMana >= 20) and (HasSpell(script_shaman.totem)) and (not IsSpellOnCD(script_shaman.totem)) then
		if (CastSpellByName(script_shaman.totem)) then
			return true;
		end
		return true;
	end

-- use fire totem
	-- totem 2
	if (script_shaman.useFireTotem) and (PlayerHasTarget()) and (not script_shamanTotems.isFireTotemAlive()) and (HasSpell(script_shaman.totem2)) and (not IsSpellOnCD(script_shaman.totem2)) then
		if (CastSpellByName(script_shaman.totem2)) then
			return true;
		end
		return true;
	end

-- use water totem
	-- totem 3
	if (script_shaman.useWaterTotem) and (not script_shamanTotems:isWaterTotemAlive()) and (PlayerHasTarget()) and (HasSpell(script_shaman.totem3)) and (not IsSpellOnCD(script_shaman.totem3)) then
		if (CastSpellByName(script_shaman.totem3)) then
			return true;
		end
	end

-- use air totem
	-- totem 4
	if (script_shaman.useAirTotem) and (not script_shamanTotems:isAirTotemAlive()) and (PlayerHasTarget()) and (HasSpell(script_shaman.totem4)) and (not IsSpellOnCD(script_shaman.totem4)) then
		if (CastSpellByName(script_shaman.totem4)) then
			return true;
		end
	end

return false;
end

-- run object manager to find if we have TREMOR totem placed...
function script_shamanTotems:isTremorTotemAlive()
	local i, t = GetFirstObject(); 

	while i ~= 0 do
		if t == 3 then
			if (i:GetDistance() <= 18) then
				if (i:GetUnitName() == "Tremor Totem") then
				return true;
				end
			end
		end
	i, t = GetNextObject(i); 
	end
return false;
end

-- run object manager to find if we have STONECLAW totem placed...
function script_shamanTotems:isStoneclawTotemAlive()
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
function script_shamanTotems:isEarthbindTotemAlive()
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

-- run object manager to find if we have a FIRE totem placed...
function script_shamanTotems:isFireTotemAlive()
	local i, t = GetFirstObject(); 

	while i ~= 0 do
		if t == 3 then
			if (i:GetDistance() <= 18) then
				if (i:GetUnitName() == "Searing Totem") or (i:GetUnitName() == "Fire Nova Totem") or (i:GetUnitName() == "Magma Totem") or (i:GetUnitName() == "Flametongue Totem") then

				return true;
				end
			end
		end
	i, t = GetNextObject(i); 
	end
return false;
end

-- run object manager to find if we have an EARTH totem placed...
function script_shamanTotems:isEarthTotemAlive()
	local i, t = GetFirstObject(); 

	while i ~= 0 do
		if t == 3 then
			if (i:GetDistance() <= 20) then
				if (i:GetUnitName() == "Stoneskin Totem") or (i:GetUnitName() == "Strength of Earth Totem") or (i:GetUnitName() == "Earthbind Totem") or (i:GetUnitName() == "Stoneclaw Totem") or (i:GetUnitName() == "Tremor Totem") then
					return true;
				end
			end
		end
	i, t = GetNextObject(i); 
	end
return false;
end

-- run object manager to find if we have a WATER totem placed...
function script_shamanTotems:isWaterTotemAlive()
	local i, t = GetFirstObject(); 

	while i ~= 0 do
		if t == 3 then
			if (i:GetDistance() <= 20) then
				if (i:GetUnitName() == "Healing Stream Totem") or (i:GetUnitName() == "Mana Spring Totem") or (i:GetUnitName() == "Mana Tide Totem") then
					return true;
				end
			end
		end
	i, t = GetNextObject(i); 
	end
return false;
end

-- run object manager to find if we have an AIR totem placed...
function script_shamanTotems:isAirTotemAlive()
	local i, t = GetFirstObject(); 

	while i ~= 0 do
		if t == 3 then
			if (i:GetDistance() <= 20) then
				if (i:GetUnitName() == "Grace of Air Totem") or (i:GetUnitName() == "Windfury Totem") then
					return true;
				end
			end
		end
	i, t = GetNextObject(i); 
	end
return false;
end
				
-- this needs to be placed in the shamanEX menu section
function script_shamanTotems:alternateEnhanceMenu()
	local a = script_shaman.useRock; local b = script_shaman.useFlame; local c = script_shaman.useWind;
	local d = HasSpell("Rockbiter Weapon"); local e = HasSpell("Flametongue Weapon"); local f = HasSpell("Windfury Weapon");
	
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

-- show EARTH totem menu
function script_shamanTotems:alternateTotemMenuEarth()
	local z = HasItem("Earth Totem");
	local aa = HasSpell("Stoneskin Totem"); local bb = HasSpell("Strength of Earth Totem");
	local cc = HasSpell("Stoneclaw Totem"); local dd = HasSpell("Earthbind Totem");
	local ee = HasSpell("Tremor Totem");
	local a = self.stoneskinTotem; local b = self.strengthOfEarthTotem;
	local c = self.stoneclawTotem; local d = self.earthbindTotem; local e = self.tremorTotem;
	
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
			wasClicked, self.stoneskinTotem = Checkbox("Stoneskin", self.stoneskinTotem);
			SameLine();
		end
		-- if b
		if not (a) and not (c) and not (d) and not (e) and (bb) then
			wasClicked, self.strengthOfEarthTotem = Checkbox("Strength of Earth", self.strengthOfEarthTotem);
		end
		-- if c
		if not (a) and not (b) and not (d) and not (e) and (cc) then
			wasClicked, self.stoneclawTotem = Checkbox("Stoneclaw", self.stoneclawTotem);
		SameLine();
		end
		-- if d
		if not (a) and not (b) and not (c) and not (e) and (dd) then
			wasClicked, self.earthbindTotem = Checkbox("Earthbind", self.earthbindTotem);
		end
		-- if e
		if not (a) and not (b) and not (c) and not (d) and (ee) then
			SameLine();
			wasClicked, self.tremorTotem = Checkbox("Tremor", self.tremorTotem);
		end
	end
end


-- show FIRE totem menu
function script_shamanTotems:alternateTotemMenuFire()
	local z = HasItem("Fire Totem");
	local aa = HasSpell("Searing Totem"); local bb = HasSpell("Fire Nova Totem");
	local cc = HasSpell("Magma Totem"); local dd = HasSpell("Flametongue Totem");
	local a = self.searingTotem; local b = self.fireNovaTotem;
	local c = self.magmaTotem; local d = self.flametongueTotem;

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
			wasClicked, self.searingTotem = Checkbox("Searing", self.searingTotem);
		end
		-- if b
		if not (a) and not (c) and not (d) and (bb) then
			SameLine();
			wasClicked, self.fireNovaTotem = Checkbox("Fire Nova", self.fireNovaTotem);
		end
		-- if c
		if not (a) and not (b) and not (d) and (cc) then
			wasClicked, self.magmaTotem = Checkbox("Magma", self.magmaTotem);
		end
		-- if d
		if not (a) and not (b) and not (c) and (dd) then
			SameLine();
			wasClicked, self.flametongueTotem = Checkbox("Flametongue", self.flametongueTotem);
		end
	end
end

-- show WATER totem menu
function script_shamanTotems:alternateTotemMenuWater()
local z = HasItem("Water Totem");
	local aa = HasSpell("Healing Stream Totem"); local bb = HasSpell("Mana Spring Totem");
	local cc = HasSpell("Mana Tide Totem");
	local a = self.healingStreamTotem; local b = self.manaSpringTotem; local c = self.manaTideTotem;

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
			wasClicked, self.healingStreamTotem = Checkbox("Healing Stream", self.healingStreamTotem);
		end
		-- if b
		if not (a) and not (c) and (bb) then
			SameLine();
			wasClicked, self.manaSpringTotem = Checkbox("Mana Spring", self.manaSpringTotem);
		end
		-- if c
		if not (a) and not (b) and (cc) then
			wasClicked, self.manaTideTotem = Checkbox("Mana Tide", self.manaTideTotem);
		SameLine();
		end
	end

end

-- show AIR totem menu
function script_shamanTotems:alternateTotemMenuWind()
local z = HasItem("Air Totem");
	local aa = HasSpell("Grace of Air Totem"); local bb = HasSpell("Windfury Totem");
	local a = self.graceOfAirTotem; local b = self.windfuryTotem;

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
			wasClicked, self.graceOfAirTotem = Checkbox("Grace of Air", self.graceOfAirTotem);
		end
		-- if b
		if not (a) and (bb) then
			SameLine();
			wasClicked, self.windfuryTotem = Checkbox("Windfury", self.windfuryTotem);
		end
	end

end