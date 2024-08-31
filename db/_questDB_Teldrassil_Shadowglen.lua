_questDB_Teldrassil_Shadowglen = {isSetup = false}

function _questDB_Teldrassil_Shadowglen:setup()

--[[completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, gatherName, gatherName2, rewardNum)]]--

-- level 1 night elf starter quest # 2
_questDB:addQuest("no", 0, "The Balance of Nature", "Conservator Ilthalaine", 10328.900390625, 826.05200195313, 1326.380859375, 141, 1, 4, 10596.055664063, 793.87274169922, 1309.9134521484, 1, 7, 7, 0, 0, 10328.900390625, 826.05200195313, 1326.380859375, "Conservator Ilthalaine", "Mangy Nightsaber", "Thistle Boar", 0, 0, 2);

-- level 1 night elf starter quest # 1
_questDB:addQuest("no", 0, "The Balance of Nature", "Conservator Ilthalaine", 10354.408203125, 675.88238525391, 1329.5684814453, 141, 1, 4, 10328.900390625, 826.05200195313, 1326.380859375, 1, 7, 4, 0, 0, 10354.408203125, 675.88238525391, 1329.5684814453, "Conservator Ilthalaine", "Young Nightsaber", "Young Thistleboar", 0, 0, 2);

self.isSetup = true;
end