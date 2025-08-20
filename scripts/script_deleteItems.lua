script_deleteItems = {
    deleteItems = {},
    deleteNum = 0,
    selectionList = {},
    selectedListItem = 0,
    addDeleteItemByName = "Add Item Here",
}

function script_deleteItems:setup()

-- most of these are random quest items picked up or start a quest items
    script_deleteItems:addDeleteItem(" ");
    script_deleteItems:addDeleteItem("Flute of Xavaric");
    script_deleteItems:addDeleteItem("OOX-22/FE Distress Beacon");
    script_deleteItems:addDeleteItem("OOX-17/TN Distress Beacon");
    script_deleteItems:addDeleteItem("OOX-09/HL Distress Beacon");
    script_deleteItems:addDeleteItem("Mangled Journal");
    script_deleteItems:addDeleteItem("Wooden Key");
    script_deleteItems:addDeleteItem("Kolkar Booty Key");
    script_deleteItems:addDeleteItem("Sunscale Feather");
    script_deleteItems:addDeleteItem("A Letter to Yvette");
    script_deleteItems:addDeleteItem("Grimesilt Outhouse Key");
    script_deleteItems:addDeleteItem("An Old History Book");

-- random drops that won't sell
    script_deleteItems:addDeleteItem("Dark Iron Scraps");
    script_deleteItems:addDeleteItem("Black Diamond");
    script_deleteItems:addDeleteItem("Savage Frond");
    script_deleteItems:addDeleteItem("Core of Elements");

-- blasted lands drops need to change this to allow to pick them up if using quester and we have the quests
    script_deleteItems:addDeleteItem("Vulture Gizzard");
    script_deleteItems:addDeleteItem("Blasted Boar Lung");
    script_deleteItems:addDeleteItem("Snickerfang Jowl");
    script_deleteItems:addDeleteItem("Basilisk Brain");
    script_deleteItems:addDeleteItem("Scorpok Pincer");

    self.selectionList[self.deleteNum] = name;
    self.selectedListItem = 0;
end

function script_deleteItems:addDeleteItem(name)
    self.deleteItems[self.deleteNum] = name;
    self.deleteNum = self.deleteNum + 1;
end

function script_deleteItems:removeDeleteItem(name)
    local tempList = self.deleteItems;
    self.deleteItems = {};
    local x = 0;
    local y = 0;
    for i=0, self.deleteNum - 1 do
        if (i ~= name) then
            self.deleteItems[x] = tempList[y];
            x = x+1;
            y = y+1;
        else
            y = y+1;
        end
    end
    self.deleteNum = self.deleteNum - 1;
    if (self.deleteNum < 0) then
        self.deleteNum = 0;
    end
end

function script_deleteItems:checkDeleteItems()
    for i = 0,4 do 
        for y=0, GetContainerNumSlots(i) do 
            if (GetContainerItemLink(i,y) ~= nil) then
                _,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
                itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
                itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
                script_deleteItems:deleteItem(itemName);
            end
        end 
    end
    return false;
end

function script_deleteItems:deleteItem(itemName)
    for i = 0, self.deleteNum - 1 do
        if (itemName == self.deleteItems[i]) then
            for bag = 0, 4 do
                for slot = 1, GetContainerNumSlots(bag) do
                    if (GetContainerItemLink(bag, slot) ~= nil) then
                        local _, _, link = string.find(GetContainerItemLink(bag, slot), "(item:%d+)");
                        local name = GetItemInfo(link);
                        if (name and name == itemName) then
                            ClearCursor();
                            PickupContainerItem(bag, slot);
                            if (CursorHasItem()) then
                                DeleteCursorItem();
                                return true;
                            end
                        end
                    end
                end
            end
        end
    end
    return false;
end