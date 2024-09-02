_questDoCombat = {}

function _questDoCombat:doCombat()
-- run combat on good targets
	if (_quest.enemyTarget ~= nil and _quest.enemyTarget ~= 0) or (IsInCombat()) then
		-- get a target if we have none
		if (PlayerHasTarget()) then
			_quest.enemyTarget = GetTarget();
		end
		if IsInCombat() and (_quest.enemyTarget ~= nil or _quest.enemyTarget == nil) then
			if (_quest.enemyTarget ~= nil) and (_questEX:getTargetAttackingUs() ~= nil) then
				if (_questEX:getTargetAttackingUs() ~= _quest.enemyTarget:GetGUID()) then
					_quest.enemyTarget = _questEX:getTargetAttackingUs();
				end
			elseif (_quest.enemyTarget == nil) then
				_quest.enemyTarget = _questEX:getTargetAttackingUs();
			end
		end
		-- if target is a quest target then count +1
		if _quest.currentQuest ~= 0 and _quest.enemyTarget ~= nil then
			for i=0, _questDB.numQuests -1 do
				if _quest.currentQuest == _questDB.questList[i]['questName'] then
					if _quest.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName'] or _quest.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName2'] then
						if _quest.enemyTarget:IsDead() and not _questDBTargets:isTargetAddedToKilledTable(_quest.enemyTarget:GetGUID()) then
							if _quest.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName'] then
								_questDBTargets:addTargetToKilledTable(_quest.enemyTarget:GetGUID());
								_quest.targetKilledNum = _quest.targetKilledNum + 1;
							end
							if _quest.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName2'] then
								_questDBTargets:addTargetToKilledTable(_quest.enemyTarget:GetGUID());
								_quest.targetKilledNum2 = _quest.targetKilledNum2 + 1;
							end
							if _quest.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName3'] then
								_questDBTargets:addTargetToKilledTable(_quest.enemyTarget:GetGUID());
								_quest.targetKilledNum3 = _quest.targetKilledNum3 + 1;
							end

						end
					end
				end
			end
		end
		-- if target is dead then clear enemytarget var
		if (_quest.enemyTarget ~= nil and _quest.enemyTarget ~= 0) and (_quest.enemyTarget:IsDead()) then
			local x, y, z = _quest.enemyTarget:GetPosition();
			if (_quest.enemyTarget:GetDistance() > 4) then
				script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);
				return;
			else
				_quest.enemyTarget = nil;
			end
		end
		
		-- do something
		if _quest.enemyTarget ~= nil and _quest.enemyTarget ~= 0 then
			if not _quest.enemyTarget:IsDead() and _quest.enemyTarget:CanAttack() then
				_quest.message = "Running Combat";
				RunCombatScript(_quest.enemyTarget:GetGUID());
				_quest.currentDebugStatus = "Running combat script";
				-- move to target
				if (_quest.enemyTarget ~= nil and _quest.enemyTarget:GetDistance() > script_grind.combatScriptRange) or (not _quest.enemyTarget:IsInLineOfSight()) then
					local x, y, z = _quest.enemyTarget:GetPosition();
					script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);
					_quest.currentDebugStatus = "Moving to target";
				return true;
				end
			end
		end
	
	end
end