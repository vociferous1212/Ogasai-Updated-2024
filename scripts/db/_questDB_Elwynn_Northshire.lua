_questDB_Elwynn_Northshire = {isSetup = false}


function _questDB_Elwynn_Northshire:setup()

-- level 1 human quest # 5
_questDB:addQuest("no", 0, "Eagan Peltskinner", "Deputy Willem", -8933.5400390625, -136.52299499512, 83.262565612793, 12, 1, 4, 0, 0, 0, 0, 0, 0, -8869.2197265625, -163.23699951172, 80.205513000488, "Eagan Peltskinner", 0, 0, 0, 0, 0);

--level 1 human quest # 4
_questDB:addQuest("no", 0, "Skirmish at Echo Ridge", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 1, 4, -8653.1298828125, -127.53595733643, 88.85417175293, 1, 12, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", "Kobold Laborer", 0, 0, 0, 3);

--level 1 human quest # 3
_questDB:addQuest("no", 0, "Investigate Echo Ridge", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 1, 4, -8716.78515625, -142.43266296387 ,86.455268859863, 1, 10, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", "Kobold Worker", 0, 0, 0, 0);

--level 1 human quest # 2
_questDB:addQuest("no", 0, "Kobold Camp Cleanup", "Marshal McBride", -8902.58984375, -162.60600280762, 81.939300537109, 12, 1, 4, -8770.373046875, -129.57608032227, 83.567390441895, 1, 10, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", "Kobold Vermin", 0, 0, 0, 0);

--level 1 human start quest
_questDB:addQuest("no", 0, "A Threat Within", "Deputy Willem", -8933.5400390625, -136.52299499512, 83.262565612793, 12, 1, 4, 0, 0, 0, 0, 0, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", 0, 0, 0, 0, 0);

self.isSetup = true;
end