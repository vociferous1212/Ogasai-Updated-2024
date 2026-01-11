grind2IsTargetingPet = {


}

function grind2IsTargetingPet:target(i)

	local pet = GetPet();

	if pet ~= nil and pet ~= 0 then

		if i:GetUnitsTarget() ~= nil and i:GetUnitsTarget() ~= 0 then

			if i:GetUnitsTarget():GetGUID() == pet:GetGUID() then

				return true;
			end
		end
	end

return false;
end