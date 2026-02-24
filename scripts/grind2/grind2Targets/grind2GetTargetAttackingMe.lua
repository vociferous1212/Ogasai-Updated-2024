grind2GetTargetAttackingMe = {

}

function grind2GetTargetAttackingMe:run()

	local bestDist = 1000;

	local target = nil;

	local i, t = GetFirstObject();

	while i ~= 0 do

		if t == 3 and not i:IsDead() and i:CanAttack() then

			if i:GetUnitsTarget() ~= 0 and i:GetUnitsTarget() ~= nil then
			
				if (i:GetUnitsTarget():GetGUID() == GetLocalPlayer():GetGUID())
				or (GetPet() ~= nil and GetPet() ~= 0 and i:GetUnitsTarget():GetGUID() == GetPet():GetGUID()) and not totemsList:isTargetTotem(i) then

					local dist = i:GetDistance();

					if bestDist > dist then
						
						bestDist = dist;

						if bestDist <= dist then
					
							target = i;
						end
					end
				end
			end
		end

	i, t = GetNextObject(i);
	end

return target;
end