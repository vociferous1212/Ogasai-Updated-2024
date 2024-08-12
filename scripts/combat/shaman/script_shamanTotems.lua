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
	waitTimer = 0,
}

-- call to use totems based on set totem in menu
function script_shamanTotems:useTotem()

	if (self.waitTimer > GetTimeEX()) then
		return;
	end

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
			self.waitTimer = GetTimeEX() + 1500;
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
				if (i:GetUnitName() == "Searing Totem") or (i:GetUnitName() == "Searing Totem II")
				or (i:GetUnitName() == "Fire Nova Totem")
				or (i:GetUnitName() == "Magma Totem")
				or (i:GetUnitName() == "Flametongue Totem") then

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
				if (i:GetUnitName() == "Stoneskin Totem") or (i:GetUnitName() == "Stoneskin Totem II")
				or (i:GetUnitName() == "Strength of Earth Totem") or (i:GetUnitName() == "Strength of Earth Totem II")
				or (i:GetUnitName() == "Stoneclaw Totem") or (i:GetUnitName() == "Stoneclaw Totem II")
				or (i:GetUnitName() == "Earthbind Totem")
				or (i:GetUnitName() == "Tremor Totem") then
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
				if (i:GetUnitName() == "Healing Stream Totem") or (i:GetUnitName() == "Healing Stream Totem II") 
				or (i:GetUnitName() == "Mana Spring Totem") or (i:GetUnitName() == "Mana Spring Totem II")
				or (i:GetUnitName() == "Mana Tide Totem") or (i:GetUnitName() == "Mana Tide Totem II") then

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


function script_shamanTotems:isAnythingAttackingMyTotems()
	local i, t = GetFirstObject()
	--local fireTable = {Searing Totem, Fire Nova Totem, Magma Totem, Flametongue Totem};
	local totem1 = 0;
	local totem2 = 0;
	local totem3 = 0;

	-- get totem
	while i ~= 0 do
		if t == 3 then
			if (i:GetDistance() < 45) then
				if i:GetUnitName() == "a" then
				end
			end
		end
	end
return firetotem1
end
					











