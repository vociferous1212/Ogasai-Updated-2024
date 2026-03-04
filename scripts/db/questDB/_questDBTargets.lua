_questDBTargets = {
	
	targetKilledTable = {},
	targetKilledTableNum = 0,
	target = 0,
	target2 = 0,
	target3 = 0,
	numKill = 0,
	numKill2 = 0,
	numKill3 = 0,

}

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

function _questDBTargets:isItTapped()
	local i, t = GetFirstObject()
	while i ~= 0 do

	if t == 3 then
		if i:GetDistance() <= 50 then
			if i:GetUnitsTarget() ~= nil and i:GetUnitsTarget() ~= 0 then
				if i:GetUnitsTarget():GetGUID() ~= GetLocalPlayer():GetGUID() then
					return true;
				end
			end
		end
	end
	i, t = GetNextObject(i);
	end
return false;
end

function _questDBTargets:getTarget()

	local bestDist = 1000;
	local bestTarget = nil;




	if IsInCombat() then
		local bestHealth = 100;
		local i, t = GetFirstObject();
		while i ~= 0 do
			if t == 3 then
				if i:GetUnitsTarget() ~= nil and i:GetUnitsTarget() ~= 0 then
					if i:GetUnitsTarget():GetGUID() == Player():GetGUID() or i:IsTappedByMe() then

						hp = i:GetHealthPercentage();

						if bestHealth > hp then

							bestHealth = hp;
								
							bestTarget = i;
						end
					end
				end
			end
		i, t = GetNextObject(i);
		end
	return bestTarget;
	end

	-- get a quest target
	local i, t = GetFirstObject();
	local haveQuestTarget = false;
	while i ~= 0 do
		if t == 3 then
			if (not i:IsTapped() or i:IsTappedByMe()) and not i:IsDead() and i:CanAttack() and self.target ~= 0 then
				if not script_grind:isTargetHardBlacklisted(i:GetGUID())
				and (not grind2SafePull:targetHasAdds(i) or _questQuestTargets:isUnitQuestTarget(i)) then
					if (i:GetUnitName() == self.target and (_quest.targetKilledNum < self.numKill or numKill == 0))
					or (i:GetUnitName() == self.target2 and (_quest.targetKilledNum2 < self.numKill2 or numKill == 0))
					or (i:GetUnitName() == self.target3 and (_quest.targetKilledNum3 < self.numKill3 or numKill == 0))
					or i:IsTappedByMe() or grind2IsTargetingMe:target(i) then

						if grind2IsTargetingMe:target(i) then
							return i;
						end

						local dist = i:GetDistance();

						if bestDist > dist then

							bestDist = dist;

							bestTarget = i;

							haveQuestTarget = true;

						end

					end
				end
			end
		end
	i, t = GetNextObject(i);
	end

	if not IsInCombat() and haveQuestTarget then
		return bestTarget;
	end

	if (_quest.grindSpotReached and not haveQuestTarget) or (IsInCombat() and isAnyTargetTargetingPlayer() and not haveQuestTarget) then
		local i, t = GetFirstObject();
		while i ~= 0 do
			if t == 3 and i:GetDistance() <= 200 then
				if not script_grind:isTargetHardBlacklisted(i:GetGUID()) then

					if (not i:IsTapped() or i:IsTappedByMe()) and not i:IsDead() and not i:IsCritter() and i:CanAttack() and (not grind2SafePull:targetHasAdds(i) or _questQuestTargets:isUnitQuestTarget(i)) then
					
						if grind2IsTargetingMe:target(i) then
							return i;
						end

						local dist = i:GetDistance();

						if bestDist > dist then

							bestDist = dist;

							bestTarget = i;

						end
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end

	--_quest.currentType == 2 and
	if bestTarget == nil then
		_quest.message = "No quest targets in range!";
		_quest.grindSpotReached = false;
	end

return bestTarget;
end

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
	
						_quest.enemyTarget = i;
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

function _questDBTargets:killStuffAroundUs()
	--not _quest.isQuestComplete and
	if (not IsInCombat() and _quest.enemyTarget == nil) or (IsInCombat()) or (GetPet() ~= nil and GetPet() ~= 0 and GetPet():GetUnitsTarget() ~= nil and GetPet():GetUnitsTarget() ~= 0) then
		local i, t = GetFirstObject();
		while i ~= 0 do
			if t == 3 and i:GetDistance() <= 38 then
				local aggro = i:GetLevel() - GetLocalPlayer():GetLevel() + 22.5;
				if GetMyClass() == "HUNTER" then
					aggro = i:GetLevel() - GetLocalPlayer():GetLevel() + 30.5;
				end
				if not i:IsCritter() and not i:IsDead() and i:CanAttack() and i:GetDistance() <= aggro and i:IsInLineOfSight() then
					if ((script_grindValidEnemy:enemyIsValid(i) and (script_aggro:safePull(i) or script_aggro:safePullRecheck(i))) or script_grind:isTargetingMe(i)) then
						_quest.enemyTarget = i;
						i:AutoAttack();
						i:FaceTarget();
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end
end

function _questDBTargets:isAnyQuestTargetInRange()

	_questDBTargets:setTargets();

	local i, t = GetFirstObject()
	
	while i ~= 0 do
		if t == 3 then
			if (self.target ~= nil and self.target ~= 0 and i:GetUnitName() == self.target)
			or (self.target2 ~= nil and self.target2 ~= 0 and i:GetUnitName() == self.target2)
			or (self.target3 ~= nil and self.target3 ~= 0 and i:GetUnitName() == self.target3) then
				return true;
			end
		end
	i, t = GetNextObject(i);
	end

return false;
end

function _questDBTargets:setTargets()

-- get targets to kill and number of targets to kill for each quest we are on
	if _questDB.curListQuest ~= nil then 
		for i=0, _questDB.numQuests -1 do
			if _questDB.questList[i]['completed'] == "no" then
				if _questDB.questList[i]['questName'] ~= "nnil" then
					if _questDB.questList[i]['questName'] == _questDB.curListQuest then
						if _questDB.questList[i]['desc'] == _quest.currentDesc then
							if self.target ~= _questDB.questList[i]['targetName'] then
								self.target = _questDB.questList[i]['targetName'];
								self.target2 = _questDB.questList[i]['targetName2'];
								self.target3 = _questDB.questList[i]['targetName3'];
								self.numKill = _questDB.questList[i]['numKill'];
								self.numKill2 = _questDB.questList[i]['numKill2'];
								self.numKill3 = _questDB.questList[i]['numKill3'];
							end
						end
					end
				end
			end
		end
	end
end