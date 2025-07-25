_questDB_Westfall = {isSetup = false}

function _questDB_Westfall:setup()

-- used for setting quests that go into a new MapID()...
local questDescription, questObjectives = GetQuestLogQuestText(1);


--(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)


--_questDB:addQuest("no", 0, "", "", xyz, 40, 10, 20, xyz, type
--_questDB:addQuest("no", 0, "", "", xyz, 40, 10, 20, xyz, type

-- leaving SW
--_questDB:addQuest("no", 0, "The Defias Brotherhood", "Master Mathias Shaw", -8815.26953125, 362.29998779297, 109.52070617676, 40, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10508.799804688, 1045.2299804688, 60.518142700195, "Gryan Stoutmantle", 0, 0, 0, 0, 0, 1, "Take Shaw's report to Gryan Stoutmantle in Westfall.", 0, 1);

-- to SW
--_questDB:addQuest("no", 0, "The Defias Brotherhood", "Gryan Stoutmantle", -10508.799804688, 1045.2299804688, 60.518142700195, 40, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8815.26953125, 362.29998779297, 109.52070617676, "Master Mathias Shaw", 0, 0, 0, 0, 0, 1, "Take Wiley's Note to Mathias Shaw in Stormwind.", 0, 1); 

-- to lakeshire
_questDB:addQuest("no", 0, "The Defias Brotherhood", "Gryan Stoutmantle", -10508.799804688, 1045.2299804688, 60.518672943115, 44, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9214.390625, -2159.0285644531, 67.580841064453, "Wiley the Black", 0, 0, 0, 0, 0, 1, "Gryan Stoutmantle wants you to talk to Wiley in Lakeshire.", 0, 1);
_questDB:addQuest("no", 0, "The Defias Brotherhood", "Gryan Stoutmantle", -10508.799804688, 1045.2299804688, 60.518672943115, 40, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9214.390625, -2159.0285644531, 67.580841064453, "Wiley the Black", 0, 0, 0, 0, 0, 2, "Gryan Stoutmantle wants you to talk to Wiley in Lakeshire.", 0, 1);


_questDB:addQuest("no", 0, "Patrolling Westfall", "Captain Danuvin", -10511.200195313, 1041.8399658203, 60.518482208252, 40, 10, 20, -10541.822265625, 1922.080078125, 37.428665161133, 1, 10, 10, 0, 0, 0, -10511.200195313, 1041.8399658203, 60.518482208252, "Captain Danuvin", "Riverpaw Mongrel", "Riverpaw Scout", 0, 0, 0, 1, "Bring 8 Gnoll Paws to Captain Danuvin on Sentinel Hill.", 0, 1);

_questDB:addQuest("no", 0, "The People's Militia", "Gryan Stoutmantle", -10508.799804688, 1045.2299804688, 60.518672943115, 40, 10, 20, -10394.708007813, 1864.2707519531, 15.379029273987, 1, 15, 15, 0, 0, 0, -10508.799804688, 1045.2299804688, 60.518672943115, "Gryan Stoutmantle", "Defias Looter", "Defias Pillager", 0, 0, 0, 1, "Gryan Stoutmantle wants you to kill 15 Defias Pillagers and 15 Defias Looters and return to him on Sentinel Hill.", 0, 1);

_questDB:addQuest("no", 0, "The Killing Fields", "Farmer Saldean", -10128.700195313, 1055.2099609375, 36.250972747803, 40, 10, 20, -10151.58203125, 1117.0521240234, 36.780567169189, 1, 20, 0, 0, 0, 0, -10128.700195313, 1055.2099609375, 36.250972747803, "Farmer Saldean", "Harvest Watcher", 0, 0, 0, 0, 2, "Farmer Saldean wants you to kill 20 Harvest Watchers.", 0, 1);

_questDB:addQuest("no", 0, "Red Leather Bandanas", "Scout Galiaan", -10636.299804688, 1127.2600097656, 33.6940574646, 40, 10, 20, -10447.83984375, 1214.90625, 52.983711242676, 1, 10, 10, 0, 0, 0, -10636.299804688, 1127.2600097656, 33.6940574646, "Scout Galiaan", "Defias Smuggler", "Defias Trapper", 0, 0, 0, 3, "Bring 15 Red Leather Bandanas to Scout Galiaan at Sentinel Hill.", 0, 1);

_questDB:addQuest("no", 0, "The People's Militia", "Gryan Stoutmantle", -10508.799804688, 1045.2299804688, 60.518672943115, 40, 10, 20, -10447.83984375, 1214.90625, 52.983711242676, 1, 15, 15, 0, 0, 0, -10508.799804688, 1045.2299804688, 60.518672943115, "Gryan Stoutmantle", "Defias Smuggler", "Defias Trapper", 0, 0, 0, 0, "Gryan Stoutmantle wants you to kill 15 Defias Trappers and 15 Defias Smugglers then return to him on Sentinel Hill.", 0, 1);

_questDB:addQuest("no", 0, "Goretusk Liver Pie", "Salma Saldean", -10112.099609375, 1042.0999755859, 37.471683502197, 40, 10, 20, -10450.541992188, 1136.3208007813, 38.930480957031, 1, 10, 0, 0, 0, 0, -10112.099609375, 1042.0999755859, 37.471683502197, "Salma Saldean", "Young Goretusk", 0, 0, 0, 0, 0, "Salma Saldean needs 8 Goretusk livers to make a Goretusk Liver Pie.", 0, 1);

_questDB:addQuest("no", 0, "Westfall Stew", "Verna Furlbrow", -9853.0498046875, 919.5419921875, 30.278017044067, 40, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10112.099609375, 1042.0999755859, 37.471683502197, "Salma Saldean", 0, 0, 0, 0, 0, 0, "Verna Furlbrow wants you to deliver her recipe for Westfall Stew to Salma Saldean.", 0, 2);

_questDB:addQuest("no", 0, "Poor Old Blanchy", "Verna Furlbrow", -9853.0498046875, 919.5419921875, 30.278553009033, 40, 10, 20, -9954.966796875, 1056.0358886719, 38.842483520508, 2, 0, 0, 0, 8, 0, -9853.0498046875, 919.5419921875, 30.278553009033, "Verna Furlbrow", 0, 0, 0, 252, 0, 0, "Verna Furlbrow in Westfall wants you to bring her 8 Handfuls of Oats.", 0, 2);

_questDB:addQuest("no", 0, "Return to Lewis", "Dungar Longdrink", -8835.759765625, 490.08401489258, 109.6157913208, 1519, 10, 20, 0, 0, 0, 10, 0, 0, 0, 0, 0, -10500.599609375, 1021.5900268555, 60.527679443359, "Quartermaster Lewis", 0, 0, 0, 0, 0, 0, "Buy a gryphon ride to Sentinel Hill from the gryphon master Dungar Longdrink, then take Osric's Crate to Lewis at Sentinel Hill.", "Osric's Crate", 1);

_questDB:addQuest("no", 0, "Return to Lewis", "Dungar Longdrink", -8835.759765625, 490.08401489258, 109.6157913208, 40, 10, 20, 0, 0, 0, 10, 0, 0, 0, 0, 0, -10500.599609375, 1021.5900268555, 60.527679443359, "Quartermaster Lewis", 0, 0, 0, 0, 0, 0, "Buy a gryphon ride to Sentinel Hill from the gryphon master Dungar Longdrink, then take Osric's Crate to Lewis at Sentinel Hill.", "Osric's Crate", 1);

_questDB:addQuest("no", 0, "Dungar Longdrink", "Osric Strang", -8702.2802734375, 382.05200195313, 103.72564697266, 1519, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8835.759765625, 490.08401489258, 109.6157913208, "Dungar Longdrink", 0, 0, 0, 0, 0, 0, "Bring Osric's Crate to Dungar Longdrink the gryphon master.", "Osric's Crate", 1);

_questDB:addQuest("no", 0, "Dungar Longdrink", "Osric Strang", -8702.2802734375, 382.05200195313, 103.72564697266, 40, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8835.759765625, 490.08401489258, 109.6157913208, "Dungar Longdrink", 0, 0, 0, 0, 0, 0, "Bring Osric's Crate to Dungar Longdrink the gryphon master.", "Osric's Crate", 1);

_questDB:addQuest("no", 0, "Continue to Stormwind", "Thor", -10628.299804688, 1037.2700195313, 34.110454559326, 40, 10, 20, 0, 0, 0, 10, 0, 0, 0, 0, 0, -8702.2802734375, 382.05200195313, 103.72564697266, "Osric Strang", 0, 0, 0, 0, 0, 0, "Buy a gryphon ride from the gryphon master Thor, then bring Lewis' Note to Osric Strang, in the shop Limited Immunity, in the Old Town of Stormwind.", 0, 1);

_questDB:addQuest("no", 0, "A Swift Message", "Quartermaster Lewis", -10500.599609375, 1021.5900268555, 60.53002166748, 40, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10628.299804688, 1037.2700195313, 34.110454559326, "Thor", 0, 0, 0, 0, 0, 0, "Bring Lewis' Note to Thor the gryphon master.", 0, 1);

_questDB:addQuest("no", 0, "Report to Gryan Stoutmantle", "Farmer Furlbrow", -9851.6796875, 918.29602050781, 30.331800460815, 40, 10, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, -10508.799804688, 1045.2299804688, 60.518672943115, "Gryan Stoutmantle", 0, 0, 0, 0, 0, 0, "Talk to Gryan Stoutmantle.  He usually can be found in the stone tower on Sentinel Hill, just off the road, in the middle of Westfall.", 0, 2);

self.isSetup = true;
end