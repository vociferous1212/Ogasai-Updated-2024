script_rogueSetup = {}

function script_rogueSetup:setup()

	script_rogue.waitTimer = GetTimeEX();

	script_rogue.useStealth = true; 
	
	if GetNumPartyMembers() ~= 0 then
		script_rogue.useThrow = false;
	end

	--set backstab as opener
	if (GetLocalPlayer():GetLevel() < 10) and (HasSpell("Backstab")) then
		script_rogue.stealthOpener = "Backstab";
	end
	if (not HasSpell("Ambush")) and (HasSpell("Garrote")) and (GetLocalPlayer():GetLevel() >= 10) then
		script_rogue.stealthOpener = "Garrote";
	end
	if (HasSpell("Ambush")) and (not HasSpell("Riposte") or HasSpell("Ghostly Strike")) then
		script_rogue.stealthOpener = "Ambush";
	end
	if (HasSpell("Riposte")) and (not HasSpell("Cheap Shot")) then
		script_rogue.stealthOpener = "Garrote";
	end
	if (HasSpell("Cheap Shot")) and (not HasSpell("Ghostly Strike")) then
		script_rogue.stealthOpener = "Cheap Shot";
	end

	if (not HasSpell("Adrenaline Rush")) then
		script_rogue.adrenRushCombo = false;
		script_rogue.enableAdrenRush = false;
	end

	if (not HasSpell("Blade Flurry")) then
		script_rogue.enableBladeFlurry = false;
	end

	-- Set Hemorrhage as default CP builder if we have it
	if (HasSpell("Hemorrhage")) then
		script_rogue.cpGenerator = "Hemorrhage";
	end

	-- DOES NOT RECOGNIZE TALENT POINTS
	-- Set the energy cost for the CP builder ability (does not recognize talent e.g. imp. sinister strike)
	_, _, _, _, script_rogue.cpGeneratorCost = GetSpellInfo(script_rogue.cpGenerator);

	-- set sinister strike cost to 40 if we have riposte in talent tree.... fall back for getspellinfo
	if (HasSpell("Riposte")) then
		script_rogue.cpGeneratorCost = 40;
	end

	if (GetLocalPlayer():GetLevel() < 6) then
		script_rogue.eatHealth = 55;
		script_rogue.useThrow = false;
	end
	if (GetLocalPlayer():GetLevel() >= 20) and (HasSpell("Poisons")) then
		script_rogue.usePoison = true;
	end
	
	script_rogue.isSetup = true;
end