script_getSpellsPaladin = {}

function script_getSpellsPaladin:getTrainerTargetPaladin()

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
		if (GetFaction() == 1 and not a and not b and not c and not e and not f) or (script_getSpells:humanZones()) then
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

