_questDB_ThousandNeedles = {}

function _questDB_ThousandNeedles:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)


-- 0 alliance and 1 horde. 2 for both factions
--_questDB:addQuest("no", 2, "", "", xyz, 400, 30, 40, xyz, type
--_questDB:addQuest("no", 2, "", "", xyz, 400, 30, 40, xyz, type

_questDB:addQuest("no", 2, "A Bump in the Road", "Trackmaster Zherin", -6253.2797851563, -4025.25, -58.749847412109, 400, 30, 40, -6524.2216796875, -3926.7712402344, -58.749607086182, 1, 10, 10, 6, 0, 0, -6253.2797851563, -4025.25, -58.749847412109, "Trackmaster Zherin", "Saltstone Basilisk", "Saltstone Crystalhide", "Saltstone Gazer", 0, 0, 1, "Kill 10 Saltstone Basilisks, 10 Saltstone Crystalhides and 6 Saltstone Gazers for Trackmaster Zherin on the Shimmering Flats.", 0, 1);

_questDB:addQuest("no", 2, "Load Lightening", "Pozzik", -5896.21484375, -4260.1884765625, -58.748920440674, 400, 30, 40, -5896.21484375, -4260.1884765625, -58.748920440674, 1, 10, 0, 0, 0, 0, -6192.6000976563, -3961.1799316406, -58.749664306641, "Pozzik", "Salt Flats Scavenger", 0, 0, 0, 0, 1, "Get 10 Hollow Vulture Bones for Pozzik in the Shimmering Flats.", 0, 1);

_questDB:addQuest("no", 2, "Hardened Shells", "Wizzle Brassbolts", -6228.8598632813, -3871.6298828125, -58.74955368042, 400, 30, 40, -6150.86328125, -4274.4477539063, -58.749771118164, 1, 20, 0, 0, 0, 0, -6228.8598632813, -3871.6298828125, -58.74955368042, "Wizzle Brassbolts", "Sparkleshell Snapper", 0, 0, 0, 0, 1, "Bring 9 Hardened Tortoise Shells to Wizzle Brassbolts in the Shimmering Flats.", 0, 1);

_questDB:addQuest("no", 2, "Salt Flat Venom", "Fizzle Brassbolts", -6229.0297851563, -3868.1799316406, -58.749572753906, 400, 30, 40, -5656.4272460938, -3521.1650390625, -58.49478149414, 1, 10, 0, 0, 0, 0, -6229.0297851563, -3868.1799316406, -58.749572753906, "Fizzle Brassbolts", "Scorpid Reaver", "Scorpid Terror", 0, 0, 0, 1, "Bring 6 Salty Scorpid Venoms to Fizzle Brassbolts in the Shimmering Flats.", 0, 1);

_questDB:addQuest("no", 2, "Rocket Car Parts", "Kravel Koalbeard", -6233.240234375, -3855.9699707031, -58.749843597412, 400, 30, 40, -5656.4272460938, -3521.1650390625, -58.494781494141, 2, 0, 0, 0, 30, 0, -6233.240234375, -3855.9699707031, -58.749843597412, "Kravel Koalbeard", 0, 0, 0, 449, 450, 1, "Bring 30 Rocket Car Parts to Kravel Koalbeard in the Shimmering Flats.", 0, 1);

end

