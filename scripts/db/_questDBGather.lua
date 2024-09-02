_questDBGather = {waitTimer = 0, gatherTarget = 0, gatherTarget2 = 0,}

function _questDBGather:getObject()
	
	local gatherNum = 0;
	local gatherNum2 = 0;
	local i, t = GetFirstObject();
	local bestDist = 1000;
	local bestTarget = nil;

							self.gatherTarget = 2090;

		self.gatheringTarget = nil;
						
	while i ~= 0 do
		if t == 5 then
			if self.gatherTarget == i:GetObjectDisplayID() then
				local dist = i:GetDistance();
				if bestDist > dist then
					bestDist = dist;
					bestTarget = i;
					self.gatherTarget = i;
				end
			end
		end
	i, t = GetNextObject(i);
	end
return self.gatherTarget;
end

function _questDBGather:gatherObject()
	if self.gatherTarget ~= 0 then
		local dist = self.gatherTarget:GetDistance();
		local x, y, z = self.gatherTarget:GetPosition();
		if dist > 3 then
			script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);
			return true;
		end
	end
return false;
end

function _questDBGather:run()

	if self.waitTimer > GetTimeEX() then
		return;
	end

	_questDBGather:getObject()
	_questDBGather:gatherObject();
	
	if self.gatherTarget:GetDistance() <= 4 then
		if (HasForm()) then
			if (IsCatForm()) then
				script_druidEX:removeCatForm();
			end
			if (IsBearForm()) then 
				script_druidEX:removeBearForm();
			end
			if (IsTravelForm) then
				script_druidEX:removeTravelForm();
			end
		end		
			if (IsMoving()) then
				StopMoving();
				self.waitTimer = GetTimeEX() + 950;
				return true;
			end
			if (not IsLooting() and not IsChanneling()) and (not IsMoving()) and (not IsCasting()) and (IsStanding()) then
				self.gatheringTarget:GameObjectInteract();
				self.waitTimer = GetTimeEX() + 1650;
				return true;
			end
			if (not LootTarget()) and (script_gather.nodeObj:GameObjectInteract()) and (not IsMoving()) and (not IsLooting()) then
				self.waitTmer = GetTimeEX() + 4550;
			end
			if (IsLooting()) then
				self.waitTimer = GetTimeEX() + 2500;
				if (LootTarget()) or (IsLooting()) then
					return true;
				end
				
			end
		self.waitTimer = GetTimeEX() + 450;
		return true;
	end

	
end


function _questDBGather:checkInventory()
	-- run inventory and find item name that matches current _questDB quest name or _quest current quest name 
	_quest.numGather = 0;
	_quest.numGather2 = 0;
	
end
