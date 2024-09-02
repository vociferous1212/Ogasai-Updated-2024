_questDBTargets = {targetKilledTable = {}, targetKilledTableNum = 0,}

function _questDBTargets:addTargetToKilledTable(target)
	if target ~= nil and target ~= 0 and target ~= "" then
		self.targetKilledTable[self.targetKilledTableNum] = target;
		self.targetKilledTableNum = self.targetKilledTableNum + 1;
	end
	
end
	
function _questDBTargets:isTargetAddedToKilledTable(target)
	for i=0, self.targetKilledTableNum do
		if target ~= nil and target ~= 0 and target ~= "" then
			if target == self.targetKilledTable[i] then
				return true;
			end
		end
	end
return false;
end

function _questDBTargets:getTarget()
	local target = 0;
	local target2 = 0;
	local numKill = 0;
	local numKill2 = 0;
	local i, t = GetFirstObject();
	local dist = 0;
	local bestDist = 1000;
	local bestTarget = nil;

	if _questDB.curListQuest ~= nil then
		for i=0, _questDB.numQuests -1 do
			if _questDB.questList[i]['completed'] == "no" then
				if _questDB.questList[i]['questName'] ~= "nnil" then
				if _questDB.questList[i]['questName'] == _questDB.curListQuest then
				if _questDB.questList[i]['desc'] == _quest.currentDesc then
					target = _questDB.questList[i]['targetName'];
					target2 = _questDB.questList[i]['targetName2'];
					target3 = _questDB.questList[i]['targetName3'];
					numKill = _questDB.questList[i]['numKill'];
					numKill2 = _questDB.questList[i]['numKill2'];
					numKill3 = _questDB.questList[i]['numKill3'];
				end
				end
				end
			end
		end
	end
	local weHaveQuestTarget = false;
	while i ~= 0 do
		if t == 3 then
			if i:GetDistance() <= 200 and ((i:GetUnitName() == target and _quest.targetKilledNum < numKill) or (i:GetUnitName() == target2 and _quest.targetKilledNum2 < numKill2) or (i:GetUnitName() == target and _quest.targetKilledNum3 < numKill3)) and not i:IsDead() then
				dist = i:GetDistance();
				if bestDist > dist then
					bestDist = dist;
					bestTarget = i;
					weHaveQuestTarget = true;
				end
			end
			if (not weHaveQuestTarget) then
					local aggro = i:GetLevel() - GetLocalPlayer():GetLevel() + 21;
				if not i:IsCritter() and not i:IsDead() and i:CanAttack() and i:GetDistance() <= aggro then
					dist = i:GetDistance();
					if bestDist > dist then
						bestDist = dist;
						bestTarget = i;	
					end
				end
			end	
		end
	i, t = GetNextObject(i);
	end
if (bestTarget == nil) then
	_quest.message = "No quest targets in range!";
elseif (bestTarget ~= nil) then
bestTarget:AutoAttack();
end
return bestTarget;
end
