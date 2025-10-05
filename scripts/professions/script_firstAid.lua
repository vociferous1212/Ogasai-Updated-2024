script_firstAid = {
    bookOpen = false,
    showFirstAid = false,
}

function script_firstAid:howMuchLinenDoWeHave()
    for i = 0,5 do 
        for y=0,GetContainerNumSlots(i) do 
            if (GetContainerItemLink(i,y) ~= nil) then
                _,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
                itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
                itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
                if (itemName == "Linen Cloth") then
                    texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(i, y);
                    number = itemCount;
                end    
            end
        end
    end    
    return number or 0; -- Return 0 if no cloth found to avoid nil
end

function script_firstAid:howMuchWoolDoWeHave()
    for i = 0,5 do 
        for y=0,GetContainerNumSlots(i) do 
            if (GetContainerItemLink(i,y) ~= nil) then
                _,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
                itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
                itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
                if (itemName == "Wool Cloth") then
                    texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(i, y);
                    number = itemCount;
                end    
            end
        end
    end    
    return number or 0; -- Return 0 if no cloth found to avoid nil
end

function script_firstAid:howMuchSilkDoWeHave()
    for i = 0,5 do 
        for y=0,GetContainerNumSlots(i) do 
            if (GetContainerItemLink(i,y) ~= nil) then
                _,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
                itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
                itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
                if (itemName == "Silk Cloth") then
                    texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(i, y);
                    number = itemCount;
                end    
            end
        end
    end    
    return number or 0; -- Return 0 if no cloth found to avoid nil
end

function script_firstAid:howMuchMageweaveDoWeHave()
    for i = 0,5 do 
        for y=0,GetContainerNumSlots(i) do 
            if (GetContainerItemLink(i,y) ~= nil) then
                _,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
                itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
                itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
                if (itemName == "Mageweave Cloth") then
                    texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(i, y);
                    number = itemCount;
                end    
            end
        end
    end    
    return number or 0; -- Return 0 if no cloth found to avoid nil
end

function script_firstAid:howMuchRuneclothDoWeHave()
    for i = 0,5 do 
        for y=0,GetContainerNumSlots(i) do 
            if (GetContainerItemLink(i,y) ~= nil) then
                _,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
                itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
                itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
                if (itemName == "Runecloth") then
                    texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(i, y);
                    number = itemCount;
                end    
            end
        end
    end    
    return number or 0; -- Return 0 if no cloth found to avoid nil
end

function script_firstAid:canCraftBandage()
    -- Get player's First Aid skill level
    local skillLevel = 0;
    for i = 1, GetNumSkillLines() do
        local name, _, _, level, _, _ = GetSkillLineInfo(i);
        if (name == "First Aid") then
            skillLevel = level;
            break;
        end
    end

	-- we cannot craft bandages if bags are full or we are in combat...
	if script_grind.bagsFull or AreBagsFull() or IsInCombat() then
		return false;
	end

    -- Check each cloth type and skill requirement
    -- Linen: 1 for Linen Bandage, 20 for Heavy Linen Bandage
    local linenCount = script_firstAid:howMuchLinenDoWeHave();
    if (linenCount >= 1 and skillLevel >= 1) or (linenCount >= 2 and skillLevel >= 20) then
        return true;
    end

    -- Wool: 50 for Wool Bandage, 75 for Heavy Wool Bandage
    local woolCount = script_firstAid:howMuchWoolDoWeHave();
    if (woolCount >= 1 and skillLevel >= 50) or (woolCount >= 2 and skillLevel >= 75) then
        return true;
    end

    -- Silk: 125 for Silk Bandage, 150 for Heavy Silk Bandage
    local silkCount = script_firstAid:howMuchSilkDoWeHave();
    if (silkCount >= 1 and skillLevel >= 125) or (silkCount >= 2 and skillLevel >= 150) then
        return true;
    end

    -- Mageweave: 175 for Mageweave Bandage, 200 for Heavy Mageweave Bandage
    local mageweaveCount = script_firstAid:howMuchMageweaveDoWeHave();
    if (mageweaveCount >= 1 and skillLevel >= 175) or (mageweaveCount >= 2 and skillLevel >= 200) then
        return true;
    end

    -- Runecloth: 225 for Runecloth Bandage, 260 for Heavy Runecloth Bandage
    local runeclothCount = script_firstAid:howMuchRuneclothDoWeHave();
    if (runeclothCount >= 1 and skillLevel >= 225) or (runeclothCount >= 2 and skillLevel >= 260) then
        return true;
    end

    return false;
