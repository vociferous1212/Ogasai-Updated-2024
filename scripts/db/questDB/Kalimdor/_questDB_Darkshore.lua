_questDB_Darkshore = {isSetup = false}

function _questDB_Darkshore:setup()
--_questDB:addQuest("no", 0, "", "", xyz, 148, 10, 20, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 148, 10, 20, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 148, 10, 20, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 148, 10, 20, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 148, 10, 20, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 148, 10, 20, xyz, type


_questDB:addQuest("no", 0, "The Fall of Ameth'Aran", "Sentinel Tysha Moonblade", 5725.0297851563, 301.93099975586, 20.957235336304, 148, 10, 20, 5577.0434570313, 146.55838012695, 29.101161956787, 2, 0, 0, 0, 2, 0, 5725.0297851563, 301.93099975586, 20.957235336304, "Sentinel Tysha Moonblade", 0, 0, 0, 403, 0, 0, "Study the tablets which tell of Ameth'Aran and of its fall, then return to Sentinel Tysha Moonblade in Darkshore.", 0, 1);

-- use quest type 2 to use item on specific object ID
_questDB:addQuest("no", 0, "Bashal'Aran", "Asterion", 6748.6401367188, 48.615798950195, 48.634918212891, 148, 10, 20, 5635.01953125, 165.00584411621, 32.359893798828, 2, 0, 0, 0, 1, 0, 6748.6401367188, 48.615798950195, 48.634918212891, "Asterion", 0, 0, 0, 249, 0, 3, "Destroy the Ancient Moonstone Seal at the ancient flame in Ameth'Aran, then return to Asterion in Bashal'Aran.", 0, 1);

_questDB:addQuest("no", 0, "Bashal'Aran", "Asterion", 6748.6401367188, 48.615798950195, 48.635047912598, 148, 10, 20, 6599.634765625, -52.705123901367, 31.686399459839, 1, 10, 0, 0, 0, 0, 6748.6401367188, 48.615798950195, 48.635047912598, "Asterion", "Deth'ryll Satyr", 0, 0, 0, 0, 0, "Obtain the Ancient Moonstone Seal and bring it to Asterion in Bashal'Aran.", 0, 1);

_questDB:addQuest("no", 0, "How Big a Threat?", "Terenthis", 6434.58984375, 362.80700683594, 13.941876411438, 148, 10, 20, 6033.00390625, 366.33697509766, 21.055772781372, 11, 0, 0, 0, 0, 0, 6434.58984375, 362.80700683594, 13.941876411438, "Terenthis", 0, 0, 0, 0, 0, 0, "Find a corrupt furbolg camp in Darkshore and return to Terenthis in Auberdine.", 0, 1);

_questDB:addQuest("no", 0, "Washed Ashore", "Gwennyth Bly'Leggonde", 6342.3999023438, 543.00500488281, 15.78307723999, 148, 10, 20, 6112.6181640625, 558.32550048828, 0.99828600883484, 2, 0, 0, 0, 1, 0, 6342.3999023438, 543.00500488281, 15.78307723999, "Gwennyth Bly'Leggonde", 0, 0, 0, 3512, 0, 0, "Recover Sea Creature Bones from the beached sea creature just south of Auberdine, and then return with it to Gwennyth Bly'Leggonde in Auberdine.", 0, 1);

_questDB:addQuest("no", 0, "Tools of the Highborne", "Thundris Windweaver", 6580.9702148438, 492.2919921875, 8.2341928482056, 148, 10, 20, 5762.2099609375, 124.99865722656, 34.957389831543, 1, 10, 10, 0, 0, 0, 6580.9702148438, 492.2919921875, 8.2341928482056, "Thundris Windweaver", "Cursed Highborne", "Writhing Highborne", 0, 0, 0, 0, "Retrieve 7 Highborne Relics for Thundris Windweaver in Auberdine.", 0, 1);

_questDB:addQuest("no", 0, "Bashal'Aran", "Asterion", 6748.6401367188, 48.615798950195, 48.635097503662, 148, 10, 20, 6736.7290039063, 23.383104324341, 43.970363616943, 1, 10, 10, 0, 0, 0, 6748.6401367188, 48.615798950195, 48.635097503662, "Asterion", "Vile Sprite", "Wild Grell", 0, 0, 0, 0, "Acquire 8 Grell Earrings for Asterion in Bashal'Aran.", 0, 1);

_questDB:addQuest("no", 0, "Bashal'Aran", "Thundris Windweaver", 6580.9702148438, 492.2919921875, 8.2341928482056, 148, 10, 20, 6748.6401367188, 48.615798950195, 48.635097503662, 11, 0, 0, 0, 0, 0, 6748.6401367188, 48.615798950195, 48.635097503662, "Asterion", 0, 0, 0, 0, 0, 0, "Find the source of the strange blue aura in the ruins of Bashal'Aran.", 0, 1);

_questDB:addQuest("no", 0, "Buzzbox 827", "Wizbang Cranktoggle", 6406.1098632813, 519.81500244141, 23.884471893311, 148, 10, 20, 6189.8002929688, 551.27038574219, 5.3186078071594, 1, 10, 0, 0, 0, 0, 6311.884765625, 541.22802734375, 13.545527458191, 356, 0, 0, 0, 0, 0, 0, "Collect 6 Crawler Legs and place them in Buzzbox 827.", 0, 1);

self.isSetup = true;
end