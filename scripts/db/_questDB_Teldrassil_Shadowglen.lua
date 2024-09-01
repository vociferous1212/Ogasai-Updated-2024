_questDB_Teldrassil_Shadowglen = {isSetup = false}

function _questDB_Teldrassil_Shadowglen:setup()

--[[completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, gatherName, gatherName2, rewardNum)]]--

_questDB:addQuest("no", 0, "The Woodland Protector", "Tarindrella", 10297.985351563, 871.41156005859, 1335.6091308594, 141, 1, 6, 10281.4140625, 948.26000976563, 1337.7951660156, 1, 8, 0, 0, 0, 10297.985351563, 871.41156005859, 1335.6091308594, "Tarindrella", "Grell", "Grellkin", 0, 0, 3, "Collect 8 Fel Moss and bring them to Tarindrella.");

-- level 1 night elf start quest # 3
_questDB:addQuest("no", 0, "The Woodland Protector", "Melithar Staghelm", 10389.799804688, 763.47698974609, 1319.9537353516, 141, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 10298.233398438, 870.58386230469, 1335.6284179688, "Tarindrella", 0, 0, 0, 0, 0, "Seek out the dryad known as Tarindrella.");

-- level 1 night elf starter quest # 2
_questDB:addQuest("no", 0, "The Balance of Nature", "Conservator Ilthalaine", 10328.900390625, 826.05200195313, 1326.380859375, 141, 1, 6, 10596.055664063, 793.87274169922, 1309.9134521484, 1, 7, 7, 0, 0, 10328.900390625, 826.05200195313, 1326.380859375, "Conservator Ilthalaine", "Mangy Nightsaber", "Thistle Boar", 0, 0, 2, "Conservator Ilthalaine needs you to kill 7 Mangy Nightsabers and 7 Thistle Boars.");

-- level 1 night elf starter quest # 1
_questDB:addQuest("no", 0, "The Balance of Nature", "Conservator Ilthalaine", 10328.900390625, 826.05200195313, 1326.380859375, 141, 1, 6, 10366.59765625, 682.63366699219, 1326.1207275391, 1, 7, 4, 0, 0, 10328.900390625, 826.05200195313, 1326.380859375, "Conservator Ilthalaine", "Young Nightsaber", "Young Thistle Boar", 0, 0, 2, "Kill 7 Young Nightsabers and 4 Young Thistle Boars and return to Conservator Ilthalaine.");

self.isSetup = true;
end