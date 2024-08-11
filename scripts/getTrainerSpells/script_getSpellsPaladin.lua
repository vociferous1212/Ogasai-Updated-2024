script_getSpellsPaladin = {}

function script_getSpellsPaladin:getTrainerTargetPaladin()

	local vX, vY, vZ = 0, 0, 0;

	-- get trainer position
		
	-- !!!! 	these need to all be put in a table to check from like hotspot distances 	!!!!!

		-- Gnome/dwarf starter area
		if (GetFaction() == 115) or (GetFaction() == 3) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -6120.6801757813, 382.08898925781, 395.54284667969;
				script_getSpells.trainerTarget = "Bromos Grummner";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -5586.759765625, -542.16302490234, 403.54095458984;
				script_getSpells.trainerTarget = "Azar Stronghammer";
			end
			-- ironforge trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = -4601.6499023438, -896.46801757813, 502.76681518555;
				script_getSpells.trainerTarget = "Brandur Ironhammer";
			end
		end
		-- Human starter area
		if (GetFaction() == 1) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -8914.5703125, -215.01600646973, 82.116622924805;
				script_getSpells.trainerTarget = "Brother Sammuel";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -9468.1396484375, 108.9759979248, 57.477275848389;
				script_getSpells.trainerTarget = "Brother Wilhelm";
			end
			-- stormwind trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = -8577.5, 881.46600341797, 106.51903533936;
				script_getSpells.trainerTarget = "Lord Grayson Shadowbreaker";
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
		if (GetFaction() == 5) then
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

function script_getSpellsPaladin:checkForSpellsNeededPaladin()


local localObj = GetLocalPlayer();
	local myLevel = localObj:GetLevel();
	local myMoney = GetMoney();	-- copper...

	if (HasSpell("Seal of Righteousness")) then
		if (myLevel >= 1) and (myMoney >= 10) and (not HasSpell("Devotion Aura")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 4) and (myMoney >= 200) and (not HasSpell("Judgement")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 6) and (myMoney >= 300) and (not HasSpell("Seal of the Crusader")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 8) and (myMoney >= 300) and (not HasSpell("Hammer of Justice")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 10) and (myMoney >= 1200) and (not HasSpell("Blessing of Protection")) then
			if (script_getSpells:run()) then
				return true;
			end
		--elseif (myLevel >= 12) and (myMoney >= 2000) and (not HasSpell("")) then
		--	if (script_getSpells:run()) then
		--		return true;
		--	end
		elseif (myLevel >= 14) and (myMoney >= 4000) and (not HasSpell("Blessing of Wisdom")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 16) and (myMoney >= 6000) and (not HasSpell("Retribution Aura")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 18) and (myMoney >= 10500) and (not HasSpell("Blessing of Freedom")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 20) and (myMoney >= 12000) and (not HasSpell("Flash of Light")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 22) and (myMoney >= 20000) and (not HasSpell("Seal of Justice")) then
			if (script_getSpells:run()) then
				return true;
			end
		else
			script_getSpells.getSpellsStatus = 0;
		end

	end
return false;
end

