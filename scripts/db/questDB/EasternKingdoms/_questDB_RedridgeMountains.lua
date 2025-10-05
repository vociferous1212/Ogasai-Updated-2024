_questDB_RedridgeMountains= {isSetup = false}

function _questDB_RedridgeMountains:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)


--_questDB:addQuest("no", 0, "", "", xyz, 44, 10, 20, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 44, 10, 20, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 44, 10, 20, xyz, type


-- to westfall
_questDB:addQuest("no", 0, "The Defias Brotherhood", "Wiley the Black", -9214.390625, -2159.0285644531, 67.580841064453, 40, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10508.799804688, 1045.2299804688, 60.518142700195, "Gryan Stoutmantle", 0, 0, 0, 0, 0, 1, "Take Wiley's Note to Gryan Stoutmantle in Westfall.", 0, 1);
_questDB:addQuest("no", 0, "The Defias Brotherhood", "Wiley the Black", -9214.390625, -2159.0285644531, 67.580841064453, 44, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10508.799804688, 1045.2299804688, 60.518142700195, "Gryan Stoutmantle", 0, 0, 0, 0, 0, 1, "Take Wiley's Note to Gryan Stoutmantle in Westfall.", 0, 1);


_questDB:addQuest("no", 0, "Return to Verner", "Smith Argus", -9456.650390625, 87.85530090332, 58.343807220459, 44, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9259.4404296875, -2243.2199707031, 63.933517456055, "Verner Osgood", 0, 0, 0, 0, 0, 1, "Return to Verner Osgood in Redridge.  Give him the Crate of Horseshoes.", 0, 1);
_questDB:addQuest("no", 0, "Return to Verner", "Smith Argus", -9456.650390625, 87.85530090332, 58.343807220459, 12, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9259.4404296875, -2243.2199707031, 63.933517456055, "Verner Osgood", 0, 0, 0, 0, 0, 1, "Return to Verner Osgood in Redridge.  Give him the Crate of Horseshoes.", 0, 1);
_questDB:addQuest("no", 0, "The Price of Shoes", "Verner Osgood", -9259.4404296875, -2243.2199707031, 63.933456420898, 44, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9456.650390625, 87.85530090332, 58.343757629395, "Smith Argus", 0, 0, 0, 0, 0, 1, "Take Verner's Note to Smith Argus in Goldshire.", 0, 1);
_questDB:addQuest("no", 0, "The Price of Shoes", "Verner Osgood", -9259.4404296875, -2243.2199707031, 63.933456420898, 12, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9456.650390625, 87.85530090332, 58.343757629395, "Smith Argus", 0, 0, 0, 0, 0, 1, "Take Verner's Note to Smith Argus in Goldshire.", 0, 1);


--_questDB:addQuest("no", 0, "The Lost Tools", "Foreman Oslow", -9279.2197265625, -2268.5300292969, 67.447540283203, 44, 10, 20, -9356.0283203125, -2473.8762207031, 54.637748718262, 2, 0, 0, 0, 1, 0, -9279.2197265625, -2268.5300292969, 67.447540283203, "Foreman Oslow", 0, 0, 0, 10, 0, 1, "Foreman Oslow of Lakeshire wants you to retrieve his toolbox from the bottom of Lake Everstill.", 0, 1);

_questDB:addQuest("no", 0, "Delivering Daffodils", "Martie Jainrose", -9245.8095703125, -2045.3299560547, 77.00284576416, 44, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9232.919921875, -2147.9799804688, 64.357398986816, "Darcy", 0, 0, 0, 0, 0, 1, "Give Darcy the Daffodil Bouquet.", 0, 1);

_questDB:addQuest("no", 0, "Visit the Herbalist", "Guard Parker", -9609.6396484375, -1902.4000244141, 59.823001861572, 44, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9245.8095703125, -2045.3299560547, 77.00284576416, "Martie Jainrose", 0, 0, 0, 0, 0, 1, "Speak with the Redridge Herbalist, Martie Jainrose.", 0, 1);

_questDB:addQuest("no", 0, "A Free Lunch", "Darcy", -9212.083984375, -2165.9699707031, 67.57593536377, 44, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9609.6396484375, -1902.4000244141, 59.823001861572, "Guard Parker", 0, 0, 0, 0, 0, 1, "Bring Parker's lunch to Guard Parker.  He patrols the road leading to Darkshire.", 0, 1);

end