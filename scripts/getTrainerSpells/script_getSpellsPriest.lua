script_getSpellsPriest = {}

function script_getSpellsPriest:getTrainerTargetPriest()
	local vX, vY, vZ = 0, 0, 0;

	local a = script_getSpells:deadZones();
	local b = script_getSpells:orcZones();
	local c = script_getSpells:gnomeZones();
	local d = script_getSpells:humanZones();
	local e = script_getSpells:elfZones();
	local f = script_getSpells:cowZones();

	-- get trainer position
		
	-- !!!! 	these need to all be put in a table to check from like hotspot distances 	!!!!!

		-- Gnome/dwarf starter area
		if ( (GetFaction() == 115 or GetFaction() == 3) and (not a and not b and not d and not e and not f)) or (script_getSpells:gnomeZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -6056.740234375, 393.54800415039, 392.75955200195;
				script_getSpells.trainerTarget = "Branstock Khalder";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then			
				vX, vY, vZ = -5590.5600585938, -529.65698242188, 399.65194702148;
				script_getSpells.trainerTarget = "Maxan Anvol";
			end
			-- ironforge trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = -4607.6298828125, -926.90100097656, 501.0710144043;
				script_getSpells.trainerTarget = "High Priest Rohan";
			end
		end
		-- Human starter area
		if (GetFaction() == 1 and not a and not b and not c and not e and not f) or (script_getSpells:humanZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -8853.58984375, -193.33599853516, 81.932304382324;
				script_getSpells.trainerTarget = "Priestess Anetta";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -9460.75, 33.133800506592, 63.820713043213;
				script_getSpells.trainerTarget = "Priestess Josetta";
			end
			-- stormwind trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = -8519.5595703125, 862.82800292969, 109.82797241211;
				script_getSpells.trainerTarget = "Brother Joshua";
			end
		end
		-- Night Elf starter area
		if (GetFaction() == 4 and not a and not b and not c and not d and not f) or (script_getSpells:elfZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = 10458.799804688, 801.62298583984, 1346.7547607422;
				script_getSpells.trainerTarget = "Shanda";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 9905.4404296875, 985.43298339844, 1313.83203125;
				script_getSpells.trainerTarget = "Laurna Morninglight";
			end
			-- Darnassus trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = 9654.4296875, 2537.3200683594, 1331.51953125;
				script_getSpells.trainerTarget = "Jandria";
			end
		end
		-- Orc/troll starter area
		if ( (GetFaction() == 2 or GetFaction() == 116) and not a and not c and not d and not e and not f) or (script_getSpells:orcZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -617.39501953125, -4202.3999023438, 38.134056091309;
				script_getSpells.trainerTarget = "Ken'jai";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 294.88400268555, -4831.490234375, 10.524134635925;
				script_getSpells.trainerTarget = "Tai'jin";
			end
			-- Orgrimmar trainer
			if (GetLocalPlayer():GetLevel() >= 10) then				
				vX, vY, vZ = 1452.4300537109, -4179.8198242188, 44.050174713135;
				script_getSpells.trainerTarget = "Ur'kyo";
			end
		end
		-- Undead starter area
		if (GetFaction() == 5 and not b and not c and not d and not e and not f) or (script_getSpells:deadZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = 1848.3199462891, 1627.6300048828, 96.933753967285;
				script_getSpells.trainerTarget = "Dark Cleric Duesten";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 2265.1999511719, 251.05400085449, 41.114849090576;
				script_getSpells.trainerTarget = "Dark Cleric Beryl";
			end
			-- Undercity trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = 1776.2800292969, 399.61199951172, -57.214412689209;
				script_getSpells.trainerTarget = "Father Lankester";
			end
		end
	return vX, vY, vZ;

end

function script_getSpellsPriest:checkForSpellsNeededPriest()

local localObj = GetLocalPlayer();
	local myLevel = localObj:GetLevel();
	local myMoney = GetMoney();	-- copper...

	if (HasSpell("Smite")) then
		if (myLevel >= 1) and (myMoney >= 10) and (not HasSpell("Power Word: Fortitude")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 4) and (myMoney >= 200) and (not HasSpell("Shadow Word: Pain")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 6) and (myMoney >= 200) and (not HasSpell("Power Word: Shield")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 8) and (myMoney >= 400) and (not HasSpell("Fade")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 10) and (myMoney >= 1200) and (not HasSpell("Mind Blast")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 12) and (myMoney >= 2400) and (not HasSpell("Inner Fire")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 14) and (myMoney >= 4800) and (not HasSpell("Psychic Scream")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 16) and (myMoney >= 3200) and (not HasSpell("Heal")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 18) and (myMoney >= 6000) and (not HasSpell("Dispel Magic")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 20) and (myMoney >= 21000) and (not HasSpell("Mind Soothe")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 22) and (myMoney >= 24000) and (not HasSpell("Mind Vision")) then
			if (script_getSpells:run()) then
				return true;
			end
		else
			script_getSpells.getSpellsStatus = 0;
		end

	end
return false;
end
