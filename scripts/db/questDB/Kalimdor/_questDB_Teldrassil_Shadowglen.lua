_questDB_Teldrassil_Shadowglen = {isSetup = false}

function _questDB_Teldrassil_Shadowglen:setup()

--[[completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherName, gatherName2, rewardNum, desc, useItem, gossipOption)]]--

_questDB:addQuest("no", 0, "Dolanaar Delivery", "Porthannius", 10214.299804688, 700.55297851563, 1360.6042480469, 141, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9802.2099609375, 982.60797119141, 1313.8966064453, "Innkeeper Keldamyr", 0, 0, 0, 0, 0, 2, "Bring the Dolanaar Delivery to Innkeeper Keldamyr.", 0, 1);

_questDB:addQuest("no", 0, "Crown of the Earth", "Tenaron Stormgrip", 10492.5, 807.28002929688, 1397.2683105469, 141, 1, 6, 10712.326171875, 763.5146484375, 1321.3764648438, 3, 0, 0, 0, 0, 0, 10492.5, 807.28002929688, 1397.2683105469, "Tenaron Stormgrip", 0, 0, 0, 0, 0, 0, "Fill the Crystal Phial and bring it back to Tenaron Stormgrip atop Aldrassil.", "Crystal Phial", 1);

_questDB:addQuest("no", 0, "Tenaron's Summons", "Gilshalan Windwalker", 10417.700195313, 871.19396972656, 1319.4086914063, 141, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10492.5, 807.28002929688, 1397.2683105469, "Tenaron Stormgrip", 0, 0, 0, 0, 0, 0, "Speak with Tenaron Stormgrip atop Aldrassil in Shadowglen.", 0, 1);

-- added extra kills to make you level faster but needs to be changed to check for items...
_questDB:addQuest("no", 0, "Webwood Egg", "Gilshalan Windwalker", 10417.700195313, 871.19396972656, 1319.4086914063, 141, 1, 6, 10902.611328125, 915.03839111328, 1323.9932861328, 2, 20, 0, 0, 1, 0, 10417.700195313, 871.19396972656, 1319.4086914063, "Gilshalan Windwalker", "Webwood Spider", "Githyiss the Vile", 0, 378, 0, 3, "Bring a Webwood Egg to Gilshalan in Aldrassil.", 0, 1);

-- added extra kills to make you level faster but needs to be changed to check for items...
_questDB:addQuest("no", 0, "Webwood Venom", "Gilshalan Windwalker", 10417.700195313, 871.19396972656, 1319.4086914063, 141, 1, 6, 10735.243164063, 925.56115722656, 1333.4985351563, 1, 20, 0, 0, 0, 0, 10417.700195313, 871.19396972656, 1319.4086914063, "Gilshalan Windwalker", "Webwood Spider", 0, 0, 0, 0, 4, "Bring 10 Webwood Venom Sacs to Gilshalan Windwalker at Aldrassil.", 0, 1);

_questDB:addQuest("no", 0, "Iverron's Antidote", "Dirania Silvershine", 10407.200195313, 713.79400634766, 1321.6176757813, 141, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10711.599609375, 1034.9100341797, 1347.2602539063, "Iverron", 0, 0, 0, 0, 0, 2, "Bring Iverron's Antidote to Iverron before the time limit is up. Iverron can be found by the cave to the north.", 0, 1);

_questDB:addQuest("no", 0, "Iverron's Antidote", "Dirania Silvershine", 10407.200195313, 713.79400634766, 1321.6176757813, 141, 1, 6, 10660.979492188, 893.12902832031, 1319.2253417969, 2, 10, 0, 0, 7, 4, 10407.200195313, 713.79400634766, 1321.6176757813, "Dirania Silvershine", "Webwood Spider", 0, 0, 2090, 253, 0, "Collect 7 Hyacinth Mushrooms, 4 Moonpetal Lilies, and 1 Webwood Ichor for Dirania Silveshine in Shadowglen.", 0, 1);

