grind2IsLootSafeToLoot = {

}

-- rest FIRST if targets are near loot, return true

function grind2IsLootSafeToLoot:isAnyTargetNearLoot(target)

	local lootTargetDistance = target:GetDistance();
	local lX, lY, lZ = target:GetPosition();

	local i, t = GetFirstObject();

	if grind2DoLoot.lootTarget ~= nil and grind2DoLoot.lootTarget ~= 0 then

		while i ~= 0 do

			if t == 3 and not totemsList:isTargetTotem(i) and i:CanAttack() and not i:IsDead() and not i:IsCritter() and i:GetDistance() <= 20 and i:GetGUID() ~= grind2DoLoot.lootTarget:GetGUID() 
				and (not HasPet() or (HasPet() and i:GetGUID() ~= GetPet():GetGUID())) then

				local targetToCheck = i;

				local iX, iY, iZ = i:GetPosition();

				local aggro = i:GetLevel() - GetLocalPlayer():GetLevel() + 16;

				if GetDistance3D(iX, iY, iZ, lX, lY, lZ) < aggro then

					return true;
				end
			end
		i, t = GetNextObject(i);
		end
	end

return false;
end