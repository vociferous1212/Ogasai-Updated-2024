_questDB_Mulgore_BloodhoofVillage = {isSetup = false}

function _questDB_Mulgore_BloodhoofVillage:setup()

--_questDB:addQuest(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)

--_questDB:addQuest("no", 1, "Dwarven Digging", "Baine Bloodhoof", -2333.5400390625, -393.07299804688, -8.0124425888062, 215, 6, 10, "At a forge, smash the Prospector's Picks to create Broken Tools."

-- fire totem quest
if GetMyClass() == "SHAMAN" then
	_questDB:addQuest("no", 1, "Call of Fire", "Narm Skychaser", -2298.9599609375, -437.74200439453, -5.4384160041809, 215, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 265.17098999023, -3037.0900878906, 96.949699401855, "Kranal Fiss", 0, 0, 0, 0, 0, 0, "Find Kranal Fiss in the Barrens.", 0, 1);
end

_questDB:addQuest("no", 1, "A Sacred Burial", "Lorekeeper Raintotem", -1150.4100341797, -1027.3699951172, 3.4960255622864, 215, 10, 14, -981.32330322266, -1012.8969116211, 14.410375595093, 1, 8, 0, 0, 0, 0, -1150.4100341797, -1027.3699951172, 3.4960255622864, "Lorekeeper Raintotem", "Bristleback Interloper", 0, 0, 0, 0, 0, "Lorekeeper Raintotem wants you to kill 8 Bristleback Interlopers at Red Rocks.", 0, 1);

_questDB:addQuest("no", 1, "The Ravaged Caravan", "Morin Cloudstalker", -2317.1003417969, -625.11138916016, -9.3817310333252, 215, 8, 12, -1937.1496582031, -732.896484375, 2.1978514194489, 2, 5, 5, 0, 1, 0,  -1924.2434082031, -713.28656005859, 3.93594622612, "Morin Cloudstalker", "Venture Co. Laboror", "Venture Co. Taskmaster", 0, 287, 0, 0, "Morin Cloudstalker wants you to examine the contents of a supply crate at the Ravaged Caravan.", 0, 1);

_questDB:addQuest("no", 1, "Dangers of the Windfury", "Ruul Eagletalon", -2397.0700683594, -384.83099365234, -2.277679681778, 215, 8, 12, -2623.2536621094, -1266.4739990234, 13.270976066589, 1, 10, 10, 0, 0, 0,-2397.0700683594, -384.83099365234, -2.277679681778, "Ruul Eagletalon", "Windfury Harpy", "Windfury Wind Witch", 0, 0, 0, 0, "Bring 8 Windfury Talons to Ruul Eagletalon in Bloodhoof Village.", 0, 1);

_questDB:addQuest("no", 1, "Wildmane Totem", "Mull thunderhorn", -2341.3999023438, -445.44900512695, -6.5005259513855, 215, 6, 12, -2478.1987304688, -1214.7149658203, -3.6065237522125, 1, 10, 0, 0, 0, 0, -2341.3999023438, -445.44900512695, -6.5005259513855, "Mull Thunderhorn", "Prairie Wolf Alpha", 0, 0, 0, 0, 0, "Bring 8 Prairie Alpha Teeth to Mull Thunderhorn in Bloodhoof Village.", 0, 1);
 
_questDB:addQuest("no", 1, "Sharing the Land", "Baine Bloodhoof", -2333.5400390625, -393.07299804688, -8.0124425888062, 215, 6, 10, -2706.6276855469, -706.32598876953, -4.4243850708008, 1, 10, 8, 5, 0, 0, -2333.5400390625, -393.07299804688, -8.0124425888062, "Baine Bloodhoof", "Palemane Tanner", "Palemane Skinner", "Palemane Poacher", 0, 0, 1, "Kill 10 Palemane Tanners, 8 Palemane Skinners, and 5 Palemane Poachers, then return to Baine Bloodhoof in Bloodhoof Village.", 0, 1);

_questDB:addQuest("no", 1, "Thunderhorn Cleansing", "Mull Thunderhorn", -2341.3999023438, -445.44900512695, -6.5003576278687, 215, 6, 10, -1829.2429199219, -242.58923339844, -9.4242296218872, 3, 0, 0, 0, 0, 0, -2341.3999023438, -445.44900512695, -6.5003576278687, "Mull Thunderhorn", 0, 0, 0, 0, 0, 1, "Use the Thunderhorn Cleansing Totem at the Thunderhorn Water Well, then return to Mull.", "Thunderhorn Cleansing Totem", 1);

_questDB:addQuest("no", 1, "Swoop Hunting", "Harken Windtotem", -2304.7900390625, -454.80899047852, -5.4383497238159, 215, 6, 10, -1670.3718261719, -584.74468994141, -26.794269561768, 1, 20, 0, 0, 0, 0, -2304.7900390625, -454.80899047852, -5.4383497238159, "Harken Windtotem", "Swoop", 0, 0, 0, 0, 0, "Bring 8 Trophy Swoop Quills to Harken Windtotem in Bloodhoof Village.", 0, 1);

-- here we will target the name of targets who have the least spawn points and walk across the map to the targets then the quester will switch to other, more abundant targets once done
_questDB:addQuest("no", 1, "Mazzranache", "Maur Raincaller", -2227.5400390625, -365.7200012207, -9.3626298904419, 215, 6, 10, -1825.8076171875, -397.6311340332, -8.6636915206909, 1, 10, 10, 10, 0, 0, -2227.5400390625, -365.7200012207, -9.3626298904419, "Maur Raincaller", "Adult Plainstrider", "Elder Plainstrider", "Swoop", 0, 0, 2, "Bring a Prairie Wolf Heart, Flatland Cougar Femur, Plainstrider Scale and Swoop Gizzard to Maur Raincaller at Bloodhoof Village.", 0, 1);

_questDB:addQuest("no", 1, "Thunderhorn Totem", "Mull Thunderhorn", -2341.3999023438, -445.44900512695, -6.5005259513855, 215, 6, 10, -2036.3660888672, -74.426887512207, -7.1414375305176, 1, 10, 10, 0, 0, 0, -2341.3999023438, -445.44900512695, -6.5005259513855, "Mull Thunderhorn", "Prairie Stalker", "Flatland Cougar", 0, 0, 0, 0, "Bring 6 Stalker Claws and 6 Cougar Claws to Mull Thunderhorn.", 0, 1);

_questDB:addQuest("no", 1, "Winterhoof Cleansing", "Mull Thunderhorn", -2341.3999023438, -445.44900512695, -6.5005259513855, 215, 6, 10, -2535.8701171875, -705.71228027344, -8.3190412521362, 3, 0, 0, 0, 0, 0, -2341.3999023438, -445.44900512695, -6.5005259513855, "Mull Thunderhorn", 0, 0, 0, 0, 0, 0, "Use the Winterhoof Cleansing Totem at the Winterhoof Water Well, then return to Mull Thunderhorn.", "Winterhoof Cleansing Totem", 1);

_questDB:addQuest("no", 1, "Poison Water", "Mull Thunderhorn", -2341.3999023438, -445.44900512695, -6.5005259513855, 215, 6, 10, -2602.6225585938, -376.10891723633, -9.05263805389, 1, 10, 10, 0, 0, 0, -2341.3999023438, -445.44900512695, -6.5005259513855, "Mull Thunderhorn", "Prairie Wolf", "Adult Plainstrider", 0, 0, 0, 0, "Bring 6 Prairie Wolf Paws and 4 Plainstrider Talons to Mull Thunderhorn in Bloodhoof.", 0, 0);

-- kill some here they are pretty easy once you clear it and maybe die a few times
_questDB:addQuest("no", 1, "Rite of Vision", "Zarlam Two-Moons", -2243.4799804688, -405.84298706055, -9.4245004653931, 215, 6, 10, -2613.9313964844, -707.29302978516, -0.29703223705292, 2, 0, 0, 0, 2, 2, -2243.4799804688, -405.84298706055, -9.4245004653931, "Zarlam Two-Moons", "Venture Co. Hireling", 0, 0, 362, 424, 0, "Collect 2 Well Stones and 2 Ambercorn and bring them back to Zarlman Two-Moons in Bloodhoof Village.", 0, 1);

_questDB:addQuest("no", 1, "Rite of Vision", "Baine Bloodhoof", -2333.5400390625, -393.07299804688, -8.0124425888062, 215, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2243.4799804688, -405.84298706055, -9.4245004653931, "Zarlam Two-Moons", 0, 0, 0, 0, 0, 0, "Speak with Zarlman Two-Moons in Bloodhoof Village.", 0, 3);

_questDB:addQuest("no", 1, "A Task Unfinished", "Antur Fallow", -3066.0200195313, 68.800201416016, 79.383514404297, 215, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2363.7182617188, -348.39907836914, -8.9568128585815, "Innkeeper Kauth", 0, 0, 0, 0, 0, 1, "Bring the Bundle of Furs to Innkeeper Kauth in Bloodhoof Village.", 0, 1);

_questDB:addQuest("no", 1, "Rites of the Earthmother", "Chief Hawkwind", -2877.9499511719, -221.83000183105, 54.820850372314, 215, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2335.01171875, -391.26531982422, -7.9884948730469, "Baine Bloodhoof", 0, 0, 0, 0, 0, 0, "Take the Totem of Hawkwind to Baine Bloodhoof in Bloodhoof Village. Follow the road out of Camp Narache.", 0, 1);


self.isSetup = true;
end