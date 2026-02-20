grind2IsLootSafeToLoot = {

}

-- rest FIRST if targets are near loot, return true

function grind2IsLootSafeToLoot:isAnyTargetNearLoot(target)

	local lootTargetDistance = target:GetDistance();
	local lX, lY, lZ = target:GetPosition();

	local bestDist = 1000;

	local i, t = GetFirstObject();

	if grind2DoLoot.lootTarget ~= nil and grind2DoLoot.lootTarget ~= 0 then

		while i ~= 0 do

			-- type 3 is NPC
			if t == 3 then
				-- if not a totem and target can attack and not target is dead and not target is critter and distance is within aggro distance
				if not totemsList:isTargetTotem(i) and i:CanAttack() and not i:IsDead() and not i:IsCritter() and i:GetDistance() <= 20 then
					-- if the target is not my current loot target...
					if i:GetGUID() ~= grind2DoLoot.lootTarget:GetGUID() then
						-- if target is not players pet
						if not HasPet() or (HasPet() and i:GetGUID() ~= GetPet():GetGUID()) then

							local targetToCheck = i;

							local distanceToCheck = i:GetDistance()

							if bestDist > distanceToCheck then

								bestDist = i:GetDistance();

								local iX, iY, iZ = i:GetPosition();

								local aggro = i:GetLevel() - PlayerLevel() + 17.8;

								if GetRealmName() == "Kalidar" or GetRealmName() == "Ashen Vanilla" then
									aggro = i:GetLevel() - PlayerLevel() + 19.5;
								end

								-- a target is within aggro range of loot, return true
								if GetDistance3D(iX, iY, iZ, lX, lY, lZ) <= aggro then

									return true;
								end
							end
						end
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end

return false;
end