_questDBGatherGetObject = {}

function _questDBGatherGetObject:getObject()

	local bestDist = 1000;
	local bestTarget = nil;

	if _quest.currentQuest ~= nil then

		for i=0, _questDB.numQuests -1 do

			if _questDB.questList[i]['desc'] == _quest.currentDesc then

				self.gatherTarget = _questDB.questList[i]['gatherID'];

				self.gatherTarget2 = _questDB.questList[i]['gatherID2'];

				self.gatherNum = _questDB.questList[i]['numGather'];

				self.gatherNum2 = _questDB.questList[i]['numGather2'];

			end
		end
	
 		_questDBGatherGetInventory:getItemsInInventory()

		local i, t = GetFirstObject();			
		
		while i ~= 0 do

			if t == 5 then

				if (self.gatherTarget == i:GetObjectDisplayID() and _quest.gatheredNum < self.gatherNum) or (self.gatherTarget2 == i:GetObjectDisplayID() and _quest.gatheredNum2 < self.gatherNum2) and script_gather:isNodeSafeToGather(i) then

					if self.gatherTarget == i:GetObjectDisplayID() then

						self.gatheringTargetName = i:GetUnitName();

					elseif self.gatherTarget2 == i:GetObjectDisplayID() then

						self.gatheringTargetName2 = i:GetUnitName();

					end

					local dist = i:GetDistance();
					if bestDist > dist then
						bestDist = dist;
						bestTarget = i;
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end
return bestTarget;
end
