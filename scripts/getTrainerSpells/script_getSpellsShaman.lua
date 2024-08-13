script_getSpellsShaman = {}

function script_getSpellsShaman:getTrainerTargetShaman()

	local vX, vY, vZ = 0, 0, 0;
	local a = script_getSpells:orcZones();
	local b = script_getSpells:cowZones();
	-- get trainer position
		
	-- !!!! 	these need to all be put in a table to check from like hotspot distances 	!!!!!

		-- Orc/troll starter area
		if ( (GetFaction() == 2 or GetFaction() == 116) and not a) or (script_getSpells:orcZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -623.93902587891, -4203.8798828125, 38.13410949707;
				script_getSpells.trainerTarget = "Shikrik";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 307.11401367188, -4839.91015625, 10.524313926697;
				script_getSpells.trainerTarget = "Swart";
			end
			-- Orgrimmar trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = 1933.6899414063, -4224.8598632813, 42.095062255859;
				script_getSpells.trainerTarget = "Kardris Dreamseeker";
			end
		end
		-- Tauren starter area
		if (GetFaction() == 6 and not b) or (script_getSpells:cowZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -2873.8798828125, -264.70901489258, 53.916400909424;
				script_getSpells.trainerTarget = "Meela Dawnstrider";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -2298.9599609375, -437.74200439453, -5.4384160041809;
				script_getSpells.trainerTarget = "Narm Skychaser";
			end
			-- TB trainer
			if (GetLocalPlayer():GetLevel() > 10) then
				vX, vY, vZ = -980.84100341797, 287.17401123047, 137.59028625488;
				script_getSpells.trainerTarget = "Beram Skychaser";
			end
		end
	return vX, vY, vZ;

end

function script_getSpellsShaman:checkForSpellsNeededShaman()
local localObj = GetLocalPlayer();
	local myLevel = localObj:GetLevel();
	local myMoney = GetMoney();	-- copper...

	if (HasSpell("Lightning Bolt")) then
		if (myLevel >= 1) and (myMoney >= 10) and (not HasSpell("Rockbiter Weapon")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 4) and (myMoney >= 100) and (not HasSpell("Earth Shock")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 6) and (myMoney >= 300) and (not HasSpell("Earthbind Totem")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 8) and (myMoney >= 500) and (not HasSpell("Lightning Shield")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 10) and (myMoney >= 1200) and (not HasSpell("Strength of Earth Totem")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 12) and (myMoney >= 3200) and (not HasSpell("Ancestral Spirit")) then
			if (script_getSpells:run()) then
				return true;
			end
		-- no new spell
		--elseif (myLevel >= 14) and (myMoney >= 1800) and (not HasSpell("")) then
		--	if (script_getSpells:run()) then
		--		return true;
		--	end
		elseif (myLevel >= 16) and (myMoney >= 5400) and (not HasSpell("Cure Poison")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 18) and (myMoney >= 10000) and (not HasSpell("Tremor Totem")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 20) and (myMoney >= 11000) and (not HasSpell("Lesser Healing Wave")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 22) and (myMoney >= 12000) and (not HasSpell("Poison Cleansing Totem")) then
			if (script_getSpells:run()) then
				return true;
			end
		else
			script_getSpells.getSpellsStatus = 0;
		end

	end
return false;
end
