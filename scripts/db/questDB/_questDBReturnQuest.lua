_questDBReturnQuest = {waitTimer = 0}

function _questDBReturnQuest:returnAQuest()

	local id = _questDBReturnQuest:getReturnTargetID();


	if (not _questDB.isSetup) then
		_questDB:setup();
	end

	local px, py, pz = GetLocalPlayer():GetPosition();
	local x, y, z = 0, 0, 0;

	-- return a quest
	if (_quest.currentQuest ~= nil and _questDB.curListQuest ~= nil) and _quest.isQuestComplete then

		-- if get type == 0 and we can return a quest without doing anything then move to quest return target
		for i=0, _questDB.numQuests -1 do
			if _quest.currentQuest == _questDB.questList[i]['questName'] then
				--if _quest.currentDesc == _questDB.questList[i]['desc'] then
				--	x, y, z = _questDB:getReturnTargetPos();
				--end
				--if _quest.currentDesc == nil and _questDB.questList[i]['desc'] ~= nil then

		
		x, y, z = _questDB:getReturnTargetPos();

				--end
			end
		end
		if id ~= nil then
			if _questDBReturnQuest:getReturnTargetID():GetDistance() <= 10 then
			x, y, z = _questDBReturnQuest:getReturnTargetID():GetPosition();
			end
		end

		-- set return target name
		local name = _questDB:getReturnTargetName();

		if GetTarget() ~= 0 and GetTarget() ~= nil then

			-- if target is quest return target
			if GetTarget():GetUnitName() == name then

				-- chase moving quest targets... get their position again
				x, y, z = GetTarget():GetPosition();

			end
		end


		if (GetDistance3D(px, py, pz, x, y, z) <= 4) and (_quest.isQuestComplete) then

				-- set return target name
				local name = _questDB:getReturnTargetName();
	
				if GetTarget() ~= 0 and GetTarget() ~= nil then
	
					-- if target is quest return target
					if GetTarget():GetUnitName() == name then
	
						-- chase moving quest targets... get their position again
						x, y, z = GetTarget():GetPosition();
	
					end
				end
			
			if (self.waitTimer > GetTimeEX()) then
				return;
			end

			_quest.grindSpotReached = false;
			_quest.targetKilledNum = 0;
			_quest.targetKilledNum2 = 0;
			_quest.targetKilledNum3 = 0;
			_quest.gatheredNum = 0;
			_quest.gatheredNum2 = 0;
			_quest.currentType = 0;
			
			_quest.message = "Completing Quest";

			local name = _questDB:getReturnTargetName();
			local id = _questDBReturnQuest:getReturnTargetID();
			if id == nil and (GetTarget() == nil or GetTarget() == 0) or (GetTarget() ~= 0 and GetTarget() ~= nil and GetTarget():GetUnitName() ~= name) then
				TargetByName(name);
				name = GetTarget();
			end
			if ((GetTarget() ~= 0 and GetTarget() ~= nil) or id ~= nil) and not IsMoving() then
					_quest.waitTimer = GetTimeEX() + 2000;
				if not IsMoving() and ((id ~= nil and id:GameObjectInteract()) or (GetTarget():UnitInteract())) then

					_quest.weCompletedQuest = true;
					
					self.waitTimer = GetTimeEX() + 2000;

						CompleteQuest();
						SelectGossipActiveQuest(1);
						--SelectActiveQuest(1);

						

					--for i=0, 5 do
						--if curQuestName == GetGossipAvailableQuests() then
						--	test = i;
						--end
					--end
					
						local rewardNum = 0;
						local rewardNumRandom = 0;
						for i=0, _questDB.numQuests -1 do
							if _questDB.questList[i]['completed'] == "no" then
								--GetNumQuestChoices();
								if _quest.currentQuest == _questDB.questList[i]['questName'] then
									rewardNum = _questDB.questList[i]['rewardNum'];
									rewardNumRandom = _questDB.questList[i]['rewardNum'];
								end
							end
						end
							
						if rewardNum > 0 then
							rewardNum = math.random(1, rewardNumRandom);
						end
						
						if (not GetQuestReward(rewardNum)) then
							SelectActiveQuest(1);
							self.waitTimer = GetTimeEX() + 2000;
							GetQuestReward(rewardNum)
							GetQuestReward(QuestFrameRewardPanel, rewardNum);
							CompleteQuest();
							--ClearTarget();
						end
					return true;	
					end
			return true;
			end
		elseif (x ~= 0) and (GetDistance3D(px, py, pz, x, y, z) > 4) and ((script_grind.lootObj == nil or script_grind.skipLooting) or (script_grind.lootObj ~= nil and script_grind:isTargetLootBlacklisted(script_grind.lootObj:GetGUID()))) then
			local name = _questDB:getReturnTargetName();
			if (not IsInCombat()) and PlayerHasTarget() and GetTarget():GetUnitName() ~= name then
				ClearTarget();
			end
			_quest.message = "Moving to quest return target";
			--if (GetDistance3D(px, py, pz, x, y, z) < 25) then
				script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);
			--else
				--script_runner:run(x, y, z)
			--end
			if not IsMoving() then Move(x, y, z); end
		return;
		end
	return true;
	end
return false;	
end

function _questDBReturnQuest:getReturnTargetID()

	local id = nil;

	for i=0, _questDB.numQuests -1 do

		if _questDB.questList[i]['completed'] == "no" then

			if _questDB.questList[i]['questName'] ~= "nil" then

				if _questDB.questList[i]['questName'] == _questDB.curListQuest then
				
					if _questDB.questList[i]['desc'] == _questDB.curDesc then
						id = _questDB.questList[i]['returnTarget'];
					end
				end
			end
		end
	end

	local i, t = GetFirstObject();
	while i ~= 0 do
		if id == i:GetObjectDisplayID() then
			return i;
		end
	i, t = GetNextObject(i);
	end

return nil;
end