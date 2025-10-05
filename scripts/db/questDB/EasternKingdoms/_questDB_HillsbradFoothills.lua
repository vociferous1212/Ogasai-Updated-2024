_questDB_HillsbradFoothills = {}

function _questDB_HillsbradFoothills:setup()


-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)


-- 0 alliance and 1 horde. 2 for both factions
--_questDB:addQuest("no", 0, "", "", xyz, 267, 30, 40, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 267, 30, 40, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 267, 30, 40, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 267, 30, 40, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 267, 30, 40, xyz, type

_questDB:addQuest("no", 0, "Soothing Turtle Bisque", "Chef Jessen", -851.78100585938, -593.68798828125, 11.674300193787, 267, 30, 40, 272.03662109375, -1351.2299804688, 44.807331085205, 7, 10, 0, 0, 0, 0, -851.78100585938, -593.68798828125, 11.674300193787, "Chef Jessen", "Snapjaw", 0, 0, 0, 0, 1, "Bring 10 pieces of Turtle Meat and some Soothing Spices to Chef Jessen in Southshore.", "Soothing Spices", 1);

end

