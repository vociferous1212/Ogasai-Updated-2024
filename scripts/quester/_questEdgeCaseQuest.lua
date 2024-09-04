_questEdgeCaseQuest = {table = {}, num = 0, targetReached = false,}

function _questEdgeCaseQuest:addToBlacklist(target)
	if target ~= nil and target ~= 0 and target ~= "" then
		self.table[self.num] = target;
		self.num = self.num + 1;
	end
end
	
function _questEdgeCaseQuest:isBlacklistedTarget(target)
	for i=0, self.num do
		if target ~= nil and target ~= 0 and target ~= "" then
			if target == self.table[i] then
				return true;
			end
		end
	end
return false;
end

function _questEdgeCaseQuest:run()

	local title = nil; local isComplete = 0;

	for i=0, _questDB.numQuests -1 do
		if _questDB.questList[i]['questName'] == _questDB.curListQuest then _quest.currentQuest = _questDB.questList[i]['questName'] end end
	for i=0, GetNumQuestLogEntries()  do
		title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(i);
	end
		if isComplete == 1 then
			_quest.isQuestComplete = true;

			return false;
		end
	if isComplete ~= 1 and title == "Lazy Peons" then

			local i, t = GetFirstObject();
			local target = nil;
			local dist = nil;
			local bestDist = 1000;
				while i ~= 0 do
					if t == 3 then
						if i:GetUnitName() == "Lazy Peon" then
							if not _questEdgeCaseQuest:isBlacklistedTarget(i:GetGUID()) then
								dist = i:GetDistance();
								if bestDist > dist then
									bestDist = dist;
								end
								if bestDist <= dist then
									target = i;
								end
							end
						end
					end
				i, t = GetNextObject(i);
				end
			if target ~= nil then
				local dist = target:GetDistance();
				if dist > 3 then
					local x, y, z = target:GetPosition();
					script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);
					if GetTarget() == 0 or GetTarget() == nil then
						target:AutoAttack();
					elseif GetTarget() ~= 0 and GetTarget() ~= nil then
						if GetTarget():GetGUID() ~= target:GetGUID() then
							ClearTarget();
						end
					end
				elseif dist <= 3 and not IsMoving() then
					if PlayerHasTarget() then
					UseItem("Foreman's Blackjack")
						_questEdgeCaseQuest:addToBlacklist(target:GetGUID())
						_quest.waitTimer = GetTimeEX() + 4000;
					end
				return true;
				end

			elseif target == nil then
				local x, y, z = GetLocalPlayer():GetPosition();
				if GetDistance3D(x, y, z, -236.66152954102, -4433.4741210938, 63.312015533447) <= 10 then	
					self.targetReached = true;
				elseif not self.targetReached then		
					script_navEX:moveToTarget(GetLocalPlayer(), -236.66152954102, -4433.4741210938, 63.312015533447);
				end
				if self.targetReached then
					if GetDistance3D(x, y, z, -737.55145263672, -4168.05859375, 30.284696578979) <= 10 then
						self.targetReached = false;
					end
					script_navEX:moveToTarget(GetLocalPlayer(), -737.55145263672, -4168.05859375, 30.284696578979);
				end

			end
	return true;
	end
return false;
end