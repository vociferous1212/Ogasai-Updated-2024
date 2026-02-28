_questDB_DunMorogh_Coldridge = {isSetup = false}


function _questDB_DunMorogh_Coldridge:setup()

--[[(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)]]--

_questDB:addQuest("no", 0, "Senir's Observations", "Mountaineer Thalos", -6235.8701171875, 152.98899841309, 428.31677246094, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -5644.3701171875, -499.16299438477, 396.6692199707, "Senir Whitebeard", 0, 0, 0, 0, 0, 0, "Deliver Grelin's report to Senir Whitebeard in Kharanos.", 0, 1);

_questDB:addQuest("no", 0, "Senir's Observations", "Grelin Whitebeard", -6363, 567.08502197266, 385.76770019531, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6235.8701171875, 152.98899841309, 428.31677246094, "Mountaineer Thalos", 0, 0, 0, 0, 0, 0, "Speak with Mountaineer Thalos.", 0, 1);

_questDB:addQuest("no", 0, "The Stolen Journal", "Grelin Whitebeard", -6363, 567.08502197266, 385.76770019531, 1, 1, 6, -6508.8198242188, 300.75799560547, 370.34649658203, 1, 1, 0, 0, 0, 0, -6363, 567.08502197266, 385.76770019531, "Grelin Whitebeard", "Grik'nir the Cold", 0, 0, 0, 0, 2, "Grelin Whitebeard wants you to kill Grik'nir the Cold, and retrieve his journal.", 0, 1);

-- warlock class quest imp
if GetMyClass() == "WARLOCK" then
	_questDB:addQuest("no", 0, "Beginnings", "Alamar Grimm", -6048.7900390625, 391.07800292969, 398.9580078125, 1, 1, 6, -6546.9775390625, 417.83032226563, 384.97494506836, 1, 6, 0, 0, 0, 0, -6048.7900390625, 391.07800292969, 398.9580078125, "Alamar Grimm", "Frostmane Novice", 0, 0, 0, 0, 0, "Bring 3 Feather Charms to Alamar Grimm in Anvilmar.", 0, 1);
end

_questDB:addQuest("no", 0, "Bring Back the Mug", "Durnan Furcutter", -6056.3798828125, 385.21301269531, 392.7624206543, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6371.1298828125, 571.81597900391, 385.74447631836, "Nori Pridedrift", 0, 0, 0, 0, 0, 0, "Return Nori's Mug to Nori Pridedrift.", 0, 1);

_questDB:addQuest("no", 0, "Scalding Mornbrew Delivery", "Nori Pridedrift", -6371.1298828125, 571.81597900391, 385.74444580078, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6056.3798828125, 385.21301269531, 392.7624206543, "Durnan Furcutter", 0, 0, 0, 0, 0, 0, "Take a Scalding Mornbrew to Durnan Furcutter inside Anvilmar before it gets cold in five minutes!", 0, 1);

_questDB:addQuest("no", 0, "The Troll Cave", "Grelin Whitebeard", -6363, 567.08502197266, 385.76773071289, 1, 1, 6, -6444.4296875, 532.41650390625, 385.23266601563, 1, 20, 0, 0, 0, 0, -6363, 567.08502197266, 385.76773071289, "Grelin Whitebeard", "Frostmane Troll Whelp", 0, 0, 0, 0, 4, "Grelin Whitebeard would like you to kill 14 Frostmane Troll Whelps.", 0, 1);

_questDB:addQuest("no", 0, "A New Threat", "Balir Frosthammer", -6216.5297851563, 339.00201416016, 383.27102661133, 1, 1, 6, -6289.8100585938, 628.37799072266, 387.6130065918, 1, 10, 10, 0, 0, 0, -6216.5297851563, 339.00201416016, 383.27102661133, "Balir Frosthammer", "Rockjaw Trogg", "Burly Rockjaw Trogg", 0, 0, 0, 3, "Balir Frosthammer wants you to kill 6 Rockjaw Troggs and 6 Burly Rockjaw Troggs.", 0, 1);

_questDB:addQuest("no", 0, "Coldridge Valley Mail Delivery", "Talin Keeneye", -6222.4702148438, 688.97302246094, 384.91912841797, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6363, 567.08502197266, 385.76770019531, "Grelin Whitebeard", 0, 0, 0, 0, 0, 0, "Deliver the letter to Grelin Whitebeard.", 0, 1);

