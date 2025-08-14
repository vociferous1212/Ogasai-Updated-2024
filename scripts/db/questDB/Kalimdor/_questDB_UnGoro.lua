_questDB_UnGoro = {isSetup = false}

function _questDB_UnGoro:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)


--_questDB:addQuest("no", 0, "", "", xyz, 490, 45, 50, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 490, 45, 50, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 490, 45, 50, xyz, type


-- 1. The Bait for Lar'korwi (Use item, requires The Scent of Lar'korwi)
_questDB:addQuest("no", 2, "The Bait for Lar'korwi", "Torwa Pathfinder", -7840.33984375, -2117.3200683594, -254.35252380371, 490, 50, 60, -7499.123046875, -1397.5390625, -254.35252380371, 3, 1, 0, 0, 0, 0, -7840.33984375, -2117.3200683594, -254.35252380371, "Torwa Pathfinder", "Lar'korwi", 0, 0, 0, 0, 1, "Use Torwa's Pouch to summon and kill Lar'korwi at his lair in eastern Un'Goro Crater, then return to Torwa Pathfinder.", 11510, 1);

-- 2. It's Dangerous to Go Alone (Kill, group, requires Linken's Adventure)
_questDB:addQuest("no", 2, "It's Dangerous to Go Alone", "Linken", -6172.7890625, -3065.7100683594, -254.35252380371, 490, 50, 60, -6536.345703125, -4314.0390625, -254.35252380371, 1, 1, 0, 0, 0, 0, -6172.7890625, -3065.7100683594, -254.35252380371, "Linken", "Blazerunner", 0, 0, 0, 0, 1, "Kill Blazerunner at the top of Fire Plume Ridge in central Un'Goro Crater, then return to Linken at Marshal's Refuge.", 0, 1);

-- 3. Linken's Adventure (Use item, requires Linken's Memory)
_questDB:addQuest("no", 2, "Linken's Adventure", "J.D. Collie", -6172.7890625, -3065.7100683594, -254.35252380371, 490, 50, 60, -6172.7890625, -3065.7100683594, -254.35252380371, 3, 0, 0, 0, 0, 0, -6172.7890625, -3065.7100683594, -254.35252380371, "J.D. Collie", 0, 0, 0, 0, 0, 1, "Speak with J.D. Collie at Marshal's Refuge.", 11933, 1);

-- 4. Linken's Memory (Gather, requires A Gnome's Assistance)
_questDB:addQuest("no", 2, "Linken's Memory", "J.D. Collie", -6172.7890625, -3065.7100683594, -254.35252380371, 490, 50, 60, -6172.7890625, -3065.7100683594, -254.35252380371, 2, 0, 0, 0, 1, 0, -6172.7890625, -3065.7100683594, -254.35252380371, "J.D. Collie", 0, 0, 0, 11912, 0, 1, "Bring a Silver Heart to J.D. Collie at Marshal's Refuge.", 0, 1);

-- 5. A Little Help From My Friends (Escort, requires Lost!)
_questDB:addQuest("no", 2, "A Little Help From My Friends", "Ringo", -6536.345703125, -4314.0390625, -254.35252380371, 490, 50, 60, -6536.345703125, -4314.0390625, -254.35252380371, 1, 0, 0, 0, 0, 0, -6172.7890625, -3065.7100683594, -254.35252380371, "Spraggle Frock", 0, 0, 0, 0, 0, 1, "Escort Ringo to Spraggle Frock at Marshal's Refuge.", 0, 1);

-- 6. The New Springs (Gather, requires Finding the Source)
_questDB:addQuest("no", 2, "The New Springs", "Krakle", -6172.7890625, -3065.7100683594, -254.35252380371, 490, 50, 60, -1836.345703125, -6428.0390625, -50.4560546875, 2, 0, 0, 0, 1, 0, -1836.345703125, -6428.0390625, -50.4560546875, "Donova Snowden", 0, 0, 0, 12467, 0, 1, "Bring Krakle's Thermometer to Donova Snowden in Winterspring.", 0, 1);

-- 7. Finding the Source (Use item)
_questDB:addQuest("no", 2, "Finding the Source", "Krakle", -6172.7890625, -3065.7100683594, -254.35252380371, 490, 50, 60, -6536.345703125, -4314.0390625, -254.35252380371, 3, 0, 0, 0, 0, 0, -6172.7890625, -3065.7100683594, -254.35252380371, "Krakle", 0, 0, 0, 0, 0, 1, "Use Krakle's Thermometer to measure the temperature at Fire Plume Ridge, then return to Krakle at Marshal's Refuge.", 12467, 1);

