script_paladinCheckAura = {retAura = false}

function script_paladinCheckAura:checkAura()

	if script_paladin.devoAura and HasSpell("Devotion Aura") and not GetLocalPlayer():HasBuff("Devotion Aura") and not IsSpellOnCD("Devotion Aura") then
		CastSpellByName("Devotion Aura");
		return true;
	end
	if script_paladin.retAura and HasSpell("Retribution Aura") and not GetLocalPlayer():HasBuff("Retribution Aura") and not IsSpellOnCD("Retribution Aura") then
		CastSpellByName("Retribution Aura");
		return true;
	end
	if script_paladin.sancAura and HasSpell("Sanctity Aura") and not GetLocalPlayer():HasBuff("Sancitiy Aura") and not IsSpellOnCD("Sanctity Aura") then
		CastSpellByName("Sanctity Aura");
		return true;
	end
return false;
end

function script_paladinCheckAura:changeAuraInCombat()

	if not IsInCombat() and self.retAura and not GetLocalPlayer():HasBuff("Retribution Aura") and not IsSpellOnCD("Retribution Aura") then
		if CastSpellByName("Retribution Aura") then
			self.retAura = false;
		end
	end

	if script_paladin.retAura and not self.retAura then
		if GetLocalPlayer():GetHealthPercentage() <= 25 and GetLocalPlayer():GetManaPercentage() <= 25 and IsInCombat() and not IsSpellOnCD("Devotion Aura") then
			if CastSpellByName("Devotion Aura") then
				self.retAura = true;
			end
		end
	end
end
