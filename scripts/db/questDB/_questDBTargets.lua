_questDBTargets = {targetKilledTable = {}, targetKilledTableNum = 0}
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
	end end end
return false;
end
function _questDBTargets:getTarget()
local target = 0; local target2 = 0; local numKill = 0; local numKill2 = 0; local i, t = GetFirstObject(); local dist = 0; local bestDist = 1000; local bestTarget = nil;
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
			if not i:IsDead() and not script_grind:isTargetHardBlacklisted(i:GetGUID()) and ((i:GetUnitName() == target and _quest.targetKilledNum < numKill) or (i:GetUnitName() == target2 and _quest.targetKilledNum2 < numKill2) or (i:GetUnitName() == target3 and _quest.targetKilledNum3 < numKill3)) then
				dist = i:GetDistance();
				if bestDist > dist then
					bestDist = dist;
					bestTarget = i;
					weHaveQuestTarget = true;
				end
			end
			if (not weHaveQuestTarget) then
					local aggro = i:GetLevel() - GetLocalPlayer():GetLevel() + 25;
				if not script_grind:isTargetHardBlacklisted(i:GetGUID()) and not i:IsCritter() and not i:IsDead() and i:CanAttack() and i:GetDistance() <= aggro then
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
	if bestTarget == nil then _quest.message = "No quest targets in range!"; if _quest.currentType == 2 and not _quest.needRest then script_navEX:moveToTarget(GetLocalPlayer(), _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ); end

elseif bestTarget ~= nil then bestTarget:AutoAttack(); end return bestTarget; end

-- get a target attacking us returns a currentObj:GetGUID()
function _questDBTargets:getTargetAttackingUs() 

	local i, t = GetFirstObject(); 

	-- run object manager
	while i ~= 0 do 
		
		-- NPC type 3
    		if t == 3 then
	
			-- acceptable targets
			if (i:CanAttack() and not i:IsDead()) and (i:IsInLineOfSight()) and (not i:IsCritter()) then

			local localObj = GetLocalPlayer();

			-- get targets target - target of target
			local targetTarget = i:GetUnitsTarget();

				-- target has a target and distance less than 50 (limit object manager by distance)
				if (targetTarget ~= 0 and targetTarget ~= nil) and (i:GetDistance() < 50) then

					-- if target is targeting me then
					if (targetTarget:GetGUID() == localObj:GetGUID()) then
	
						-- return target
						return i;
					end
				end	

            		end 
       		end

	-- get next target
	i, t = GetNextObject(i); 
	end

-- return nil if no target
return nil;
end