-- 8. A Better Ingredient (Gather, requires Toxic Test)
_questDB:addQuest("no", 2, "A Better Ingredient", "Torwa Pathfinder", -7840.33984375, -2117.3200683594, -254.35252380371, 490, 50, 60, -7436.7890625, -3064.7100683594, -254.35252380371, 2, 0, 0, 0, 1, 0, -7840.33984375, -2117.3200683594, -254.35252380371, "Torwa Pathfinder", 0, 0, 0, 11514, 0, 1, "Bring a Devilsaur Barb to Torwa Pathfinder at the entrance of Un'Goro Crater.", 0, 1);

-- 9. Toxic Test (Use item, requires Bloodpetal Poison)
_questDB:addQuest("no", 2, "Toxic Test", "Torwa Pathfinder", -7840.33984375, -2117.3200683594, -254.35252380371, 490, 50, 60, -7436.7890625, -3064.7100683594, -254.35252380371, 3, 1, 0, 0, 0, 0, -7840.33984375, -2117.3200683594, -254.35252380371, "Torwa Pathfinder", "Devilsaur", 0, 0, 0, 0, 1, "Use the Toxic Injector to weaken a Devilsaur in Un'Goro Crater, then return to Torwa Pathfinder.", 11513, 1);

-- 10. Bloodpetal Poison (Gather)
_questDB:addQuest("no", 2, "Bloodpetal Poison", "Torwa Pathfinder", -7840.33984375, -2117.3200683594, -254.35252380371, 490, 50, 60, -7436.7890625, -3064.7100683594, -254.35252380371, 2, 0, 0, 0, 15, 0, -7840.33984375, -2117.3200683594, -254.35252380371, "Torwa Pathfinder", 0, 0, 0, 11507, 0, 1, "Bring 15 Bloodpetal Sprouts to Torwa Pathfinder at the entrance of Un'Goro Crater.", 0, 1);

-- 11. The Mighty U'cha (Kill, requires The Apes of Un'Goro)
_questDB:addQuest("no", 2, "The Mighty U'cha", "Torwa Pathfinder", -7840.33984375, -2117.3200683594, -254.35252380371, 490, 50, 60, -6074.4560546875, -3064.7100683594, -254.35252380371, 1, 1, 0, 0, 0, 0, -7840.33984375, -2117.3200683594, -254.35252380371, "Torwa Pathfinder", "U'cha", 0, 0, 0, 0, 1, "Kill U'cha in the Fungal Rock cave in northern Un'Goro Crater, then return to Torwa Pathfinder.", 0, 1);

-- 12. Lost! (Use item)
_questDB:addQuest("no", 2, "Lost!", "Spraggle Frock", -6172.7890625, -3065.7100683594, -254.35252380371, 490, 50, 60, -6536.345703125, -4314.0390625, -254.35252380371, 3, 0, 0, 0, 0, 0, -6172.7890625, -3065.7100683594, -254.35252380371, "Spraggle Frock", 0, 0, 0, 0, 0, 1, "Use Spraggle's Canteen at Fire Plume Ridge to find Ringo, then return to Spraggle Frock at Marshal's Refuge.", 11568, 1);

-- 13. Beware of Pterrordax (Kill)
_questDB:addQuest("no", 2, "Beware of Pterrordax", "Wanted Poster", -6172.7890625, -3065.7100683594, -254.35252380371, 490, 50, 60, -6074.4560546875, -3064.7100683594, -254.35252380371, 1, 10, 10, 0, 0, 0, -6172.7890625, -3065.7100683594, -254.35252380371, "Spraggle Frock", "Pterrordax", "Frenzied Pterrordax", 0, 0, 0, 1, "Kill 10 Pterrordaxes and 10 Frenzied Pterrordaxes in northern Un'Goro Crater, then return to Spraggle Frock at Marshal's Refuge.", 0, 1);

-- 14. Expedition Salvation (Gather)
_questDB:addQuest("no", 2, "Expedition Salvation", "Williden Marshal", -6172.7890625, -3065.7100683594, -254.35252380371, 490, 50, 60, -6436.7890625, -3612.7100683594, -254.35252380371, 2, 0, 0, 0, 1, 1, -6172.7890625, -3065.7100683594, -254.35252380371, "Williden Marshal", 0, 0, 0, 11505, 11506, 1, "Bring 1 Crate of Foodstuffs and 1 Research Equipment from northern Un'Goro Crater to Williden Marshal at Marshal's Refuge.", 0, 1);

