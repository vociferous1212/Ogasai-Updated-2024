script_rogueSetup = {}

function script_rogueSetup:setup()

	script_rogue.waitTimer = GetTimeEX();
	script_rogue.riposteTimer = GetTimeEX();


	local localObj = GetLocalPlayer();
	
	if GetNumPartyMembers() ~= 0 then
		script_rogue.useThrow = false;
	end

	-- set backstab as opener
	if (localObj:GetLevel() < 10) and (HasSpell("Backstab")) then
		script_rogue.stealthOpener = "Backstab";
	end
	-- set garrote as opener
	if (not HasSpell("Ambush")) and (HasSpell("Garrote")) and (localObj:GetLevel() >= 10) then
		script_rogue.stealthOpener = "Garrote";
	end
	-- set ambush as opener
	if (HasSpell("Ambush")) and (not HasSpell("Riposte") or HasSpell("Ghostly Strike")) then
		script_rogue.stealthOpener = "Ambush";
	end
	-- use garrote if we do not have cheapshot and have riposte, instead of ambush
	if (HasSpell("Riposte")) and (not HasSpell("Cheap Shot")) then
		script_rogue.stealthOpener = "Garrote";
	end
	-- set cheapshot as opener
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

	if (localObj:GetLevel() < 6) then
		script_rogue.eatHealth = 55;
		script_rogue.useThrow = false;
	end
	if localObj:GetLevel() >= 40 then
		script_rogue.eatHealth = 45;
		script_rogue.evasionHealth = 35;
		script_rogue.adrenRushComboHP = 30;
	end
	if (localObj:GetLevel() >= 20) and (HasSpell("Poisons")) then
		script_rogue.usePoison = true;
	end

	if not (HasSpell("Slice and Dice")) then
		script_rogue.useSliceAndDice = false;
	end
	if (not HasSpell("Stealth")) then
		script_rogue.useStealth = false;
	end

	-- check for spent talent points
	if GetLocalPlayer():GetLevel() >= 10 then
		script_grindCheckSpentTalentPoints:checkSpentTalentPoints()
	end

	if GetRealmName() == "Permadeath - EU" then
		script_rogue.eatHealth = 70;
	end
	
	script_rogue.isSetup = true;
end