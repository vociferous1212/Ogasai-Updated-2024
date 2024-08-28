script_getSpellsWarlock = {}

function script_getSpellsWarlock:getTrainerTargetWarlock()

	local vX, vY, vZ = 0, 0, 0;
	local a = script_getSpells:deadZones();
	local b = script_getSpells:orcZones();
	local c = script_getSpells:gnomeZones();
	local d = script_getSpells:humanZones();

	-- get trainer position
		
	-- !!!! 	these need to all be put in a table to check from like hotspot distances 	!!!!!

			

		-- Undead starter area
		if (GetFaction() == 5 and not b and not c and not d) or (script_getSpells:deadZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = 1839.0300292969, 1636.5400390625, 96.933532714844;
				script_getSpells.trainerTarget = "Maximillion";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 2259.0500488281, 250.31700134277, 41.114887237549;
				script_getSpells.trainerTarget = "Rupert Boch";
			end
			-- Undercity trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = 1776.4000244141, 20.254299163818, -47.388172149658;
				script_getSpells.trainerTarget = "Richard Kerwin";
			end
		end

		-- Gnomes starter area
		if ( (GetFaction() == 115 or GetFaction() == 3) and (not a and not b and not d)) or (script_getSpells:gnomeZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -6048.7900390625, 391.07900292969, 398.9580078125;
				script_getSpells.trainerTarget = "Alamar Grimm";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -5640, -528.80102539063, 404.29623413086;
				script_getSpells.trainerTarget = "Gimrizz Shadowcog";
			end
			-- ironforge trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = -4599.080078125, -1111.6700439453, 504,93862915039;
				script_getSpells.trainerTarget = "Briarthorn";
			end
		end			
		-- Human starter area
		if (GetFaction() == 1 and not a and not b and not c) or (script_getSpells:humanZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -8926.740234375, -195.5890045166, 80.588554382324;
				script_getSpells.trainerTarget = "Drusilla La Salle";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -9472.7998046875, -5.3266100883484, 49.794696807861;
				script_getSpells.trainerTarget = "Maximillian Crowe";
			end
			-- stormwind trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = -8971.0498046875, 1029.9000244141, 101.40431213379;
				script_getSpells.trainerTarget = "Ursula Deline";
			end
		end
		-- Orc/troll starter area
		if ( (GetFaction() == 2 or GetFaction() == 116) and not a and not c and not d) or (script_getSpells:orcZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -639.34399414063, -4230.1899414063, 38.134117126465;
				script_getSpells.trainerTarget = "Frang";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 356.19198608398, -4837.9501953125, 11.089032173157;
				script_getSpells.trainerTarget = "Dhugru Gorelust";
			end
			-- Orgrimmar trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = 1848.9599609375, -4360.4301757813, -14.943470954895;
				script_getSpells.trainerTarget = "Zevrost";
			end
		end
	return vX, vY, vZ;

end

function script_getSpellsWarlock:checkForSpellsNeededWarlock()
	local localObj = GetLocalPlayer();
	local myLevel = localObj:GetLevel();
	local myMoney = GetMoney();	-- copper...

	if (HasSpell("Shadow Bolt")) then
		if (myLevel >= 1) and (myMoney >= 10) and (not HasSpell("Immolate")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 4) and (myMoney >= 200) and (not HasSpell("Corruption")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 6) and (myMoney >= 200) and (not HasSpell("Life Tap")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 8) and (myMoney >= 400) and (not HasSpell("Fear")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 10) and (myMoney >= 1200) and (not HasSpell("Drain Soul")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 12) and (myMoney >= 1800) and (not HasSpell("Health Funnel")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 14) and (myMoney >= 2700) and (not HasSpell("Drain Life")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 16) and (myMoney >= 2400) and (not HasSpell("Unending Breath")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 18) and (myMoney >= 4500) and (not HasSpell("Searing Pain")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 20) and (myMoney >= 12000) and (not HasSpell("Rain of Fire")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 22) and (myMoney >= 10000) and (not HasSpell("Eye of Kilrogg")) then
			if (script_getSpells:run()) then
				return true;
			end
		else
			script_getSpells.getSpellsStatus = 0;
		end

	end
return false;
end
