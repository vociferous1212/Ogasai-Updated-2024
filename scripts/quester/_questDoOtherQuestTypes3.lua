_questDoOtherQuestTypes3 = {}

function _questDoOtherQuestTypes3:run()


	local px, py, pz = GetLocalPlayer():GetPosition();
	
	local distToGiver = GetDistance3D(px, py, pz, _quest.curQuestX, _quest.curQuestY, _quest.curQuestZ);

	local distToGrind = GetDistance3D(px, py, pz, _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);


	-- type 11 explore quest go to specific spot and that's it. 
	if _quest.currentType == 11 and not IsInCombat() and (_quest.curGrindX ~= 0) and not _quest.isQuestComplete and not IsLooting() then
		if distToGrind > 10 and not _quest.isQuestComplete then
			script_navEX:moveToTarget(GetLocalPlayer(), _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);
			return true;
		end end

	-- type 12 use an item and kill a specific target
	if _quest.currentType == 12 and not IsInCombat() and (_quest.curGrindX ~= 0) and not _quest.isQuestComplete and not IsLooting() then
		if HasItem(_quest.usingItem) and dist > 10 then
			script_navEX:moveToTarget(GetLocalPlayer(), _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);
		end
		if distToGrind <= 10 and HasItem(_quest.usingItem) then
			UseItem(_quest.usingItem);
		end
		local i, t = GetFirstObject();
		while i ~= 0 do
			if t == 3 then
				if not i:IsDead() and i:GetUnitName() == _questDBTargets.target then
					_quest.enemyTarget = i;
				end
			end
		i, t = GetNextObject(i);
		end
	end
		
return false;
end