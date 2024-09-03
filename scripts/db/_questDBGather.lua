_questDBGather = {waitTimer = 0, gatherTarget = 0, gatherTarget2 = 0, gatheringTarget = 0, gatherNum = 0, gatherNum2 = 0, gatherTargetName = nil, gatherTargetName2 = nil,}

function _questDBGather:getObject()
	local bestDist = 1000;
	local bestTarget = nil;
		if _quest.currentQuest ~= nil then
			for i=0, _questDB.numQuests -1 do if _questDB.questList[i]['desc'] == _quest.currentDesc then self.gatherTarget = _questDB.questList[i]['gatherID']; self.gatherTarget2 = _questDB.questList[i]['gatherID2']; self.gatherNum = _questDB.questList[i]['numGather']; self.gatherNum2 = _questDB.questList[i]['numGather2']; end end
			
		local i, t = GetFirstObject();					
		while i ~= 0 do
			if t == 5 then
				if (self.gatherTarget == i:GetObjectDisplayID() and _quest.gatheredNum < self.gatherNum) or (self.gatherTarget2 == i:GetObjectDisplayID() and _quest.gatheredNum2 < self.gatherNum2) then
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
function _questDBGather:gatherObject()
	if self.gatheringTarget ~= 0 and self.gatheringTarget ~= nil then
		local dist = self.gatheringTarget:GetDistance();
		local x, y, z = self.gatheringTarget:GetPosition();
		if dist > 3 then
			script_navEX:moveToTarget(GetLocalPlayer(), x, y, z);
			return true;
		end
	end
return false;
end
function _questDBGather:run()


	-- get object
		self.gatheringTarget = _questDBGather:getObject();
		
	-- move to object
	if _questDBGather:gatherObject() then return true; end
	
	if self.gatheringTarget:GetDistance() <= 4 then if (HasForm()) then if (IsCatForm()) then script_druidEX:removeCatForm(); end if (IsBearForm()) then  script_druidEX:removeBearForm();
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
		if (not LootTarget()) and (self.gatheringTarget:GameObjectInteract()) and (not IsMoving()) and (not IsLooting()) then
			self.waitTmer = GetTimeEX() + 4550;
			return true;
		end
		if (IsLooting()) then self.waitTimer = GetTimeEX() + 2500; if (LootTarget()) or (IsLooting()) then return true; end end end
		self.waitTimer = GetTimeEX() + 450;
	return;
	
end
function _questDBGather:getItemsInInventory()
	-- run inventory and find item name that matches current _questDB quest name or _quest current quest name 
	for i = 0,5 do 
		for y=0,GetContainerNumSlots(i) do 
			if (GetContainerItemLink(i,y) ~= nil) then _,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)"); itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink); 
if itemName == self.gatheringTargetName then texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(i, y);
	_quest.gatheredNum = itemCount; end if itemName == self.gatheringTargetName2 then texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(i, y);
				 _quest.gatheredNum2 = itemCount; end
			end
		end 
	end
return false;
end