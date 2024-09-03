_questDB = { isSetup = false, questList = {}, numQuests = 0, curListQuest = 0, curDesc = nil,
		includeElwynnNorthshire = include("scripts\\db\\_questDB_Elwynn_Northshire.lua"),
		includeTeldrassShadowglen = include("scripts\\db\\_questDB_Teldrassil_Shadowglen.lua"),
		includeTeldrassDolanaar = include("scripts\\db\\_questDB_Teldrassil_Dolanaar.lua"),
		includeDuskwood2025 = include("scripts\\db\\_questDB_Duskwood_20_25.lua"),
		includeDunMoroghColdridge = include("scripts\\db\\_questDB_DunMorogh_Coldridge.lua"),
}
function _questDB:setup()
--[[
--type quest - 1 = kill | 2 = gather | 0 = already completed | 3 = ?

--completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum)

]]--

	_questDB_Duskwood_20_25:setup();
	_questDB_Teldrassil_Dolanaar:setup()
	_questDB_Teldrassil_Shadowglen:setup();
	_questDB_Elwynn_Northshire:setup();
	_questDB_DunMorogh_Coldridge:setup();

	self.isSetup = true;

end

function _questDB:addQuest(completed, faction, questName, giverName, posX, posY, posZ, mapID, minLevel, maxLevel, grindX, grindY, grindZ, type, numKill, numKill2, numKill3, numGather, numGather2, returnX, returnY, returnZ, returnTarget, targetName, targetName2, targetName3, gatherID, gatherID2, rewardNum, desc, useItem)
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
	self.questList[self.numQuests]['numKill3'] = numKill3;
	self.questList[self.numQuests]['numGather'] = numGather;
	self.questList[self.numQuests]['numGather2'] = numGather2;
	self.questList[self.numQuests]['returnPos'] = {};
	self.questList[self.numQuests]['returnPos']['returnX'] = returnX;
	self.questList[self.numQuests]['returnPos']['returnY'] = returnY;
	self.questList[self.numQuests]['returnPos']['returnZ'] = returnZ;
	self.questList[self.numQuests]['returnTarget'] = returnTarget;
	self.questList[self.numQuests]['targetName'] = targetName;
	self.questList[self.numQuests]['targetName2'] = targetName2;
	self.questList[self.numQuests]['targetName3'] = targetName3;
	self.questList[self.numQuests]['gatherID'] = gatherID;
	self.questList[self.numQuests]['gatherID2'] = gatherID2;
	self.questList[self.numQuests]['rewardNum'] = rewardNum;
	self.questList[self.numQuests]['desc'] = desc;
	self.questList[self.numQuests]['useItem'] = useItem;
	self.numQuests = self.numQuests + 1;

end

function _questDB:getQuestStartPos()
local x, y, z = 0, 0, 0;
local dist = 0;
local bestDist = 10000;
	for i=0, self.numQuests -1 do
		if self.questList[i]['completed'] ~= "nnil" then
			if self.questList[i]['questName'] ~= "nnil" then
				if self.questList[i]['mapID'] == GetMapID() then
					if GetLocalPlayer():GetLevel() >= self.questList[i]['minLevel'] and GetLocalPlayer():GetLevel() <= self.questList[i]['maxLevel'] then

					x, y, z = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];

					-- set our quest to be checked through rest of script?
						--if _quest.currentDesc == nil then
						_questDB.curDesc = self.questList[i]['desc'];
						_questDB.curListQuest = self.questList[i]['questName'];
						_quest.currentType = _questDB.questList[i]['type'];
						_quest.usingItem = _questDB.questList[i]['useItem'];

					end

		
				end
			end
		end
	end
return x, y, z;
end

function _questDB:getQuestGiverName()
local name = "";
local dist = 0;
local bestDist = 10000;

	for i=0, self.numQuests -1 do
		if self.questList[i]['completed'] == "no" then
			if self.questList[i]['questName'] ~= "nnil" then
				if self.questList[i]['mapID'] == GetMapID() then

			local dist = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];

				
					x, y, z = self.questList[i]['pos']['x'], self.questList[i]['pos']['y'], self.questList[i]['pos']['z'];
			

					if self.questList[i]['questName'] == self.curListQuest then
						name = self.questList[i]['giverName'];
					end
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

	for i=0, self.numQuests -1 do
		if self.questList[i]['completed'] == "no" then
			if (self.questList[i]['questName'] ~= "nnil") then
			if self.questList[i]['questName'] == _quest.currentQuest then
			if self.questList[i]['desc'] == _quest.currentDesc then
				x, y, z = self.questList[i]['grindPos']['grindX'], self.questList[i]['grindPos']['grindY'], self.questList[i]['grindPos']['grindZ'];
			end
			end
			end
		end
	end

