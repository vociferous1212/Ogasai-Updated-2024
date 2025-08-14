_questDB_SearingGorge = {isSetup = false}

function _questDB_SearingGorge:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)


--_questDB:addQuest("no", 0, "", "", xyz, 51, 45, 50, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 51, 45, 50, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 51, 45, 50, xyz, type

_questDB:addQuest("no", 2, "Incendosaurs? Whateverosaur is More Like It", "Hansel Heavyhands", -6513.6201171875, -1183.7800292969, 309.25555419922, 51, 45, 50, -6485.5278320313, -1444.9770507813, 151.36944580078, 1, 20, 0, 0, 0, 0, -6513.6201171875, -1183.7800292969, 309.25506591797, "Hansel Heavyhands", "Incendosaur", 0, 0, 0, 0, 1, "Hansel Heavyhands wants you to kill 20 Incendosaurs.\n\nYou will find Incendosaurs occupying the lava pools inside the Slag Pit. The Slag Pit can be found in the Cauldron of the Searing Gorge.\n\nReturn to Hansel Heavyhands in the Searing Gorge when you have killed enough Incendosaurs.", 0, 1);

_questDB:addQuest("no", 2, "Fiery Menace!", "Hansel Heavyhands", -6513.6201171875, -1183.7800292969, 309.25506591797, 51, 45, 50, -6923.283203125, -944.90185546875, 240.74397277832, 1, 20, 0, 0, 0, 0, -6513.6201171875, -1183.7800292969, 309.25506591797, "Hansel Heavyhands", "Greater Lava Spider", 0, 0, 0, 0, 1, "Hansel Heavyhands wants you to kill 20 Greater Lava Spiders in the Searing Gorge. You can find Greater Lava Spiders in the plateaus and lava pools of the Searing Gorge.\n\nReturn to Hansel Heavyhands in the Searing Gorge when you have killed enough Greater Lava Spiders.", 0, 1)

_questDB:addQuest("no", 2, "Curse These Fat Fingers", "Hansel Heavyhands", -6513.6201171875, -1183.7800292969, 309.25555419922, 51, 45, 50, -6809.8876953125, -1182.6442871094, 239.81072998047, 1, 20, 0, 0, 0, 0, -6513.6201171875, -1183.7800292969, 309.25555419922, "Hansel Heavyhands", "Heavy War Golem", 0, 0, 0, 0, 1, "Hansel Heavyhands wants you to kill 20 Heavy War Golems.\n\nThe Heavy War Golems wander the areas surrounding the Cauldron in the Searing Gorge. When you've killed enough, return to Hansel in Searing Gorge.", 0, 1);

self.isSetup = true;
end