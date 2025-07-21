_questDB_Barrens_15_20 = {isSetup = false}

function _questDB_Barrens_15_20:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)

--_questDB:addQuest("no", 1, "", "", xyz, 17, 14, 20, xyz, type

_questDB:addQuest("no", 1, "Samophlange", "Sputtervalve", -902.03601074219, -3759.3999023438, 11.467498779297, 17, 14, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 826.44879150391, -2688.2624511719, 91.794792175293, 356, 0, 0, 0, 0, 0, 0, "Access the control console at the Venture Company research site.", 0, 1);


self.isSetup = true;
end