_questDB:addQuest("no", 0, "The Boar Hunter", "Talin Keeneye", -6222.4702148438, 688.97302246094, 384.91912841797, 1, 1, 6, -6217.2001953125, 746.82202148438, 388.63339233398, 1, 12, 0, 0, 0, 0, -6222.4702148438, 688.97302246094, 384.91912841797, "Talin Keeneye", "Small Crag Boar", 0, 0, 0, 0, 2, "Talin Keeneye would like you to kill 12 Small Crag Boars.", 0, 1);

_questDB:addQuest("no", 0, "Coldridge Valley Mail Delivery", "Sten Stoutarm", -6214.8500976563, 328.18099975586, 383.48645019531, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6222.4702148438, 688.97302246094, 384.91912841797, "Talin Keeneye", 0, 0, 0, 0, 0, 0, "Deliver the stack of letters to Talin Keeneye.", 0, 1);



-- class quests
if GetMyClass() == "WARLOCK" then
_questDB:addQuest("no", 0, "Tainted Memorandum", "Sten Stoutarm", -6214.8500976563, 328.18099975586, 383.48645019531, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6048.7900390625, 391.07800292969, 398.9580078125, "Alamar Grimm", 0, 0, 0, 0, 0, 0, "Read the Tainted Memorandum and speak to Alamar Grimm inside Anvilmar above Coldridge Valley.", 0, 2);
end
if GetMyClass() == "HUNTER" then
_questDB:addQuest("no", 0, "Etched Rune", "Sten Stoutarm", -6214.8500976563, 328.18099975586, 383.48645019531, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6091.7900390625, 365.14099121094, 395.5400390625, "Thorgas Grimson", 0, 0, 0, 0, 0, 0, "Read the Etched Rune and speak to Thorgas Grimson in Coldridge Valley.", 0, 2);
end
if GetMyClass() == "MAGE" then
_questDB:addQuest("no", 0, "Glyphic Memorandum", "Sten Stoutarm", -6214.8500976563, 328.18099975586, 383.48645019531, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6056.08984375, 388.17498779297, 392.76116943359, "Marryk Nurribit", 0, 0, 0, 0, 0, 0, "Read the Glyphic Memorandum and speak to Marryk Nurribit inside Anvilmar above Coldridge Valley.", 0, 2);
end
if GetMyClass() == "ROGUE" then
_questDB:addQuest("no", 0, "Encrypted Memorandum", "Sten Stoutarm", -6214.8500976563, 328.18099975586, 383.48645019531, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6093.75, 404.91799926758, 395.53692626953, "Solm Hargrin", 0, 0, 0, 0, 0, 0, "Read the Encrypted Memorandum and speak to Solm Hargrin in Coldridge Valley.", 0, 2);
end
if GetMyClass() == "WARRIOR" then
_questDB:addQuest("no", 0, "Simple Memorandum", "Sten Stoutarm", -6214.8500976563, 328.18099975586, 383.48645019531, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6084.7700195313, 382.14099121094, 395.54345703125, "Thran Khorman", 0, 0, 0, 0, 0, 0, "Read the Simple Memorandum and speak to Thran Khorman in Coldridge Valley.", 0, 2);
end
if GetMyClass() == "PALADIN" then
_questDB:addQuest("no", 0, "Consecrated Rune", "Sten Stoutarm", -6214.8500976563, 328.18099975586, 383.48715209961, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6120.6801757813, 382.08898925781, 395.54290771484, "Bromos Grummner", 0, 0, 0, 0, 0, 0, "Read the Consecrated Rune and speak to Bromos Grummner in Coldridge Valley.", 0, 2);
end
if GetMyClass() == "PRIEST" then
_questDB:addQuest("no", 0, "Hallowed Rune", "Sten Stoutarm", -6214.8500976563, 328.18099975586, 383.48715209961, 1, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6056.740234375, 393.54800415039, 392.75955200195, "Branstock Khalder", 0, 0, 0, 0, 0, 0, "Read the Hallowed Rune and speak to Branstock Khalder in Anvilmar.", 0, 2);
end



_questDB:addQuest("no", 0, "Dwarven Outfitters", "Sten Stoutarm", -6214.8500976563, 328.18099975586, 383.48645019531, 1, 1, 6, -6299.2026367188, 367.25122070313, 378.76663208008, 1, 20, 0, 0, 0, 0, -6214.8500976563, 328.18099975586, 383.48645019531, "Sten Stoutarm", "Ragged Young Wolf", "Ragged Timber Wolf", 0, 0, 0, 3, "Sten Stoutarm would like 8 pieces of Tough Wolf Meat.", 0, 1);

self.isSetup = true;
end
