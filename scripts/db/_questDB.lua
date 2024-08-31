_questDB = { isSetup = false, questList = {}, numQuests = 0, curListQuest = 0,
		includeElwynnNorthshire = include("scripts\\db\\_questDB_Elwynn_Northshire.lua"),
		includeTeldrassShadowglen = include("scripts\\db\\_questDB_Teldrassil_Shadowglen.lua"),
		includeDuskwood2025 = include("scripts\\db\\_questDB_Duskwood_20_25.lua"),
}

function _questDB:setup()

	-- type quest 1 = kill 2 = gather 0 = already completed

--[[completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, gatherName, gatherName2, rewardNum)]]--

	_questDB_Duskwood_20_25:setup();
	_questDB_Teldrassil_Shadowglen:setup();
	_questDB_Elwynn_Northshire:setup()

	self.isSetup = true;

end


function _questDB:addQuest(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, gatherName, gatherName2, rewardNum)
	self.questList[self.numQuests] = {};
	self.questList[self.numQuests]['completed'] = completed;
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
	self.questList[self.numQuests]['numKill2'] = numKill2;
	self.questList[self.numQuests]['numGather'] = numGather;
	self.questList[self.numQuests]['numGather2'] = numGather2;
	self.questList[self.numQuests]['returnPos'] = {};
	self.questList[self.numQuests]['returnPos']['returnX'] = returnX;
	self.questList[self.numQuests]['returnPos']['returnY'] = returnY;
	self.questList[self.numQuests]['returnPos']['returnZ'] = returnZ;
	self.questList[self.numQuests]['returnTarget'] = returnTarget;
	self.questList[self.numQuests]['targetName'] = targetName;
	self.questList[self.numQuests]['targetName2'] = targetName2;
	self.questList[self.numQuests]['gatherName'] = gatherName;
	self.questList[self.numQuests]['gatherName2'] = gatherName2;
	self.questList[self.numQuests]['rewardNum'] = rewardNum;

	self.numQuests = self.numQuests + 1;

end


-- we need to run a check for faction first and foremost...




function _questDB:getQuestStartPos()
local x, y, z = 0, 0, 0;
local dist = 0;
local bestDist = 10000;
	if (not self.isSetup) then
		_questDB:setup();
	end

	for i=0, self.numQuests -1 do
		if self.questList[i]['completed'] ~= "nnil" then
			if self.questList[i]['mapID'] == GetMapID() then
					x, y, z = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];

				-- set our quest to be checked through rest of script?
				self.curListQuest = self.questList[i]['questName'];
			end
		end
	end

return x, y, z;
end

function _questDB:getQuestGiverName()
local name = "";
local dist = 0;
local bestDist = 10000;

if (not self.isSetup) then
		_questDB:setup();
	end

	for i=0, self.numQuests -1 do
		if self.questList[i]['completed'] ~= "nnil" then
			if self.questList[i]['mapID'] == GetMapID() then

			local dist = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];

				
					x, y, z = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];
			

					if self.questList[i]['questName'] == self.curListQuest then
						name = self.questList[i]['giverName'];
					end
			end
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

if (not self.isSetup) then
		_questDB:setup();
	end

	for i=0, self.numQuests -1 do
		if self.questList[i]['completed'] ~= "nnil" then
			if self.questList[i]['questName'] == _quest.currentQuest then
				x, y, z = self.questList[i]['grindPos']['grindX'], self.questList[i]['grindPos']['grindY'], self.questList[i]['grindPos']['grindZ'];
			end
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
	local numKill = 0;
	local numKill2 = 0;
	local i, t = GetFirstObject();
	local dist = 0;
	local bestDist = 1000;
	local bestTarget = nil;

if (not self.isSetup) then
		_questDB:setup();
	end

	if _questDB.curListQuest ~= nil then
		for i=0, self.numQuests -1 do
			if self.questList[i]['completed'] == "no" then
				if self.questList[i]['questName'] == self.curListQuest then
					target = self.questList[i]['targetName'];
					target2 = self.questList[i]['targetName2'];
					numKill = self.questList[i]['numKill'];
					numKill2 = self.questList[i]['numKill2'];
				end
			end
		end
	end
	while i ~= 0 do
		if t == 3 then
			if i:GetDistance() <= 350 and ((i:GetUnitName() == target and _quest.targetKilledNum < numKill) or (i:GetUnitName() == target2 and _quest.targetKilledNum2 < numKill2)) and not i:IsDead() then
				dist = i:GetDistance();
				if bestDist > dist then
					bestDist = dist;
					bestTarget = i;
				end
				
			elseif i:GetDistance() <= 50 and not i:IsDead() then
				i:AutoAttack();
				return i;
			end
		end
	i, t = GetNextObject(i);
	end
bestTarget:AutoAttack();
return bestTarget;
end

function _questDB:getReturnTargetPos()
local x, y, z = 0, 0, 0;

if (not self.isSetup) then
		_questDB:setup();
	end
	
	if self.curListQuest ~= nil then
	for i=0, self.numQuests -1 do
		if self.questList[i]['completed'] ~= "nnil" then
			if self.questList[i]['questName'] == self.curListQuest then
				x, y, z = self.questList[i]['returnPos']['returnX'], self.questList[i]['returnPos']['returnY'], self.questList[i]['returnPos']['returnZ'];
			end
		end
	end
	end

return x, y, z;
end

function _questDB:getReturnTargetName()	
local x, y, z = 0, 0, 0;

if (not self.isSetup) then
		_questDB:setup();
	end

	for i=0, self.numQuests -1 do
		if self.questList[i]['completed'] ~= "nnil" then
			if self.questList[i]['questName'] == self.curListQuest then
				name = self.questList[i]['returnTarget'];
			end
		end
	end

return name;
end

function _questDB:turnQuestCompleted()

if (not self.isSetup) then
		_questDB:setup();
	end

	for i=0, self.numQuests do
		if self.questList[i]['questName'] == self.curListQuest then
			if self.questList[i]['completed'] ~= "nnil" then
				self.questList[i]['completed'] = "nnil";
				_quest.currentQuest = nil;
				self.curListQuest = nil;
				DEFAULT_CHAT_FRAME:AddMessage("Quest marked as complete");
				return true;
			end
		end
	end
return false;
end
