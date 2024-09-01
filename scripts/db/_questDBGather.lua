_questDBGather = {gatherTarget = 0, gatherTarget2 = 0}

function _questDBGather:getObject()
	
	local gatherNum = 0;
	local gatherNum2 = 0;
	local i, t = GetFirstObject();
	local bestDist = 1000;
	local bestTarget = nil;

	if _questDB.curListQuest ~= nil then
		for i=0, _questDB.numQuests -1 do
			if _questDB.questList[i]['completed'] == "no" then
				if _questDB.questList[i]['questName'] ~= "nnil" then
					if _questDB.questList[i]['questName'] == _questDB.curListQuest then
						self.gatherTarget = _questDB.questList[i]['gatherID'];
						self.gatherTarget2 = _questDB.questList[i]['gatherID2'];
						gatherNum = _questDB.questList[i]['gatherNum'];
						gatherNum2 = _questDB.questList[i]['gatherNum2'];
					end
				end
			end
		end
	end
	
	while i ~= 0 do
		if t == 5 then
			if self.gatherTarget == i:GetObjectDisplayID() or self.gatherTarget2 == i:GetObjectDisplayID() then
				local dist = i:GetDistance();
				if bestDist > dist then
					bestDist = dist;
					bestTarget = i;
					self.gatherTarget = i;
				end
			end
		end
	i, t = GetNextObject(i);
	end
return nil;
end

function _questDBGather:gatherObject()
	if self.gatherTarget ~= 0 then
		local dist = self.gatherTarget:GetDistance();
		local x, t, z = self.gatherTarget:GetPosition();
		if dist > 4 then
			script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);
			return true;
		end
	end
return false;
end

function _questDBGather:checkInventory()
	-- run inventory and find item name that matches current _questDB quest name or _quest current quest name 
	_quest.numGather = 0;
	_quest.numGather2 = 0;
	
end
