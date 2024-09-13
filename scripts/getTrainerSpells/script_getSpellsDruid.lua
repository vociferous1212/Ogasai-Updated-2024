script_getSpellsDruid = {}

function script_getSpellsDruid:getTrainerTargetDruid()

	local vX, vY, vZ = 0, 0, 0;
	local a = script_getSpells:deadZones();
	local b = script_getSpells:orcZones();
	local c = script_getSpells:gnomeZones();
	local d = script_getSpells:humanZones();
	local e = script_getSpells:elfZones();
	local f = script_getSpells:cowZones();


	-- get trainer position
		
	-- !!!! 	these need to all be put in a table to check from like hotspot distances 	!!!!!

		--stormwind has a druid trainer...
		if (GetFaction() == 1 and not a and not b and not c and not e and not f) or (script_getSpells:humanZones()) then
			vX, vY, vZ = 0, 0, 0;
			script_getSpells.trainerTarget = "Theridran";
		end
		-- Night Elf starter area
				-- faction elf and in elf zones so we can use stormwind trainer, too
		if (GetFaction() == 4 and not a and not b and not c and not d and not f) or (script_getSpells:elfZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then	
				vX, vY, vZ = 10464, 829.53802490234, 1380.9401855469;
				script_getSpells.trainerTarget = "Mardant Strongoak";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 9741.91015625, 966, 1293.6934814453;
				script_getSpells.trainerTarget = "Kal";
			end
			-- Darnassus trainer
			if (GetLocalPlayer():GetLevel() >= 11) then
				vX, vY, vZ = 10186.299804688, 2570.3798828125, 1325.9674072266;
				script_getSpells.trainerTarget = "Denatharion";
			end
		end
		-- Tauren starter area
		if (GetFaction() == 6 and not a and not b and not c and not d and not e) or (script_getSpells:cowZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -2873.5700683594, -268.59100341797, 53.916931152344;
				script_getSpells.trainerTarget = "Gart Mistrunner";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -2315.75, -442.63400268555, -5.4382953643799;
				script_getSpells.trainerTarget = "Gennia Runetotem";
			end
			-- TB trainer
			if (GetLocalPlayer():GetLevel() >= 11) then
				vX, vY, vZ = -980.84100341797, 287.17401123047, 137.59028625488;
				script_getSpells.trainerTarget = "Beram Skychaser";
			end
		end
	return vX, vY, vZ;

end

function script_getSpellsDruid:checkForSpellsNeededDruid()
local localObj = GetLocalPlayer();
	local myLevel = localObj:GetLevel();
	local myMoney = GetMoney();	-- copper...

	if (HasSpell("Wrath")) then
		if (myLevel >= 1) and (myMoney >= 10) and (not HasSpell("Mark of the Wild")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 4) and (myMoney >= 200) and (not HasSpell("Rejuvenation")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 6) and (myMoney >= 200) and (not HasSpell("Thorns")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 8) and (myMoney >= 400) and (not HasSpell("Entangling Roots")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 10) and (myMoney >= 1200) and (not HasSpell("Demoralizing Roar")) and (HasSpell("Bear Form")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 12) and (myMoney >= 1600) and (not HasSpell("Regrowth")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 14) and (myMoney >= 3600) and (not HasSpell("Bash")) and (HasSpell("Bear Form")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 16) and (myMoney >= 5400) and (not HasSpell("Swipe")) and (HasSpell("Bear Form")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 18) and (myMoney >= 7600) and (not HasSpell("Hibernate")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 20) and (myMoney >= 18000) and (not HasSpell("Rebirth")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 22) and (myMoney >= 15000) and (not HasSpell("Soothe Animal")) then
			if (script_getSpells:run()) then
				return true;
			end
		else
			script_getSpells.getSpellsStatus = 0;
		end

	end
return false;
end
