script_getSpellsWarlock = {}

function script_getSpellsWarlock:getTrainerTargetWarlock()

	local vX, vY, vZ = 0, 0, 0;

	-- get trainer position
		
	-- !!!! 	these need to all be put in a table to check from like hotspot distances 	!!!!!

		-- Gnomes starter area
		if (GetFaction() == 115) or (GetFaction() == 3) then
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
		if (GetFaction() == 1) then
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
		-- Night Elf starter area
		if (GetFaction() == 4) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = 10526.599609375, 778.08599853516, 1329.5993652344;
				script_getSpells.trainerTarget = "Alyissia";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 9822.23046875, 952.00701904297, 1308.7742919922;
				script_getSpells.trainerTarget = "Kyra Windblade";
			end
			-- Darnassus trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = 9992.009765625, 2316.9699707031, 1330.7905273438;
				script_getSpells.trainerTarget = "Arias'ta Bladesinger";
			end
		end
		-- Orc/troll starter area
		if (GetFaction() == 2) or (GetFaction() == 116) then
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
		-- Undead starter area
		if (GetFaction() == 5) then
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
		-- Tauren starter area
		if (GetFaction() == 6) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -2880.4299316406, -213.02000427246, 54.821006774902;
				script_getSpells.trainerTarget = "Harutt Thunderhorn";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -2347.9799804688, -495.92001342773, -9.0472869873047;
				script_getSpells.trainerTarget = "Krang Stonehoof";
			end
			-- TB trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = -1472.8699951172, -78.183898925781, 161.10205078125;
				script_getSpells.trainerTarget = "Sark Ragetotem";
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
		elseif (myLevel >= 18) and (myMoney >= 4500) and (not HasSpell("Curse of Agony")) then
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
