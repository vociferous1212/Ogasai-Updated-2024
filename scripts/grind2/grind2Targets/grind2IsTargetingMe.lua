grind2IsTargetingMe = {


}

function grind2IsTargetingMe:target(i)
			
	if i:GetUnitsTarget() ~= nil and i:GetUnitsTarget() ~= 0 then

		if i:GetUnitsTarget():GetGUID() == GetLocalPlayer():GetGUID() then

			return true;
		end
	end

return false;
end