grind2IsLootSafeToLoot = {

}

-- rest FIRST if targets are near loot, return true

function grind2IsLootSafeToLoot:anyTargetNearLoot(target)

	local lootTargetDistance = target:GetDistance();
	local lX, lY, lZ = target:GetPosition();

	local i, t = GetFirstObject();

	while i ~= 0 do

		if t == 3 and not i:IsDead() and not i:IsCritter() and i:GetDistance() <= 20 then

			local targetToCheck = i;
			local iX, iY, iZ = i:GetPosition();

			local aggro = i:GetLevel() - GetLocalPlayer():GetLevel() + 16;

			if GetDistance3D(iX, iY, iZ, lX, lY, lZ) <= aggro then
				return true;
			end
		end
	i, t = GetNextObject(i);
	end

return false;
end