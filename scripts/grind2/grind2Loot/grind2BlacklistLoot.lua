grind2BlacklistLoot = {

	blacklistLootTargets = {},

	numBlacklistLootTargets = 0

	

}

function grind2BlacklistLoot:resetLootBlacklistTable()

	for i = 0, self.numBlacklistLootTargets - 1 do

		self.blacklistLootTargets[i] = nil;

	end
end

function grind2BlacklistLoot:isLootTargetBlacklisted(targetGUID)

	for i = 0, self.numBlacklistLootTargets - 1 do

		if targetGUID == self.blacklistLootTargets[i] then

			return true;
		end
	end
return false;
end

function grind2BlacklistLoot:addLootTargetToBlacklist(targetGUID)

	if targetGUID~= nil and targetGUID ~= 0 and targetGUID ~= '' then

		self.blacklistLootTargets[self.numBlacklistLootTargets] = targetGUID;

		self.numBlacklistLootTargets = self.numBlacklistLootTargets + 1;
	end
end