_questDB_Teldrassil_Dolanaar = {isSetup = false}

function _questDB_Teldrassil_Dolanaar:setup()

----_questDB:addQuest(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherName, gatherName2, rewardNum, desc);
--_questDB:addQuest("no", 0, "", "", xyz, 141, 6, 10, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 141, 6, 10, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 141, 6, 10, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 141, 6, 10, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 141, 6, 10, xyz, type

-- leave darnassus to get a quest map id 1657 darnassus
_questDB:addQuest("no", 0, "Teldrassil", "Sentinel Arynia Cloudsbreak", 10665.099609375, 1863.5699462891, 1324.4266357422, 1657, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10176.14453125, 2572.1174316406, 1366.9592285156, "Arch Druid Fandral Staghelm", 0, 0, 0, 0, 0, 0, "Deliver the Oracle Tree's report to Arch Druid Fandral Staghelm in Darnassus.", 0, 1);

_questDB:addQuest("no", 0, "Crown of the Earth", "Corithras Moonrage", 9736.91015625, 956.06298828125, 1294.1112060547, 141, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10176.14453125, 2572.1174316406, 1366.9592285156, "Arch Druid Fandral Staghelm", 0, 0, 0, 0, 0, 2, "Bring the Filled Vessel to Arch Druid Fandral Staghelm in Darnassus.", 0, 1);

_questDB:addQuest("no", 0, "Crown of the Earth", "Corithras Moonrage", 9736.91015625, 956.06298828125, 1294.1103515625, 141, 6, 10, 10676.05859375, 1858.5090332031, 1324.3109130859, 3, 0, 0, 0, 0, 0, 9736.91015625, 956.06298828125, 1294.1103515625, "Corithras Moonrage", 0, 0, 0, 0, 0, 0, "Fill the Amethyst Phial and bring it back to Corithras Moonrage in Dolanaar.", "Amethyst Phial", 0, 1);

_questDB:addQuest("no", 0, "The Enchanted Glade", "Sentinel Arynia Cloudsbreak", 10665.099609375, 1863.5699462891, 1324.42578125, 141, 6, 10, 10553.200195313, 1942.4899902344, 1325.5090332031, 1, 10, 10, 10, 0, 0, 10665.099609375, 1863.5699462891, 1324.42578125, "Sentinel Arynia Cloudsbreak", "Bloodfeather Rogue", "Bloodfeather Harpy", "Bloodfeather Sorceress", 0, 0, 2, "Acquire 6 Bloodfeather Belts and bring them to Sentinel Arynia Cloudsbreak in the Oracle Glade.", 0, 1);

_questDB:addQuest("no", 0, "Crown of the Earth", "Corithras Moonrage", 9736.91015625, 956.06298828125, 1294.1103515625, 141, 6, 10, 9554.3076171875, 1654.1804199219, 1299.2454833984, 3, 0, 0, 0, 0, 0, 9736.91015625, 956.06298828125, 1294.1103515625, "Corithras Moonrage", 0, 0, 0, 0, 0, 0, "Fill the Tourmaline Phial and bring it back to Corithras Moonrage in Dolanaar.", "Tourmaline Phial", 1);

_questDB:addQuest("no", 0, "Twisted Hatred", "Tallonkai Swiftroot", 9898.58984375, 984.96801757813, 1354.8022460938, 141, 6, 10, 10127.799804688, 1202, 1323.3000488281, 1, 1, 0, 0, 0, 0, 9898.58984375, 984.96801757813, 1354.8022460938, "Tallonkai Swiftroot", "Lord Melenas", 0, 0, 0, 0, 2, "Kill Lord Melenas and bring his head to Tallonkai Swiftroot in Dolanaar.", 0, 1);

_questDB:addQuest("no", 0, "The Road to Darnassus", "Moon Priestess Amara", 9933.822265625, 1242.5231933594, 1307.8793945313, 141, 6, 10, 9985.8662109375, 1348.5472412109, 1287.7858886719, 1, 10, 0, 0, 0, 0, 9933.822265625, 1242.5231933594, 1307.8793945313, "Moon Priestess Amara", "Gnarlpine Ambusher", 0, 0, 0, 0, 0, "Slay 6 Gnarlpine Ambushers and return to Sentinel Amara Nightwalker outside of Dolanaar.", 0, 1);

_questDB:addQuest("no", 0, "The Emerald Dreamcatcher", "Tallonkai Swiftroot", 9898.58984375, 984.96801757813, 1354.8022460938, 141, 6, 10, 9807.638671875, 352.60781860352, 1308.4591064453, 2, 0, 0, 0, 1, 0, 9898.58984375, 984.96801757813, 1354.8022460938, "Tallonkai Swiftroot", 0, 0, 0, 1568, 0, 0, "Bring the Emerald Dreamcatcher to Tallonkai Swiftroot in Dolanaar.", 0, 1);

_questDB:addQuest("no", 0, "Gnarlpine Corruption", "Gaerolas Talvethren", 9845.150390625, 440.92999267578, 1317.1828613281, 141, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9887.5302734375, 965.53997802734, 1313.814453125, "Athridas Bearmantle", 0, 0, 0, 0, 0, 0, "Return to Athridas Bearmantle in Dolanaar.", 0, 1);

_questDB:addQuest("no", 0, "A Troubling Breeze", "Athridas Bearmantle", 9887.5302734375, 965.53997802734, 1313.8148193359, 141, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9845.150390625, 440.92999267578, 1317.1828613281, "Gaerolas Talvethren", 0, 0, 0, 0, 0, 0, "Seek out Gaerolas Talvethren in Starbreeze Village.", 0, 1);

_questDB:addQuest("no", 0, "Seek Redemption!", "Syral Bladeleaf", 9872.259765625, 959.27801513672, 1308.0705566406, 141, 6, 10, 9973.609375, 406.53604125977, 1307.3420410156, 2, 0, 0, 0, 3, 0, 9925.73046875, 737.07000732422, 1315.8264160156, "Zenn Foulhoof", 0, 0, 0, 425, 0, 0, "Collect 3 Fel Cones and give them to Zenn Foulhoof outside of Dolanaar.", 0, 1);

_questDB:addQuest("no", 0, "Timberling Seeds", "Denalan", 9505.830078125, 712.35198974609, 1255.8856201172, 141, 6, 10, 9616.375, 754.27960205078, 1265.4580078125, 1, 10, 0, 0, 0, 0, 9505.830078125, 712.35198974609, 1255.8856201172, "Denalan", "Timberling", 0, 0, 0, 0, 0, "Bring 8 Timberling Seeds to Denelan at Lake Al'Ameth.", 0, 1);

_questDB:addQuest("no", 0, "Timberling Sprouts", "Denalan", 9505.830078125, 712.35198974609, 1255.8856201172, 141, 6, 10, 9552.548828125, 687.78588867188, 1265.2369384766, 2, 0, 0, 0, 12, 0, 9505.830078125, 712.35198974609, 1255.8856201172, "Denalan", 0, 0, 0, 391, 0, 2, "Bring 12 Timberling Sprouts to Denalan at Lake Al'Ameth.", 0, 2);

_questDB:addQuest("no", 0, "Denalan's Earth", "Syral Bladeleaf", 9872.259765625, 959.27801513672, 1308.0705566406, 141, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9506.919921875, 713.76599121094, 1255.8875732422, "Denalan", 0, 0, 0, 0, 0, 0, "Bring the package of Rare Earth to Denalan at Lake Al'Ameth.");

_questDB:addQuest("no", 0, "Crown of the Earth", "Corithras Moonrage", 9736.91015625, 956.06298828125, 1294.1107177734, 141, 6, 10, 9860.1923828125, 587.9375, 1300.7536621094, 3, 0, 0, 0, 0, 0, 9736.91015625, 956.06298828125, 1294.1107177734, "Corithras Moonrage", 0, 0, 0, 0, 0, 0, "Fill the Jade Phial and bring it back to Corithras Moonrage in Dolanaar.", "Jade Phial", 1);

_questDB:addQuest("no", 0, "Zenn's Bidding", "Zenn Foulhoof", 9925.73046875, 737.07000732422, 1315.8277587891, 141, 6, 10, 9766.2744140625, 640.22064208984, 1296.651367187, 1, 10, 10, 10, 0, 0, 9925.73046875, 737.07000732422, 1315.8277587891, "Zenn Foulhoof", "Nightsaber", "Strigid Owl", "Webwood Lurker", 0, 0, 1, "Bring Zenn Foulhoof outside of Dolanaar 3 Nightsaber Fangs, 3 Strigid Owl Feathers and 3 swatches of Webwood Spider Silk.");

self.isSetup = true;
end