end

function script_firstAid:openMenu()
    if (not self.bookOpen) then
        local name = "First Aid";
        self.bookOpen = true;
        CastSpellByName(name)
        return true;
    end
    return false;
end

function script_firstAid:closeMenu()
    if (self.bookOpen) then  
        self.bookOpen = false;
        CloseTradeSkill();
        return true;
    end
    return false;
end

function script_firstAid:craftBandages()
    if not IsMoving() and IsStanding() and not IsInCombat() and not script_grind.bagsFull and not AreBagsFull() then
        -- runecloth bandage
        if (HasItem("Runecloth")) then
            script_firstAid:openMenu();
            for i = 0, GetNumTradeSkills(i) do
                local name, _, _, _, _ = GetTradeSkillInfo(i);
                if (name == "Heavy Runecloth Bandage") then
                    if script_firstAid:howMuchRuneclothDoWeHave() >= 2 then
                        DoTradeSkill(i, 20);
                        return true;
                    end
                elseif (name == "Runecloth Bandage") then
                    DoTradeSkill(i, 20);
                    return true;
                end
            end
        end

        -- mageweave bandage
        if (HasItem("Mageweave Cloth")) then
            script_firstAid:openMenu();
            for i = 0, GetNumTradeSkills(i) do
                local name, _, _, _, _ = GetTradeSkillInfo(i);
                if (name == "Heavy Mageweave Bandage") then
                    if script_firstAid:howMuchMageweaveDoWeHave() >= 2 then
                        DoTradeSkill(i, 20);
                        return true;
                    end
                elseif (name == "Mageweave Bandage") then
                    DoTradeSkill(i, 20);
                    return true;
                end
            end
        end

        -- silk bandage
        if (HasItem("Silk Cloth")) then
            script_firstAid:openMenu();
            for i = 0, GetNumTradeSkills(i) do
                local name, _, _, _, _ = GetTradeSkillInfo(i);
                if (name == "Heavy Silk Bandage") then
                    if script_firstAid:howMuchSilkDoWeHave() >= 2 then
                        DoTradeSkill(i, 20);
                        return true;
                    end
                elseif (name == "Silk Bandage") then
                    DoTradeSkill(i, 20);
                    return true;
                end
            end
        end

        -- wool bandage
        if (HasItem("Wool Cloth")) then
            script_firstAid:openMenu();
            for i = 0, GetNumTradeSkills(i) do
                local name, _, _, _, _ = GetTradeSkillInfo(i);
                if (name == "Heavy Wool Bandage") then
                    if script_firstAid:howMuchWoolDoWeHave() >= 2 then
                        DoTradeSkill(i, 20);
                        return true;
                    end
                elseif (name == "Wool Bandage") then
                    DoTradeSkill(i, 20);
                    return true;
                end
            end
        end
    
        -- linen bandage
        if (HasItem("Linen Cloth")) then
            script_firstAid:openMenu();
            for i = 0, GetNumTradeSkills(i) do
                local name, _, _, _, _ = GetTradeSkillInfo(i);
                if (name == "Heavy Linen Bandage") then
                    if script_firstAid:howMuchLinenDoWeHave() >= 2 then
                        DoTradeSkill(i, 20);
                        return true;
                    end
                elseif (name == "Linen Bandage") then
                    DoTradeSkill(i, 20);
                    return true;
                end
            end
        end
    end

    if (self.bookOpen) then
        CloseTradeSkill();
    end
    return false;
end