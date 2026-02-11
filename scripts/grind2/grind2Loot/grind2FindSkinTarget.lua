grind2FindSkinTarget = {

}

function grind2FindSkinTarget:target(lootRadius)

	if IsAnyTargetTargetingPlayer() or not grind2.lootTargets then

		return nil;
	end
		
	local i, t = GetFirstObject();

	local bestDist = 1000;

	local bestTarget = nil;

	while i ~= 0 do

		if t == 3 then

			if i:IsDead() and not i:IsCritter() then

				if i:IsSkinnable() and not i:IsLootable() and grind2CanSkinTarget:target(i) and not grind2BlacklistLoot:isLootTargetBlacklisted(i:GetGUID()) then

					local dist = i:GetDistance();

					if dist < lootRadius and bestDist > dist then

						bestDist = dist;

						bestTarget = i;
					end
				end
			end
		end

	i, t = GetNextObject(i);
	end

return bestTarget;
end