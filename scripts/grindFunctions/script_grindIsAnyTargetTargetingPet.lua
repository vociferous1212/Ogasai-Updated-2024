script_grindIsAnyTargetTargetingPet = {}


-- Return a target targeting pet

function script_grindIsAnyTargetTargetingPet:isAnyTargetTargetingPet()

	if GetPet() ~= nil and GetPet() ~= 0 then

		local i, targetType = GetFirstObject();

		while i ~= 0 do
			if (targetType == 3) then

				
				-- limit the check by distance... anything over 40 yards must move closer...
				if i:GetDistance() <= 60 then
					
					-- some servers return 0 when unit target has no target so AND ~= nil
					if (i:GetUnitsTarget() ~= 0 and i:GetUnitsTarget() ~= nil) then

						-- if target is targeting my guid
						if i:GetUnitsTarget():GetGUID() == GetPet():GetGUID() then 

							return true;
						end
					end
				end
			end	
		i, targetType = GetNextObject(i);
		end
	end
return false;
end