_questDB_Elwynn_Northshire = {isSetup = false}


function _questDB_Elwynn_Northshire:setup()


--type quest - 1 = kill | 2 = gather | 0 = already completed | 3 = ?
--completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem, gossipOption)

--leaving northshire abbey
_questDB:addQuest("no", 0, "Rest and Relaxation", "Falkhaan Isenstrider", -9044.5595703125, -45.981700897217, 88.336166381836, 12, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9462.66015625, 16.191499710083, 56.963390350342, "Innkeeper Farley", 0, 0, 0, 0, 0, 2, "Speak with Innkeeper Farley at the Lion's Pride Inn.", 0, 1);

-- report to goldshire
_questDB:addQuest("no", 0, "Report to Goldshire", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 6, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, -9465.51953125, 74.006896972656, 56.59508895874, "Marshal Dughan", 0, 0, 0, 0, 0, 1, "Take Marshal McBride's Documents to Marshal Dughan in Goldshire.", 0, 1);

-- added extra kills
_questDB:addQuest("no", 0, "Brotherhood of Thieves", "Deputy Willem", -8933.5400390625, -136.52299499512, 83.262565612793, 12, 1, 6, -9034.2412109375, -252.53915405273, 72.35909271240, 1, 20, 0, 0, 0, 0, 
-8933.5400390625, -136.52299499512, 83.262565612793, "Deputy Willem", "Defias Thug", 0, 0, 0, 0, 5, "Bring 12 Red Burlap Bandanas to Deputy Willem outside the Northshire Abbey.", 0, 1);
--level 1 human quest # 6
_questDB:addQuest("no", 0, "Skirmish at Echo Ridge", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 1, 6, -8616.5224609375, -143.78283691406, 87.454872131348, 1, 12, 0, 0, 0, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", "Kobold Laborer", 0, 0, 0, 0, 3, "Kill 12 Kobold Laborers, then return to Marshal McBride at Northshire Abbey.", 0, 1);

--level 1 human quest # 5
_questDB:addQuest("no", 0, "Investigate Echo Ridge", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 1, 6, -8716.78515625, -142.43266296387 ,86.455268859863, 1, 10, 0, 0, 0, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", "Kobold Worker", 0, 0, 0, 0, 0, "Kill 10 Kobold Workers, then report back to Marshal McBride.", 0, 1);

if GetMyClass() == "ROGUE" then
_questDB:addQuest("no", 0, "Encrypted Letter", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8863.4697265625, -210.9049987793, 80.572006225586, "Jorik Kerridan", 0, 0, 0, 0, 0, 0, "Read the Encrypted Letter and speak to Jorik Kerridan in the stable behind Northshire Abbey.", 0, 2);
end
if GetMyClass() == "WARRIOR" then
_questDB:addQuest("no", 0, "Simple Letter", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8918.3603515625, -208.4109954834, 82.125419616699, "Llane Beshere", 0, 0, 0, 0, 0, 0, "Read the Simple Letter and speak to Llane Beshere in Northshire Abbey.", 0, 2);
end
if GetMyClass() == "PALADIN" then
_questDB:addQuest("no", 0, "Consecrated Letter", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939643859863, 12, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8914.5703125, -215.01600646973, 82.116500854492, "Brother Sammuel", 0, 0, 0, 0, 0, 0, "Read the Consecrated Letter and speak to Brother Sammuel in Northshire Abbey.", 0, 2);
end

--level 1 human quest # 4
_questDB:addQuest("no", 0, "Kobold Camp Cleanup", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 1, 6, -8765.392578125, -189.02615356445, 84.626686096191, 1, 20, 0, 0, 0, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", "Kobold Vermin", 0, 0, 0, 0, 0, "Kill 10 Kobold Vermin, then return to Marshal McBride.", 0, 1);

--level 1 human quest # 3
_questDB:addQuest("no", 0, "Wolves Across the Border", "Eagan Peltskinner", -8869.2197265625, -163.23699951172, 80.205833435059, 12, 1, 6, -8855.4892578125, -114.63375854492, 80.380462646484, 1, 20, 0, 0, 0, 0, -8869.2197265625, -163.23699951172, 80.205833435059, "Eagan Peltskinner", "Young Wolf", "Timber Wolf", 0, 0, 0, 0, "Bring 8 pieces of Tough Wolf Meat to Eagan Peltskinner outside Northshire Abbey.", 0, 1);

-- level 1 human quest # 2
_questDB:addQuest("no", 0, "Eagan Peltskinner", "Deputy Willem", -8933.5400390625, -136.52299499512, 83.262565612793, 12, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8869.2197265625, -163.23699951172, 80.205513000488, "Eagan Peltskinner", 0, 0, 0, 0, 0, 0, "Speak with Eagan Peltskinner.", 0, 1);

--level 1 human start quest
_questDB:addQuest("no", 0, "A Threat Within", "Deputy Willem", -8933.5400390625, -136.52299499512, 83.262565612793, 12, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", 0, 0, 0, 0, 0, 0, "Speak with Marshal McBride.", 0, 1);

self.isSetup = true;
end