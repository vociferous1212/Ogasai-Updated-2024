_questDB_DunMorogh_Coldridge = {isSetup = false}


function _questDB_DunMorogh_Coldridge:setup()

--[[(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)]]--

_questDB:addQuest("no", 0, "The Boar Hunter", "Talin Keeneye", -6222.4702148438, 688.97302246094, 384.91912841797, 1, 1, 6, -6217.2001953125, 746.82202148438, 388.63339233398, 1, 12, 0, 0, 0, 0, -6222.4702148438, 688.97302246094, 384.91912841797, "Talin Keeneye", "Small Crag Boar", 0, 0, 0, 0, 2, "Talin Keeneye would like you to kill 12 Small Crag Boars.");

_questDB:addQuest("no", 0, "Coldridge Valley Mail Delivery", "Sten Stoutarm", -6214.8500976563, 328.18099975586, 383.48645019531, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6222.4702148438, 688.97302246094, 384.91912841797, "Talin Keeneye", 0, 0, 0, 0, 0, 0, "Deliver the stack of letters to Talin Keeneye.");

_questDB:addQuest("no", 0, "Dwarven Outfitters", "Sten Stoutarm", -6214.8500976563, 328.18099975586, 383.48645019531, 1, 1, 6, -6299.2026367188, 367.25122070313, 378.76663208008, 1, 20, 0, 0, 0, 0, -6214.8500976563, 328.18099975586, 383.48645019531, "Sten Stoutarm", "Ragged Young Wolf", "Ragged Timber Wolf", 0, 0, 0, 3, "Sten Stoutarm would like 8 pieces of Tough Wolf Meat.");

self.isSetup = true;
end
