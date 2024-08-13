script_getSpellsWarrior = {}

function script_getSpellsWarrior:getTrainerTargetWarrior()

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
				vX, vY, vZ = -6084.7700195313, 382.14099121094, 395.54364013672;
				script_getSpells.trainerTarget = "Thran Khorman";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -5605.7299804688, -530.38500976563, 399.65490722656;
				script_getSpells.trainerTarget = "Granis Swiftaxe";
			end
			-- ironforge trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = -5035.669921875, -1234.6400146484, 507.75198364258;
				script_getSpells.trainerTarget = "Bilban Tosslespanner";
			end
		end
		-- Human starter area
		if (GetFaction() == 1 and not a and not b and not c and not e and not f) or (script_getSpells:humanZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -8918.3603515625, -208.4109954834, 82.125961303711;
				script_getSpells.trainerTarget = "Llane Beshere";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -9461.849609375, 109.35299682617, 57.695423126221;
				script_getSpells.trainerTarget = "Lyria Du Lac";
			end
			-- stormwind trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = -8705.41015625, 329.58999633789, 111.68900299072;
				script_getSpells.trainerTarget = "Ander Germaine";
			end
		end
		-- Night Elf starter area
		if (GetFaction() == 4 and not a and not b and not c and not d and not f) or (script_getSpells:elfZones()) then
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
		if ( (GetFaction() == 2 or GetFaction() == 116) and not a and not c and not d and not e and not f) or (script_getSpells:orcZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -639.34399414063, -4230.1899414063, 38.134117126465;
				script_getSpells.trainerTarget = "Frang";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 311.35198974609, -4827.7900390625, 9.5797252655029;
				script_getSpells.trainerTarget = "Tarshaw Jaggedscar";
			end
			-- Orgrimmar trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = 1970.9499511719, -4808.169921875, 56.765071868896;
				script_getSpells.trainerTarget = "Sorek";
			end
		end
		-- Undead starter area
		if (GetFaction() == 5 and not b and not c and not d and not e and not f) or (script_getSpells:deadZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = 1862.4599609375, 1556.3299560547, 94.778495788574;
				script_getSpells.trainerTarget = "Dannal Stern";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 2254.7600097656, 238.44500732422, 33.633785247803;
				script_getSpells.trainerTarget = "Austil de Mon";
			end
			-- Undercity trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = 1780.4599609375, 422.93200683594, -57.19747543335;
				script_getSpells.trainerTarget = "Christoph Walker";
			end
		end
		-- Tauren starter area
		if (GetFaction() == 6 and not a and not b and not c and not d and not e) or (script_getSpells:cowZones()) then
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

function script_getSpellsWarrior:checkForSpellsNeededWarrior()
	local localObj = GetLocalPlayer();
	local myLevel = localObj:GetLevel();
	local myMoney = GetMoney();	-- copper...

	if (HasSpell("Heroic Strike")) then
		if (myLevel >= 1) and (myMoney >= 10) and (not HasSpell("Battle Shout")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 4) and (myMoney >= 200) and (not HasSpell("Rend")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 6) and (myMoney >= 200) and (not HasSpell("Thunder Clap")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 8) and (myMoney >= 400) and (not HasSpell("Hamstring")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 10) and (myMoney >= 1200) and (not HasSpell("Bloodrage")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 12) and (myMoney >= 3000) and (not HasSpell("Shield Bash")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 14) and (myMoney >= 3000) and (not HasSpell("Revenge")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 16) and (myMoney >= 6000) and (not HasSpell("Shield Block")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 18) and (myMoney >= 6000) and (not HasSpell("Disarm")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 20) and (myMoney >= 12000) and (not HasSpell("Cleave")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 22) and (myMoney >= 12000) and (not HasSpell("Intimidating Shout")) then
			if (script_getSpells:run()) then
				return true;
			end
		else
			script_getSpells.getSpellsStatus = 0;
		end

	end
return false;
end
