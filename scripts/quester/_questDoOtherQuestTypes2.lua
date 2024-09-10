_questDoOtherQuestTypes2 = {}

function _questDoOtherQuestTypes2:run()


	local px, py, pz = GetLocalPlayer():GetPosition();

	local distToGiver = GetDistance3D(px, py, pz, _quest.curQuestX, _quest.curQuestY, _quest.curQuestZ);

	local distToGrind = GetDistance3D(px, py, pz, _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);



	-- type 7 is get an item from vendor... being used for 1 quest right now
	if _quest.currentType == 7 and not IsInCombat() and (_quest.curGrindX ~= 0) and not _quest.isQuestComplete and not IsLooting() then

		if _quest.waitTimer > GetTimeEX() then return; end

		_quest.message = "Type quest == 7";

		if not HasItem(_quest.usingItem) then

			local px, py, pz = GetLocalPlayer():GetPosition();
			local x, y, z = 2259.7299804688, 275.5710144043, 34.837535858154;

			if GetDistance3D(px, py, pz, x, y, z) > 4 then

				script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);

			elseif GetDistance3D(px, py, pz, x, y, z) <= 4 then

				_quest:setTimer(1500);

				local name = "Abigail Shiel";

				if GetTarget() ~= nil and GetTarget() ~= 0 then
					if GetTarget():GetUnitName() ~= name then
						TargetByName(name);
					end
				elseif GetTarget() == 0 or GetTarget() == nil then
					TargetByName(name);
				end
				if GetTarget():GetUnitName() == name then
					if (not IsVendorWindowOpen()) then
						SkipGossip();
						if (GetTarget():UnitInteract()) then
							_quest:setTimer(1500);
							return true;
						end
					else
						if BuyItem(_quest.usingItem, 1) then
							_quest:setTimer(1500);
							return true;
						end
					end
				end
			end

		return true;
		end
	end

	-- follow a target to quest area... doesn't seem to gain a target
	if _quest.currentType == 8 and not IsInCombat() and (_quest.curGrindX ~= 0) and not _quest.isQuestComplete and not IsLooting() then

		if _quest.waitTimer > GetTimeEX() then return; end

		_quest.message = "Type quest == 8";

		local dist = 0;
		local qx, qy, qz = 0;
		local questTarget = 0;

		local i, t = GetFirstObject();
		while i ~= 0 do
			if t == 3 then
				if i:GetDistance() <= 50 and i:GetUnitName() == _questDB:getQuestGiverName() then
					questTarget = i;
					qx, qy, qz = questTarget:GetPosition();
					dist = questTarget:GetDistance();
				end
				if i:GetUnitsTarget() == questTarget:GetGUID() then
					_quest.enemyTarget = i;
				end
			end
		i, t = GetNextObject(i);
		end
		
		if dist > 10 then
			script_navEX:moveToTarget(GetLocalPlayer(), qx, qy, qz);
		end
	return true;
	end	
	
	-- type 10 is use a wind ride master to city
	if _quest.currentType == 10 and not IsInCombat() and (_quest.curGrindX ~= 0) and not quest.isQuestComplete and not IsLooting() then

		if _quest.waitTimer > GetTimeEX() then return; end

		_quest.message = "Type quest == 10";

			local px, py, pz = GetLocalPlayer():GetPosition();
			local x, y, z = -437.1369934082, -2596, 95.787612915039;

			if GetDistance3D(px, py, pz, x, y, z) > 4 then

				script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);

			elseif GetDistance3D(px, py, pz, x, y, z) <= 4 then

				_quest:setTimer(1500);

				local name = "Devrak";

				if GetTarget() ~= nil and GetTarget() ~= 0 then
					if GetTarget():GetUnitName() ~= name then
						TargetByName(name);
					end
				elseif GetTarget() == 0 or GetTarget() == nil then
					TargetByName(name);
				end
				if GetTarget():GetUnitName() == name then
					if (GetTarget():UnitInteract()) then
						SelectGossipOption(1);
						_quest:setTimer(1500);
						return true;
					end
				end
				if script_goToFP:run() then
				else
					local name = GetLocalPlayer();
					TargetByName(name);
					if UnitOnTaxi("player") then
						_quest.pause = true;
					end
				end
			end

		return true;
		end

return false;
end