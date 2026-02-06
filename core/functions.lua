script_functions = {}

function HasForm()

	local player = GetLocalPlayer();

	if (player:HasBuff("Bear Form")) or (player:HasBuff("Dire Bear Form"))
	or (player:HasBuff("Cat Form")) or (player:HasBuff("Aquatic Form"))
	or (player:HasBuff("Travel Form")) or (player:HasBuff("Moonkin Form"))
	or (player:HasBuff("Ghost Wolf")) then

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

function IsBearForm()
	local player = GetLocalPlayer();
	
	if (player:HasBuff("Bear Form")) or (player:HasBuff("Dire Bear Form")) then
		return true;
	end
	
return false;
end

function IsTravelForm()
	local player = GetLocalPlayer();
	
	if (player:HasBuff("Travel Form")) then
	
		return true;
	end

return false;
end

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

	if (HasSpell("Stealth") or HasSpell("Prowl") or HasSpell("Shadowmeld")) and (not script_checkDebuffs:hasMagic()) and (not script_checkDebuffs:hasPoison()) and (not script_checkDebuffs:hasCurse()) and (not IsStealth()) then
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

	if (player:HasBuff("Stealth")) or (player:HasBuff("Prowl")) or player:HasBuff("Shadowmeld") then
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

	local player = GetLocalPlayer();

	if player:HasBuff("Bear Form") and not IsSpellOnCD("Bear Form") then
		CastSpellByName("Bear Form");
	elseif player:HasBuff("Dire Bear Form") and not IsSpellOnCD("Dire Bear Form") then
		CastSpellByName("Dire Bear Form");
	elseif player:HasBuff("Cat Form") and not IsSpellOnCD("Cat Form") then
		CastSpellByName("Cat Form");
	elseif player:HasBuff("Moonkin Form") and not IsSpellOnCD("Moonkin Form") then
		CastSpellByName("Moonkin Form");
	elseif player:HasBuff("Ghost Wolf") and not IsSpellOnCD("Ghost Wolf")then
		CastSpellByName("Ghost Wolf");
	end

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

function GetMyClass()
	local class = "";
	if HasSpell("Heroic Strike") then class = "WARRIOR"
	elseif HasSpell("Sinister Strike") then class = "ROGUE"
	elseif HasSpell("Seal of Righteousness") then class = "PALADIN"
	elseif HasSpell("Lightning Bolt") then class = "SHAMAN"
	elseif HasSpell("Fireball") then class = "MAGE"
	elseif HasSpell("Wrath") then class = "DRUID"
	elseif HasSpell("Shadow Bolt") then class = "WARLOCK"
	elseif HasSpell("Smite") then class = "PRIEST"
	elseif HasSpell("Raptor Strike") then class = "HUNTER"
	end
return class;
end

function DoStartChecks()
	if IsStanding() and not IsMoving() and not IsMounted() and not IsEating() and not IsDrinking() and not IsCasting() and not IsChanneling() and not GetLocalPlayer():IsDead() and not IsGhost() and not GetLocalPlayer():IsConfused() and not GetLocalPlayer():IsFleeing() and not GetLocalPlayer():IsStunned() and not IsLooting() then
		return true;
	end
return false;
end

-- ogasai target has ranged weapon doesn't work properly to detect when a ranged weapon is in use...
function TargetHasRangedWeapon(target)
	local castingTable = {[6660] = true};

	if target ~= nil and target ~= 0 then
		for i=0, script_grind.targetHasRangedWeaponTableNum do
			-- check if target is already known to have ranged weapon then return true
			if (target:GetGUID() == script_grind.targetHasRangedWeaponTable[i]) then
				return true;
			end
			-- if not target is known to have ranged weapon then add to table and return true
			if (target:GetGUID() ~= script_grind.targetHasRangedWeaponTable[i]) then
				if castingTable[target:GetCasting()] or (target:IsCasting()) then
					script_grind.targetHasRangedWeaponTable[script_grind.targetHasRangedWeaponTableNum] = target:GetGUID();
					script_grind.targetHasRangedWeaponTableNum = script_grind.targetHasRangedWeaponTableNum + 1;
					return true;
				end
			end
		end
	end
return false;
end

function IsDisarmed()
local INVSLOT_MAINHAND = 16; local mainHandTexture = GetInventoryItemTexture("player", INVSLOT_MAINHAND);
if mainHandTexture then return false; end return true; end

