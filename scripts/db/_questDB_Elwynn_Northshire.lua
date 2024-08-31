_questDB_Elwynn_Northshire = {isSetup = false}


function _questDB_Elwynn_Northshire:setup()


--[[is completed, faction, quest name, quest giver name, quest giver pos, mapID, minLevel, maxLevel, grind pos, type, kill number, gather number, return pos, return target name, kill target 1, kill target 2, gather target 1, gather target 2, rewardNum]]--

-- level 1 human quest # 7



--level 1 human quest # 6
_questDB:addQuest("no", 0, "Skirmish at Echo Ridge", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 1, 4, -8653.1298828125, -127.53595733643, 88.85417175293, 1, 12, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", "Kobold Laborer", 0, 0, 0, 3);

--level 1 human quest # 5
_questDB:addQuest("no", 0, "Investigate Echo Ridge", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 1, 4, -8716.78515625, -142.43266296387 ,86.455268859863, 1, 10, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", "Kobold Worker", 0, 0, 0, 0);

--level 1 human quest # 4
_questDB:addQuest("no", 0, "Kobold Camp Cleanup", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 1, 4, -8770.373046875, -129.57608032227, 83.567390441895, 1, 10, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", "Kobold Vermin", 0, 0, 0, 0);

--level 1 human quest # 3
_questDB:addQuest("no", 0, "Wolves Across the Border", "Eagan Peltskinner", -8869.2197265625, -163.23699951172, 80.205833435059, 12, 1, 4, -8855.4892578125, -114.63375854492, 80.380462646484, 2, 0, 8, -8869.2197265625, -163.23699951172, 80.205833435059, "Eagan Peltskinner", "Young Wolf", "Timber Wolf", 0, 0, 0);

-- level 1 human quest # 2
_questDB:addQuest("nnil", 0, "Eagan Peltskinner", "Deputy Willem", -8933.5400390625, -136.52299499512, 83.262565612793, 12, 1, 4, 0, 0, 0, 0, 0, 0, -8869.2197265625, -163.23699951172, 80.205513000488, "Eagan Peltskinner", 0, 0, 0, 0, 0);

--level 1 human start quest
_questDB:addQuest("nnil", 0, "A Threat Within", "Deputy Willem", -8933.5400390625, -136.52299499512, 83.262565612793, 12, 1, 4, 0, 0, 0, 0, 0, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", 0, 0, 0, 0, 0);

self.isSetup = true;
end