_questDBReturnQuest = {waitTimer = 0}

function _questDBReturnQuest:returnAQuest()

	if (not _questDB.isSetup) then
		_questDB:setup();
	end
	local px, py, pz = GetLocalPlayer():GetPosition();
	local x, y, z = 0, 0, 0;

	if (self.waitTimer > GetTimeEX()) then
		return;
	end

	-- return a quest
	if (_quest.currentQuest ~= nil and _questDB.curListQuest ~= nil) then

	local xp = UnitXP("player");

		-- if get type == 0 and we can return a quest without doing anything then move to quest return target
		for i=0, _questDB.numQuests -1 do
			if _quest.currentQuest == _questDB.questList[i]['questName'] then

				if _questDB.questList[i]['type'] == 0 then
					x, y, z = _questDB:getReturnTargetPos();
				end

				if _questDB.questList[i]['type'] == 1 then
					if _quest.isQuestComplete then	
						x, y, z = _questDB:getReturnTargetPos();
					end
				end
			end
		end

		if (GetDistance3D(px, py, pz, x, y, z) <= 4) and (_quest.isQuestComplete) then

			_quest.grindSpotReached = false;
			_quest.targetKilledNum = 0;
			_quest.targetKilledNum2 = 0;
			_quest.gatheredNum = 0;
			_quest.gatheredNum2 = 0;
			
			_quest.message = "Completing Quest";

			local name = _questDB:getReturnTargetName();
			if (GetTarget() == nil or GetTarget() == 0) or (GetTarget() ~= 0 and GetTarget() ~= nil and GetTarget():GetUnitName() ~= name) then
				TargetByName(name);
				name = GetTarget();
			end
			if (GetTarget() ~= 0 and GetTarget() ~= nil) and not IsMoving() then
					_quest.waitTimer = GetTimeEX() + 2000;
				if not IsMoving() and (GetTarget():UnitInteract()) then
					
					self.waitTimer = GetTimeEX() + 5000;

						CompleteQuest();
						SelectGossipActiveQuest(1)

					--for i=0, 5 do
						--if curQuestName == GetGossipAvailableQuests() then
						--	test = i;
						--end
					--end
					
						local rewardNum = 0;
						for i=0, _questDB.numQuests -1 do
							if _questDB.questList[i]['completed'] == "no" then
								--GetNumQuestChoices();
								if _quest.currentQuest == _questDB.questList[i]['questName'] then
									rewardNum = _questDB.questList[i]['rewardNum'];
								end
							end
						end
					
						if (GetQuestReward(rewardNum)) then
							GetQuestReward(QuestFrameRewardPanel, rewardNum);
							self.waitTimer = GetTimeEX() + 2000;	
						else
							_questDB:turnQuestCompleted()

							
							_quest.isQuestComplete = false;
							_quest.currentQuest = nil;
							_questDB.curListQuest = nil;
						end
					
				end
			end
		return true;
		end
		if (x ~= 0) and (GetDistance3D(px, py, pz, x, y, z) > 4) then
			if (not IsInCombat()) and PlayerHasTarget() then
				ClearTarget();
			end
			_quest.message = "Moving to quest return target";
			script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);
			return true;
		end
	return true;
	end
return false;	
end


--frame:RegisterEvent("QUEST_TURNED_IN") 
--frame:SetScript("OnEvent", handlerFunc). To unregister an event,
--use frame:UnregisterEvent("eventName").