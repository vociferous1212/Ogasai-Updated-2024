_questQuestTargets = {

	numTargets = 2,

	names = {

		[1] = "Chief Sharptusk Thornmantle",
		[2] = "Garrick Padfoot",
	},

}

-- the bot needs to NOT pull adds... but it needs to understand that sometimes it MUST to try to complete a quest
-- this became very apparent at the end of starter zone quests (1-6) while there is an extra target standing next to quest kill target

function _questQuestTargets:isUnitQuestTarget(target)

	if target ~= nil and target ~= 0 then
		for i = 1, self.numTargets do

			if target:GetUnitName() == _questQuestTargets.names[i] then
		
				return true;

			end
		end
	end

return false;
end