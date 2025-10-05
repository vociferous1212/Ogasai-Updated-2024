script_useItemsInInventory = {}

function script_useItemsInInventory:useItems()

   -- local table = { [Scum Covered Bag] = true}

    -- if has table item then use item.
    -- recheck a single run through the inventory and use global vars for true or false.
    -- self.hasScumCoveredBag

	if script_useItemsInInventory:useBigMouthClam() then
		script_grind:setWaitTimer(500);
        return true;
	end

    if script_useItemsInInventory:useThickShelledClam() then
		script_grind:setWaitTimer(500);
        return true;
	end

    if script_useItemsInInventory:useScumCoveredBag() then
		script_grind:setWaitTimer(500);
        return true;
	end

return false;
end

function script_useItemsInInventory:useBigMouthClam()
    local itemSlot = nil
    local itemSlot2 = nil

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
        if itemSlot then break end
    end

    -- Use the item if found
    if itemSlot and itemSlot2 then
        UseContainerItem(itemSlot, itemSlot2)
		if IsLooting() then LootTarget() end
	return true;
    end
return false;
end

function script_useItemsInInventory:useThickShelledClam()
    local itemSlot = nil
    local itemSlot2 = nil

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
        if itemSlot then break end
    end

    -- Use the item if found
    if itemSlot and itemSlot2 then
        UseContainerItem(itemSlot, itemSlot2)
		if IsLooting() then LootTarget() end
	return true;
    end
return false;
end

function script_useItemsInInventory:useScumCoveredBag()
    local itemSlot = nil
    local itemSlot2 = nil

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
        if itemSlot then break end
    end

    -- Use the item if found
    if itemSlot and itemSlot2 then
        UseContainerItem(itemSlot, itemSlot2)
		if IsLooting() then LootTarget() end
	return true;
    end
return false;
end
