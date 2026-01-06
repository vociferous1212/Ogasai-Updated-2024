script_paladinCastFlashOfLight = {

	healthFull = true


}

function script_paladinCastFlashOfLight:castFlashOfLight()

	if GetLocalPlayer():GetHealthPercentage() >= 85 then
		self.healthFull = true;
	end

	-- cast flash of light and return until health is full
	if not self.healthFull then

		if HasSpell("Flash of Light") and GetLocalPlayer():GetManaPercentage() >= 7 then
		
			if CastSpellByName("Flash of Light", GetLocalPlayer()) then
				return true;
			end

		return;
		end
	end

return false;
end