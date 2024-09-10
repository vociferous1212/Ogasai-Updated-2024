_questDB_Barrens_10_15 = {isSetup = false}

function _questDB_Barrens_10_15:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)

--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 15, xyz, type


_questDB:addQuest("no", 1, "Disrupt the Attacks", "Thork", -473.20199584961, -2595.6999511719, 103.72268676758, 17, 10, 15, -157.04364013672, -2949.5043945313, 92.959602355957, 1, 8, 8, 3, 0, 0, -473.20199584961, -2595.6999511719, 103.72268676758, "Thork", "Razormane Thornweaver", "Razormane Water Seeker", "Razormane Hunter", 0, 0, 0, "Of the Razormane tribe, kill 8 Water Seekers, 8 Thornweavers and 3 Hunters, and then return to Thork in the Crossroads.", 0, 1);

if GetFaction() == 2 or GetFaction() == 116 then
	_questDB:addQuest("no", 1, "Ride to Orgrimmar", "Devrak", -437.1369934082, -2596, 95.787612915039, 17, 10, 15, 0, 0, 0, 10, 0, 0, 0, 0, 0, xyz, name, 0, 0, 0, 0, 0, 0, "", 0, 1);
	_questDB:addQuest("no", 1, "Meats to Orgrimmar", "Zargh", -403.67999267578, -2709.3400878906, 97.538192749023, 17, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, -437.1369934082, -2596, 95.787612915039, "Devrak", 0, 0, 0, 0, 0, 0, "Bring Zargh's Meats to Devrak in the Crossroads.", 0, 1);
end
_questDB:addQuest("no", 1, "Wharfmaster Dizzywig", "Wharfmaster Dizzywig", -424.5419921875, -2589.8798828125, 95.816192626953, 17, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, -985.59899902344, -3796.7099609375, 5.1261796951294, "Wharfmaster Dizzywig", 0, 0, 0, 0, 0, 0, "Bring the Secure Crate to Wharfmaster Dizzywig in Ratchet.", 0, 2);

_questDB:addQuest("no", 1, "Plainstrider Menace", "Sergra Darkthorn", -482.47500610352, -2670.1899414063, 97.349334716797, 17, 10, 15, -568.57733154297, -2789.5336914063, 93.000152587891, 1, 10, 0, 0, 0, 0, -482.47500610352, -2670.1899414063, 97.349334716797, "Sergra Darkthorn", "Greater Plainstrider", 0, 0, 0, 0, 0, "Collect 7 Plainstrider Beaks and return them to Sergra Darkthorn in the Crossroads.", 0, 1);

_questDB:addQuest("no", 1, "Conscript of the Horde", "Kargal Battlescar", 303.43200683594, -3686.1599121094, 27.067232131958, 17, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -482.47500610352, -2670.1899414063, 97.349334716797, "Sergra Darkthorn", 0, 0, 0, 0, 0, 0, "Follow the western road from Kargal's Far Watch Outpost.\n\nAt the T intersection, turn left and follow the road south. \n\nFind Sergra Darkthorn at the crossing of roads within the Crossroads.", 0, 1);

-- this will take you back to durotar
_questDB:addQuest("no", 1, "Conscript of the Horde", "Takrin Pathseeker", 271.80499267578, -4650.830078125, 11.70618057251, 17, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 303.43200683594, -3686.1599121094, 27.067232131958, "Kargal Battlescar", 0, 0, 0, 0, 0, 0, "Follow the western road from Razor Hill to the Barrens over a bridge.\n\nStop at the orc outpost across the bridge.\n\nGive Kargal Battlescar at the Barrens outpost your recruitment letter.", 0, 1);




self.isSetup = true;
end