return x, y, z;
end

function _questDB:getReturnTargetPos()
local x, y, z = 0, 0, 0;
	
	if self.curListQuest ~= nil then
	for i=0, self.numQuests -1 do
		if self.questList[i]['completed'] == "no" then
			if self.questList[i]['questName'] ~= "nnil" then
			if self.questList[i]['questName'] == self.curListQuest then
				x, y, z = self.questList[i]['returnPos']['returnX'], self.questList[i]['returnPos']['returnY'], self.questList[i]['returnPos']['returnZ'];
			end
			end
		end
	end
	end

return x, y, z;
end

function _questDB:getReturnTargetName()	
local x, y, z = 0, 0, 0;
local name = nil;


	for i=0, self.numQuests -1 do
		if self.questList[i]['completed'] == "no" then
			if self.questList[i]['questName'] ~= "nil" then
			if self.questList[i]['questName'] == self.curListQuest then
				name = self.questList[i]['returnTarget'];
			end
			end
		end
	end

return name;
end

function _questDB:turnQuestCompleted()
local questDescription, questObjectives = GetQuestLogQuestText();
	if self.curListQuest ~= nil then
	for i=0, self.numQuests -1 do
		--(if desc == quest being checked and quest being checked ~= nil) or (quest being checked ~= nil and quester current quest == nil) or (there's no quest objective
		if (self.questList[i]['desc'] == _quest.currentDesc and _quest.currentDesc ~= nil) or (self.questList[i]['desc'] == _questDB.curDesc and _questDB.curDesc ~= nil and _quest.currentQuest == nil) or (questObjectives == nil and _quest.currentQuest ~= _questDB.curListQuest) or (not _quest.isQuestCompleted) then
			if self.questList[i]['questName'] == self.curListQuest and self.questList[i]['desc'] == _questDB.curDesc then
				if self.questList[i]['completed'] == "no" and self.questList[i]['questName'] ~= "nnil" then
					DEFAULT_CHAT_FRAME:AddMessage("Quest marked as complete - "..self.curListQuest);
					ToFile(""..self.curListQuest.." - completed");
					self.curListQuest = nil;
					self.curDesc = nil;
					_quest.currentQuest = nil;
					self.questList[i]['completed'] = "nnil";
					self.questList[i]['questName'] = "nnil";
					_quest.curGrindX, _quest.curGrindY, _quest.curGrindZ = _questDB:getQuestGrindPos();
					_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = _questDB:getQuestStartPos();
					return true;
					
				end
			end
		end
	end
	end
return false;
end
function _questDB:turnOldQuestCompleted()
local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(1);
	local questDescription, questObjectives = GetQuestLogQuestText();
	if (not _quest.isQuestCompleted)then
		for i=0, _questDB.numQuests -1 do
			if self.questList[i]['questName'] == self.curListQuest then
			if self.questList[i]['completed'] == "no" then
			if self.questList[i]['questName'] ~= "nnil" then
			if _quest.currentDesc ~= _questDB.curDesc then
			if self.questList[i]['questName'] ~= title then
			if self.questList[i]['desc'] ~= _quest.currentDesc then
				if questObjectives ~= self.questList[i]['desc'] then
				DEFAULT_CHAT_FRAME:AddMessage("Quest marked as complete - "..self.curListQuest);
				self.questList[i]['completed'] = "nnil";
				self.questList[i]['questName'] = "nnil";
				ToFile(""..self.curListQuest.." - completed");
				self.curListQuest = nil;
				self.curDesc = nil;
				_quest.currentQuest = nil;
				_quest.curGrindX, _quest.curGrindY, _quest.curGrindZ = _questDB:getQuestGrindPos();
				_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = _questDB:getQuestStartPos();
			return true;
			end end end end end end end
		end
	end
end