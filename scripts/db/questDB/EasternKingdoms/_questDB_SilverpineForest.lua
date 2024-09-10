_questDB_SilverpineForest = {isSetup = false}

--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)


--_questDB:addQuest("no", 1, "", "", x, y, z, 130, 10, 15, x, y, z, 

function _questDB_SilverpineForest:setup()


--_questDB:addQuest("no", 1, "", "", x, y, z, 130, 10, 15, x, y, z, 
--_questDB:addQuest("no", 1, "", "", x, y, z, 130, 10, 15, x, y, z, 
--_questDB:addQuest("no", 1, "", "", x, y, z, 130, 10, 15, x, y, z, 
--_questDB:addQuest("no", 1, "", "", x, y, z, 130, 10, 15, x, y, z, 
--_questDB:addQuest("no", 1, "", "", x, y, z, 130, 10, 15, x, y, z, 
--_questDB:addQuest("no", 1, "", "", x, y, z, 130, 10, 15, x, y, z, 
--_questDB:addQuest("no", 1, "", "", x, y, z, 130, 10, 15, x, y, z, 

-- type 8 not working?
--_questDB:addQuest("no", 1, "Escorting Erland", "Deathstalker Erland", 1409.6800537109, 1090.2600097656, 53.685470581055, 130, 10, 15, 0, 0, 0, 8, 0, 0, 0, 0, 0, 1290.6899414063, 1204.6999511719, 52.72172164917, "Rane Yorick", 0, 0, 0, 0, 0, 1, "Escort Erland through the wolves, to Rane Yorick.", 0, 1);

_questDB:addQuest("no", 1, "A Recipe For Death", "Apothecary Renferrel", 522.44897460938, 1652.3000488281, 125.65983581543, 130, 10, 15, 1231.2794189453, 1857.7447509766, 10.451230049133, 1, 10, 10, 0, 0, 0, 522.44897460938, 1652.3000488281, 125.65986633301, "Apothecary Renferrel", "Giant Grizzled Bear", "check", 0, 0, 0, 0, "Collect 6 Grizzled Bear Hearts and 6 samples of Skittering Blood and deliver them to Master Apothecary Faranell in the Undercity.", 0, 1);

_questDB:addQuest("no", 1, "Arugal's Folly", "Dalar Dawnweaver", 553.16375732422, 1592.1258544922, 130.31602478027, 130, 10, 15, 867.16137695313, 1232.5633544922, 52.602878570557, 2, 0, 0, 0, 0, 0, 553.16375732422, 1592.1258544922, 130.31602478027, "Dalar Dawnweaver", 0, 0, 0, 0, 0, 0, "Retrieve the Remedy of Arugal for Dalar Dawnweaver at the Sepulcher.", 0, 1);

_questDB:addQuest("no", 1, "Wild Hearts", "Rane Yorick", 1290.6899414063, 1204.6999511719, 52.72172164917, 130, 10, 15, 1305.4827880859, 1154.5721435547, 52.442070007324, 1, 10, 0, 0, 0, 0, 522.44897460938, 1652.3000488281, 125.65983581543, "Apothecary Renferrel", "Mottled Worg", 0, 0, 0, 0, 0, "Gather 6 discolored worg hearts and bring them to Apothecary Renferrel at the Sepulcher.", 0, 1);

_questDB:addQuest("no", 1, "Lost Deathstalkers", "High Executor Hadrec", 522.44897460938, 1626.1500244141, 104.81187438965, 130, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1290.6899414063, 1204.6999511719, 52.72172164917, "Rane Yorick", 0, 0, 0, 0, 0, 0, "Find the Deathstalkers Quinn and Rane Yorick.", 0, 1);
 
_questDB:addQuest("no", 1, "Prove Your Worth", "Dalar Dawnweaver", 551.48095703125, 1594.7186279297, 129.86012268066, 130, 10, 15, 503.75399780273, 1266.4802246094, 83.814270019531, 1, 5, 0, 0, 0, 0, 551.48095703125, 1594.7186279297, 129.86012268066, "Dalar Dawnweaver", "Moonrage Whitescalp", 0, 0, 0, 0, 0, "Dalar Dawnweaver at the Sepulcher wants you to kill 5 Moonrage Whitescalps.", 0, 1);

_questDB:addQuest("no", 1, "Supplying the Sepulcher", "Deathguard Podrig", 499.65301513672, 1626.2199707031, 125.66520690918, 130, 10, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 473.93899536133, 1533.9499511719, 131.87731933594, "Karos Razok", 0, 0, 0, 0, 0, 0, "Bring Podrig's Order to Karos Razok.", 0, 1);

self.isSetup =  true;
end


