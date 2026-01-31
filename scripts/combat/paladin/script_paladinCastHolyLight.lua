script_paladinCastHolyLight = {

	holyLightTimer = 0;
}

function script_paladinCastHolyLight:castHolyLight(localObj)
	if (self.holyLightTimer > GetTimeEX()) then
		return;
	end
	if (HasSpell("Holy Light")) then
		if (not IsSpellOnCD("Holy Light")) then
			if (not IsMoving()) and (IsStanding()) then
				if (not IsCasting()) and (not IsChanneling()) then
					if (CastSpellByName("Holy Light", localObj)) then
						self.holyLightTimer = GetTimeEX() + 4500;
						script_paladin.waitTimer = GetTimeEX() + 2500;
						script_grind:setWaitTimer(2500);
						return false;
					end
				end
			end
		end
	end
return false;
end