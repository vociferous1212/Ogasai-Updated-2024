script_getSpellsHunter = {}

function script_getSpellsHunter:getTrainerTargetHunter()

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
				vX, vY, vZ = -6091.7900390625, 365.14099121094, 395.5400390625;
				script_getSpells.trainerTarget = "Thorgas Grimson";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -5618.5400390625, -454.0710144043, 407.65930175781;
				script_getSpells.trainerTarget = "Grif Wildheart";
			end
			-- ironforge trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = -5010.3901367188, -1274.0500488281, 507.75201416016;
				script_getSpells.trainerTarget = "Olmin Burningbeard";
			end
		end
		-- Night Elf starter area
		if (GetFaction() == 4 and not a and not b and not c and not d and not f) or (script_getSpells:elfZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = 10458.5, 827.86798095703, 1380.939453125;
				script_getSpells.trainerTarget = "Ayanna Everstride";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 9812.330078125, 928.80603027344, 1308.1091308594;
				script_getSpells.trainerTarget = "Dazalar";
			end
			-- Darnassus trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = 10178, 2511.0100097656, 1342.8723144531;
				script_getSpells.trainerTarget = "Jocaste";
			end
		end
		-- Orc/troll starter area
		if ( (GetFaction() == 2 or GetFaction() == 116) and not a and not c and not d and not e and not f) or (script_getSpells:orcZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -635.46197509766, -4227.5200195313, 38.133941650391;
				script_getSpells.trainerTarget = "Jen'shan";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 275.34100341797, -4704, 11.625081062317;
				script_getSpells.trainerTarget = "Thotar";
			end
			-- Orgrimmar trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = 2084.9599609375, -4623.7700195313, 58.593330383301;
				script_getSpells.trainerTarget = "Xor'juul";
			end
		end
		-- Tauren starter area
		if (GetFaction() == 6 and not a and not b and not c and not d and not e) or (script_getSpells:cowZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -2865.3999023438, -225.73100280762, 54.820751190186;
				script_getSpells.trainerTarget = "Lanka Farshot";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -2180.2199707031, -408.81600952148, -4.6015024185181;
				script_getSpells.trainerTarget = "Yaw Sharpmane";
			end
			-- TB trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = -1474.7600097656, -81.372299194336, 161.10191345215;
				script_getSpells.trainerTarget = "Holt Thunderhorn";
			end
		end
	return vX, vY, vZ;

end

function script_getSpellsHunter:checkForSpellsNeededHunter()

local localObj = GetLocalPlayer();
	local myLevel = localObj:GetLevel();
	local myMoney = GetMoney();	-- copper...

	if (HasSpell("Raptor Strike")) then
		if (myLevel >= 1) and (myMoney >= 10) and (not HasSpell("Track Beasts")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 4) and (myMoney >= 200) and (not HasSpell("Serpent Sting")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 6) and (myMoney >= 200) and (not HasSpell("Hunter's Mark")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 8) and (myMoney >= 600) and (not HasSpell("Concussive Shot")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 10) and (myMoney >= 1200) and (not HasSpell("Track Humanoids")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 12) and (myMoney >= 2400) and (not HasSpell("Wing Clip")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 14) and (myMoney >= 3600) and (not HasSpell("Scare Beast")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 16) and (myMoney >= 5400) and (not HasSpell("Mongoose Bite")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 18) and (myMoney >= 8000) and (not HasSpell("Track Undead")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 20) and (myMoney >= 13200) and (not HasSpell("Freezing Trap")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 22) and (myMoney >= 12000) and (not HasSpell("Scorpid Sting")) then
			if (script_getSpells:run()) then
				return true;
			end
		else
			script_getSpells.getSpellsStatus = 0;
		end

	end
return false;
end

