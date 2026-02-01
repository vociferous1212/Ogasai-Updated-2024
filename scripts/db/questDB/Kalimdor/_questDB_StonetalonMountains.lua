_questDB_StonetalonMountains = {isSetup = false}

function _questDB_StonetalonMountains:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)

--_questDB:addQuest("no", 0, "", "", xyz, 440, 40, 50, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 440, 40, 50, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 440, 40, 50, xyz, type


-- 1. Ordanus (Kill, requires Cenarius’ Legacy, Quest ID 1088)
_questDB:addQuest("no", 2, "Ordanus", "Braelyn Firehand", 559.36, 796.94, 103.43557739258, 406, 15, 35, -40.64, 1896.94, 44.40, 1, 1, 0, 0, 0, 0, 559.36, 796.94, 103.43557739258, "Braelyn Firehand", "Ordanus", 0, 0, 0, 0, 1, "Kill Ordanus at the Charred Vale and bring his head to Braelyn Firehand in Sun Rock Retreat.", 0, 1);

-- 2. The Den (Kill, requires Cenarius’ Legacy, Quest ID 1087)
_questDB:addQuest("no", 2, "The Den", "Braelyn Firehand", 559.36, 796.94, 103.43557739258, 406, 15, 35, -40.64, 1896.94, 44.40, 1, 1, 0, 0, 0, 0, 559.36, 796.94, 103.43557739258, "Braelyn Firehand", "Druid of the Fang", 0, 0, 0, 0, 1, "Kill 5 Druids of the Fang in the Den at the Charred Vale and return to Braelyn Firehand in Sun Rock Retreat.", 0, 1);

-- 3. Bloodfury Bloodline (Kill, requires Harpies Threaten, Quest ID 1068)
_questDB:addQuest("no", 2, "Bloodfury Bloodline", "Maggran Earthbinder", 559.36, 796.94, 103.43557739258, 406, 15, 35, -40.64, 1896.94, 44.40, 1, 1, 0, 0, 0, 0, 559.36, 796.94, 103.43557739258, "Maggran Earthbinder", "Bloodfury Ripper", 0, 0, 0, 0, 1, "Kill Bloodfury Ripper in the Charred Vale and bring her remains to Maggran Earthbinder in Sun Rock Retreat.", 0, 1);

-- 4. Harpies Threaten (Kill, Quest ID 6281)
_questDB:addQuest("no", 2, "Harpies Threaten", "Maggran Earthbinder", 559.36, 796.94, 103.43557739258, 406, 15, 35, -40.64, 1896.94, 44.40, 1, 10, 10, 8, 0, 0, 559.36, 796.94, 103.43557739258, "Maggran Earthbinder", "Bloodfury Harpy", "Bloodfury Ambusher", "Bloodfury Slayer", 0, 0, 1, "Kill 10 Bloodfury Harpies, 10 Bloodfury Ambushers, and 8 Bloodfury Slayers in the Charred Vale, then return to Maggran Earthbinder in Sun Rock Retreat.", 0, 1);

-- 5. New Life (Use item, requires Cycle of Rebirth, Quest ID 1089)
_questDB:addQuest("no", 2, "New Life", "Tammra Windfield", 1015.6799926758, 928.041015625, 103.43557739258, 406, 15, 35, -40.64, 1896.94, 44.40, 3, 0, 0, 0, 10, 0, 1015.6799926758, 928.041015625, 103.43557739258, "Tammra Windfield", 0, 0, 0, 8049, 0, 1, "Use Gaea Seeds to plant 10 seeds in the fertile soil mounds of the Charred Vale, then return to Tammra Windfield in Sun Rock Retreat.", 8049, 1);

-- 6. Elemental War (Kill, Quest ID 1048)
_questDB:addQuest("no", 2, "Elemental War", "Tsunaman", 559.36, 796.94, 103.43557739258, 406, 15, 35, -40.64, 1896.94, 44.40, 1, 10, 0, 0, 0, 0, 559.36, 796.94, 103.43557739258, "Tsunaman", "Raging Fire Elemental", 0, 0, 0, 0, 1, "Kill 10 Raging Fire Elementals in the Charred Vale, then return to Tsunaman in Sun Rock Retreat.", 0, 1);

-- 7. Cenarius’ Legacy (Kill, Quest ID 1086)
_questDB:addQuest("no", 2, "Cenarius’ Legacy", "Braelyn Firehand", 559.36, 796.94, 103.43557739258, 406, 15, 35, -40.64, 1896.94, 44.40, 1, 4, 4, 4, 0, 0, 559.36, 796.94, 103.43557739258, "Braelyn Firehand", "Son of Cenarius", "Daughter of Cenarius", "Cenarion Protector", 0, 0, 1, "Kill 4 Sons of Cenarius, 4 Daughters of Cenarius, and 4 Cenarion Protectors in the Charred Vale, then return to Braelyn Firehand in Sun Rock Retreat.", 0, 1);

-- 8. Cycle of Rebirth (Gather, Quest ID 6301)
_questDB:addQuest("no", 2, "Cycle of Rebirth", "Tammra Windfield", 1015.6799926758, 928.041015625, 103.43557739258, 406, 15, 35, 59.36, 996.94, 44.40, 2, 0, 0, 0, 10, 0, 1015.6799926758, 928.041015625, 103.43557739258, "Tammra Windfield", 0, 0, 0, 8048, 0, 1, "Bring 10 Gaea Seeds from Mirkfallon Lake to Tammra Windfield in Sun Rock Retreat.", 0, 1);

-- 9. Jin’Zil’s Forest Magic (Gather, Quest ID 1058)
_questDB:addQuest("no", 2, "Jin’Zil’s Forest Magic", "Witch Doctor Jin’Zil", -272.48001098633, -394.08401489258, 17.195829391479, 406, 15, 35, 59.36, 996.94, 44.40, 2, 0, 0, 0, 5, 5, -272.48001098633, -394.08401489258, 17.195829391479, "Witch Doctor Jin’Zil", 0, 0, 0, 8050, 8051, 1, "Bring 5 Stonetalon Sap and 5 Twilight Whiskers from Mirkfallon Lake to Witch Doctor Jin’Zil in Malaka’jin.", 0, 1);

-- 10. Arachnophobia (Kill, Quest ID 6284)
_questDB:addQuest("no", 2, "Arachnophobia", "Wanted Poster", 559.36, 796.94, 103.43557739258, 406, 15, 35, 59.36, 996.94, 44.40, 1, 1, 0, 0, 0, 0, 559.36, 796.94, 103.43557739258, "Maggran Earthbinder", "Besseleth", 0, 0, 0, 0, 1, "Kill Besseleth near Mirkfallon Lake and bring its fang to Maggran Earthbinder in Sun Rock Retreat.", 0, 1);

-- 11. Further Instructions (Kill, requires Super Reaper 6000, Quest ID 1094)
_questDB:addQuest("no", 2, "Further Instructions", "Ziz Fizziks", 3059.36, -803.06, 44.40, 406, 15, 35, 1259.36, -1203.06, 44.40, 1, 1, 0, 0, 0, 0, 3059.36, -803.06, 44.40, "Ziz Fizziks", "Gerenzo Wrenchwhistle", 0, 0, 0, 0, 1, "Kill Gerenzo Wrenchwhistle in Windshear Crag and return to Ziz Fizziks in Ratchet.", 0, 1);

-- 12. Gerenzo’s Orders (Kill, Quest ID 1092)
_questDB:addQuest("no", 2, "Gerenzo’s Orders", "Gerenzo’s Orders", 1259.36, -1203.06, 44.40, 406, 15, 35, 1259.36, -1203.06, 44.40, 1, 6, 6, 0, 0, 0, 3059.36, -803.06, 44.40, "Ziz Fizziks", "Venture Co. Operator", "Venture Co. Overseer", 0, 0, 0, 1, "Kill 6 Venture Co. Operators and 6 Venture Co. Overseers in Windshear Crag, then return to Ziz Fizziks in Ratchet.", 0, 1);

-- 13. Shredding Machines (Kill, Quest ID 1067)
_questDB:addQuest("no", 2, "Shredding Machines", "Seereth Stonebreak", -265.125, -943.147, 12.546382904053, 406, 15, 35, 1259.36, -1203.06, 44.40, 1, 2, 0, 0, 0, 0, -265.125, -943.147, 12.546382904053, "Seereth Stonebreak", "XT:4", "XT:9", 0, 0, 0, 1, "Destroy 2 Shredder Machines (XT:4 and XT:9) in Windshear Crag, then return to Seereth Stonebreak in Honor’s Stand.", 0, 1);

-- 14. Super Reaper 6000 (Gather, requires Ziz Fizziks, Quest ID 1093)
_questDB:addQuest("no", 2, "Super Reaper 6000", "Ziz Fizziks", 3059.36, -803.06, 44.40, 406, 15, 35, 1259.36, -1203.06, 44.40, 2, 0, 0, 0, 1, 0, 3059.36, -803.06, 44.40, "Ziz Fizziks", 0, 0, 0, 5792, 0, 1, "Bring the Super Reaper 6000 Blueprints from Windshear Crag to Ziz Fizziks in Ratchet.", 0, 1);

-- 15. Earthen Arise (Kill, requires Boulderslide Ravine, Quest ID 6482)
_questDB:addQuest("no", 2, "Earthen Arise", "Mor’rogal", 559.36, 796.94, 103.43557739258, 406, 15, 35, 59.36, 1596.94, 44.40, 1, 1, 0, 0, 0, 0, 559.36, 796.94, 103.43557739258, "Mor’rogal", "Goggeroc", 0, 0, 0, 0, 1, "Kill Goggeroc in Boulderslide Ravine and return to Mor’rogal in Sun Rock Retreat.", 0, 1);

-- 16. Boulderslide Ravine (Gather, Quest ID 6421)
_questDB:addQuest("no", 2, "Boulderslide Ravine", "Mor’rogal", 831.23400878906, 939.91400146484, 154.98725891113, 406, 15, 35, -122.93688201904, 220.02459716797, 98.006301879883, 2, 0, 0, 0, 10, 0, 831.23400878906, 939.91400146484, 154.98725891113, "Mor’rogal", 0, 0, 0, 8047, 0, 1, "Explore deep into the cave at Boulderslide Ravine and bring back 10 Resonite Crystals for Mor'rogal at Sun Rock Retreat to investigate.", 0, 1);

-- 17. Goblin Invaders (Kill, Quest ID 1062)
_questDB:addQuest("no", 2, "Goblin Invaders", "Seereth Stonebreak", -265.125, -943.147, 12.546382904053, 406, 15, 35, 1038.2139892578, 136.38049316406, 17.608114242554, 1, 15, 0, 0, 0, 0, -265.125, -943.147, 12.546382904053, "Seereth Stonebreak", "Venture Co. Logger", 0, 0, 0, 0, 1, "Kill 15 Venture Co. Loggers, then return to Seereth Stonebreak on the border of Stonetalon and the Barrens.", 0, 1);

self.isSetup = true;
end

