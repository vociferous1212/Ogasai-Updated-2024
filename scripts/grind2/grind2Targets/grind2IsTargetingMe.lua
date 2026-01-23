grind2IsTargetingMe = {


}

function grind2IsTargetingMe:target(i)
			
	if not i:IsDead() then
		if i:GetUnitsTarget() ~= nil and i:GetUnitsTarget() ~= 0 then

			if i:GetUnitsTarget():GetGUID() == GetLocalPlayer():GetGUID() then

				return true;
			end
		end
	end

return false;
end