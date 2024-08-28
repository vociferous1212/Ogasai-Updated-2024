script_gather = { isSetup = false, useVendor = false, useMount = true, nodeObj = nil, gatherDistance = 85, message = 'Gather...', collectMinerals = true, collectHerbs = true, herbs = {}, numHerbs = 0, minerals = {}, numMinerals = 0, lootDistance = 3, timer = 0, nodeID = 0, gatherAllPossible = true, timerSet = false, nodeGUID = 0, chests = {}, numChests = 0, lock = {}, numLock = 0, fish = {}, numFish = 0, collectChests = true, dist = 0, messageToGrinder = "", gathering = false, blacklistedNodes = {}, blacklistedNodesNum = 0, blacklistedNodesNameNum = 0, blacklistTime = 0, blacklistSetTime = 60, isChest = false, lastNode = 0, messageSent = false, safeGather = true,
}

-- add node to blacklist table by GUID
function script_gather:addNodeToBlacklist(nodeGUID) 
if (nodeGUID ~= nil and nodeGUID ~= 0 and nodeGUID ~= '') then	 self.blacklistedNodes[self.blacklistedNodesNum] = nodeGUID; self.blacklistedNodesNum = self.blacklistedNodesNum + 1; end end

-- check if node is blacklisted by table GUID
function script_gather:isNodeBlacklisted(nodeGUID) 
for i=0,self.blacklistedNodesNum do if (nodeGUID == self.blacklistedNodes[i]) then return true; end end return false; end

function script_gather:addChest(name, id)
self.chests[self.numChests] = {}; self.chests[self.numChests][0] = name; self.chests[self.numChests][1] = id; self.numChests = self.numChests + 1; end

function script_gather:addLock(name, id)
self.lock[self.numLock] = {}; self.lock[self.numLock][0] = name; self.lock[self.numLock][1] = id; self.numLock = self.numLock + 1; end

function script_gather:addFish(name, id)
self.fish[self.numFish] = {}; self.fish[self.numFish][0] = name; self.fish[self.numFish][1] = id; self.numFish = self.numFish + 1; end

function script_gather:addHerb(name, id, use, req)
self.herbs[self.numHerbs] = {}self.herbs[self.numHerbs][0] = name;self.herbs[self.numHerbs][1] = id;self.herbs[self.numHerbs][2] = use;self.herbs[self.numHerbs][3] = req; self.numHerbs = self.numHerbs + 1; end

function script_gather:addMineral(name, id, use, req)
self.minerals[self.numMinerals] = {} self.minerals[self.numMinerals][0] = name; self.minerals[self.numMinerals][1] = id; self.minerals[self.numMinerals][2] = use; self.minerals[self.numMinerals][3] = req; self.numMinerals = self.numMinerals + 1; end

function script_gather:setup()
	
	self.collectMinerals = HasSpell('Find Minerals');
	self.collectHerbs = HasSpell('Find Herbs');
	
	script_gatherEX:setup();

	self.blacklistTime = GetTimeEX();
	self.timer = GetTimeEX();
	script_gatherEX2.waitTimer = GetTimeEX();
	self.isSetup = true;
end
function script_gather:getHerbSkill()
	local herbSkill = 0;
	for skillIndex = 1, GetNumSkillLines() do
  		skillName, isHeader, isExpanded, skillRank, numTempPoints, skillModifier,
    		skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType,
    		skillDescription = GetSkillLineInfo(skillIndex)
    		if (skillName == 'Herbalism') then
			herbSkill = skillRank;
		end
	end
	return herbSkill;
end
function script_gather:getMiningSkill()
	local miningSkill = 0;
	for skillIndex = 1, GetNumSkillLines() do
  		skillName, isHeader, isExpanded, skillRank, numTempPoints, skillModifier,
    		skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType,
    		skillDescription = GetSkillLineInfo(skillIndex)
    		if (skillName == 'Mining') then
			miningSkill = skillRank;
		end
	end
	return miningSkill;
end
function script_gather:ShouldGather(id)
	local herbSkill = script_gather:getHerbSkill();
	local miningSkill = script_gather:getMiningSkill();
	if(self.collectMinerals) then
		for i=0,self.numMinerals - 1 do
			if(self.minerals[i][1] == id and (self.minerals[i][2] or ((self.minerals[i][3] <= miningSkill) and self.gatherAllPossible))) then
				return true;		
			end
		end
	end
	if(self.collectHerbs) then
		for i=0,self.numHerbs - 1 do
			if(self.herbs[i][1] == id and (self.herbs[i][2]or ((self.herbs[i][3] <= herbSkill) and self.gatherAllPossible))) then		
				return true;		
			end
		end	
	end
	if (self.collectChests) then
		for i=0,self.numChests - 1 do
			if (self.chests[i][1] == id) then
				self.isChest = true;
				return true;
			end
		end
	end
end

