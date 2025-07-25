_questDBGatherGetObject = {}

function _questDBGatherGetObject:getObject()

	local bestDist = 1000;
	local bestTarget = nil;

	if _quest.currentQuest ~= nil then

		for i=0, _questDB.numQuests -1 do

			if _questDB.questList[i]['desc'] == _quest.currentDesc then

				_questDBGather.gatherTarget = _questDB.questList[i]['gatherID'];

				_questDBGather.gatherTarget2 = _questDB.questList[i]['gatherID2'];

				_questDBGather.gatherNum = _questDB.questList[i]['numGather'];

				_questDBGather.gatherNum2 = _questDB.questList[i]['numGather2'];

			end
		end
	
 		_questDBGatherGetInventory:getItemsInInventory()

		local i, t = GetFirstObject();			
		
		while i ~= 0 do

			if t == 5 then

				if not _questDBGather:isNodeBlacklisted(i:GetGUID()) and (_questDBGather.gatherTarget == i:GetObjectDisplayID() and _quest.gatheredNum < _questDBGather.gatherNum) or (_questDBGather.gatherTarget2 == i:GetObjectDisplayID() and _quest.gatheredNum2 < _questDBGather.gatherNum2) and script_gatherEX2:isNodeSafeToGather(i) then

					if _questDBGather.gatherTarget == i:GetObjectDisplayID() then

						_questDBGather.gatheringTargetName = i:GetUnitName();

					elseif _questDBGather.gatherTarget2 == i:GetObjectDisplayID() then

						_questDBGather.gatheringTargetName2 = i:GetUnitName();

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
