script_functions = {}

function HasForm()
	local player = GetLocalPlayer();

	if (player:HasBuff("Bear Form")) or (player:HasBuff("Dire Bear Form")) or (player:HasBuff("Cat Form")) or (player:HasBuff("Aquatic Form")) or (player:HasBuff("Travel Form")) or (player:HasBuff("Moonkin Form")) or (player:HasBuff("Ghost Wolf")) then
		return true;
	end
return false;
end

function IsMoonkinForm()
	local player = GetLocalPlayer();

	if (player:HasBuff("Moonkin Form")) then
		return true;
	end
return false;
end

function IsCatForm()
	local player = GetLocalPlayer();

	if (player:HasBuff("Cat Form")) then
		return true;
	end
return false;
end

-- druid has bear form
function IsBearForm()
	local player = GetLocalPlayer();

	if (player:HasBuff("Bear Form")) or (player:HasBuff("Dire Bear Form")) then
		return true;
	end
return false;
end

-- druid has travel form
function IsTravelForm()
	local player = GetLocalPlayer();

	if (player:HasBuff("Travel Form")) then
		return true;
	end
return false;
end

-- druid has aquatic form
function IsAquaticForm()
	local player = GetLocalPlayer();

	if (player:HasBuff("Aquatic Form")) then
		return true;
	end
return false;
end

function CastGhostWolf()
	local player = GetLocalPlayer();

	if (HasSpell("Ghost Wolf")) and (not player:HasBuff("Ghost Wolf")) and (not IsSpellOnCD("Ghost Wolf")) and (not IsIndoors()) then
		CastSpellByName("Ghost Wolf", player);
		return true;
	end
return false;
end

-- shaman has ghost wolf form
function IsGhostWolf()
	local player = GetLocalPlayer();

	if (player:HasBuff("Ghost Wolf")) then
		return true;
	end
return false;
end

function PetHasTarget()
	local pet = GetPet();

	if (pet ~= 0) and (pet ~= nil) then
		if (pet:GetUnitsTarget() ~= 0) and (pet:GetUnitsTarget():GetGUID() ~= nil) then
			return true;
		end
	end
return false;
end

function PlayerHasTarget()
	local player = GetLocalPlayer();

	if (player:GetUnitsTarget() ~= 0) and (player:GetUnitsTarget() ~= nil) and (GetTarget() ~= 0) and (GetTarget() ~= nil) then
		if (player:GetUnitsTarget():GetGUID() ~= nil) then
			return true;
		end
	end
return false;
end

function HasPet()
	local pet = GetPet();

	if (pet ~= 0) and (pet ~= nil) then
		if (pet:GetHealthPercentage() > 1) then
			return true;
		end
	end
return false;
end

function CallPet()
	local pet = GetPet();

	if (pet == 0) and (pet ~= nil) and (not IsSpellOnCD("Call Pet")) then
		script_hunter.message = "pet is missing, calling pet...";
		CastSpellByName("Call Pet");
		return true;
	end
return false;
end

function CastStealth()
	local player = GetLocalPlayer();

	if (HasSpell("Stealth")) or (HasSpell("Prowl")) and (not script_checkDebuffs:hasMagic()) and (not script_checkDebuffs:hasPoison()) and (not script_checkDebuffs:hasCurse()) and (not IsStealth()) then
		if (HasSpell("Stealth")) and (script_rogue.useStealth) then
			if (not IsSpellOnCD("Stealth")) then
				CastSpellByName("Stealth", player);
				script_grind:setWaitTimer(1500);
				return true;
			end
		elseif (HasSpell("Prowl")) and (script_druid.useStealth) and (not IsSpellOnCD("Cat Form")) then
			if (not HasForm()) then
				if (HasSpell("Cat Form")) then
					CastSpellByName("Cat Form");
					return true;
				end
			elseif (not IsSpellOnCD("Prowl")) and (IsCatForm()) then
				CastSpellByName("Prowl", player);
				script_grind:setWaitTimer(1500);
				return true;
			end
		end
	end
return false;
end

function IsStealth()
	local player = GetLocalPlayer();

	if (player:HasBuff("Stealth")) or (player:HasBuff("Prowl")) then
		return true;
	end
return false;
end

function CastSprint()
	if (HasSpell("Sprint")) and (not IsSpellOnCD("Sprint")) then
		CastSpellByName("Sprint");
		return true;
	end
return false;
end

function RemoveForm()
	script_druidEX:removeTravelForm();
	script_druidEX:removeBearForm();
	script_druidEX:removeCatForm();
	script_druidEX:removeMoonkinForm();
	script_shamanEX2:removeGhostWolf();
return false;
end
function GetMyFaction()
	local myFaction = nil;
	-- faction check - 0 for alliance and 1 for horde
	if (GetFaction() == 115 or GetFaction() == 3 or GetFaction() == 4 or GetFaction() == 1) then
		myFaction = 0;
	else
		myFaction = 1;
	end
return myFaction;
end
