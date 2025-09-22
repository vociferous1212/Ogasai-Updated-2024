script_grindAddTargetToAggroBlacklist = {

		blacklistAggroTargets = {},
		blacklistAggroNum = 0,

}

-- attempt to blacklist nuetral targets and only attack unfriendly targets - currently placeholding for gather checks
function script_grindAddTargetToAggroBlacklist:addTargetToAggroBlacklist(targetGUID)

	if (targetGUID ~= nil and targetGUID ~= 0 and targetGUID ~= '') then	

		self.blacklistAggroTargets[self.blacklistAggroNum] = targetGUID;

		self.blacklistAggroNum = self.blacklistAggroNum + 1;
	end
end