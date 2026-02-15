script_useItemsInInventory = {

	localTimer = 0

}

function script_useItemsInInventory:useItems()

	-- local table = { [Scum Covered Bag] = true}

	-- if has table item then use item.
	-- recheck a single run through the inventory and use global vars for true or false.
	-- self.hasScumCoveredBag

	if self.localTimer > GetTimeEX() or IsLooting() then
		return false;
	end

	if script_useItemsInInventory:useBigMouthClam() then
		script_grind:setWaitTimer(1500);
		grind2:setTimer(1500);
		return false;
	end

	if script_useItemsInInventory:useThickShelledClam() then
		script_grind:setWaitTimer(1500);
		grind2:setTimer(1500);
		return false;
	end

	if script_useItemsInInventory:useScumCoveredBag() then
		script_grind:setWaitTimer(1500);
		grind2:setTimer(1500);
		return false;
	end

self.localTimer = GetTimeEX() + 1500;
return false;
end

function script_useItemsInInventory:useBigMouthClam()
	local itemSlot = nil
	local itemSlot2 = nil

	if self.localTimer > GetTimeEX() then
		return false;
	end

	-- Search bags for Big-mouth Clam
	for i = 0, 4 do
		for y = 1, GetContainerNumSlots(i) do
			local itemLink = GetContainerItemLink(i, y)
			if itemLink then
				local _, _, itemName = string.find(itemLink, "|h%[(.+)%]|h")
				if itemName and string.lower(itemName) == "big-mouth clam" then
					itemSlot = i
					itemSlot2 = y
					break
				end
			end
		end
		if itemSlot then
			break
		end
	end

	-- Use the item if found
	if itemSlot and itemSlot2 and GetTimeEX() > self.localTimer and not IsLooting() then
		self.localTimer = GetTimeEX() + 1500;
		if not UseContainerItem(itemSlot, itemSlot2) then
			self.localTimer = GetTimeEX() + 1500;
		end
	end
return false;
end

function script_useItemsInInventory:useThickShelledClam()
	local itemSlot = nil
	local itemSlot2 = nil

	if self.localTimer > GetTimeEX() then
		return false;
	end

	-- Search bags for Big-mouth Clam
	for i = 0, 4 do
		for y = 1, GetContainerNumSlots(i) do
			local itemLink = GetContainerItemLink(i, y)
			if itemLink then
				local _, _, itemName = string.find(itemLink, "|h%[(.+)%]|h")
				if itemName and string.lower(itemName) == "thick-shelled clam" then
					itemSlot = i
					itemSlot2 = y
					break
				end
			end
		end
		if itemSlot then
			break
		end
	end

	-- Use the item if found
	if itemSlot and itemSlot2 and GetTimeEX() > self.localTimer and not IsLooting() then
		self.localTimer = GetTimeEX() + 1500;
		if not UseContainerItem(itemSlot, itemSlot2) then
			self.localTimer = GetTimeEX() + 1500;
		end
	end
return false;
end

function script_useItemsInInventory:useScumCoveredBag()
	local itemSlot = nil
	local itemSlot2 = nil

	if self.localTimer > GetTimeEX() then
		return false;
	end

	-- Search bags for Big-mouth Clam
	for i = 0, 4 do
		for y = 1, GetContainerNumSlots(i) do
			local itemLink = GetContainerItemLink(i, y)
			if itemLink then
				local _, _, itemName = string.find(itemLink, "|h%[(.+)%]|h")
				if itemName and string.lower(itemName) == "scum covered bag" then
					itemSlot = i
					itemSlot2 = y
					break
				end
			end
		end
		if itemSlot then
			break
		end
	end

	-- Use the item if found
	if itemSlot and itemSlot2 and GetTimeEX() > self.localTimer and not IsLooting() then
		self.localTimer = GetTimeEX() + 1500;
		if not UseContainerItem(itemSlot, itemSlot2) then
			self.localTimer = GetTimeEX() + 1500;
		end
	end
return false;
end
