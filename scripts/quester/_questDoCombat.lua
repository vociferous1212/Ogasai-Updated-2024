_questDoCombat = {waitTimer = 0, blacklistTimer = GetTimeEX() * 2, targetingTimer = 0}

function _questDoCombat:doCombat()

	local localObj = GetLocalPlayer();

	if IsInCombat() and IsLooting() then
		LootTarget();
	end

	-- don't do anything if we are busy
	if IsChanneling() or IsCasting() then
		return;
	end

		

	-- flee combat
	if _quest.currentQuest ~= "Princess Must Die!" and PlayerHasTarget() and IsInCombat() then
		if PlayerMana() < 35 and grind2IsTargetingMe:target(GetTarget()) and PlayerHealth() >= 15 and IsInCombat() and (PlayerLevel() >= 6 or GetRealmName() == "Permadeath - EU") and ((GetTarget():GetHealthPercentage() > PlayerHealth() and PlayerHealth() <= 60) or (NumberTargetsAttackingPlayer() > 2) and PlayerHealth() <= 75) then
		
			local x, y z = 0, 0, 0;
			_quest.enemyTarget = nil;
	
			if not _quest.isQuestComplete then
				x, y, z = _quest.curQuestX, _quest.curQuestY, _quest.curQuestZ;
			else
				x, y, z = _questDB:getReturnTargetPos();
			end
			if x ~= 0 then
				if grind2MoveToTarget:run(localObj, x, y, z) then
					_quest.message = "Running out of combat";
					if HasSpell("Earthbind Totem") and not IsSpellOnCD("Earthbind Totem") then
						CastSpellByName("Earthbind Totem");
					end
					return true;
				end
			end
		return;
		end
	end



	-- run combat on good targets
	if (_quest.enemyTarget ~= nil and _quest.enemyTarget ~= 0) or IsInCombat() then

			script_expChecker:targetLevels();


	-- this was causing bot to do nothing but aqcuire new targets and not move to quest spots
		-- get a target if we have none
		--if (((not PlayerHasTarget() and _quest.enemyTarget == nil or _quest.enemyTarget == 0) or (PlayerHasTarget() and not GetTarget():CanAttack() and not GetTarget():IsDead())) and (_quest.grindSpotReached or IsInCombat())) then

		--	_quest.enemyTarget = _questDBTargets:getTarget();

		--end

		-- reset blacklist target timer
		if (PlayerHasTarget() and IsInCombat()) or (PlayerHasTarget() and GetTarget():IsDead()) or IsMoving() then
			self.blacklistTimer = GetTimeEX() + 10000;
		end


		_questDoCombat:clearTarget();
		


		-- move to target
		if _quest.enemeyTarget ~= nil and _quest.enemyTarget ~= 0 then
			
			if IsChanneling() or IsCasting() then
				self.blacklistTimer = GetTimeEX() + 10000;
			end

			if not IsMoving() and not IsInCombat() and _quest.enemyTarget ~= nil and GetTimeEX() > self.blacklistTimer then
				if not _questQuestTargets:isUnitQuestTarget(_quest.enemyTarget) then
					script_grind:addTargetToHardBlacklist(_quest.enemyTarget:GetGUID())
					DEFAULT_CHAT_FRAME:AddMessage("Cannot find a path to target and 10 seconds have passed... Automatically Blacklisting ".._quest.enemyTarget:GetUnitName()..", "..math.floor(_quest.enemyTarget:GetDistance()).." (yd), Time: "..GetTimeStamp().."");
					ClearTarget();
					_quest.enemyTarget = nil;
					self.blacklistTimer = GetTimeEX() + 10000;
				end
			end
			
		end
		

		
		if GetPet() ~= 0 and GetPet() ~= nil and GetPet():GetUnitsTarget() ~= nil and GetPet():GetUnitsTarget() ~= 0 and  GetTarget() ~= 0 and GetTarget() ~= nil then
			if GetPet():GetUnitsTarget():GetGUID() ~= GetTarget():GetGUID() then
				_quest.enemyTarget = GetPet():GetUnitsTarget();
			end
		end

		if _quest.enemyTarget ~= nil then
			if not _quest.enemyTarget:CanAttack() or _quest.enemyTarget:IsDead() then
				_quest.enemyTarget = nil;
			end
		end

		_questDoCombat:getLowestHealthTargetAttackingUs();

	

		-- do something
		if _quest.enemyTarget ~= nil and _quest.enemyTarget ~= 0 and PlayerHasTarget() then

			if not _quest.enemyTarget:IsDead() and _quest.enemyTarget:CanAttack() then

				if not IsMoving() then
					_quest.message = "Running Combat ".._quest.enemyTarget:GetUnitName()..", "..math.floor(_quest.enemyTarget:GetDistance()).." (yd)";
				end

				if IsInCombat() and not IsMoving() and _quest.enemyTarget:CanAttack() then

					if _quest.enemyTarget:GetDistance() <= script_grind.combatScriptRange then
						if _quest.enemyTarget ~= nil then
							if not _quest.enemyTarget:IsDead() then
								if not IsAutoCasting("Attack") then
									_quest.enemyTarget:AutoAttack();
								end
							end
						end
					end

				end

				if not _quest.enemyTarget:CanAttack() or (_quest.enemyTarget:IsTapped() and not _quest.enemyTarget:IsTappedByMe() and not script_grind:isTargetingMe(_quest.enemyTarget:GetGUID()) or _quest.enemyTarget:IsDead()) then
					_quest.enemyTarget = nil;
				end
			
				

				if not IsMoving() and not IsInCombat() and _quest.enemyTarget ~= nil and GetTimeEX() > self.blacklistTimer then
					if not _questQuestTargets:isUnitQuestTarget(_quest.enemyTarget) then
						script_grind:addTargetToHardBlacklist(_quest.enemyTarget:GetGUID())
						DEFAULT_CHAT_FRAME:AddMessage("Cannot find a path to target and 10 seconds have passed... Automatically Blacklisting ".._quest.enemyTarget:GetUnitName()..", "..math.floor(_quest.enemyTarget:GetDistance()).." (yd), Time: "..GetTimeStamp().."");
						ClearTarget();
						_quest.enemyTarget = nil;
						self.blacklistTimer = GetTimeEX() + 10000;
					return true;
					end
				end

					-- stop moving if we have reached a target
			if IsInCombat() and PlayerHasTarget() and not IsSpellOnCD("Disengage") and not IsSpellOnCD("Frost Nova") then
				if GetTarget():GetDistance() <= 1.5 and not GetTarget():IsFleeing() and not GetTarget():IsDead() and PlayerHealth() > 80 then
					if GetTarget():GetDistance() > .5 then
						if GetTarget():GetHealthPercentage() >= 20 then
							if IsMoving() then
								StopMoving();
								script_grind.combatError = nil;
								return false;
							end
						end
					end
				end
			end

			if _quest.enemyTarget:IsFleeing() and _quest.enemyTarget:GetDistance() > .5 then

				script_grind.combatError = 3;
			end
				
		

		
				
			script_grind.combatError = RunCombatScript(_quest.enemyTarget:GetGUID());

			script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);

			if _quest.enemyTarget ~= nil and _quest.enemyTarget ~= 0 then
				local x, y, z = _quest.enemyTarget:GetPosition();
				if x ~= 0 and ((script_grind.combatError == 3 and _quest.enemyTarget:GetDistance() >= script_grind.combatScriptRange) or (_quest.enemyTarget:GetDistance() > script_grind.combatScriptRange or not _quest.enemyTarget:IsInLineOfSight())) and _quest.enemyTarget:GetDistance() > 2 then
					grind2MoveToTarget:run(GetLocalPlayer(), x, y, z);
				return false;
				end

				
				if _quest.enemyTarget:IsFleeing() and _quest.enemyTarget:GetDistance() > script_grind.combatScriptRange and not IsMoving() then
					Move(x, y, z);
				end
			end
			return;
			end
		end
	end
