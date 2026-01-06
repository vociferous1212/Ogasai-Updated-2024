_questDB_StranglethornVale = {isSetup = false}

function _questDB_StranglethornVale:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)

--_questDB:addQuest("no", 1, "", "", xyz, 33, 30, 40, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 33, 30, 40, xyz, type
--_questDB:addQuest("no", 1, "", "", xyz, 33, 30, 40, xyz, type


_questDB:addQuest("no", 2, "Panther Mastery", "Sir S. J. Erlgadin", -11617.400390625, -48.013500213623, 10.972524642944, 33, 30, 40, -11611.2734375, 290.77154541016, 43.869506835938, 1, 10, 0, 0, 0, 0, -11617.400390625, -48.013500213623, 10.972524642944, "Sir S. J. Erlgadin", "Panther", 0, 0, 0, 0, 1, "Sir S. J. Erlgadin of Nesingwary's Expedition wants you to kill 10 Panthers.", 0, 1);

_questDB:addQuest("no", 2, "Tiger Mastery", "Ajeck Rouack", -11620.5, -51.90230178833, 11.143781661987, 33, 30, 40, -11814.610351563, -750.36260986328, 38.759609222412, 1, 10, 0, 0, 0, 0, -11620.5, -51.90230178833, 11.143781661987, "Ajeck Rouack", "Stranglethorn Tiger", 0, 0, 0, 0, 1, "Ajeck Rouack of Nesingwary's Expedition wants you to kill 10 Stranglethorn Tigers.", 0, 1);

_questDB:addQuest("no", 2, "Raptor Mastery", "Hemet Nesingwary", -11628.599609375, -54.556900024414, 10.939642906189, 33, 30, 40, -11886.577148438, 483.51135253906, 43.568031311035, 1, 10, 0, 0, 0, 0, -11628.599609375, -54.556900024414, 10.939642906189, "Hemet Nesingwary", "Stranglethorn Raptor", 0, 0, 0, 0, 1, "Hemet Nesingwary wants you to kill 10 Stranglethorn Raptors.", 0, 1);

_questDB:addQuest("no", 2, "Panther Mastery", "Sir S. J. Erlgadin", -11617.400390625, -48.013500213623, 10.97252368927, 33, 30, 40, -11612.408203125, -420.40884399414, 16.265293121338, 1, 10, 0, 0, 0, 0, -11617.400390625, -48.013500213623, 10.97252368927, "Sir S. J. Erlgadin","Young Panther", 0, 0, 0, 0, 1, "Sir S. J. Erlgadin of Nesingwary's Expedition wants you to kill 10 Young Panthers.", 0, 1);

_questDB:addQuest("no", 2, "Tiger Mastery", "Ajeck Rouack", -11620.5, -51.90230178833, 11.142838478088, 33, 30, 40, -11716.333984375, 50.825759887695, 16.327899932861, 1, 10, 0, 0, 0, 0, -11620.5, -51.90230178833, 11.142838478088, "Ajeck Rouack", "Young Stranglethorn Tiger", 0, 0, 0, 0, 1, "Ajeck Rouack of Nesingwary's Expedition wants you to kill 10 Young Stranglethorn Tigers.", 0, 1);

_questDB:addQuest("no", 2, "Welcome to the Jungle", "Barnil Stonepot", -11616.700195313, -54.832500457764, 11.055157661438, 33, 30, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, -11628.599609375, -54.556900024414, 10.940011024475, "Hemet Nesingwary", 0, 0, 0, 0, 0, 1, "Speak with Hemet Nesingwary.", 0, 1);

self.isSetup = true;
end