_questDB:addQuest("no", 0, "A Friend in Need", "Iverron", 10711.599609375, 1034.9100341797, 1347.2602539063, 141, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10407.200195313, 713.79400634766, 1321.6176757813, "Dirania Silvershine", 0, 0, 0, 0, 0, 0, "Speak to Dirania Silvershine in Shadowglen.", 0, 1);

_questDB:addQuest("no", 0, "A Good Friend", "Dirania Silvershine", 10407.200195313, 713.79400634766, 1321.6176757813, 141, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10711.599609375, 1034.9100341797, 1347.2602539063, "Iverron", 0, 0, 0, 0, 0, 0, "Find Iverron by the cave to the north.", 0, 1);

_questDB:addQuest("no", 0, "The Woodland Protector", "Tarindrella", 10297.985351563, 871.41156005859, 1335.6091308594, 141, 1, 6, 10281.4140625, 948.26000976563, 1337.7951660156, 1, 20, 0, 0, 0, 0, 10297.985351563, 871.41156005859, 1335.6091308594, "Tarindrella", "Grellkin", "Grell", 0, 0, 0, 3, "Collect 8 Fel Moss and bring them to Tarindrella.", 0, 1);

-- level 1 night elf start quest # 3
_questDB:addQuest("no", 0, "The Woodland Protector", "Melithar Staghelm", 10389.799804688, 763.47698974609, 1319.9537353516, 141, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10298.233398438, 870.58386230469, 1335.6284179688, "Tarindrella", 0, 0, 0, 0, 0, 0, "Seek out the dryad known as Tarindrella.", 0, 1);

if GetMyClass() == "ROGUE" then
_questDB:addQuest("no", 0, "Encrypted Sigil", "Conservator Ilthalaine", 10328.900390625, 826.05200195313, 1326.380859375, 141, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10519.099609375, 778.01397705078, 1329.5992431641, "Frahun Shadewhisper", 0, 0, 0, 0, 0, 0, "Read the Encrypted Sigil and speak to Frahun Shadewhisper in Shadowglen.", 0, 1);
end
if GetMyClass() == "WARRIOR" then
_questDB:addQuest("no", 0, "Simple Sigil", "Conservator Ilthalaine", 10328.900390625, 826.05200195313, 1326.380859375, 141, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10526.599609375, 778.08599853516, 1329.5993652344, "Alyissia", 0, 0, 0, 0, 0, 0, "Read the Simple Sigil and speak to Alyissia in Shadowglen.", 0, 1);
end

-- level 1 night elf starter quest # 2
_questDB:addQuest("no", 0, "The Balance of Nature", "Conservator Ilthalaine", 10328.900390625, 826.05200195313, 1326.380859375, 141, 1, 6, 10596.055664063, 793.87274169922, 1309.9134521484, 1, 7, 7, 0, 0, 0, 10328.900390625, 826.05200195313, 1326.380859375, "Conservator Ilthalaine", "Mangy Nightsaber", "Thistle Boar", 0, 0, 0, 2, "Conservator Ilthalaine needs you to kill 7 Mangy Nightsabers and 7 Thistle Boars.", 0, 1);

-- level 1 night elf starter quest # 1
_questDB:addQuest("no", 0, "The Balance of Nature", "Conservator Ilthalaine", 10328.900390625, 826.05200195313, 1326.380859375, 141, 1, 6, 10366.59765625, 682.63366699219, 1326.1207275391, 1, 7, 4, 0, 0, 0, 10328.900390625, 826.05200195313, 1326.380859375, "Conservator Ilthalaine", "Young Nightsaber", "Young Thistle Boar", 0, 0, 0, 2, "Kill 7 Young Nightsabers and 4 Young Thistle Boars and return to Conservator Ilthalaine.", 0, 1);

self.isSetup = true;
end