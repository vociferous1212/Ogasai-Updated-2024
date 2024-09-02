_questDB_Teldrassil_Shadowglen = {isSetup = false}

function _questDB_Teldrassil_Shadowglen:setup()

--[[completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherName, gatherName2, rewardNum, desc)]]--

----_questDB:addQuest(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherName, gatherName2, rewardNum, desc);

_questDB:addQuest("no", 0, "Dolanaar Delivery", "Porthannius", 10214.299804688, 700.55297851563, 1360.6042480469, 141, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9802.2099609375, 982.60797119141, 1313.8966064453, "Innkeeper Keldamyr", 0, 0, 0, 0, 0, 2, "Bring the Dolanaar Delivery to Innkeeper Keldamyr.");

-- added extra kills to make you level faster but needs to be changed to check for items...
_questDB:addQuest("no", 0, "Webwood Venom", "Gilshalan Windwalker", 10417.700195313, 871.19396972656, 1319.4086914063, 141, 1, 6, 10735.243164063, 925.56115722656, 1333.4985351563, 1, 20, 0, 0, 0, 0, 10417.700195313, 871.19396972656, 1319.4086914063, "Gilshalan Windwalker", "Webwood Spider", 0, 0, 0, 0, 4, "Bring 10 Webwood Venom Sacs to Gilshalan Windwalker at Aldrassil.");

--needs checked thoroughly
--_questDB:addQuest("no", 0, "Iverron's Antidote", "Dirania Silvershine", 10407.200195313, 713.79400634766, 1321.6176757813, 141, 1, 6, 10668.392578125, 878.42413330078, 1319.3364257813, 2, 0, 0, 7, 4, 10407.200195313, 713.79400634766, 1321.6176757813, "Dirania Silvershine", "Webwood Spider", 0, 2090, 253, "Webwood Ichor", 0, "Collect 7 Hyacinth Mushrooms, 4 Moonpetal Lilies, and 1 Webwood Ichor for Dirania Silveshine in Shadowglen.");

_questDB:addQuest("no", 0, "A Friend in Need", "Iverron", 10711.599609375, 1034.9100341797, 1347.2602539063, 141, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10407.200195313, 713.79400634766, 1321.6176757813, "Dirania Silvershine", 0, 0, 0, 0, 0, 0, "Speak to Dirania Silvershine in Shadowglen.");

_questDB:addQuest("no", 0, "A Good Friend", "Dirania Silvershine", 10407.200195313, 713.79400634766, 1321.6176757813, 141, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10711.599609375, 1034.9100341797, 1347.2602539063, "Iverron", 0, 0, 0, 0, 0, 0, "Find Iverron by the cave to the north.");

_questDB:addQuest("no", 0, "The Woodland Protector", "Tarindrella", 10297.985351563, 871.41156005859, 1335.6091308594, 141, 1, 6, 10281.4140625, 948.26000976563, 1337.7951660156, 1, 20, 0, 0, 0, 0, 10297.985351563, 871.41156005859, 1335.6091308594, "Tarindrella", "Grell", "Grellkin", 0, 0, 0, 3, "Collect 8 Fel Moss and bring them to Tarindrella.");

-- level 1 night elf start quest # 3
_questDB:addQuest("no", 0, "The Woodland Protector", "Melithar Staghelm", 10389.799804688, 763.47698974609, 1319.9537353516, 141, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10298.233398438, 870.58386230469, 1335.6284179688, "Tarindrella", 0, 0, 0, 0, 0, 0, "Seek out the dryad known as Tarindrella.");

-- level 1 night elf starter quest # 2
_questDB:addQuest("no", 0, "The Balance of Nature", "Conservator Ilthalaine", 10328.900390625, 826.05200195313, 1326.380859375, 141, 1, 6, 10596.055664063, 793.87274169922, 1309.9134521484, 1, 7, 7, 0, 0, 0, 10328.900390625, 826.05200195313, 1326.380859375, "Conservator Ilthalaine", "Mangy Nightsaber", "Thistle Boar", 0, 0, 0, 2, "Conservator Ilthalaine needs you to kill 7 Mangy Nightsabers and 7 Thistle Boars.");

-- level 1 night elf starter quest # 1
_questDB:addQuest("no", 0, "The Balance of Nature", "Conservator Ilthalaine", 10328.900390625, 826.05200195313, 1326.380859375, 141, 1, 6, 10366.59765625, 682.63366699219, 1326.1207275391, 1, 7, 4, 0, 0, 0, 10328.900390625, 826.05200195313, 1326.380859375, "Conservator Ilthalaine", "Young Nightsaber", "Young Thistle Boar", 0, 0, 0, 2, "Kill 7 Young Nightsabers and 4 Young Thistle Boars and return to Conservator Ilthalaine.");

self.isSetup = true;
end