script_grindReturnTargetNearMyAggroRange = {}

-- attempt to blacklist nuetral targets and only attack unfriendly targets while moving hotspots - currently placeholding for gather checks
function script_grindReturnTargetNearMyAggroRange:returnTargetNearMyAggroRange()

	local i, t = GetFirstObject();

	local mx, my, mz = GetLocalPlayer():GetPosition();

	local tx, ty, tz = 0, 0, 0;

	while i ~= 0 do

		if t == 3 or t == 4 then

			if i:GetDistance() <= 30 and i:CanAttack() and not i:IsDead() and not i:IsCritter()
			and i:IsInLineOfSight() and not script_grindIsTargetAggroBlacklisted:isTargetAggroBlacklisted(i:GetGUID())
			and not script_grind:isTargetHardBlacklisted(i:GetGUID()) and not friendlyEnemiesList:isEnemyNuetral(i)
			
			then

				tx, ty, tz = i:GetPosition();

				local range = GetDistance3D(mx, my, mz, tx, ty, tz);

				local aggro = i:GetLevel() - GetLocalPlayer():GetLevel() + 21;

				if range <= aggro and (not PlayerHasTarget()) then

					name = i:GetUnitName();

					TargetByName(name);

					if (UnitIsEnemy("target","player")) then
					
						if not IsAutoCasting("Attack") then
							i:AutoAttack();
						end

						return i;
					end

				elseif (not script_grind.hotspotReached or _quest.usingQuester) and (not IsInCombat()) then	

					script_grindAddTargetToAggroBlacklist:addTargetToAggroBlacklist(i:GetGUID());

					if (PlayerHasTarget()) then

						ClearTarget();
					end

				return nil;
				end
			end
		end
	i, t = GetNextObject(i);
	end
return nil;
end