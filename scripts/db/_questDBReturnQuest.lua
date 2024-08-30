_questDBReturnQuest = {}

function _questDBReturnQuest:returnAQuest()

	local px, py, pz = GetLocalPlayer():GetPosition();
	local x, y, z = 0, 0, 0;

	-- return a quest
	if (_quest.currentQuest ~= nil) then

		-- if get type == 0 and we can return a quest without doing anything then move to quest return target
		for i=0, _questDB.numQuests -1 do
			if _quest.currentQuest == _questDB.questList[i]['questName'] then
				if _questDB.questList[i]['type'] == 0 then
					x, y, z = _questDB:getReturnTargetPos();
				end
				if _quest.currentQuest == _questDB.questList[i]['questName'] then
					if _questDB.questList[i]['type'] == 1 then
						if _quest.isQuestComplete then	
							x, y, z = _questDB:getReturnTargetPos();
						end
					end
				end
			end
		end
		if (GetDistance3D(px, py, pz, x, y, z) <= 4) then
			local xp = UnitXP("player");
			_quest.message = "Completing Quest";
			local name = _questDB:getReturnTargetName();
			TargetByName(name);
			name = GetTarget();
			if (GetTarget():UnitInteract()) then

				_quest.waitTimer = GetTimeEX() + 2000;
				--for i=0, 5 do
					--if curQuestName == GetGossipAvailableQuests() then
					--	test = i;
					--end
				--end

				SelectGossipActiveQuest(1);

				_quest.waitTimer = GetTimeEX() + 2000;

				if (not GetQuestReward()) then
					GetQuestReward();
GetQuestReward(1);
				_quest.waitTimer = GetTimeEX() + 2000;


				end
				if xp ~= UnitXP("player") then
					_questDB:turnQuestCompleted();
				end

			return true;	
			end
		return true;
		end
		if (x ~= 0) and (GetDistance3D(px, py, pz, x, y, z) > 4) then
			_quest.message = "Moving to quest return target";
			script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);
			return true;
		end
	end
return false;	
end