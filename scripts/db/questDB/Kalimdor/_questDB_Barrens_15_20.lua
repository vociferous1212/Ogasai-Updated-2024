_questDB_Barrens_15_20 = {isSetup = false}

function _questDB_Barrens_15_20:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)

--_questDB:addQuest("no", 1, "", "", xyz, 17, 14, 20, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 14, 20, xyz, type

-- crossover to stonetalone - Goblin Invaders (Kill, Quest ID 1062)
_questDB:addQuest("no", 1, "Goblin Invaders", "Seereth Stonebreak", -265.125, -943.147, 12.546382904053, 17, 15, 35, 1038.2139892578, 136.38049316406, 17.608114242554, 1, 15, 0, 0, 0, 0, -265.125, -943.147, 12.546382904053, "Seereth Stonebreak", "Venture Co. Logger", 0, 0, 0, 0, 1, "Kill 15 Venture Co. Loggers, then return to Seereth Stonebreak on the border of Stonetalon and the Barrens.", 0, 1);

_questDB:addQuest("no", 1, "Stolen Booty", "Gazlowe", -835.56298828125, -3728.6599121094, 26.292079925537, 17, 14, 20, -1758.2136230469, -3784.5041503906, 1.4539045095444, 2, 0, 0, 0, 1, 1, -835.56298828125, -3728.6599121094, 26.292079925537, "Gazlowe", 0, 0, 0, 347, 31, 1, "Retrieve the Shipment of Boots and Telescopic Lens for Gazlowe in Ratchet.", 0, 1);

_questDB:addQuest("no", 1, "The Missing Shipment", "Wharfmaster Dizzywig", -985.59899902344, -3796.7099609375, 5.1261320114136, 17, 14, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -835.56298828125, -3728.6599121094, 26.291809082031, "Gazlowe", 0, 0, 0, 0, 0, 1, "Return Gazlowe's Ledger to Gazlowe in Ratchet.", 0, 1);

_questDB:addQuest("no", 1, "The Missing Shipment", "Gazlowe", -835.56298828125, -3728.6599121094, 26.291809082031, 17, 14, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -985.59899902344, -3796.7099609375, 5.1261320114136, "Wharfmaster Dizzywig", 0, 0, 0, 0, 0, 1, "Bring Gazlowe's Ledger to Wharfmaster Dizzywig.", 0, 1);

_questDB:addQuest("no", 1, "Southsea Freebooters", "Gazlowe", -835.56298828125, -3728.6599121094, 26.291809082031, 17, 14, 20, -1350.9537353516, -3844.9477539063, 18.238227844238, 1, 12, 6, 0, 0, 0, -835.56298828125, -3728.6599121094, 26.291809082031, "Gazlowe", "Southsea Brigand", "Southsea Cannoneer", 0, 0, 0, 1, "Kill 12 Southsea Brigands and 6 Southsea Cannoneers for Gazlowe in Ratchet.", 0, 1);

--_questDB:addQuest("no", 1, "Flawed Power Stone", "", xyz, 17, 14, 20, xyz, type

_questDB:addQuest("no", 1, "Harpy Raiders", "Darsok Swiftdagger", -474.89401245117, -2607.7399902344, 127.79977416992, 17, 14, 20, 302.71423339844, -1513.9111328125, 92.837944030762, 1, 10, 10, 0, 0, 0, -474.89401245117, -2607.7399902344, 127.79977416992, "Darsok Swiftdagger", "Witchwing Harpy", "Witchwing Roguefeather", 0, 0, 0, 1, "Collect 8 Witchwing talons.\n\nReturn them to Darsok Swiftdagger at the Crossroads.", 0, 1);

--_questDB:addQuest("no", 1, "Samophlange", "Sputtervalve", -902.03601074219, -3759.3999023438, 11.467498779297, 17, 14, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 826.44879150391, -2688.2624511719, 91.794792175293, 356, 0, 0, 0, 0, 0, 0, "Access the control console at the Venture Company research site.", 0, 1);


self.isSetup = true;
end