function IsAnyTargetTargetingPlayer()
	local i, t = GetFirstObject()
	while i ~= 0 do
		if t == 3 and i:GetDistance() <= 75 and not i:IsDead() and not i:IsCritter() then
			if i:GetUnitsTarget() ~= 0 and i:GetUnitsTarget() ~= nil then
				if i:GetUnitsTarget():GetGUID() == GetLocalPlayer():GetGUID() then
					return true;
				end
				if GetPet() ~= 0 and GetPet() ~= nil then
					if i:GetUnitsTarget():GetGUID() == GetPet():GetGUID() then
						return true;
					end
				end	
			end
		end
	i, t = GetNextObject(i);
	end
return false;
end

function NumberTargetsAttackingPlayer()
	local numTargets = 0;
	local tempTarget = nil;
	local i, t = GetFirstObject();
	while i ~= 0 do
		if t == 3 then
			if i:GetDistance() <= 75 and not i:IsDead() and not i:IsCritter() then
				if i:GetUnitsTarget() ~= 0 and i:GetUnitsTarget() ~= nil then
					if i:GetUnitsTarget():GetGUID() == GetLocalPlayer():GetGUID() then
						numTargets = numTargets + 1;
						tempTarget = i:GetGUID();
					end
					if GetPet() ~= 0 and GetPet() ~= nil then
						if i:GetGUID() ~= tempTarget then
							if i:GetUnitsTarget():GetGUID() == GetPet():GetGUID() then
								numTargets = numTargets + 1;
							end
						end
					end	

				end
			end
		end
	i, t = GetNextObject(i);
	end
return numTargets;
end

function PetHealth()

	local health = 0;

	if GetPet() ~= 0 and GetPet() ~= nil then
	
		health = GetPet():GetHealthPercentage();
	end

return health;
end

function PetFocus()

	local focus = 0;

	if GetPet() ~= 0 and GetPet() ~= nil then

		if not GetPet():IsDead() then
	
			focus = GetPet():GetFocusPercentage();
		end
	end

return focus;
end

function PlayerHealth()

	local health = 0;

	if GetLocalPlayer() ~= nil then
		
		health = GetLocalPlayer():GetHealthPercentage();
	end

return health;
end

function PlayerMana()

	local mana = 0;

	if GetLocalPlayer():HasBuff("Clearcasting") then
	
		return 100;
	end

	if GetLocalPlayer() ~= nil then

		if GetMyClass() ~= "WARRIOR" and GetMyClass() ~= "ROGUE" then
		
			mana = GetLocalPlayer():GetManaPercentage();
		end
	end

return mana;

end

function PlayerManaTotal()

	local manaTotal = 0;

	if GetLocalPlayer() ~= nil then

		if GetMyClass() ~= "WARRIOR" and GetMyClass() ~= "ROGUE" then
		
			manaTotal = GetLocalPlayer():GetMana();
		end
	end

return manaTotal;
end

function PlayerRage()

	local rage = 0;

	if GetLocalPlayer():HasBuff("Clearcasting") then
	
		return 100;
	end

	if GetLocalPlayer() ~= nil then

		if GetMyClass() == "WARRIOR" or GetLocalPlayer():HasBuff("Bear Form") or GetLocalPlayer():HasBuff("Dire Bear Form") then
		
			rage = GetLocalPlayer():GetRagePercentage();
		end
	end

return rage;
end

function PlayerEnergy()

	local energy = 0;

	if GetLocalPlayer():HasBuff("Clearcasting") then
	
		return 100;
	end

	if GetLocalPlayer() ~= nil then

		if GetMyClass() == "ROGUE" or GetLocalPlayer():HasBuff("Cat Form") then
		
			energy = GetLocalPlayer():GetEnergyPercentage();
		end
	end

return energy;
end

function PlayerComboPoints()

	local comboPoints = 0;

	if GetLocalPlayer() ~= nil and PlayerHasTarget() then
		
		comboPoints = GetComboPoints("player", "target");
	end

return comboPoints;
end

function PlayerLevel()

	local level = 1;

	if GetLocalPlayer() ~= nil then

		level = GetLocalPlayer():GetLevel();
	end

return level;
end

function Player()

	return GetLocalPlayer();
end

function PlayerPosition()

	local x, y, z = GetLocalPlayer():GetPosition();

return x, y, z;
end