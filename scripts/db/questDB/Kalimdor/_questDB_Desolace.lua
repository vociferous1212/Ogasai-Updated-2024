_questDB_Desolace = {isSetup = false}

function _questDB_Desolace:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)


--_questDB:addQuest("no", 0, "", "", xyz, 440, 40, 50, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 440, 40, 50, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 440, 40, 50, xyz, type

-- 1. Vahlarriel’s Search 3 (Gather, requires Vahlarriel’s Search 2, Quest ID 1466)
_questDB:addQuest("no", 2, "Vahlarriel’s Search 3", "Vahlarriel Demonslayer", 4255.66015625, 5314.6796875, 8.6637134552002, 405, 30, 40, 3055.66015625, 2314.6796875, 8.6637134552002, 2, 0, 0, 0, 1, 0, 4255.66015625, 5314.6796875, 8.6637134552002, "Vahlarriel Demonslayer", 0, 0, 0, 7029, 0, 1, "Recover Malem Pendant from Maraudon and return to Vahlarriel Demonslayer in Nijel's Point.", 0, 1);

-- 2. Vahlarriel’s Search 2 (Kill, requires Vahlarriel’s Search, Quest ID 1434)
_questDB:addQuest("no", 2, "Vahlarriel’s Search 2", "Vahlarriel Demonslayer", 4255.66015625, 5314.6796875, 8.6637134552002, 405, 30, 40, 3755.66015625, 3314.6796875, 8.6637134552002, 1, 1, 0, 0, 0, 0, 4255.66015625, 5314.6796875, 8.6637134552002, "Vahlarriel Demonslayer", "Khan Dez’hepah", 0, 0, 0, 0, 1, "Kill Khan Dez’hepah at Magram Village and return to Vahlarriel Demonslayer in Nijel's Point.", 0, 1);

-- 3. The Corrupter 3 (Gather, requires The Corrupter 2, Quest ID 1482)
_questDB:addQuest("no", 2, "The Corrupter 3", "Maurin Bonesplitter", 4255.66015625, 5314.6796875, 8.6637134552002, 405, 30, 40, 3055.66015625, 2314.6796875, 8.6637134552002, 2, 0, 0, 0, 1, 0, 4255.66015625, 5314.6796875, 8.6637134552002, "Maurin Bonesplitter", 0, 0, 0, 7028, 0, 1, "Bring a Shadowstalker Scalp to Maurin Bonesplitter in Nijel's Point.", 0, 1);

-- 4. The Corrupter 2 (Gather, requires The Corrupter, Quest ID 1481)
_questDB:addQuest("no", 2, "The Corrupter 2", "Maurin Bonesplitter", 4255.66015625, 5314.6796875, 8.6637134552002, 405, 30, 40, 3055.66015625, 2314.6796875, 8.6637134552002, 2, 0, 0, 0, 1, 0, 4255.66015625, 5314.6796875, 8.6637134552002, "Maurin Bonesplitter", 0, 0, 0, 7070, 0, 1, "Bring an Oracle Crystal to Maurin Bonesplitter in Nijel's Point.", 0, 1);

-- 5. Book of the Ancients (Use item, requires The Burning of Spirits, Quest ID 1436)
_questDB:addQuest("no", 2, "Book of the Ancients", "Azore Aldamort", 3755.66015625, 3514.6796875, 8.6637134552002, 405, 30, 40, 2755.66015625, 1314.6796875, 8.6637134552002, 3, 0, 0, 0, 1, 0, 3755.66015625, 3514.6796875, 8.6637134552002, "Azore Aldamort", 0, 0, 0, 8052, 0, 1, "Use the Serpent Statue to raise the Statue in Serpent’s Coil, then return to Azore Aldamort at Ethel Rethor.", 8052, 1);

-- 6. The Burning of Spirits (Kill, Quest ID 1435)
_questDB:addQuest("no", 2, "The Burning of Spirits", "Azore Aldamort", 3755.66015625, 3514.6796875, 8.6637134552002, 405, 30, 40, 2755.66015625, 1314.6796875, 8.6637134552002, 1, 7, 7, 7, 0, 0, 3755.66015625, 3514.6796875, 8.6637134552002, "Azore Aldamort", "Burning Blade Felsworn", "Burning Blade Augur", "Burning Blade Reaver", 0, 0, 1, "Kill 7 Burning Blade Felsworn, 7 Burning Blade Augurs, and 7 Burning Blade Reavers at Thunder Axe Fortress, then return to Azore Aldamort at Ethel Rethor.", 0, 1);

-- 7. Down the Scarlet Path 2 (Kill, requires Down the Scarlet Path, Quest ID 1053)
_questDB:addQuest("no", 2, "Down the Scarlet Path 2", "Brother Anton", 4255.66015625, 5314.6796875, 8.6637134552002, 405, 30, 40, 2975.66015625, 2314.6796875, 8.6637134552002, 1, 30, 0, 0, 0, 0, 4255.66015625, 5314.6796875, 8.6637134552002, "Brother Anton", "Undead Ravager", 0, 0, 0, 0, 1, "Kill 30 Undead Ravagers at Mannoroc Coven, then return to Brother Anton in Nijel's Point.", 0, 1);

-- 8. Kodo Roundup (Use item, Quest ID 5561)
_questDB:addQuest("no", 2, "Kodo Roundup", "Smeed Scrabblescrew", 3755.66015625, 2314.6796875, 8.6637134552002, 405, 30, 40, 4255.66015625, 3314.6796875, 8.6637134552002, 3, 0, 0, 0, 5, 0, 3755.66015625, 2314.6796875, 8.6637134552002, "Smeed Scrabblescrew", 0, 0, 0, 10074, 0, 1, "Use the Kodo Kombobulator to round up 5 Kodos in the Kodo Graveyard, then return to Smeed Scrabblescrew at Scrabblescrew’s Camp.", 10074, 1);

-- 9. Bone Collector (Gather, Quest ID 5501)
_questDB:addQuest("no", 2, "Bone Collector", "Bibbly F’utzbuckle", 3755.66015625, 2314.6796875, 8.6637134552002, 405, 30, 40, 4255.66015625, 3314.6796875, 8.6637134552002, 2, 0, 0, 0, 10, 0, 3755.66015625, 2314.6796875, 8.6637134552002, "Bibbly F’utzbuckle", 0, 0, 0, 10047, 0, 1, "Bring 10 Kodo Bones from the Kodo Graveyard to Bibbly F’utzbuckle at Scrabblescrew’s Camp.", 0, 1);

-- 10. Gizelton Caravan (Escort, Quest ID 5943)
_questDB:addQuest("no", 2, "Gizelton Caravan", "Rigger Gizelton", 3755.66015625, 2314.6796875, 8.6637134552002, 405, 30, 40, 2975.66015625, 2314.6796875, 8.6637134552002, 1, 0, 0, 0, 0, 0, 3755.66015625, 2314.6796875, 8.6637134552002, "Smeed Scrabblescrew", 0, 0, 0, 0, 0, 1, "Escort the Gizelton Caravan through Mannoroc Coven, then talk to Smeed Scrabblescrew at Scrabblescrew’s Camp.", 0, 1);

-- 11. Ghost-O-Plasm Round Up (Gather, Quest ID 6134)
_questDB:addQuest("no", 2, "Ghost-O-Plasm Round Up", "Hornizz Brimbuzzle", 3755.66015625, 2314.6796875, 8.6637134552002, 405, 30, 40, 2975.66015625, 2314.6796875, 8.6637134552002, 2, 0, 0, 0, 8, 0, 3755.66015625, 2314.6796875, 8.6637134552002, "Hornizz Brimbuzzle", 0, 0, 0, 10046, 0, 1, "Bring 8 Ghost-O-Plasms from Mannoroc Coven to Hornizz Brimbuzzle at Scrabblescrew’s Camp.", 0, 1);

-- 12. Portals of the Legion (Use item, Quest ID 5581)
_questDB:addQuest("no", 2, "Portals of the Legion", "Captain Pentigast", 4255.66015625, 5314.6796875, 8.6637134552002, 405, 30, 40, 2975.66015625, 2314.6796875, 8.6637134552002, 3, 0, 0, 0, 6, 0, 4255.66015625, 5314.6796875, 8.6637134552002, "Captain Pentigast", 0, 0, 0, 10075, 0, 1, "Use the Demon Portal Focus to close 6 Demon Portals at Mannoroc Coven, then return to Captain Pentigast in Nijel’s Point.", 10075, 1);

-- 13. Sceptre of Light (Gather, Quest ID 1433)
_questDB:addQuest("no", 2, "Sceptre of Light", "Azore Aldamort", 3755.66015625, 3514.6796875, 8.6637134552002, 405, 30, 40, 2755.66015625, 1314.6796875, 8.6637134552002, 2, 0, 0, 0, 1, 0, 3755.66015625, 3514.6796875, 8.6637134552002, "Azore Aldamort", 0, 0, 0, 8051, 0, 1, "Bring the Sceptre of Light from Thunder Axe Fortress to Azore Aldamort at Ethel Rethor.", 0, 1);

-- 14. Reagents for Reclaimers Inc. 2 (Gather, requires Reagents for Reclaimers Inc., Quest ID 1456)
_questDB:addQuest("no", 2, "Reagents for Reclaimers Inc. 2", "Kreldig Ungor", 4255.66015625, 5314.6796875, 8.6637134552002, 405, 30, 40, 2755.66015625, 1314.6796875, 8.6637134552002, 2, 0, 0, 0, 10, 10, 4255.66015625, 5314.6796875, 8.6637134552002, "Kreldig Ungor", 0, 0, 0, 7030, 7031, 1, "Bring 10 Hatefury Claws and 10 Hatefury Horns from Thunder Axe Fortress to Kreldig Ungor in Nijel’s Point.", 0, 1);

-- 15. Reagents for Reclaimers Inc. (Gather, requires Reclaimers’ Business in Desolace, Quest ID 1454)
_questDB:addQuest("no", 2, "Reagents for Reclaimers Inc.", "Kreldig Ungor", 4255.66015625, 5314.6796875, 8.6637134552002, 405, 30, 40, 2755.66015625, 1314.6796875, 8.6637134552002, 2, 0, 0, 0, 10, 10, 4255.66015625, 5314.6796875, 8.6637134552002, "Kreldig Ungor", 0, 0, 0, 5639, 5798, 1, "Bring 10 Scorpashi Venoms and 10 Aged Kodo Hides to Kreldig Ungor in Nijel’s Point.", 0, 1);

-- 16. Reclaimers’ Business in Desolace (Gather, Quest ID 1453)
_questDB:addQuest("no", 2, "Reclaimers’ Business in Desolace", "Roetten Stonehammer", 4255.66015625, 5314.6796875, 8.6637134552002, 405, 30, 40, 4255.66015625, 5314.6796875, 8.6637134552002, 2, 0, 0, 0, 1, 0, 4255.66015625, 5314.6796875, 8.6637134552002, "Kreldig Ungor", 0, 0, 0, 10076, 0, 1, "Bring the Reclaimers’ Report to Kreldig Ungor in Nijel’s Point.", 0, 1);

-- 17. The Karnitol Shipwreck 2 (Gather, requires The Karnitol Shipwreck, Quest ID 1455)
_questDB:addQuest("no", 2, "The Karnitol Shipwreck 2", "Kreldig Ungor", 4255.66015625, 5314.6796875, 8.6637134552002, 405, 30, 40, 975.66015625, 3514.6796875, 8.6637134552002, 2, 0, 0, 0, 1, 0, 4255.66015625, 5314.6796875, 8.6637134552002, "Kreldig Ungor", 0, 0, 0, 10078, 0, 1, "Bring Karnitol’s Satchel to Kreldig Ungor in Nijel’s Point.", 0, 1);

-- 18. The Karnitol Shipwreck (Gather, Quest ID 1454)
_questDB:addQuest("no", 2, "The Karnitol Shipwreck", "Kreldig Ungor", 4255.66015625, 5314.6796875, 8.6637134552002, 405, 30, 40, 975.66015625, 3514.6796875, 8.6637134552002, 2, 0, 0, 0, 1, 0, 4255.66015625, 5314.6796875, 8.6637134552002, "Kreldig Ungor", 0, 0, 0, 10077, 0, 1, "Bring Karnitol’s Chest from the shipwreck at Ranazjar Isle to Kreldig Ungor in Nijel’s Point.", 0, 1);

-- 19. Down the Scarlet Path (Kill, Quest ID 1052)
_questDB:addQuest("no", 2, "Down the Scarlet Path", "Brother Anton", 4255.66015625, 5314.6796875, 8.6637134552002, 405, 30, 40, 2975.66015625, 2314.6796875, 8.6637134552002, 1, 30, 0, 0, 0, 0, 4255.66015625, 5314.6796875, 8.6637134552002, "Brother Anton", "Undead Ravager", 0, 0, 0, 0, 1, "Kill 30 Undead Ravagers at Mannoroc Coven, then return to Brother Anton in Nijel’s Point.", 0, 1);

-- 20. Centaur Bounty (Kill, Quest ID 1387)
_questDB:addQuest("no", 2, "Centaur Bounty", "Corporal Melkins", 4255.66015625, 5314.6796875, 8.6637134552002, 405, 30, 40, 3755.66015625, 3314.6796875, 8.6637134552002, 1, 15, 15, 0, 0, 0, 4255.66015625, 5314.6796875, 8.6637134552002, "Corporal Melkins", "Magram Centaur", "Gelkis Centaur", 0, 0, 0, 1, "Kill 15 Magram Centaurs and 15 Gelkis Centaurs, then return to Corporal Melkins in Nijel’s Point.", 0, 1);

self.isSetup = true;
end