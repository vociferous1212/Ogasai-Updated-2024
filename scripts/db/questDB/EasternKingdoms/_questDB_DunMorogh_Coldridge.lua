_questDB_DunMorogh_Coldridge = {isSetup = false}


function _questDB_DunMorogh_Coldridge:setup()

--[[(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)]]--


--_questDB:addQuest("no", 0, "", "", xyz, 1, 1, 6, type,
--_questDB:addQuest("no", 0, "", "", xyz, 1, 1, 6, type,
--_questDB:addQuest("no", 0, "", "", xyz, 1, 1, 6, type,
--_questDB:addQuest("no", 0, "", "", xyz, 1, 1, 6, type,
--_questDB:addQuest("no", 0, "", "", xyz, 1, 1, 6, type,
--_questDB:addQuest("no", 0, "", "", xyz, 1, 1, 6, type,
--_questDB:addQuest("no", 0, "", "", xyz, 1, 1, 6, type,
--_questDB:addQuest("no", 0, "", "", xyz, 1, 1, 6, type,
--_questDB:addQuest("no", 0, "", "", xyz, 1, 1, 6, type,

_questDB:addQuest("no", 0, "The Boar Hunter", "Talin Keeneye", -6222.4702148438, 688.97302246094, 384.91912841797, 1, 1, 6, -6217.2001953125, 746.82202148438, 388.63339233398, 1, 12, 0, 0, 0, 0, -6222.4702148438, 688.97302246094, 384.91912841797, "Talin Keeneye", "Small Crag Boar", 0, 0, 0, 0, 1, "Talin Keeneye would like you to kill 12 Small Crag Boars.", 0, 1);


_questDB:addQuest("no", 0, "Coldridge Valley Mail Delivery", "Sten Stoutarm", -6214.8500976563, 328.18099975586, 383.48645019531, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6222.4702148438, 688.97302246094, 384.91912841797, "Talin Keeneye", 0, 0, 0, 0, 0, 0, "Deliver the stack of letters to Talin Keeneye.", 0, 1);

if GetMyClass() == "PALADIN" then
_questDB:addQuest("no", 0, "Consecrated Rune", "Sten Stoutarm", -6214.8500976563, 328.18099975586, 383.48715209961, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6120.6801757813, 382.08898925781, 395.54290771484, "Bromos Grummner", 0, 0, 0, 0, 0, 0, "Read the Consecrated Rune and speak to Bromos Grummner in Coldridge Valley.", 0, 2);
end

_questDB:addQuest("no", 0, "Dwarven Outfitters", "Sten Stoutarm", -6214.8500976563, 328.18099975586, 383.48645019531, 1, 1, 6, -6299.2026367188, 367.25122070313, 378.76663208008, 1, 20, 0, 0, 0, 0, -6214.8500976563, 328.18099975586, 383.48645019531, "Sten Stoutarm", "Ragged Young Wolf", "Ragged Timber Wolf", 0, 0, 0, 3, "Sten Stoutarm would like 8 pieces of Tough Wolf Meat.", 0, 1);

self.isSetup = true;
end
