_questDB_Elwynn_Northshire = {isSetup = false}


function _questDB_Elwynn_Northshire:setup()


--type quest - 1 = kill | 2 = gather | 0 = already completed | 3 = ?
--completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, gatherID, gatherID2, rewardNum, desc)


--level 1 human quest # 6
_questDB:addQuest("no", 0, "Skirmish at Echo Ridge", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 1, 4, -8653.1298828125, -127.53595733643, 88.85417175293, 1, 12, 0, 0, 0, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", "Kobold Laborer", 0, 0, 0, 0, 3, "Kill 12 Kobold Laborers, then return to Marshal McBride at Northshire Abbey.");

--level 1 human quest # 5
_questDB:addQuest("no", 0, "Investigate Echo Ridge", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 1, 4, -8716.78515625, -142.43266296387 ,86.455268859863, 1, 10, 0, 0, 0, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", "Kobold Worker", 0, 0, 0, 0, 0, "Kill 10 Kobold Workers, then report back to Marshal McBride.");

--level 1 human quest # 4
_questDB:addQuest("no", 0, "Kobold Camp Cleanup", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 1, 4, -8770.373046875, -129.57608032227, 83.567390441895, 1, 20, 0, 0, 0, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", "Kobold Vermin", 0, 0, 0, 0, 0, "Kill 10 Kobold Vermin, then return to Marshal McBride.");

--level 1 human quest # 3
_questDB:addQuest("no", 0, "Wolves Across the Border", "Eagan Peltskinner", -8869.2197265625, -163.23699951172, 80.205833435059, 12, 1, 4, -8855.4892578125, -114.63375854492, 80.380462646484, 1, 20, 0, 0, 0, 0, -8869.2197265625, -163.23699951172, 80.205833435059, "Eagan Peltskinner", "Young Wolf", "Timber Wolf", 0, 0, 0, 0, "Bring 8 pieces of Tough Wolf Meat to Eagan Peltskinner outside Northshire Abbey.");

-- level 1 human quest # 2
_questDB:addQuest("no", 0, "Eagan Peltskinner", "Deputy Willem", -8933.5400390625, -136.52299499512, 83.262565612793, 12, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8869.2197265625, -163.23699951172, 80.205513000488, "Eagan Peltskinner", 0, 0, 0, 0, 0, 0, "Speak with Eagan Peltskinner");

--level 1 human start quest
_questDB:addQuest("no", 0, "A Threat Within", "Deputy Willem", -8933.5400390625, -136.52299499512, 83.262565612793, 12, 1, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", 0, 0, 0, 0, 0, 0, "Speak with Marshal McBride.");

self.isSetup = true;
end