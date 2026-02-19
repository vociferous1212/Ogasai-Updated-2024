script_paladinSetup = {}

function script_paladinSetup:setup()

	local localObj = GetLocalPlayer();

	if (not HasSpell("Retribution Aura")) then

		script_paladin.devoAura = true;

	--elseif (HasSpell("Retribution Aura")) then

	--	script_paladin.devoAura = false;
	--	script_paladin.retAura = true;
	end

	-- blessing of kings
	if HasSpell("Blessing of Kings") then

		script_paladin.kings = true;

	-- Blessing of wisdom
	elseif (HasSpell("Blessing of Wisdom")) then

		script_paladin.wisdom = true;

	--Blessing of might
	elseif (HasSpell("Blessing of Might")) then

		script_paladin.might = true;

	end

	--set holy light health no flash of light
	if (not HasSpell("Flash of Light")) then

		script_paladin.holyLightHealth = 55;

	end

	script_paladin.waitTimer = GetTimeEX();

	script_paladinCastHolyLight.holyLightTimer = GetTimeEX();
	
	-- check for spent talent points
	if GetLocalPlayer():GetLevel() >= 10 then

		script_grindCheckSpentTalentPoints:checkSpentTalentPoints()

	end

	if GetRealmName() == "Permadeath - EU" then

		script_paladin.holyLightHealth = 65;
	end

	script_paladin.isSetup = true;
end