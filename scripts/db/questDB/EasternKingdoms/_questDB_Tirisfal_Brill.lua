_questDB_Tirisfal_Brill = {isSetup = false}

function _questDB_Tirisfal_Brill:setup()

--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)


--_questDB:addQuest("no", 1, "", "", x, y, z, 85, 1, 6, x, y, z, 
--_questDB:addQuest("no", 1, "", "", x, y, z, 85, 1, 6, x, y, z,



-- grind x,y,z offset here so we can do a lot of grinding - it's a good spot to grind
_questDB:addQuest("no", 1, "Graverobbers", "Magistrate Sevren",  2278.080078125, 295.58700561523, 35.146938323975, 85, 8, 12, 2552.9765625, 411.65158081055, 29.183498382568, 1, 8, 5, 0, 0, 0, 2278.080078125, 295.58700561523, 35.146938323975, "Magistrate Sevren", "Rot Hide Graverobber", "Rot Hide Mongrel", 0, 0, 0, 0, "Kill Rot Hide Graverobbers and Rot Hide Mongrels.  \n\nBring 8 Embalming Ichors to Magistrate Sevren in Brill.", 0, 1);


_questDB:addQuest("no", 1, "At War With The Scarlet Crusade", "Executor Zygand", 2278.080078125, 295.58700561523, 35.146938323975, 85, 8, 12, 1886.8020019531, 755.23516845703, 39.53235244751, 1, 1, 3, 3, 0, 0, 2278.080078125, 295.58700561523, 35.146938323975, "Executor Zygand", "Captain Perrine", "Scarlet Zealot", "Scarlet Missionary", 0, 0, 0, "Executor Zygand in Brill wants you to kill Captain Perrine, 3 Scarlet Zealots and 3 Scarlet Missionaries.", 0, 1);

_questDB:addQuest("no", 1, "Proof of Demise", "Deathguard Burgess", 2270.6999511719, 279.99798583984, 35.139389038086, 85, 8, 12, 1886.8020019531, 755.23516845703, 39.53235244751, 1, 10, 0, 0, 0, 0, 2270.6999511719, 279.99798583984, 35.139389038086, "Deathguard Burgess", "Scarlet Zealot", "Scarlet Missionary", 0, 0, 0, 3, "Bring 10 Scarlet Insignia Rings to Deathguard Burgess in Brill.", 0, 1);

_questDB:addQuest("no", 1, "At War With The Scarlet Crusade", "Executor Zygand", 2278.080078125, 295.58700561523, 35.14693069458, 85, 8, 12, 2379.3400878906, 1514.8800048828, 35.777603149414, 1, 10, 0, 0, 0, 0, 2278.080078125, 295.58700561523, 35.14693069458, "Executor Zygand", "Scarlet Warrior", 0, 0, 0, 0, 0, "Executor Zygand of Brill wants you to kill 10 Scarlet Warriors.", 0, 1);

--_questDB:addQuest("no", 1, "Doom Weed", "Junior Apothecary Holland", 2401.4699707031, 381.98620605469, 33.897987365723, 85, 8, 12, 2606.2817382813, 467.08862304688, 22.805404663086, 2, 0, 0, 0, 10, 0, 2401.4699707031, 381.98620605469, 33.897987365723, "Junior Apothecary Holland", 0, 0, 0, 4112, 0, 0, "Collect 10 Doom Weed and deliver them back to Junior Apothecary Holland.", 0, 1);

--_questDB:addQuest("no", 1, "Gordo's Task", "Gordo", 2092.0354003906, 777.30523681641, 30.656112670898, 85, 6, 10, 2092.0354003906, 777.30523681641, 30.656112670898, 2, 0, 0, 0, 3, 0, 2401.4699707031, 381.98620605469, 33.897987365723, "Junior Apothecary Holland", 0, 0, 0, 4111, 0, 0, "Collect 3 Gloom Weed and deliver them to Junior Apothecary Holland in the Brill graveyard.", 0, 1);

_questDB:addQuest("no", 1, "A Rogue's Deal", "Calvin Montague", 2126.6398925781, 1305.9499511719, 53.951900482178, 85, 6, 10, 2126.6398925781, 1305.9499511719, 53.951900482178, 1, 1, 0, 0, 0, 0, 2126.6398925781, 1305.9499511719, 53.951900482178, "Calvin Montague", "Calvin Montague", 0, 0, 0, 0, 0, "Defeat Calvin Montague in Deathknell.", 0, 1);

_questDB:addQuest("no", 1, "A Rogue's Deal", "Calvin Montague", 2126.6398925781, 1305.9499511719, 53.951900482178, 85, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2269.5100097656, 244.94400024414, 34.256988525391, "Innkeeper Renee", 0, 0, 0, 0, 0, 2, "Deliver the Nondescript Letter to Innkeeper Renee in Tirisfal Glades.", 0, 1);

_questDB:addQuest("no", 1, "Fields of Grief", "Apothecary Johaan", 2259.0400390625, 347.04800415039, 36.019245147705, 85, 7, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2292.4499511719, 233.12199401855, 27.089141845703, "Captured Scarlet Zealot", 0, 0, 0, 0, 0, 0, "Take the Laced Pumpkin to the Captured Scarlet Zealot who is being held in the cellar of the Gallow's End Tavern.", 0, 2);




_questDB:addQuest("no", 1, "Fields of Grief", "Deathguard Simmer", 2205.75, 1184.5200195313, 32.145820617676, 85, 7, 10, 2263.3728027344, 1357.4959716797, 33.333843231201, 2, 0, 0, 0, 10, 0, 2259.0400390625, 347.04800415039, 36.019496917725, "Apothecary Johaan", 0, 0, 0, 60, 0, 0, "Steal 10 pumpkins from the farm to the west, just north of Deathknell and take them to Apothecary Johaan in Brill.", 0, 1);

_questDB:addQuest("no", 1, "The Chill of Death", "Gretchen Dedmar", 2249.0600585938, 236.78500366211, 41.114894866943, 85, 6, 10, 2159.6516113281, 464.46478271484, 66.882095336914, 7, 10, 0, 0, 0, 0, 2249.0600585938, 236.78500366211, 41.114894866943, "Gretchen Dedmar", "Greater Duskbat", 0, 0, 0, 0, 2, "Bring five Duskbat Pelts and some Coarse Thread to Gretchen Dedmar in Brill.", "Coarse Thread", 1);

_questDB:addQuest("no", 1, "A Putrid Task", "Deathguard Dillinger", 2287.6599121094, 403.37200927734, 33.921516418457, 85, 6, 10, 2148.9426269531, 677.16589355469, 34.744232177734, 1, 10, 10, 0, 0, 0, 2287.6599121094, 403.37200927734, 33.921516418457, "Deathguard Dillinger", "Rotting Dead", "Ravaged Corpse", 0, 0, 0, 0, "Bring 7 Putrid Claws to Deathguard Dillinger in Brill.", 0, 1);

-- added some extra kills sometimes you will leave deathknell at level 5.... this is a good safe spot to vendor/res and all
_questDB:addQuest("no", 1, "A New Plague", "Apothecary Johaan", 2259.0400390625, 347.04800415039, 36.019496917725, 85, 6, 10, 2159.6516113281, 464.46478271484, 66.882095336914, 1, 10, 5, 0, 0, 0, 2259.0400390625, 347.04800415039, 36.019496917725, "Apothecary Johaan", "Decrepit Darkhound", "Greater Duskbat", 0, 0, 0, 1, "Apothecary Johaan in the town of Brill wants you to collect 5 Vials of Darkhound Blood.", 0, 1);

self.isSetup = true;
end