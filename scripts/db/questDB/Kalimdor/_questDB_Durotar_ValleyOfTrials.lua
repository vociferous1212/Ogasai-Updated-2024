_questDB_Durotar_ValleyOfTrials = {isSetup = false}

function _questDB_Durotar_ValleyOfTrials:setup()

--completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)

--_questDB:addQuest("no", 1, "", "", xyz, 14, 3, 8, xyz, type

_questDB:addQuest("no", 1, "Report to Sen'jin Village", "Zureetha Fargaze", -629.05200195313, -4228.0600585938, 38.151065826416, 14, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, -825.63598632813, -4920.759765625, 19.358600616455, "Master Gadrin", 0, 0, 0, 0, 0, 0, "Speak with Master Gadrin in Sen'jin Village.", 0, 1);

_questDB:addQuest("no", 1, "Thazz'ril's Pick", "Foreman Thazz'ril", -611.58697509766, -4322.080078125, 40.009136199951, 14, 3, 8, -87.878067016602, -4275.388671875, 65.59432220459, 2, 0, 0, 0, 1, 0, -611.58697509766, -4322.080078125, 40.009136199951, "Foreman Thazz'ril", 0, 0, 0, 4992, 0, 0, "Bring Thazz'ril's Pick to Foreman Thazz'ril.", 0, 1);

_questDB:addQuest("no", 1, "Burning Blade Medallion", "Zureetha Fargaze", -629.05200195313, -4228.0600585938, 38.151065826416, 14, 3, 8, -58.357398986816, -4220.2099609375, 62.312801361084, 1, 1, 0, 0, 0, 0, -629.05200195313, -4228.0600585938, 38.151065826416, "Zureetha Fargaze", "Yarrog Baneshadow", 0, 0, 0, 0, 3, "Bring the Burning Blade Medallion to Zureetha Fargaze, outside The Den.", 0, 1);

_questDB:addQuest("no", 1, "Vile Familiars", "Zureetha Fargaze", -629.05200195313, -4228.0600585938, 38.15111541748, 14, 3, 8, -178.97116088867, -4359.7021484375, 68.368034362793, 1, 12, 0, 0, 0, 0, -629.05200195313, -4228.0600585938, 38.15111541748, "Zureetha Fargaze", "Vile Familiar", 0, 0, 0, 0, 4, "Kill 12 Vile Familiars.\n\nReturn to Zureetha Fargaze outside the Den.", 0, 1);

_questDB:addQuest("no", 1, "Sarkoth", "Hana'zua", -397.76098632813, -4108.990234375, 50.205364227295, 14, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, -600.13201904297, -4186.1899414063, 41.089050292969, "Gornek", 0, 0, 0, 0, 0, 2, "Bring the news of Hana'zua's plight to Gornek at the Den.", 0, 1);

_questDB:addQuest("no", 1, "Sarkoth", "Hana'zua", -397.76098632813, -4108.990234375, 50.205364227295, 14, 3, 6, -547.33502197266, -4103.8500976563, 69.868316650391, 1, 1, 0, 0, 0, 0, -397.76098632813, -4108.990234375, 50.205364227295, "Hana'zua", "Sarkoth", 0, 0, 0, 0, 0, "Kill Sarkoth and bring his claw back to Hana'zua.", 0, 1);

_questDB:addQuest("no", 1, "Lazy Peons", "Foreman Thazz'ril", -611.58697509766, -4322.080078125, 40.009197235107, 14, 3, 8, 0, 0, 0, 99, 0, 0, 0, 0, 0, -611.58697509766, -4322.080078125, 40.009197235107, "Foreman Thazz'ril", 0, 0, 0, 0, 0, 0, "Use the Foreman's Blackjack on Lazy Peons when they're sleeping.  Wake up 5 peons, then return the Foreman's Blackjack to Foreman Thazz'ril in the Valley of Trials.", 0, 0);

_questDB:addQuest("no", 1, "Sting of the Scorpid", "Gornek", -600.13201904297, -4186.1899414063, 41.089050292969, 14, 2, 6, -478.54333496094, -4115.1318359375, 51.317123413086, 1, 10, 0, 0, 0, 0, -600.13201904297, -4186.1899414063, 41.089050292969, "Gornek", "Scorpid Worker", 0, 0, 0, 0, 2, "Get 10 Scorpid Worker Tails for Gornek in the Den.", 0, 1);

_questDB:addQuest("no", 1, "Galgar's Cactus Apple Surprise", "Galgar", -561.62799072266, -4221.7998046875, 41.590587615967, 14, 1, 6, -465.33151245117, -4246.904296875, 48.406204223633, 2, 0, 0, 0, 10, 0, -561.62799072266, -4221.7998046875, 41.590587615967, "Galgar", 0, 0, 0, 3451, 0, 1, "Bring Galgar 10 Cactus Apples. You remember him saying that they could be found near cactuses.", 0, 1);

if GetMyClass() == "WARRIOR" then
_questDB:addQuest("no", 1, "Simple Parchment", "Gornek", -600.13201904297, -4186.1899414063, 41.089050292969, 14, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -639.34399414063, -4230.1899414063, 38.134117126465, "Frang", 0, 0, 0, 0, 0, 0, "Read the Simple Parchment and speak to Frang in the Valley of Trials.", 0, 2);
end

_questDB:addQuest("no", 1, "Cutting Teeth", "Gornek", -600.13201904297, -4186.1899414063, 41.089050292969, 14, 1, 6, -467.72756958008, -4308.0942382813, 47.28205871582, 1, 10, 0, 0, 0, 0, -600.13201904297, -4186.1899414063, 41.089050292969, "Gornek", "Mottled Boar", 0, 0, 0, 0, 2, "Kill 10 Mottled Boars then return to Gornek at the Den.", 0, 1);

_questDB:addQuest("no", 1, "Your Place In The World", "Kaltunk", -607.43402099609, -4251.330078125, 38.956043243408, 14, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -600.13201904297, -4186.1899414063, 41.089050292969, "Gornek", 0, 0, 0, 0, 0, 0, "Speak with Gornek. You recall Kaltunk marking your map with his location and mentioning that Gornek resided in the Den, a building to the west. \n\n", 0, 1);

self.isSetup = true;
end