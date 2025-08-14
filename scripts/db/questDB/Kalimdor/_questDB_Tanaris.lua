_questDB_Tanaris = {isSetup = false}

function _questDB_Tanaris:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)


--_questDB:addQuest("no", 0, "", "", xyz, 440, 40, 50, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 440, 40, 50, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 440, 40, 50, xyz, type

-- 1. Screecher Spirits (Use item, requires The Prophecy of Mosh’aru)
_questDB:addQuest("no", 2, "Screecher Spirits", "Yeh’kinya", -6903.3999023438, -4840.9399414063, 8.3811378479004, 440, 40, 50, -6903.3999023438, -4840.9399414063, 8.3811378479004, 3, 0, 0, 0, 3, 0, -6903.3999023438, -4840.9399414063, 8.3811378479004, "Yeh’kinya", 0, 0, 0, 10412, 0, 1, "Use Yeh’kinya’s Bramble on 3 Vale Screecher corpses in Feralas, then return to Yeh’kinya in Steamwheedle Port.", 10412, 1);

-- 2. The Prophecy of Mosh’aru (Gather, requires The Ancient Egg)
_questDB:addQuest("no", 2, "The Prophecy of Mosh’aru", "Yeh’kinya", -6903.3999023438, -4840.9399414063, 8.3811378479004, 440, 40, 50, -6903.3999023438, -4840.9399414063, 8.3811378479004, 2, 0, 0, 0, 2, 0, -6903.3999023438, -4840.9399414063, 8.3811378479004, "Yeh’kinya", 0, 0, 0, 10414, 0, 1, "Bring the First and Second Mosh’aru Tablets from Zul’Farrak to Yeh’kinya in Steamwheedle Port.", 0, 1);

-- 3. The Ancient Egg (Gather, requires The God Hakkar)
_questDB:addQuest("no", 2, "The Ancient Egg", "Yeh’kinya", -6903.3999023438, -4840.9399414063, 8.3811378479004, 440, 40, 50, -6903.3999023438, -4840.9399414063, 8.3811378479004, 2, 0, 0, 0, 1, 0, -6903.3999023438, -4840.9399414063, 8.3811378479004, "Yeh’kinya", 0, 0, 0, 10413, 0, 1, "Bring the Ancient Egg from Jintha’Alor in The Hinterlands to Yeh’kinya in Steamwheedle Port.", 0, 1);

-- 4. The God Hakkar (Use item, requires The Troll Mojo)
_questDB:addQuest("no", 2, "The God Hakkar", "Yeh’kinya", -6903.3999023438, -4840.9399414063, 8.3811378479004, 440, 40, 50, -6903.3999023438, -4840.9399414063, 8.3811378479004, 3, 0, 0, 0, 1, 0, -6903.3999023438, -4840.9399414063, 8.3811378479004, "Yeh’kinya", 0, 0, 0, 10411, 0, 1, "Use the Filled Egg of Hakkar in Zul’Farrak to summon and kill Gahz’rilla, then return to Yeh’kinya in Steamwheedle Port.", 10411, 1);

-- 5. The Troll Mojo (Gather, requires Presence of Sight)
_questDB:addQuest("no", 2, "The Troll Mojo", "Yeh’kinya", -6903.3999023438, -4840.9399414063, 8.3811378479004, 440, 40, 50, -6903.3999023438, -4840.9399414063, 8.3811378479004, 2, 0, 0, 0, 8, 0, -6903.3999023438, -4840.9399414063, 8.3811378479004, "Yeh’kinya", 0, 0, 0, 10410, 0, 1, "Bring 8 Troll Mojos from Zul’Farrak to Yeh’kinya in Steamwheedle Port.", 0, 1);

-- 6. Presence of Sight (Gather, requires Divino-matic Rod)
_questDB:addQuest("no", 2, "Presence of Sight", "Yeh’kinya", -6903.3999023438, -4840.9399414063, 8.3811378479004, 440, 40, 50, -6903.3999023438, -4840.9399414063, 8.3811378479004, 2, 0, 0, 0, 1, 0, -6903.3999023438, -4840.9399414063, 8.3811378479004, "Yeh’kinya", 0, 0, 0, 10409, 0, 1, "Bring the Sandfury Guardian’s Eye from Zul’Farrak to Yeh’kinya in Steamwheedle Port.", 0, 1);

-- 7. Divino-matic Rod (Use item, requires Troll Temper)
_questDB:addQuest("no", 2, "Divino-matic Rod", "Chief Engineer Bilgewhizzle", -7186.6401367188, -3838.6000976563, 8.6637134552002, 440, 40, 50, -7186.6401367188, -3838.6000976563, 8.6637134552002, 3, 0, 0, 0, 1, 0, -7186.6401367188, -3838.6000976563, 8.6637134552002, "Chief Engineer Bilgewhizzle", 0, 0, 0, 8564, 0, 1, "Use the Divino-matic Rod in Zul’Farrak to retrieve the Sacred Mallet, then return to Chief Engineer Bilgewhizzle in Gadgetzan.", 8564, 1);

-- 8. Gahz’ridian (Gather, Quest ID 3161)
_questDB:addQuest("no", 2, "Gahz’ridian", "Marvon Rivetseeker", -7987.5200195313, -3855.6201171875, 17.733413696289, 440, 40, 50, -7987.5200195313, -3855.6201171875, 17.733413696289, 2, 0, 0, 0, 30, 0, -7987.5200195313, -3855.6201171875, 17.733413696289, "Marvon Rivetseeker", 0, 0, 0, 8587, 0, 1, "Bring 30 Gahz’ridian Ornaments from the sands of Tanaris to Marvon Rivetseeker near Gadgetzan.", 0, 1);

-- 9. Troll Temper (Gather, requires Gadgetzan Water Survey)
_questDB:addQuest("no", 2, "Troll Temper", "Trenton Lighthammer", -7179.1899414063, -3845.6201171875, 8.6637134552002, 440, 40, 50, -7186.6401367188, -3838.6000976563, 8.6637134552002, 2, 0, 0, 0, 20, 0, -7186.6401367188, -3838.6000976563, 8.6637134552002, "Chief Engineer Bilgewhizzle", 0, 0, 0, 8422, 0, 1, "Bring 20 Sandfury Axes from Zul’Farrak to Chief Engineer Bilgewhizzle in Gadgetzan.", 0, 1);

-- 10. Gadgetzan Water Survey (Use item, requires Water Pouch Bounty)
_questDB:addQuest("no", 2, "Gadgetzan Water Survey", "Senior Surveyor Fizzledowser", -7179.1899414063, -3845.6201171875, 8.6637134552002, 440, 40, 50, -6487.5200195313, -2855.6201171875, 8.6637134552002, 3, 0, 0, 0, 1, 0, -7179.1899414063, -3845.6201171875, 8.6637134552002, "Senior Surveyor Fizzledowser", 0, 0, 0, 9923, 0, 1, "Use the Untapped Dowsing Widget at the Eldreth Waterfall in eastern Tanaris, then return to Senior Surveyor Fizzledowser in Gadgetzan.", 9923, 1);

-- 11. Water Pouch Bounty (Gather, requires Wastewander Justice)
_questDB:addQuest("no", 2, "Water Pouch Bounty", "Spigot Operator Luglunket", -7179.1899414063, -3845.6201171875, 8.6637134552002, 440, 40, 50, -6487.5200195313, -2855.6201171875, 8.6637134552002, 2, 0, 0, 0, 5, 0, -7179.1899414063, -3845.6201171875, 8.6637134552002, "Spigot Operator Luglunket", 0, 0, 0, 8153, 0, 1, "Bring 5 Wastewander Water Pouches from Wastewander bandits in eastern Tanaris to Spigot Operator Luglunket in Gadgetzan.", 0, 1);

-- 12. Wastewander Justice (Kill, requires WANTED: Caliph Scorpidsting)
_questDB:addQuest("no", 2, "Wastewander Justice", "Chief Engineer Bilgewhizzle", -7186.6401367188, -3838.6000976563, 8.6637134552002, 440, 40, 50, -6487.5200195313, -2855.6201171875, 8.6637134552002, 1, 10, 10, 0, 0, 0, -7186.6401367188, -3838.6000976563, 8.6637134552002, "Chief Engineer Bilgewhizzle", "Wastewander Bandit", "Wastewander Thief", 0, 0, 0, 1, "Kill 10 Wastewander Bandits and 10 Wastewander Thieves in eastern Tanaris, then return to Chief Engineer Bilgewhizzle in Gadgetzan.", 0, 1);

-- 13. WANTED: Caliph Scorpidsting (Kill)
_questDB:addQuest("no", 2, "WANTED: Caliph Scorpidsting", "Wanted Poster", -7186.6401367188, -3838.6000976563, 8.6637134552002, 440, 40, 50, -6487.5200195313, -2855.6201171875, 8.6637134552002, 1, 1, 0, 0, 0, 0, -7186.6401367188, -3838.6000976563, 8.6637134552002, "Chief Engineer Bilgewhizzle", "Caliph Scorpidsting", 0, 0, 0, 0, 1, "Kill Caliph Scorpidsting in eastern Tanaris, then return to Chief Engineer Bilgewhizzle in Gadgetzan.", 0, 1);

-- 14. WANTED: Andre Firebeard (Kill)
_questDB:addQuest("no", 2, "WANTED: Andre Firebeard", "Wanted Poster", -7186.6401367188, -3838.6000976563, 8.6637134552002, 440, 40, 50, -6903.3999023438, -4840.9399414063, 8.3811378479004, 1, 1, 0, 0, 0, 0, -7186.6401367188, -3838.6000976563, 8.6637134552002, "Chief Engineer Bilgewhizzle", "Andre Firebeard", 0, 0, 0, 0, 1, "Kill Andre Firebeard at Steamwheedle Port, then return to Chief Engineer Bilgewhizzle in Gadgetzan.", 0, 1);

-- 15. Southsea Shakedown (Kill)
_questDB:addQuest("no", 2, "Southsea Shakedown", "Security Chief Bilgewhizzle", -7186.6401367188, -3838.6000976563, 8.6637134552002, 440, 40, 50, -6903.3999023438, -4840.9399414063, 8.3811378479004, 1, 10, 10, 8, 6, 0, -7186.6401367188, -3838.6000976563, 8.6637134552002, "Security Chief Bilgewhizzle", "Southsea Pirate", "Southsea Freebooter", "Southsea Dock Worker", "Southsea Swashbuckler", 0, 1, "Kill 10 Southsea Pirates, 10 Southsea Freebooters, 8 Southsea Dock Workers, and 6 Southsea Swashbucklers at Steamwheedle Port, then return to Security Chief Bilgewhizzle in Gadgetzan.", 0, 1);

-- 16. Pirate Hats Ahoy! (Gather)
_questDB:addQuest("no", 2, "Pirate Hats Ahoy!", "Haughty Modiste", -6903.3999023438, -4840.9399414063, 8.3811378479004, 440, 40, 50, -6903.3999023438, -4840.9399414063, 8.3811378479004, 2, 0, 0, 0, 20, 0, -6903.3999023438, -4840.9399414063, 8.3811378479004, "Haughty Modiste", 0, 0, 0, 8367, 0, 1, "Bring 20 Southsea Pirate Hats from Steamwheedle Port to Haughty Modiste in Steamwheedle Port.", 0, 1);

-- 17. Stoley’s Shipment (Gather)
_questDB:addQuest("no", 2, "Stoley’s Shipment", "Stoley", -6903.3999023438, -4840.9399414063, 8.3811378479004, 440, 40, 50, -6903.3999023438, -4840.9399414063, 8.3811378479004, 2, 0, 0, 0, 1, 0, -6903.3999023438, -4840.9399414063, 8.3811378479004, "Stoley", 0, 0, 0, 9246, 0, 1, "Bring Stoley’s Shipment from the Southsea Pirate base at Steamwheedle Port to Stoley in Steamwheedle Port.", 0, 1);

-- 18. Stoley’s Debt (Gather)
_questDB:addQuest("no", 2, "Stoley’s Debt", "Stoley", -6903.3999023438, -4840.9399414063, 8.3811378479004, 440, 40, 50, -7179.1899414063, -3845.6201171875, 8.6637134552002, 2, 0, 0, 0, 1, 0, -7179.1899414063, -3845.6201171875, 8.6637134552002, "Kravel Koalbeard", 0, 0, 0, 9245, 0, 1, "Bring Stoley’s Bottle to Kravel Koalbeard in Gadgetzan.", 0, 1);

-- 19. Tran’rek (Gather)
_questDB:addQuest("no", 2, "Tran’rek", "Kravel Koalbeard", -7179.1899414063, -3845.6201171875, 8.6637134552002, 440, 40, 50, -7179.1899414063, -3845.6201171875, 8.6637134552002, 2, 0, 0, 0, 1, 0, -7179.1899414063, -3845.6201171875, 8.6637134552002, "Tran’rek", 0, 0, 0, 9244, 0, 1, "Bring Kravel’s Crate to Tran’rek in Gadgetzan.", 0, 1);

-- 20. Handle With Care (Gather)
_questDB:addQuest("no", 2, "Handle With Care", "Curgle Cranklehop", -7179.1899414063, -3845.6201171875, 8.6637134552002, 440, 40, 50, -6487.5200195313, -2855.6201171875, 8.6637134552002, 2, 0, 0, 0, 10, 0, -7179.1899414063, -3845.6201171875, 8.6637134552002, "Curgle Cranklehop", 0, 0, 0, 9243, 0, 1, "Bring 10 Etched Phials from Wastewander bandits in eastern Tanaris to Curgle Cranklehop in Gadgetzan.", 0, 1);

self.isSetup = true;
end
