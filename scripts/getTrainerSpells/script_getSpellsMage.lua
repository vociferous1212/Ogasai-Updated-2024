script_getSpellsMage = {}

function script_getSpellsMage:getTrainerTargetMage()

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
				vX, vY, vZ = -6056.08984375, 388.17498779297, 392.76116943359;
				script_getSpells.trainerTarget = "Marryk Nurribit";
			end
			if (GetLocalPlayer():GetLevel() >= 7 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -5586.9399414063, -537.17297363281, 403.54071044922;
				script_getSpells.trainerTarget = "Magis Sparkmantle";
			end
			-- ironforge mage trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = -4604.9399414063, -921.48901367188, 501.07345581055;
				script_getSpells.trainerTarget = "Juli Stormkettle";
			end
		end
		-- Human starter area
		if (GetFaction() == 1 and not a and not b and not c and not e and not f) or (script_getSpells:humanZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -8851.5703125, -188.23399353027, 89.314559936523;
				script_getSpells.trainerTarget = "Khelden Bremen";
			end
			if (GetLocalPlayer():GetLevel() >= 7 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -9471.669921875, 34.451000213623, 63.820621490479;
				script_getSpells.trainerTarget = "Zaldimar Wefhellt";
			end
			-- stormwind trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = -9010.7802734375, 876.57501220703, 148.61874389648;
				script_getSpells.trainerTarget = "Elsharin";
			end
		end
		-- Orc/troll starter area
		if ( (GetFaction() == 2 or GetFaction() == 116) and not a and not c and not d and not e and not f) or (script_getSpells:orcZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = -625.29602050781, -4210.169921875, 38.134181976318;
				script_getSpells.trainerTarget = "Mai'ah";
			end
			if (GetLocalPlayer():GetLevel() >= 7 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = -839.28698730469, -4939.830078125, 20.990133285522;
				script_getSpells.trainerTarget = "Un'Thuwa";
			end
			-- Orgrimmar trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = 1468.1800537109, -4219.8798828125, 42.959217071533;
				script_getSpells.trainerTarget = "Deino";
			end
		end
		-- Undead starter area
		if (GetFaction() == 5 and not b and not c and not d and not e and not f) or (script_getSpells:deadZones()) then
			if (GetLocalPlayer():GetLevel() <= 6) then
				vX, vY, vZ = 1847.3900146484, 1635.5200195313, 96.933547973633;
				script_getSpells.trainerTarget = "Isabella";
			end
			if (GetLocalPlayer():GetLevel() >= 7 and GetLocalPlayer():GetLevel() <= 10) then
				vX, vY, vZ = 2256.8100585938, 233.21899414063, 41.114883422852;
				script_getSpells.trainerTarget = "Cain Firesong";
			end
			-- Undercity trainer
			if (GetLocalPlayer():GetLevel() >= 10) then
				vX, vY, vZ = 1813.7399902344, 56.413799285889, -47.387073516846;
				script_getSpells.trainerTarget = "Anastasia Hartwell";
			end
		end
	return vX, vY, vZ;
end

function script_getSpellsMage:checkForSpellsNeededMage()
	local localObj = GetLocalPlayer();
	local myLevel = localObj:GetLevel();
	local myMoney = GetMoney();	-- copper...

	if (HasSpell("Fireball")) then
		if (myLevel >= 1) and (myMoney >= 10) and (not HasSpell("Arcane Intellect")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 4) and (myMoney >= 200) and (not HasSpell("Frostbolt")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 7) and (myMoney >= 300) and (not HasSpell("Conjure Food")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 8) and (myMoney >= 700) and (not HasSpell("Polymorph")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 10) and (myMoney >= 1200) and (not HasSpell("Frost Nova")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 12) and (myMoney >= 1800) and (not HasSpell("Slow Fall")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 14) and (myMoney >= 2400) and (not HasSpell("Arcane Explosion")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 16) and (myMoney >= 2800) and (not HasSpell("Flamestrike")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 18) and (myMoney >= 5400) and (not HasSpell("Remove Lesser Curse")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 20) and (myMoney >= 18000) and (not HasSpell("Blizzard")) then
			if (script_getSpells:run()) then
				return true;
			end
		elseif (myLevel >= 22) and (myMoney >= 15000) and (not HasSpell("Frost Ward")) then
			if (script_getSpells:run()) then
				return true;
			end
		else
			script_getSpells.getSpellsStatus = 0;
		end

	end
return false;
end
