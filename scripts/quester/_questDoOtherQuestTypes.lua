_questDoOtherQuestTypes = {}

function _questDoOtherQuestTypes()

	local px, py, pz = GetLocalPlayer():GetPosition();

	local distToGiver = GetDistance3D(px, py, pz, _quest.curQuestX, _quest.curQuestY, _quest.curQuestZ);

	local distToGrind = GetDistance3D(px, py, pz, _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);

	if _quest.currentType == 3 and not IsInCombat() and (_quest.curGrindX ~= 0) and not _quest.isQuestComplete and not IsLooting() then

		_quest.message = "Type quest == 3";

		if not HasItem(_quest.usingItem) then _quest.message = "No quest item to use!"; end
		if distToGrind <= 5 and not IsMoving() and not IsChanneling() and not IsCasting() and not IsInCombat() and HasItem(_quest.usingItem) then

			
			UseItem(_quest.usingItem)

			_quest.isQuestComplete = true;

		return true;
		elseif distToGrind > 5 then
		
			script_navEX:moveToTarget(GetLocalPlayer(), _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);
			
				
			if not IsMoving() then

				Move(_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ);

			end

		return true;
		end	
	end

	if _quest.currentType == 4 and not IsInCombat() and (_quest.curGrindX ~= 0) and not _quest.isQuestComplete and not IsLooting() then

		_quest.message = "Type quest == 4";

		-- use item position

		local x, y, z = _quest.curQuestX, _quest.curQuestY, _quest.curQuestZ;

		if GetDistance3D(px, py, pz, x, y, z) < 10 and HasItem(_quest.usingItem) then

			UseItem(_quest.usingItem)

			--return true;

		return true;
		elseif distToGrind > 5 and not HasItem(_quest.usingItem) then
		
			script_navEX:moveToTarget(GetLocalPlayer(), _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);
	
				
			if not IsMoving() then

				Move(_quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);

			end

		return true;
		elseif distToGrind <= 10 then

			_quest.isQuestComplete = true;

		end

	end

if _quest.currentType == 5 and not IsInCombat() and (_quest.curGrindX ~= 0) and not _quest.isQuestComplete and not IsLooting() then

		_quest.message = "Type quest == 5";

		-- use item position

		local x, y, z = _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ;

		if GetDistance3D(px, py, pz, x, y, z) < 10 and HasItem(_quest.usingItem) then

			UseItem(_quest.usingItem)

			--return true;

		return true;
		elseif distToGrind > 5 then
		
			script_navEX:moveToTarget(GetLocalPlayer(), _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);
	
				
			if not IsMoving() then

				Move(_quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);

			end

		return true;
		elseif distToGrind <= 10 and not HasItem(_quest.usingItem) then

			_quest.isQuestComplete = true;

		end

	end

return false;
end

-- type 6 is we get an item at grind spot, quest is not completed, and need to go to a different return target to complete