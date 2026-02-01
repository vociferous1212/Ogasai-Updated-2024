_questDB_Duskwood_20_25 = {isSetup = false}

function _questDB_Duskwood_20_25:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)

--_questDB:addQuest("no", 1, "", "", xyz, 10, 20, 30, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 10, 20, 30, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 10, 20, 30, xyz, type


-- Quest 10: Deliver supplies to Sven Yorgen (Level 20-30)
_questDB:addQuest("no", 0, "Deliveries to Sven", "Elaine Carevin", -10514.500976563, -1160.0390014648, 38.829577255249, 10, 20, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10314.200195313, 625.03900146484, 26.529577255249, "Sven Yorgen", 0, 0, 0, 0, 0, 1, "Deliver a crate of supplies to Sven Yorgen at his camp on the western border of Duskwood.", 0, 1);

-- Quest 9: Slay wolves near Sven’s Camp (Level 20-30)
_questDB:addQuest("no", 0, "Wolves at Our Heels", "Lars", -10314.200195313, 625.03900146484, 26.529577255249, 10, 20, 30, -10177.66796875, 398.97235107422, 34.466728210449, 1, 12, 8, 0, 0, 0, -10314.200195313, 625.03900146484, 26.529577255249, "Lars", "Starving Dire Wolf", "Rabid Dire Wolf", 0, 0, 0, 1, "Kill 12 Starving Dire Wolves and 8 Rabid Dire Wolves near Sven’s Camp on the western border of Duskwood, then return to Lars.", 0, 1);

-- Quest 8: Slay skeletons and ghouls in Tranquil Gardens Cemetery (Level 20-30)
_questDB:addQuest("no", 0, "The Night Watch", "Commander Althea Ebonlocke", -10510.100097656, -1155.0390014648, 38.629577255249, 10, 20, 30, -11000.66796875, -1800.9723510742, 40.466728210449, 1, 8, 8, 0, 0, 0, -10510.100097656, -1155.0390014648, 38.629577255249, "Commander Althea Ebonlocke", "Skeletal Fiend", "Fetid Corpse", 0, 0, 0, 1, "Slay 8 Skeletal Fiends and 8 Fetid Corpses in Tranquil Gardens Cemetery, then return to Commander Althea Ebonlocke in Darkshire.", 0, 1);

-- Quest 7: Slay skeletons in Tranquil Gardens Cemetery (Level 20-30)
_questDB:addQuest("no", 0, "The Night Watch", "Commander Althea Ebonlocke", -10510.100097656, -1155.0390014648, 38.629577255249, 10, 20, 30, -11000.66796875, -1800.9723510742, 40.466728210449, 1, 15, 0, 0, 0, 0, -10510.100097656, -1155.0390014648, 38.629577255249, "Commander Althea Ebonlocke", "Skeletal Warrior", 0, 0, 0, 0, 1, "Slay 15 Skeletal Warriors in Tranquil Gardens Cemetery, then return to Commander Althea Ebonlocke in Darkshire.", 0, 1);

-- Quest 6: Collect wolf meat for Chef Grual (Level 20-30)
_questDB:addQuest("no", 0, "Four-Legged Menaces", "Chef Grual", -10513.400390625, -1158.0390014648, 38.629577255249, 10, 20, 30, -10650.66796875, -1200.9723510742, 35.466728210449, 2, 0, 0, 0, 10, 0, -10513.400390625, -1158.0390014648, 38.629577255249, "Chef Grual", 0, 0, 0, 1019, 0, 1, "Collect 10 Wolf Skewer Meat from Nightbane Wolves east of Darkshire, then return to Chef Grual in Darkshire.", 0, 1);

-- Quest 5: Kill spiders for Watcher Dodds (Level 20-30)
_questDB:addQuest("no", 0, "Eight-Legged Menaces", "Watcher Dodds", -10350.400390625, -200.03900146484, 30.529577255249, 10, 20, 30, -10450.66796875, -1000.9723510742, 34.466728210449, 1, 15, 0, 0, 0, 0, -10350.400390625, -200.03900146484, 30.529577255249, "Watcher Dodds", "Pygmy Venom Web Spider", 0, 0, 0, 0, 1, "Kill 15 Pygmy Venom Web Spiders north of Darkshire, then return to Watcher Dodds.", 0, 1);

-- Quest 4: Return a book to Jitters (Level 20-30)
_questDB:addQuest("no", 0, "Return to Jitters", "Tavernkeep Smitts", -10513.600585938, -1157.0390014648, 38.629577255249, 10, 20, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10550.200195313, -2000.0390014648, 41.529577255249, "Jitters", 0, 0, 0, 0, 0, 1, "Deliver the Book of Morgan to Jitters at Raven Hill.", 0, 1);

-- Quest 3: Speak to Jitters at Raven Hill (Level 20-30)
_questDB:addQuest("no", 0, "Raven Hill", "Commander Althea Ebonlocke", -10510.100097656, -1155.0390014648, 38.629577255249, 10, 20, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10550.200195313, -2000.0390014648, 41.529577255249, "Jitters", 0, 0, 0, 0, 0, 1, "Speak to Jitters at Raven Hill in Duskwood.", 0, 1);

-- Quest 2: Collect spider legs for Chef Grual (Level 20-30)
_questDB:addQuest("no", 0, "Dusky Crab Cakes", "Chef Grual", -10513.400390625, -1158.0390014648, 38.629577255249, 10, 20, 30, -10450.66796875, -1000.9723510742, 34.466728210449, 2, 0, 0, 0, 6, 0, -10513.400390625, -1158.0390014648, 38.629577255249, "Chef Grual", 0, 0, 0, 2250, 0, 1, "Gather 6 Gooey Spider Legs from Venom Web Spiders north of Darkshire, then return to Chef Grual.", 0, 1);

-- Quest 1: Deliver food to Jitters at Raven Hill (Level 20-30)
_questDB:addQuest("no", 0, "Jitters’ Growling Gut", "Chef Grual", -10513.400390625, -1158.0390014648, 38.629577255249, 10, 20, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10550.200195313, -2000.0390014648, 41.529577255249, "Jitters", 0, 0, 0, 0, 0, 1, "Deliver a crate of food to Jitters at Raven Hill.", 0, 1);

--_questDB:addQuest("no", 0, "The Night Watch", "Commander Althea Ebonlocke", -10559.327148438, -1152.2353515625, 28.035062789917, 10, 20, 30, -10952.12890625, -1260.5128173828, 51.59015655517, 1, 8, 6, 0, 0, 0, -10559.327148438, -1152.2353515625, 28.035062789917, "Commander Althea Ebonlocke", "Skeletal Warrior", "Skeletal Mage", 0, 0, 0, 1, "kill stuff", 0, 1);

--_questDB:addQuest("no", 0, "Wolves at Our Heels", "Lars", -10314.200195313, 625.03900146484, 26.529577255249, 10, 20, 30, -10177.66796875, 398.97235107422, 34.466728210449, 1, 12, 8, 0, 0, 0, -10314.200195313, 625.03900146484, 26.529577255249, "Lars", "Starving Dire Wolf", "Rabid Dire Wolf", 0, 0, 0, 1, "Kill 12 Starving Dire Wolves and 8 Rabid Dire Wolves, then return to Lars at Sven's Camp on the western border of Duskwood.", 0, 1);

self.isSetup = true;
end