_questDB_Duskwood_20_25 = {isSetup = false}

function _questDB_Duskwood_20_25:setup()

--[[completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, gatherName, gatherName2, rewardNum)]]--


_questDB:addQuest("no", 0, "The Night Watch", "Commander Althea Ebonlocke", -10559.327148438, -1152.2353515625, 28.035062789917, 10, 24, 30, -10952.12890625, -1260.5128173828, 51.59015655517, 1, 8, 6, 0, 0, -10559.327148438, -1152.2353515625, 28.035062789917, "Commander Althea Ebonlocke", "Skeletal Warrior", "Skeletal Mage", 0, 0, 0);

_questDB:addQuest("no", 0, "Wolves at Our Heels", "Lars", -10314.200195313, 625.03900146484, 26.529577255249, 10, 20, 30, -10177.66796875, 398.97235107422, 34.466728210449, 1, 12, 8, 0, 0, -10314.200195313, 625.03900146484, 26.529577255249, "Lars", "Starving Dire Wolf", "Rabid Dire Wolf", 0, 0, 1);

self.isSetup = true;
end