return false;
end

-- get the lowest health target in combat with us
function _questDoCombat:getLowestHealthTargetAttackingUs()
	local bestTarget = nil;
	local i, t = GetFirstObject();
	while i ~= 0 do
		if t == 3 and not i:IsCritter() and not i:IsDead() and i:GetHealthPercentage() >= 1 and i:CanAttack() and script_grind:isTargetingMe(i) and script_grind:enemiesAttackingUs() > 1 and _quest.enemyTarget ~= 0 and _quest.enemyTarget ~= nil and not _quest.enemyTarget:IsDead() then
			local hp = _quest.enemyTarget:GetHealthPercentage();
			local ihp = i:GetHealthPercentage();
			if ihp < hp then
				_quest.enemyTarget = i;
				bestTarget = i;
			end
		end
	i, t = GetNextObject(i);
	end
return bestTarget;
end

function _questDoCombat:clearTarget()

-- if target is a quest target then count +1
		if _quest.currentQuest ~= 0 and _quest.enemyTarget ~= nil then
			for i=0, _questDB.numQuests -1 do
				if _quest.currentQuest == _questDB.questList[i]['questName'] then
					if _quest.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName']
						or _quest.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName2']
						or _quest.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName3'] then
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

			-- clear dead targets tapped killed counter
	if (_questDoCombat.enemyTarget ~= 0 and _questDoCombat.enemyTarget ~= nil and _questDoCombat.enemyTarget:IsDead()) or (PlayerHasTarget() and GetTarget():IsDead()) then
		if _questDoCombat.enemyTarget ~= nil and _questDoCombat.enemyTarget ~= 0 then
			script_grind.monsterKillCount = script_grind.monsterKillCount + 1;
			grind2SaveCoordinates:saveTargetsLocation(_questDoCombat.enemyTarget);
			if not IsAnyTargetTargetingPlayer() and not IsInCombat() then
				_quest.waitTimer = GetTimeEX() + 750;
			end
		end
		_questDoCombat.enemyTarget = nil;
		ClearTarget();
	end
end