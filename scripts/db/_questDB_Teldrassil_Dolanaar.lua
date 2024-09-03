_questDB_Teldrassil_Dolanaar = {isSetup = false}

function _questDB_Teldrassil_Dolanaar:setup()

----_questDB:addQuest(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherName, gatherName2, rewardNum, desc);

--SelectGossipActiveQuests(1) returns nothing...
----_questDB:addQuest("no", 0, "Denalan's Earth", "Syral Bladeleaf", 9872.259765625, 959.27801513672, 1308.0705566406, 141, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9506.919921875, 713.76599121094, 1255.8875732422, "Denalan", 0, 0, 0, 0, 0, 0, "Bring the package of Rare Earth to Denalan at Lake Al'Ameth.");

	_questDB:addQuest("no", 0, "Zenn's Bidding", "Zenn Foulhoof", 9925.73046875, 737.07000732422, 1315.8277587891, 141, 6, 10, 9766.2744140625, 640.22064208984, 1296.651367187, 1, 10, 10, 10, 0, 0, 9925.73046875, 737.07000732422, 1315.8277587891, "Zenn Foulhoof", "Nightsaber", "Strigid Owl", "Webwood Lurker", 0, 0, 1, "Bring Zenn Foulhoof outside of Dolanaar 3 Nightsaber Fangs, 3 Strigid Owl Feathers and 3 swatches of Webwood Spider Silk.");



self.isSetup = true;
end