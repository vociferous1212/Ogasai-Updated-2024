script_getSpellsRogue = {}



function script_getSpellsRogue:getTrainerTargetRogue()

	local vX, vY, vZ = 0, 0, 0;
	local a = script_getSpells:deadZones();
	local b = script_getSpells:orcZones();
	local c = script_getSpells:gnomeZones();
	local d = script_getSpells:humanZones();
	local e = script_getSpells:elfZones();
	local f = script_getSpells:cowZones();



	-- get trainer position


		
	-- !!!! 	these need to all be put in a table to check from like hotspot distances 	!!!!!

		-- Gnomes starter area
		if ( (GetFaction() == 115 or GetFaction() == 3) and (not a and not b and not d and not e and not f)) or (script_getSpells:gnomeZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -6093.75, 404.91799926758, 395.53692626953;
				script_getSpells.trainerTarget = "Solm Hargrin";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -5604.4399414063, -540.32299804688, 399.09655761719;
				script_getSpells.trainerTarget = "Hogral Bakkan";
			end
			-- ironforge trainer
			if (GetLocalPlayer():GetLevel() >= 11) then
				vX, vY, vZ = -4648.419921875, -1131.7199707031, 508.55133056641;
				script_getSpells.trainerTarget = "Ormyr Flinteye";
			end
		end
		-- Human starter area
		if (GetFaction() == 1 and not a and not b and not c and not e and not f) or (script_getSpells:humanZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) or (script_getSpells:humanZones()) then
				vX, vY, vZ = -8863.4697265625, -210.9049987793, 80.572006225586;
				script_getSpells.trainerTarget = "Jorik Kerridan";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -9465.7900390625, 12.645400047302, 63.821369171143;
				script_getSpells.trainerTarget = "Keryn Sylvius";
			end
			-- stormwind trainer
			if (GetLocalPlayer():GetLevel() >= 11) then
				vX, vY, vZ = -8752.2998046875, 377.5719909668, 101.05635070801;
				script_getSpells.trainerTarget = "Osborne the Night Man";
			end
		end
		-- Night Elf starter area
		if (GetFaction() == 4 and not a and not b and not c and not d and not f) or (script_getSpells:elfZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) or (script_getSpells:elfZones()) then
				vX, vY, vZ = 10519.099609375, 778.01397705078, 1329.5992431641;
				script_getSpells.trainerTarget = "Frahun Shadewhisper";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 9790.3095703125, 943.86999511719, 1308.7780761719;
				script_getSpells.trainerTarget = "Jannok Breezesong";
			end
			-- Darnassus trainer
			if (GetLocalPlayer():GetLevel() >= 11) then
				vX, vY, vZ = 10083.700195313, 2546.8701171875, 1295.0402832031;
				script_getSpells.trainerTarget = "Syurna";
			end
		end
		-- Orc/troll starter area
		if ( (GetFaction() == 2 or GetFaction() == 116) and not a and not c and not d and not e and not f) or (script_getSpells:orcZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then				
				vX, vY, vZ = -588.70300292969, -4144.9399414063, 41.02010345459;
				script_getSpells.trainerTarget = "Rwag";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 268.13000488281, -4710.9399414063, 17.488662719727;
				script_getSpells.trainerTarget = "Kaplak";
			end
			-- Orgrimmar trainer
			if (GetLocalPlayer():GetLevel() >= 11) then
				vX, vY, vZ = 1771.2099609375, -4284.419921875, 7.7534546852112;
				script_getSpells.trainerTarget = "Shenthul";
			end
		end
		-- Undead starter area
		if (GetFaction() == 5 and not b and not c and not d and not e and not f) or (script_getSpells:deadZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = 1859.6500244141, 1563.3000488281, 94.306686401367;
				script_getSpells.trainerTarget = "David Trias";
			end
			if (GetLocalPlayer():GetLevel() >= 6 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 2271.0400390625, 242.99699401855, 41.114879608154;
				script_getSpells.trainerTarget = "Marion Call";
			end
			-- Undercity trainer
			if (GetLocalPlayer():GetLevel() >= 11) then				
				vX, vY, vZ = 1419.8000488281, 55.702098846436, -62.278587341309;
				script_getSpells.trainerTarget = "Miles Dexter";
			end
		end
	return vX, vY, vZ;

end





function script_getSpellsRogue:checkForSpellsNeededRogue()
	local localObj = GetLocalPlayer();
	local myLevel = localObj:GetLevel();
	local myMoney = GetMoney();	-- copper...

	if (HasSpell("Sinister Strike")) then
		if (myLevel >= 1) and (myMoney >= 10) and (not HasSpell("Stealth")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 4) and (myMoney >= 200) and (not HasSpell("Pick Pocket")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 6) and (myMoney >= 200) and (not HasSpell("Gouge")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 8) and (myMoney >= 400) and (not HasSpell("Evasion")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 10) and (myMoney >= 900) and (not HasSpell("Sap")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 12) and (myMoney >= 2400) and (not HasSpell("Kick")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 14) and (myMoney >= 3600) and (not HasSpell("Garrote")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 16) and (myMoney >= 7000) and (not HasSpell("Feint")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 18) and (myMoney >= 5800) and (not HasSpell("Ambush")) then
			if (script_getSpells:run()) then
				return true;
			end

		-- rogue needs to do poison quest...
		elseif (myLevel >= 20) and (myMoney >= 12000) and (not HasSpell("Rupture")) and (HasSpell("Poisons")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 22) and (myMoney >= 16000) and (not HasSpell("Vanish")) and (HasSpell("Poisons")) then
			if (script_getSpells:run()) then
				return true;
			end
		else
			script_getSpells.getSpellsStatus = 0;
		end

	end
return false;
end