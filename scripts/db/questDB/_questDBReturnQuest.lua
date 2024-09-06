_questDBReturnQuest = {waitTimer = 0}

function _questDBReturnQuest:returnAQuest()

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
			if (GetTarget() == nil or GetTarget() == 0) or (GetTarget() ~= 0 and GetTarget() ~= nil and GetTarget():GetUnitName() ~= name) then
				TargetByName(name);
				name = GetTarget();
			end
			if (GetTarget() ~= 0 and GetTarget() ~= nil) and not IsMoving() then
					_quest.waitTimer = GetTimeEX() + 2000;
				if not IsMoving() and (GetTarget():UnitInteract()) then

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
						for i=0, _questDB.numQuests -1 do
							if _questDB.questList[i]['completed'] == "no" then
								--GetNumQuestChoices();
								if _quest.currentQuest == _questDB.questList[i]['questName'] then
									rewardNum = _questDB.questList[i]['rewardNum'];
								end
							end
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
		elseif (x ~= 0) and (GetDistance3D(px, py, pz, x, y, z) > 4) and (script_grind.lootObj == nil or script_grind.skipLooting) then
			if (not IsInCombat()) and PlayerHasTarget() then
				ClearTarget();
			end
			_quest.message = "Moving to quest return target";
			script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);
			if not IsMoving() then Move(x, y, z); end
		return;
		end
	return true;
	end
return false;	
end


--frame:RegisterEvent("QUEST_TURNED_IN") 
--frame:SetScript("OnEvent", handlerFunc). To unregister an event,
--use frame:UnregisterEvent("eventName").