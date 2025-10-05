script_tailoring = {
    bookOpen = false,
    showTailoring = false,
    linenBolt = false,
    woolBolt = false,
    linenBag = false,
    woolBag = false,
}

function script_tailoring:howMuchLinenDoWeHave()
    local number = 0
    for i = 0, 5 do 
        for y = 0, GetContainerNumSlots(i) do 
            if (GetContainerItemLink(i, y) ~= nil) then
                _, _, itemLink = string.find(GetContainerItemLink(i, y), "(item:%d+)")
                if itemLink then
                    local itemName = GetItemInfo(itemLink)
                    if itemName == "Linen Cloth" then
                        local _, itemCount = GetContainerItemInfo(i, y)
                        number = number + (itemCount or 0)
                    end
                end
            end
        end
    end
    return number
end

function script_tailoring:howMuchWoolDoWeHave()
    local number = 0
    for i = 0, 5 do 
        for y = 0, GetContainerNumSlots(i) do 
            if (GetContainerItemLink(i, y) ~= nil) then
                _, _, itemLink = string.find(GetContainerItemLink(i, y), "(item:%d+)")
                if itemLink then
                    local itemName = GetItemInfo(itemLink)
                    if itemName == "Wool Cloth" then
                        local _, itemCount = GetContainerItemInfo(i, y)
                        number = number + (itemCount or 0)
                    end
                end
            end
        end
    end
    return number
end

function script_tailoring:openMenu()
    if not self.bookOpen then
        local name = "Tailoring"
        self.bookOpen = CastSpellByName(name)
        return self.bookOpen
    end
    return false
end

function script_tailoring:closeMenu()
    if self.bookOpen then
        CloseTradeSkill()
        self.bookOpen = false
        return true
    end
    return false
end

function script_tailoring:craftItems()
    if not IsMoving() and IsStanding() then
        local linenCount = script_tailoring:howMuchLinenDoWeHave()
        local woolCount = script_tailoring:howMuchWoolDoWeHave()
        local _, skillLevel = GetTradeSkillLine()

        if HasItem("Linen Cloth") or HasItem("Wool Cloth") then
            script_tailoring:openMenu()

            for i = 1, GetNumTradeSkills() do
                local name, _, _, _, _ = GetTradeSkillInfo(i)

                -- Woolen Bag (4 Wool Cloth, skill 80)
                if self.woolBag and name == "Woolen Bag" and woolCount >= 4 then
                    DoTradeSkill(i, 20)
                    return true
                -- Bolt of Woolen Cloth (3 Wool Cloth, skill 75)
                elseif self.woolBolt and name == "Bolt of Woolen Cloth" and woolCount >= 3 then
                    DoTradeSkill(i, 20)
                    return true
                -- Linen Bag (3 Linen Cloth, skill 45)
                elseif self.linenBag and name == "Linen Bag" and linenCount >= 3 then
                    DoTradeSkill(i, 20)
                    return true
                -- Bolt of Linen Cloth (2 Linen Cloth, skill 1)
                elseif self.linenBolt and name == "Bolt of Linen Cloth" and linenCount >= 2 then
                    DoTradeSkill(i, 20)
                    return true
                end
            end
        end
    end

    if self.bookOpen then
        script_tailoring:closeMenu()
    end
    return false
end

function script_tailoring:menu()
    if self.showTailoring then
        local wasClicked
        wasClicked, self.linenBolt = Checkbox("Craft Bolt of Linen Cloth", self.linenBolt)
        if self.linenBolt then
            script_tailoring:craftItems()
        end

        wasClicked, self.woolBolt = Checkbox("Craft Bolt of Woolen Cloth", self.woolBolt)
        if self.woolBolt then
            script_tailoring:craftItems()
        end

        wasClicked, self.linenBag = Checkbox("Craft Linen Bag", self.linenBag)
        if self.linenBag then
            script_tailoring:craftItems()
        end

        wasClicked, self.woolBag = Checkbox("Craft Woolen Bag", self.woolBag)
        if self.woolBag then
            script_tailoring:craftItems()
        end
    end
end