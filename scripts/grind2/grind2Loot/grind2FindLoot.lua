grind2FindLoot = {

}

function grind2FindLoot:target(lootRadius)

	if IsAnyTargetTargetingPlayer() or not grind2.lootTargets then

		return nil;
	end

	local i, t = GetFirstObject();

	local bestDist = lootRadius;

	local bestTarget = nil;

	while i ~= 0 do

		if t == 3 then

			if i:IsDead() and i:IsLootable() and not grind2BlacklistLoot:isLootTargetBlacklisted(i:GetGUID()) then

				local dist = i:GetDistance();

				if (dist < lootRadius and bestDist > dist) then

					bestDist = dist;

					bestTarget = i;

				end
			end
		end

	i, t = GetNextObject(i);
	end

return bestTarget;
end