-- 15. Alien Ecology (Use item)
_questDB:addQuest("no", 2, "Alien Ecology", "Hol'anyee Marshal", -6172.7890625, -3065.7100683594, -254.35252380371, 490, 50, 60, -6836.7890625, -6064.4800683594, -254.35252380371, 3, 0, 0, 0, 1, 0, -6172.7890625, -3065.7100683594, -254.35252380371, "Hol'anyee Marshal", 0, 0, 0, 11509, 0, 1, "Use the Scraping Vial to collect a Hive Wall Sample from the Slithering Scar in southern Un'Goro Crater, then return to Hol'anyee Marshal at Marshal's Refuge.", 11509, 1);

-- 16. Shizzle's Flyer (Gather)
_questDB:addQuest("no", 2, "Shizzle's Flyer", "Shizzle", -6172.7890625, -3065.7100683594, -254.35252380371, 490, 50, 60, -7436.7890625, -6064.4800683594, -254.35252380371, 2, 0, 0, 0, 8, 8, -6172.7890625, -3065.7100683594, -254.35252380371, "Shizzle", 0, 0, 0, 11500, 11501, 1, "Bring 8 Webbed Diemetradon Scales and 8 Webbed Pterrordax Scales from southern Un'Goro Crater to Shizzle at Marshal's Refuge.", 0, 1);

-- 17. Roll the Bones (Gather)
_questDB:addQuest("no", 2, "Roll the Bones", "Spark Nilminer", -6172.7890625, -3065.7100683594, -254.35252380371, 490, 50, 60, -7436.7890625, -3064.7100683594, -254.35252380371, 2, 0, 0, 0, 8, 0, -6172.7890625, -3065.7100683594, -254.35252380371, "Spark Nilminer", 0, 0, 0, 11503, 0, 1, "Bring 8 Dinosaur Bones from Un'Goro Crater to Spark Nilminer at Marshal's Refuge.", 0, 1);

-- 18. Chasing A-Me 01 (Kill and escort)
_questDB:addQuest("no", 2, "Chasing A-Me 01", "Karna Remtravel", -6172.7890625, -3065.7100683594, -254.35252380371, 490, 50, 60, -6074.4560546875, -3064.7100683594, -254.35252380371, 1, 5, 0, 0, 0, 0, -6172.7890625, -3065.7100683594, -254.35252380371, "Karna Remtravel", "Pterrordax", 0, 0, 0, 0, 1, "Kill 5 Pterrordaxes and escort A-Me 01 to safety in northern Un'Goro Crater, then return to Karna Remtravel at Marshal's Refuge.", 0, 1);

-- 19. The Scent of Lar'korwi (Gather)
_questDB:addQuest("no", 2, "The Scent of Lar'korwi", "Torwa Pathfinder", -7840.33984375, -2117.3200683594, -254.35252380371, 490, 50, 60, -7436.7890625, -3064.7100683594, -254.35252380371, 2, 0, 0, 0, 2, 0, -7840.33984375, -2117.3200683594, -254.35252380371, "Torwa Pathfinder", 0, 0, 0, 11502, 0, 1, "Bring 2 Ravasaur Matriarch's Pelts to Torwa Pathfinder at the entrance of Un'Goro Crater.", 0, 1);

-- 20. The Apes of Un'Goro (Kill)
_questDB:addQuest("no", 2, "The Apes of Un'Goro", "Torwa Pathfinder", -7840.33984375, -2117.3200683594, -254.35252380371, 490, 50, 60, -6074.4560546875, -3064.7100683594, -254.35252380371, 1, 2, 2, 2, 0, 0, -7840.33984375, -2117.3200683594, -254.35252380371, "Torwa Pathfinder", "Un'Goro Gorilla", "Un'Goro Stomper", "Un'Goro Thunderer", 0, 0, 1, "Bring 2 Un'Goro Gorilla Pelts, 2 Un'Goro Stomper Pelts, and 2 Un'Goro Thunderer Pelts to Torwa Pathfinder at the entrance of Un'Goro Crater.", 0, 1);

self.isSetup = true;

end