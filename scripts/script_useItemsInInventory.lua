script_useItemsInInventory = {}

function script_useItemsInInventory:useItems()

	if script_useItemsInInventory:useBigMouthClam() then
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