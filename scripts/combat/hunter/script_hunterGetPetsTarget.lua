script_hunterGetPetsTarget = {

}

function script_hunterGetPetsTarget:run()

	local target = nil;

	if HasPet() and PetHasTarget() then

		if not GetPet():IsDead() and IsInCombat() then

			local i, t = GetFirstObject();

			while i ~= 0 do

				if t == 3 or t == 4 then

					if GetPet():GetUnitsTarget():GetGUID() == i:GetGUID() then

						target = i;
					end
				end

			i, t = GetNextObject(i);
			end
		end
	end

return target;
end
