grind2Blacklisting = {

	blacklistedTargets = {},

	blacklistedNum = 0,

}

-- check if target is blacklisted by GUID
function grind2Blacklisting:isTargetBlacklisted(targetGUID) 

	local target = targetGUID;

	for i = 0, self.blacklistedNum do

		if target == self.blacklistedTargets[i] then

			return true;
		end
	end

	return false;
end

-- add target to blacklist table by GUID
function grind2Blacklisting:addTargetToBlacklist(targetGUID)

	local target = targetGUID;

	if target ~= nil and target ~= 0 and targetGUID ~= '' then

		self.blacklistedTargets[self.blacklistedNum] = target;

		self.blacklistedNum = self.blacklistedNum + 1;
	end
end