function script_gather:GetNode()
	local targetObj, targetType = GetFirstObject();
	local bestDist = 9999;
	local bestTarget = nil;
	while targetObj ~= 0 do
		if (targetType == 5) then --GameObject
			if (script_gather:ShouldGather(targetObj:GetObjectDisplayID())) then
				if (not script_gather:isNodeBlacklisted(targetObj:GetGUID())) then
					local dist = targetObj:GetDistance();
					if(dist < self.gatherDistance and bestDist > dist) then
						local _x, _y, _z = targetObj:GetPosition();
						if(not IsNodeBlacklisted(_x, _y, _z, 5)) then
							bestDist = dist;
							bestTarget = targetObj;
							self.nodeGUID = targetObj:GetGUID();
						end
					end
				end
			end
		end
		targetObj, targetType = GetNextObject(targetObj);
	end
	return bestTarget;
end

function script_gather:drawChestNodes()

	local targetObj, targetType = GetFirstObject();
	while targetObj ~= 0 do
		if (targetType == 5) then 
			local id = targetObj:GetObjectDisplayID();
			local chestName = "";
			local _x, _y, _z = targetObj:GetPosition();
			local _tX, _tY, onScreen = WorldToScreen(_x, _y, _z);
			local dist = math.floor(targetObj:GetDistance());

			if(onScreen) then

				-- show chests by name
				for i=0,self.numChests - 1 do
					if (self.chests[i][1] == id) then
						chestName = "*"..self.chests[i][0].."*";
						local this = ""..dist.." yd";
						DrawText(this, _tX-10, _tY+12, 0, 255, 0);
					end
				end
	
				-- draw chests by name
				DrawText(chestName, _tX-25, _tY, 0, 255, 0);

			end
		end
	targetObj, targetType = GetNextObject(targetObj);
	end
end

function script_gather:drawGatherNodes()

local targetObj, targetType = GetFirstObject();
	while targetObj ~= 0 do
		if (targetType == 5) then 
			local id = targetObj:GetObjectDisplayID();
			local name = "";
			local chestName = "";
			local fishName = "";
			local _x, _y, _z = targetObj:GetPosition();
			local _tX, _tY, onScreen = WorldToScreen(_x, _y, _z);
			local dist = math.floor(targetObj:GetDistance());

			if(onScreen) then
				for i=0,self.numHerbs - 1 do
					if (self.herbs[i][1] == id) then
						name = self.herbs[i][0];
						local this = ""..dist.." yd";
						DrawText(this, _tX-10, _tY+12, 255, 255, 0);
					end
				end

				for i=0,self.numMinerals - 1 do
					if (self.minerals[i][1] == id) then
						name = self.minerals[i][0];
						local this = ""..dist.." yd";
						DrawText(this, _tX-10, _tY+12, 255, 255, 0);
				
					end
				end

				-- show chests by name
				for i=0,self.numChests - 1 do
					if (self.chests[i][1] == id) then
						chestName = "*"..self.chests[i][0].."*";
						local this = ""..dist.." yd";
						DrawText(this, _tX-10, _tY+12, 0, 255, 0);
					end
				end

				for i=0,self.numFish - 1 do
					if (self.fish[i][1] == id) then
						fishName = "*"..self.fish[i][0].."*";
						local this = ""..dist.." yd";
						DrawText(this, _tX-10, _tY+12, 0, 255, 0);
					end
				end

				-- armor crates
				--if (id == 335) then
				--	local this = ""..dist.." yd";
				--	local crateName = "Armor Crate";
				--	DrawText(crateName, _tX-10, _tY, 0, 255, 0);
				--	DrawText(this, _tX-10, _tY+12, 0, 255, 0);
				--end
	
				-- draw herbs and minerals by name
				DrawText(name, _tX-10, _tY, 255, 255, 0);
				-- draw chests by name
				DrawText(chestName, _tX-25, _tY, 0, 255, 0);
				DrawText(fishName, _tX-25, _tY, 0, 255, 0);
				if (script_grindMenu.showIDD) then
					if (id ~= nil) and (id ~= 0) then
						local idd = "ID - "..id.."";
						DrawText(idd, _tX-10, _tY-12, 255, 255, 0);
					end
				end
			end
		end
		targetObj, targetType = GetNextObject(targetObj);
	end
end

function script_gather:currentGatherName()
	local name = ' ';
	if (self.nodeID ~= 0 and self.nodeID ~= nil) then
		for i=0,self.numHerbs - 1 do
			if (self.herbs[i][1] == self.nodeID) then
				name = self.herbs[i][0];
			end
		end

		for i=0,self.numMinerals - 1 do
			if (self.minerals[i][1] == self.nodeID) then
				name = self.minerals[i][0];
			end
		end
		for i=0, self.numChests -1 do
			if (self.chests[i][1] == self.nodeID) then
				name = self.chests[i][0];
			end
		end
	end
	return name;
end