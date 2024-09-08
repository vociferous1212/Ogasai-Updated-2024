_questDB_Barrens_10_15 = {isSetup = false}

function _questDB_Barrens_10_15:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)




if GetMyClass() == "SHAMAN" then

--call of fire
_questDB:addQuest("no", 1, "Call of Fire", "Kranal Fiss", 260.59149169922, -3042.9353027344, 96.310523986816, 17, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -265.56140136719, -4000.3620605469, 169.64166259766, "Telf Joolam", 0, 0, 0, 0, 0, 0, "Bring the Torch of the Dormant Flame to Telf Joolam in Durotar.", 0, 0);

	-- call of fire from bloodhoof village so the bot can check that we have this quest in this map ID
	if questObjectives == "Find Kranal Fiss in the Barrens." then
	_questDB:addQuest("no", 1, "Call of Fire", "Narm Skychaser", -2298.9599609375, -437.74200439453, -5.4384160041809, 17, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 265.17098999023, -3037.0900878906, 96.949699401855, "Kranal Fiss", 0, 0, 0, 0, 0, 0, "Find Kranal Fiss in the Barrens.", 0, 1);
	end


end


self.isSetup = true;
end