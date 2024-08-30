_questDB = { isSetup = false, questList = {}, numQuests = 0, curListQuest = 0,


}


function _questDB:addQuest(faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numGather, returnX, returnY, returnZ, returnTarget, enemyName, enemyName2, gatherName, gatherName2, completed)
	self.questList[self.numQuests] = {};
	self.questList[self.numQuests]['faction']= faction;
	self.questList[self.numQuests]['questName'] = questName;
	self.questList[self.numQuests]['giverName'] = giverName;
	self.questList[self.numQuests]['pos'] = {};
	self.questList[self.numQuests]['pos']['x'] = posX;
	self.questList[self.numQuests]['pos']['y'] = posY;
	self.questList[self.numQuests]['pos']['z'] = posZ;
	self.questList[self.numQuests]['mapID'] = mapID;
	self.questList[self.numQuests]['minLevel'] = minLevel;
	self.questList[self.numQuests]['maxLevel'] = maxLevel;
	self.questList[self.numQuests]['grindPos'] = {};
	self.questList[self.numQuests]['grindPos']['grindX'] = grindX;
	self.questList[self.numQuests]['grindPos']['grindY'] = grindY;
	self.questList[self.numQuests]['grindPos']['grindZ'] = grindZ;
	self.questList[self.numQuests]['type'] = type;
	self.questList[self.numQuests]['numKill'] = numKill;
	self.questList[self.numQuests]['numGather'] = numGather;
	self.questList[self.numQuests]['returnPos'] = {};
	self.questList[self.numQuests]['returnPos']['returnX'] = returnX;
	self.questList[self.numQuests]['returnPos']['returnY'] = returnY;
	self.questList[self.numQuests]['returnPos']['returnZ'] = returnZ;
	self.questList[self.numQuests]['returnTarget'] = returnTarget;
	self.questList[self.numQuests]['targetName'] = enemyName;
	self.questList[self.numQuests]['targetName2'] = enemyName2;
	self.questList[self.numQuests]['gatherName'] = gatherName;
	self.questList[self.numQuests]['gatherName2'] = gatherName2;
	self.questList[self.numQuests]['completed'] = completed;
end

function _questDB:setup()

	-- type quest 1 = kill 2 = gather 0 = already completed



--[[faction, quest name, quest giver name, quest giver pos, mapID, minLevel, maxLevel, grind pos, type, kill number, gather number, return pos, return target name, kill target 1, kill target 2, gather target 1, gather target 2, is completed ]]--




	-- need some other edge case things like prerequisite yes or no.. can probably remove minlevel/maxlevel and just run all quests not marked as completed

-- level 1 night elf starter quest
_questDB:addQuest(0, "The Balance of Nature", "Conservator Ilthalaine", 10354.408203125, 675.88238525391, 1329.5684814453, 141, 1, 4, 10328.900390625, 826.05200195313, 1326.380859375, 1, 7, 0, 10354.408203125, 675.88238525391, 1329.5684814453, "Conservator Ilthalaine", "Young Nightsaber", "Young Thistleboar", 0, 0, false);

--level 1 human start quest
_questDB:addQuest(0, "A Threat Within", "Deputy Willem", -8933.5400390625, -136.52299499512, 83.262565612793, 12, 1, 4, 0, 0, 0, 0, 0, 0, -8902.58984375, -162.60600280762, 81.939300537109, "Marshal McBride", 0, 0, 0, 0, false);


self.isSetup = true;
end



-- we need to run a check for faction first and foremost...




function _questDB:getQuestStartPos()
local x, y, z = 0, 0, 0;

	for i=0, self.numQuests do
		if self.questList[i]['mapID'] == GetMapID() then
			x, y, z = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];

			-- set our quest to be checked through rest of script?
			self.curListQuest = self.questList[self.numQuests]['questName'];
		end
	end

return x, y, z;
end

function _questDB:getQuestGiverName()
local name = "";

	for i=0, self.numQuests do

		if self.questList[i]['questName'] == self.curListQuest then
			name = self.questList[i]['giverName'];
		end
	end

return name;
end

function _questDB:getQuestName()
local name = "";

		name = self.curListQuest;
return name;
end

function _questDB:getQuestGrindPos()
local x, y, z = 0, 0, 0;

	for i=0, self.numQuests do

		if self.questList[i]['questName'] == self.curListQuest then
			x, y, z = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];
		end
	end

return x, y, z;
end

function _questDB:getObjectives()

	-- entry 1...
	ToggleQuestLog()
	SelectQuestLogEntry(1);
	local desc, type, done = GetQuestLogLeaderBoard(1, 2)
	DEFAULT_CHAT_FRAME:AddMessage(desc);
end

function _questDB:getTarget()
	local target = 0;
	local target2 = 0;
	local i, t = GetFirstObject();

	if _quest.currentQuest ~= nil then
		for i=0, self.numQuests do
			if self.questList[i]['questName'] == _quest.currentQuest then
				target = self.questList[i]['targetName'];
				target2 = self.questList[i]['targetName2'];
			end
		end
	end
	while i ~= 0 do
		if t == 3 then
			if i:GetDistance() <= 50 and (i:GetUnitName() == target or i:GetUnitName() == target2) and not i:IsDead() then
				i:AutoAttack();
				return i;
			elseif i:GetDistance() <= 50 and not i:IsDead() and i:CanAttack() and not i:IsCritter() then
				i:AutoAttack();
				return i;
			end
		end
	i, t = GetNextObject(i);
	end
return nil;
end

function _questDB:getReturnTargetPos()
local x, y, z = 0, 0, 0;

	for i=0, self.numQuests do
		if self.questList[i]['questName'] == self.curListQuest then
			x, y, z = self.questList[i]['returnPos']['returnX'], self.questList[i]['returnPos']['returnY'], self.questList[i]['returnPos']['returnZ'];
		end
	end

return x, y, z;
end

function _questDB:getReturnTargetName()	
local x, y, z = 0, 0, 0;

	for i=0, self.numQuests do
		if self.questList[i]['questName'] == self.curListQuest then
			name = self.questList[i]['returnTarget'];
		end
	end

return name;
end
