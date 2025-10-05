script_grindIsTargetAggroBlacklisted = {}

-- attempt to blacklist nuetral targets and only attack unfriendly targets - currently placeholding for gather checks
function script_grindIsTargetAggroBlacklisted:isTargetAggroBlacklisted(targetGUID) 

	for i=0, script_grindAddTargetToAggroBlacklist.blacklistAggroNum -1 do

		if (targetGUID == script_grindAddTargetToAggroBlacklist.blacklistAggroTargets[i]) then

			return true;
		end
	end
	return false;
end