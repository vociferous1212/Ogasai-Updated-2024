script_grindBlacklistAreaWithElite = {}

-- if there is an elite then blacklist all targets around it
function script_grindBlacklistAreaWithElite:blacklistAreaWithElite()

	local eliteTarget = nil;

	local eliteX, eliteY, eliteZ = 0, 0, 0;

	local tarX, tarY, tarZ = 0, 0, 0;

	local i, t = GetFirstObject();

	while i ~= 0 do

		if t == 3 then

			tarX, tarY, tarZ = i:GetPosition();

			if not grind2.usingGrinder2 then
				if script_grind:isTargetHardBlacklisted(i:GetGUID()) and (i:GetClassification() == 1 or i:GetClassification() == 2) then

					eliteTarget = i;

					eliteX, eliteY, eliteZ = eliteTarget:GetPosition();
				end

				if GetDistance3D(tarX, tarY, tarZ, eliteX, eliteY, eliteZ) <= 40 then

					if not script_grind:isTargetHardBlacklisted(i:GetGUID()) then

						script_grind:addTargetToHardBlacklist(i:GetGUID());
					end
				end
			else
				if (i:GetClassification() == 1 or i:GetClassification() == 2) then

					eliteTarget = i;

					eliteX, eliteY, eliteZ = eliteTarget:GetPosition();
				end

				if GetDistance3D(tarX, tarY, tarZ, eliteX, eliteY, eliteZ) <= 40 then

					if not grind2Blacklisting:isTargetBlacklisted(i:GetGUID()) then

						grind2Blacklisting:addTargetToBlacklist(i:GetGUID());
					end
				end
			end
		end
	i, t = GetNextObject(i);
	end
	return false;
end