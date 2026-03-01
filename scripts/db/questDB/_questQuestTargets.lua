_questQuestTargets = {

	names = {

		["Chief Sharptusk Thornmantle"] = true,
		[ "Garrick Padfoot"] = true,
	},

}

-- the bot needs to NOT pull adds... but it needs to understand that sometimes it MUST to try to complete a quest
-- this became very apparent at the end of starter zone quests (1-6) while there is an extra target standing next to quest kill target

function _questQuestTargets:isUnitQuestTarget(target)

	if target ~= nil and target ~= 0 then
	
		if _questQuestTargets.names[target:GetUnitName()] then
		
			return true;

		end
	end

return false;
end