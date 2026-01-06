_questDB_Tirisfal_Deathknell = {isSetup = false}

function _questDB_Tirisfal_Deathknell:setup()

--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)

--_questDB:addQuest("no", 1, "", "", x, y, z, 85, 1, 6, x, y, z, 

_questDB:addQuest("no", 1, "Vital Intelligence", "Executor Arren", 1848.8199462891, 1580.4699707031, 94.663215637207, 85, 4, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2278.080078125, 295.58700561523, 35.146938323975, "Executor Zygand", 0, 0, 0, 0, 0, 0, "Deliver the Scarlet Crusade Documents to Executor Zygand in Brill.", 0, 1);

_questDB:addQuest("no", 1, "The Red Messenger", "Executor Arren", 1848.8199462891, 1580.4699707031, 94.663093566895, 85, 4, 6, 1763.4799804688, 1384.8000488281, 92.706619262695, 1, 1, 0, 0, 0, 0, 1848.8199462891, 1580.4699707031, 94.663093566895, "Executor Arren", 
"Meven Korgal", 0, 0, 0, 0, 2, "Kill Meven Korgal, the messenger, at the Crusader camp, then return any information you find to Executor Arren.", 0, 1);
 
_questDB:addQuest("no", 1, "The Scarlet Crusade", "Executor Arren", 1849.01171875, 1582.4462890625, 94.073722839355, 85, 4, 6, 1824.0997314453, 1384.3817138672, 75.812217712402, 1, 10, 10, 0, 0, 0, 1849.01171875, 1582.4462890625, 94.073722839355, "Executor Arren", "Scarlet Initiate", "Scarlet Convert", 0, 0, 0, 4, "Bring Executor Arren 12 Scarlet Armbands from Scarlet Converts and Scarlet Initiates.", 0, 1);

_questDB:addQuest("no", 1, "Night Web's Hollow", "Executor Arren", 1847.6917724609, 1581.4688720703, 94.541481018066, 85, 3, 6,2060.5170898438, 1796.8792724609, 96.28076171875, 1, 10, 8, 0, 0, 0, 1847.6917724609, 1581.4688720703, 94.541481018066, "Executor Arren", "Young Night Web Spider", "Night Web Spider", 0, 0, 0, 3, "Executor Arren wants you to kill 10 Young Night Web Spiders and 8 Night Web Spiders.", 0, 1);

_questDB:addQuest("no", 1, "Scavenging Deathknell", "Deathguard Saltain", 1859.8845214844, 1605.1652832031, 95.0546875, 85, 1, 6, 1919.6579589844, 1542.2098388672, 87.059234619141, 2, 0, 0, 0, 6, 0, 1859.8845214844, 1605.1652832031, 95.0546875, "Deathguard Saltain", 0, 0, 0, 36, 0, 3, "Search Deathknell and the vicinity for 6 pieces of Scavenged Goods, and return them to Deathguard Saltain.", 0, 1);

	-- we can't do type 6 quest yet
	--_questDB:addQuest("no", 1, "Marla's Last Wish", "Novice Elreth", 1847.55859375, 1638.2150878906, 96.934028625488, 85, 1, 6, 1992.3714599609, 1380.7069091797, 62.068729400635, 6, 1, 0, 0, 0, 0, 1878.1737060547, 1623.8287353516, 94.632858276367, 20, "Samuel Fipps", 0, 0, 0, 0, 0, "Bring Samuel Fipps' Remains to Marla's Grave, then return to Novice Elreth.", 0, 1);

_questDB:addQuest("no", 1, "The Damned", "Novice Elreth", 1846.7763671875, 1638.0198974609, 96.933639526367, 85, 1, 6, 1971.1020507813, 1682.8845214844, 77.90934753418, 1, 6, 6, 0, 0, 0, 1846.7763671875, 1638.0198974609, 96.933639526367, "Novice Elreth", "Young Scavenger", "Duskbat", 0, 0, 0, 2, "Novice Elreth requires 6 Scavenger Paws and 6 Duskbat Wings.", 0, 1);

_questDB:addQuest("no", 1, "Rattling the Rattlecages", "Shadow Priest Sarvis", 1843.1867675781, 1638.1273193359, 97.230392456055, 85, 1, 6, 1995.5382080078, 1557.5123291016, 78.250221252441, 1, 12, 0, 0, 0, 0, 1843.1867675781, 1638.1273193359, 97.230392456055, "Shadow Priest Sarvis", "Rattlecage Skeleton", 0, 0, 0, 0, 3, "Kill 12 Rattlecage Skeletons, and then return to Shadow Priest Sarvis in Deathknell when you are done.", 0, 1);

	-- class starter quests
	if GetMyClass() == "ROGUE" then
	_questDB:addQuest("no", 1, "Encrypted Scroll", "Shadow Priest Sarvis", 1843.1867675781, 1638.1273193359, 97.230392456055, 85, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1860.6556396484, 1565.6350097656, 94.313667297363, "David Trias", 0, 0, 0, 0, 0, 0, "Read the Encrypted Scroll and speak to David Trias in Deathknell.", 0, 1);
	end
	if GetMyClass() == "WARLOCK" then
	_questDB:addQuest("no", 1, "Tainted Scroll", "Shadow Priest Sarvis", 1843.3199462891, 1639.9000244141, 97.628211975098, 85, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1839.0300292969, 1636.5400390625, 96.933578491211, "Maximillion", 0, 0, 0, 0, 0, 0, "Read the Tainted Scroll and speak to Maximillion in Deathknell.", 0, 1);
end


_questDB:addQuest("no", 1, "The Mindless Ones", "Shadow Priest Sarvis", 1843.1867675781, 1638.1273193359, 97.230392456055, 85, 1, 6, 1934.5037841797, 1576.1915283203, 82.858383178711, 1, 8, 8, 0, 0, 0, 1843.1867675781, 1638.1273193359, 97.230392456055, "Shadow Priest Sarvis", "Wretched Zombie", "Mindless Zombie", 0, 0, 0, 2, "Shadow Priest Sarvis wants you to kill 8 Mindless Zombies and 8 Wretched Zombies.", 0, 1);

	-- class pet quest
	if GetMyClass() == "WARLOCK" then
	_questDB:addQuest("no", 1, "Piercing the Veil", "Venya Marthand", 1836.9399414063, 1633.4300537109, 96.933525085449, 85, 1, 6, 1976.2431640625, 1560.8590087891, 79.482109069824, 1, 3, 0, 0, 0, 0, 1836.9399414063, 1633.4300537109, 96.933525085449, "Venya Marthand", "Rattlecage Skeleton", 0, 0, 0, 0, 0, "Bring Venya Marthand 3 Rattlecage Skulls.", 0, 1);
	end

_questDB:addQuest("no", 1, "Rude Awakening", "Undertaker Mordo", 1679.4172363281, 1666.1722412109, 135.3966217041, 85, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1843.1867675781, 1638.1273193359, 97.230392456055, "Shadow Priest Sarvis", 0, 0, 0, 0, 0, 0, "Speak with Shadow Priest Sarvis.", 0, 0);

self.isSetup = true;
end