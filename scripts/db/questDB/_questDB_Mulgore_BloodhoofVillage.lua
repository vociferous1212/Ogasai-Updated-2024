_questDB_Mulgore_BloodhoofVillage = {isSetup = false}

function _questDB_Mulgore_BloodhoofVillage:setup()

--_questDB:addQuest(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)

--_questDB:addQuest("no", 1, "Sharing the Land", "Baine Bloodhoof", -2333.5400390625, -393.07299804688, -8.0124425888062, 215, 6, 10, "Kill 10 Palemane Tanners, 8 Palemane Skinners, and 5 Palemane Poachers, then return to Baine Bloodhoof in Bloodhoof Village."

--_questDB:addQuest("no", 1, "Dwarven Digging", "Baine Bloodhoof", -2333.5400390625, -393.07299804688, -8.0124425888062, 215, 6, 10, "At a forge, smash the Prospector's Picks to create Broken Tools."



_questDB:addQuest("no", 1, "Poison Water", "Mull Thunderhorn", -2341.3999023438, -445.44900512695, -6.5005259513855, 215, 6, 10, -2602.6225585938, -376.10891723633, -9.05263805389, 1, 20, 20, 0, 0, 0, -2341.3999023438, -445.44900512695, -6.5005259513855, "Mull Thunderhorn", "Prairie Wolf", "Adult Plainstrider", 0, 0, 0, 0, "Bring 6 Prairie Wolf Paws and 4 Plainstrider Talons to Mull Thunderhorn in Bloodhoof.", 0, 0);

-- kill some here they are pretty easy once you clear it and maybe die a few times
_questDB:addQuest("no", 1, "Rite of Vision", "Zarlam Two-Moons", -2243.4799804688, -405.84298706055, -9.4245004653931, 215, 6, 10, -2613.9313964844, -707.29302978516, -0.29703223705292, 2, 0, 0, 0, 2, 2, -2243.4799804688, -405.84298706055, -9.4245004653931, "Zarlam Two-Moons", "Venture Co. Hireling", 0, 0, 362, 424, 0, "Collect 2 Well Stones and 2 Ambercorn and bring them back to Zarlman Two-Moons in Bloodhoof Village.", 0, 1);

_questDB:addQuest("no", 1, "Rite of Vision", "Baine Bloodhoof", -2333.5400390625, -393.07299804688, -8.0124425888062, 215, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2243.4799804688, -405.84298706055, -9.4245004653931, "Zarlam Two-Moons", 0, 0, 0, 0, 0, 0, "Speak with Zarlman Two-Moons in Bloodhoof Village.", 0, 3);

_questDB:addQuest("no", 1, "A Task Unfinished", "Antur Fallow", -3066.0200195313, 68.800201416016, 79.383514404297, 215, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2363.7182617188, -348.39907836914, -8.9568128585815, "Innkeeper Kauth", 0, 0, 0, 0, 0, 1, "Bring the Bundle of Furs to Innkeeper Kauth in Bloodhoof Village.", 0, 1);

_questDB:addQuest("no", 1, "Rites of the Earthmother", "Chief Hawkwind", -2877.9499511719, -221.83000183105, 54.820850372314, 215, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, -2335.01171875, -391.26531982422, -7.9884948730469, "Baine Bloodhoof", 0, 0, 0, 0, 0, 0, "Take the Totem of Hawkwind to Baine Bloodhoof in Bloodhoof Village. Follow the road out of Camp Narache.", 0, 1);


self.isSetup = true;
end