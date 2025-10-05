script_paladinCheckAura = {}

function script_paladinCheckAura:checkAura()

	if script_paladin.devoAura and HasSpell("Devotion Aura") and not GetLocalPlayer():HasBuff("Devotion Aura") then
		CastSpellByName("Devotion Aura");
		return true;
	end
	if script_paladin.retAura and HasSpell("Retribution Aura") and not GetLocalPlayer():HasBuff("Retribution Aura") then
		CastSpellByName("Retribution Aura");
		return true;
	end
	if script_paladin.sancAura and HasSpell("Sanctity Aura") and not GetLocalPlayer():HasBuff("Sancitiy Aura") then
		CastSpellByName("Sanctity Aura");
		return true;
	end
return false;
end