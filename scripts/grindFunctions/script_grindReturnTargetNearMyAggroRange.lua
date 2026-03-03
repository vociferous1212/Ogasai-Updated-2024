script_grindReturnTargetNearMyAggroRange = {}

-- attempt to blacklist nuetral targets and only attack unfriendly targets while moving hotspots - currently placeholding for gather checks
function script_grindReturnTargetNearMyAggroRange:returnTargetNearMyAggroRange()

	local i, t = GetFirstObject();

	local mx, my, mz = GetLocalPlayer():GetPosition();

	local tx, ty, tz = 0, 0, 0;

	local aggroTarget = nil;

	while i ~= 0 do

		if t == 3 or t == 4 then

			if i:GetDistance() <= 30 and i:CanAttack() and not i:IsDead() and not i:IsCritter() and i:IsInLineOfSight()
			and not script_grind:isTargetHardBlacklisted(i:GetGUID()) and not friendlyEnemiesList:isEnemyNuetral(i)
			
			then

				tx, ty, tz = i:GetPosition();

				local range = GetDistance3D(mx, my, mz, tx, ty, tz);

				local aggro = i:GetLevel() - GetLocalPlayer():GetLevel() + 19.5;

				if GetRealmName() == "Permadeath - EU" then

					aggro = i:GetLevel() - PlayerLevel() + 17.2;
					
					if PlayerLevel() <= 5 then
						aggro = i:GetLevel() - PlayerLevel() + 15;
					end
				end

				if GetRealmName() == "Kalidar" or GetRealmName() == "Ashen Vanilla" then
					aggro = i:GetLevel() - PlayerLevel() + 19.1;
				end

				if range <= aggro then

					aggroTarget = i;

				end
			end
		end
	i, t = GetNextObject(i);
	end
return aggroTarget;
end