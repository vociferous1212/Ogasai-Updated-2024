_questDB_Barrens_10_15 = {isSetup = false}

function _questDB_Barrens_10_15:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)

--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 20, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 20, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 20, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 20, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 20, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 20, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 20, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 20, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 20, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 20, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 20, xyz, type



--_questDB:addQuest("no", 1, "", "", xyz, 17, 10, 20, xyz, type

_questDB:addQuest("no", 1, "Prowlers of the Barrens", "Sergra Darkthorn", -482.47500610352, -2670.1899414063, 97.349342346191, 17, 13, 20, -1142.6600341797, -3314.1499023438, 91.804168701172, 1, 10, 0, 0, 0, 0, -482.47500610352, -2670.1899414063, 97.349342346191, "Sergra Darkthorn", "Savannah Prowler", 0, 0, 0, 0, 0, "Collect 7 Prowler Claws from Savannah Prowlers for Sergra Darkthorn in the Crossroads.", 0, 1);

_questDB:addQuest("no", 1, "Raptor Thieves", "Gazrog", -435.95199584961, -2639.2099609375, 96.275207519531, 17, 10, 20, -808.23986816406, -2907.2934570313, 91.99715423584, 1, 10, 10, 0, 0, 0, -435.95199584961, -2639.2099609375, 96.275207519531, "Gazrog", "Sunscale Screecher", "Sunscale Lashtail", 0, 0, 0, 0, "Bring 12 Raptor Heads to Gazrog at the Crossroads.", 0, 1);

_questDB:addQuest("no", 1, "Disrupt the Attacks", "Thork", -473.20199584961, -2595.6999511719, 103.72268676758, 17, 10, 20, -157.04364013672, -2949.5043945313, 92.959602355957, 1, 8, 8, 3, 0, 0, -473.20199584961, -2595.6999511719, 103.72268676758, "Thork", "Razormane Thornweaver", "Razormane Water Seeker", "Razormane Hunter", 0, 0, 0, "Of the Razormane tribe, kill 8 Water Seekers, 8 Thornweavers and 3 Hunters, and then return to Thork in the Crossroads.", 0, 1);

_questDB:addQuest("no", 1, "The Zhevra", "Sergra Darkthorn", -482.47500610352, -2670.1899414063, 97.349334716797, 17, 10, 20, -752.74957275391, -2679.4772949219, 91.684265136719, 1, 10, 0, 0, 0, 0, -482.47500610352, -2670.1899414063, 97.349334716797, "Sergra Darkthorn", "Zhevra Runner", 0, 0, 0, 0, 0, "Slay Zhevra Runners to collect 4 Zhevra Hooves for Sergra Darkthorn in the Crossroads.", 0, 1);

_questDB:addQuest("no", 1, "Plainstrider Menace", "Sergra Darkthorn", -482.47500610352, -2670.1899414063, 97.349334716797, 17, 10, 20, -568.57733154297, -2789.5336914063, 93.000152587891, 1, 10, 10, 0, 0, 0, -482.47500610352, -2670.1899414063, 97.349334716797, "Sergra Darkthorn", "Greater Plainstrider", "Fleeting Plainstrider", 0, 0, 0, 0, "Collect 7 Plainstrider Beaks and return them to Sergra Darkthorn in the Crossroads.", 0, 1);

-- using gather item and no item to gather. will go to spot and finish quest.
_questDB:addQuest("no", 1, "The Forgotten Pools", "Tonga Runetotem", -544.99200439453, -2672.7700195313, 95.787773132324, 17, 10, 20, 91.586433410645, -1943.9213867188, 79.785652160645, 11, 0, 0, 0, 0, 0, -544.99200439453, -2672.7700195313, 95.787773132324, "Tonga Runetotem", 0, 0, 0, 0, 0, 0, "Report back to Tonga Runetotem with your findings.", 0, 1);

_questDB:addQuest("no", 1, "Wharfmaster Dizzywig", "Apothecary Helbrim", -424.5419921875, -2589.8798828125, 95.816192626953, 17, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -985.59899902344, -3796.7099609375, 5.1261796951294, "Wharfmaster Dizzywig", 0, 0, 0, 0, 0, 0, "Bring the Secure Crate to Wharfmaster Dizzywig in Ratchet.", 0, 2);

if GetFaction() == 2 or GetFaction() == 116 then
	--_questDB:addQuest("no", 1, "Ride to Orgrimmar", "Devrak", -437.1369934082, -2596, 95.787612915039, 17, 10, 20, 0, 0, 0, 10, 0, 0, 0, 0, 0, xyz, name, 0, 0, 0, 0, 0, 0, "", 0, 1);
	_questDB:addQuest("no", 1, "Meats to Orgrimmar", "Zargh", -403.67999267578, -2709.3400878906, 97.538192749023, 17, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -437.1369934082, -2596, 95.787612915039, "Devrak", 0, 0, 0, 0, 0, 0, "Bring Zargh's Meats to Devrak in the Crossroads.", 0, 1);
end

if GetFaction() == 6 then
	-- using use item to tell bot to return to barrens FP
	_questDB:addQuest("no", 1, "Return to Jahan", "Tal", -1196.75, 26.077699661255, 176.94958496094, 17, 10, 20, 0, 0, 0, 10, 0, 0, 0, 0, 0, -350.07901000977, -2566.5900878906, 97.358093261719, "Jahan Hawkwing", 0, 0, 0, 0, 0, 0, "Buy a wind rider to the Crossroads from the wind rider master Tal, then bring Ahanu's Leather Goods to Jahan Hawkwing.", "Ahanu's Leather Goods", 1);
	
	_questDB:addQuest("no", 1, "Tal the Wind Rider Master", "Ahanu", -1238.5799560547, 38.971000671387, 127.06378173828, 17, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1196.75, 26.077699661255, 176.94958496094, "Tal", 0, 0, 0, 0, 0, 0, "Bring Ahanu's Leather Goods to Tal in Thunder Bluff.", 0, 1);
	
	_questDB:addQuest("no", 1, "Ride to Thunder Bluff", "Devrak", -437.1369934082, -2596, 95.787612915039, 17, 10, 20, 0, 0, 0, 10, 0, 0, 0, 0, 0, -1238.5799560547, 38.971000671387, 127.06378173828, "Ahanu", 0, 0, 0, 0, 0, 0, "Buy a wind rider to Thunder Bluff from the wind rider master Devrak, then bring the Bundle of Hides to Ahanu in Thunder Bluff.", 0, 1);

	_questDB:addQuest("no", 1, "A Bundle of Hides", "Jahan Hawkwing", -350.07901000977, -2566.5900878906, 97.358093261719, 17, 10, 20, 0, 0, 0, 10, 0, 0, 0, 0, 0, -437.1369934082, -2596, 95.787612915039, "Devrak", 0, 0, 0, 0, 0, 0, "Bring the Bundle of Hides to the wind rider master Devrak in the Crossroads.", 0, 1);
end

_questDB:addQuest("no", 1, "Crossroads Conscription", "Kargal Battlescar", 303.43200683594, -3686.1599121094, 27.067232131958, 17, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -482.47500610352, -2670.1899414063, 97.349334716797, "Sergra Darkthorn", 0, 0, 0, 0, 0, 0, "Follow the western road from Kargal's Far Watch Outpost.\n\nAt the T intersection, turn left and follow the road south. \n\nFind Sergra Darkthorn at the crossing of roads within the Crossroads.", 0, 1);

-- this will take you back to durotar
_questDB:addQuest("no", 1, "Conscript of the Horde", "Takrin Pathseeker", 271.80499267578, -4650.830078125, 11.70618057251, 17, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 303.43200683594, -3686.1599121094, 27.067232131958, "Kargal Battlescar", 0, 0, 0, 0, 0, 0, "Follow the western road from Razor Hill to the Barrens over a bridge.\n\nStop at the orc outpost across the bridge.\n\nGive Kargal Battlescar at the Barrens outpost your recruitment letter.", 0, 1);

self.isSetup = true;
end