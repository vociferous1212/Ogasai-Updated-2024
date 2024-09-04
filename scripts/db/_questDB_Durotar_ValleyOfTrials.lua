_questDB_Durotar_ValleyOfTrials = {isSetup = false}

function _questDB_Durotar_ValleyOfTrials:setup()

--completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)


_questDB:addQuest("no", 1, "Lazy Peons", "Foreman Thazz'ril", -611.58697509766, -4322.080078125, 40.009197235107, 14, 3, 6, 0, 0, 0, 99, 0, 0, 0, 0, 0, -611.58697509766, -4322.080078125, 40.009197235107, "Foreman Thazz'ril", 0, 0, 0, 0, 0, 0, " Use the Foreman's Blackjack on Lazy Peons when they're sleeping.  Wake up 5 peons, then return the Foreman's Blackjack to Foreman Thazz'ril in the Valley of Trials.", 0, 0);


_questDB:addQuest("no", 1, "Galgar's Cactus Apple Surprise", "Galgar", -561.62799072266, -4221.7998046875, 41.590587615967, 14, 1, 6, -465.33151245117, -4246.904296875, 48.406204223633, 2, 0, 0, 0, 10, 0, -561.62799072266, -4221.7998046875, 41.590587615967, "Galgar", 0, 0, 0, 3451, 0, 1, "Bring Galgar 10 Cactus Apples. You remember him saying that they could be found near cactuses.", 0, 1);

if GetMyClass() == "WARRIOR" then
_questDB:addQuest("no", 1, "Simple Parchment", "Gornek", -600.13201904297, -4186.1899414063, 41.089050292969, 14, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -639.34399414063, -4230.1899414063, 38.134117126465, "Frang", 0, 0, 0, 0, 0, 0, "Read the Simple Parchment and speak to Frang in the Valley of Trials.", 0, 2);
end

_questDB:addQuest("no", 1, "Cutting Teeth", "Gornek", -600.13201904297, -4186.1899414063, 41.089050292969, 14, 1, 6, -467.72756958008, -4308.0942382813, 47.28205871582, 1, 10, 0, 0, 0, 0, -600.13201904297, -4186.1899414063, 41.089050292969, "Gornek", "Mottled Boar", 0, 0, 0, 0, 2, "Kill 10 Mottled Boars then return to Gornek at the Den.", 0, 1);

-- desc doesn't match or something is not right in the game and I cannot find why it won't work.
--_questDB:addQuest("no", 1, "Your Place In The World", "Kaltunk", -607.43402099609, -4251.330078125, 38.956043243408, 14, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -600.13201904297, -4186.1899414063, 41.089050292969, "Gornek", 0, 0, 0, 0, 0, 0, "Speak with Gornek. You recall Kaltunk marking your map with his location and mentioning that Gornek resided in the Den, a building to the west.", 0, 1);

self.isSetup = true;
end