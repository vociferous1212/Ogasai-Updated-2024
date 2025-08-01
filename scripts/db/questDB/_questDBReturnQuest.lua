_questDBReturnQuest = {waitTimer = 0}

function _questDBReturnQuest:returnAQuest()
  

    local id = _questDBReturnQuest:getReturnTargetID()

    if not _questDB.isSetup then
        _questDB:setup()
    end

    local px, py, pz = GetLocalPlayer():GetPosition()
    local x, y, z = 0, 0, 0

    -- Return a quest
    if _quest.currentQuest ~= nil and _questDB.curListQuest ~= nil and _quest.isQuestComplete then
        for i = 0, _questDB.numQuests - 1 do
            if _quest.currentQuest == _questDB.questList[i]['questName'] then
                x, y, z = _questDB:getReturnTargetPos()
            end
        end
        if id ~= nil then
            if _questDBReturnQuest:getReturnTargetID():GetDistance() <= 10 then
                x, y, z = _questDBReturnQuest:getReturnTargetID():GetPosition()
            end
        end

        local name = _questDB:getReturnTargetName()

        if GetTarget() ~= 0 and GetTarget() ~= nil then
            if GetTarget():GetUnitName() == name then
                x, y, z = GetTarget():GetPosition()
            end
        end

        if GetDistance3D(px, py, pz, x, y, z) <= 4 and _quest.isQuestComplete then
            if HasForm() then RemoveForm() end

            local name = _questDB:getReturnTargetName()

            if GetTarget() ~= 0 and GetTarget() ~= nil then
                if GetTarget():GetUnitName() == name then
                    x, y, z = GetTarget():GetPosition()
                end
            end

            if self.waitTimer > GetTimeEX() then
                return
            end

            _quest.grindSpotReached = false
            _quest.targetKilledNum = 0
            _quest.targetKilledNum2 = 0
            _quest.targetKilledNum3 = 0
            _quest.gatheredNum = 0
            _quest.gatheredNum2 = 0
            _quest.currentType = 0

            _quest.message = "Completing Quest"

            local name = _questDB:getReturnTargetName()
            local id = _questDBReturnQuest:getReturnTargetID()
            if id == nil and (GetTarget() == nil or GetTarget() == 0) or (GetTarget() ~= 0 and GetTarget() ~= nil and GetTarget():GetUnitName() ~= name) then
                TargetByName(name)
                name = GetTarget()
            end
            if ((GetTarget() ~= 0 and GetTarget() ~= nil) or id ~= nil) and not IsMoving() then
                _quest.waitTimer = GetTimeEX() + 2000
                if not IsMoving() and ((id ~= nil and id:GameObjectInteract()) or (GetTarget():UnitInteract())) then
                    _quest.weCompletedQuest = true
                    self.waitTimer = GetTimeEX() + 2000

                    -- Class-specific reward selection
                    local _, playerClass = UnitClass("player")
                    local playerLevel = UnitLevel("player")

                    local validEquipTypes = {
                        ["INVTYPE_HEAD"] = true, ["INVTYPE_SHOULDER"] = true, ["INVTYPE_CHEST"] = true,
                        ["INVTYPE_WAIST"] = true, ["INVTYPE_LEGS"] = true, ["INVTYPE_FEET"] = true,
                        ["INVTYPE_WRIST"] = true, ["INVTYPE_HAND"] = true, ["INVTYPE_FINGER"] = true,
                        ["INVTYPE_TRINKET"] = true, ["INVTYPE_CLOAK"] = true, ["INVTYPE_WEAPON"] = true,
                        ["INVTYPE_WEAPONMAINHAND"] = true, ["INVTYPE_WEAPONOFFHAND"] = true,
                        ["INVTYPE_RANGED"] = true, ["INVTYPE_THROWN"] = true, ["INVTYPE_SHIELD"] = true,
                        ["INVTYPE_2HWEAPON"] = true
                    }

                    local armorProficiencies = {
                        ["WARRIOR"] = { ["Cloth"] = true, ["Leather"] = true, ["Mail"] = true, ["Plate"] = playerLevel >= 40, ["Shield"] = true },
                        ["PALADIN"] = { ["Cloth"] = true, ["Leather"] = true, ["Mail"] = true, ["Plate"] = playerLevel >= 40, ["Shield"] = true },
                        ["HUNTER"] = { ["Cloth"] = true, ["Leather"] = true, ["Mail"] = playerLevel >= 40 },
                        ["ROGUE"] = { ["Cloth"] = true, ["Leather"] = true },
                        ["PRIEST"] = { ["Cloth"] = true },
                        ["SHAMAN"] = { ["Cloth"] = true, ["Leather"] = true, ["Mail"] = playerLevel >= 40, ["Shield"] = true },
                        ["MAGE"] = { ["Cloth"] = true },
                        ["WARLOCK"] = { ["Cloth"] = true },
                        ["DRUID"] = { ["Cloth"] = true, ["Leather"] = true }
                    }

                    local weaponProficiencies = {
                        ["WARRIOR"] = { ["Dagger"] = true, ["Sword"] = true, ["Mace"] = true, ["Axe"] = true, ["Polearm"] = true, ["Staff"] = true, ["Bow"] = true, ["Crossbow"] = true, ["Gun"] = true, ["Thrown"] = true, ["Fist"] = true },
                        ["PALADIN"] = { ["Sword"] = true, ["Mace"] = true, ["Axe"] = true, ["Polearm"] = true, ["Two-Handed Sword"] = true, ["Two-Handed Mace"] = true, ["Two-Handed Axe"] = true },
                        ["HUNTER"] = { ["Dagger"] = true, ["Axe"] = true, ["Sword"] = true, ["Polearm"] = true, ["Staff"] = true, ["Bow"] = true, ["Crossbow"] = true, ["Gun"] = true, ["Thrown"] = true },
                        ["ROGUE"] = { ["Dagger"] = true, ["Sword"] = true, ["Mace"] = true, ["Fist"] = true, ["Bow"] = true, ["Crossbow"] = true, ["Gun"] = true, ["Thrown"] = true },
                        ["PRIEST"] = { ["Dagger"] = true, ["Mace"] = true, ["Staff"] = true, ["Wand"] = true },
                        ["SHAMAN"] = { ["Mace"] = true, ["Axe"] = true, ["Staff"] = true, ["Dagger"] = true },
                        ["MAGE"] = { ["Dagger"] = true, ["Staff"] = true, ["Wand"] = true },
                        ["WARLOCK"] = { ["Dagger"] = true, ["Staff"] = true, ["Wand"] = true },
                        ["DRUID"] = { ["Dagger"] = true, ["Mace"] = true, ["Staff"] = true, ["Polearm"] = true, ["Fist"] = true }
                    }

                    local statPriorities = {
                        ["ROGUE"] = "Agility",
                        ["DRUID"] = "Agility",
                        ["HUNTER"] = "Agility",
                        ["SHAMAN"] = "Agility",
                        ["WARRIOR"] = "Strength",
                        ["PALADIN"] = "Strength",
                        ["MAGE"] = "Intellect",
                        ["WARLOCK"] = "Stamina",
                        ["PRIEST"] = "Intellect"
                    }

                    local function GetStatScore(itemName, priorityStat)
                        if not itemName then return 0, -1 end
                        local score = 0
                        if priorityStat == "Agility" and string.find(itemName, "of Agility") then
                            score = 10
                        elseif priorityStat == "Strength" and string.find(itemName, "of Strength") then
                            score = 10
                        elseif priorityStat == "Intellect" and string.find(itemName, "of Intellect") then
                            score = 10
                        elseif priorityStat == "Stamina" and string.find(itemName, "of Stamina") then
                            score = 10
                        end
                        return score
                    end

                    local bestRewardIndex = -1
                    local bestScore = -1
                    local bestRarity = -1
                    local bestItemName = nil
                    local priorityStat = statPriorities[playerClass]
                    local classArmorProfs = armorProficiencies[playerClass]
                    local classWeaponProfs = weaponProficiencies[playerClass]

                    local numChoices = GetNumQuestChoices()
                    if numChoices > 0 then
                        for i = 1, numChoices do
                            local itemLink = GetQuestItemLink("choice", i)
                            if itemLink then
                                local _, _, parsedItemLink = string.find(itemLink, "(item:%d+)")
                                if parsedItemLink then
                                    local itemName, _, itemRarity, _, _, _, _, itemStackCount = GetItemInfo(parsedItemLink)
                                    if itemName and itemRarity and itemStackCount and itemStackCount ~= "" and validEquipTypes[itemStackCount] then
                                        local isEquippable = false

                                        if itemStackCount == "INVTYPE_HEAD" or itemStackCount == "INVTYPE_SHOULDER" or itemStackCount == "INVTYPE_CHEST" or
                                           itemStackCount == "INVTYPE_WAIST" or itemStackCount == "INVTYPE_LEGS" or itemStackCount == "INVTYPE_FEET" or
                                           itemStackCount == "INVTYPE_WRIST" or itemStackCount == "INVTYPE_HAND" then
                                            if classArmorProfs["Leather"] or classArmorProfs["Mail"] or classArmorProfs["Plate"] or classArmorProfs["Cloth"] then
                                                isEquippable = true
                                            end
                                        elseif itemStackCount == "INVTYPE_CLOAK" and classArmorProfs["Cloth"] then
                                            isEquippable = true
                                        elseif itemStackCount == "INVTYPE_SHIELD" and classArmorProfs["Shield"] then
                                            isEquippable = true
                                        elseif itemStackCount == "INVTYPE_WEAPON" or itemStackCount == "INVTYPE_WEAPONMAINHAND" or itemStackCount == "INVTYPE_WEAPONOFFHAND" or
                                               itemStackCount == "INVTYPE_2HWEAPON" or itemStackCount == "INVTYPE_RANGED" or itemStackCount == "INVTYPE_THROWN" then
                                            if (string.find(itemName, "Dagger") and classWeaponProfs["Dagger"]) or
                                               (string.find(itemName, "Sword") and classWeaponProfs["Sword"]) or
                                               (string.find(itemName, "Mace") and classWeaponProfs["Mace"]) or
                                               (string.find(itemName, "Axe") and classWeaponProfs["Axe"]) or
                                               (string.find(itemName, "Polearm") and classWeaponProfs["Polearm"]) or
                                               (string.find(itemName, "Staff") and classWeaponProfs["Staff"]) or
                                               (string.find(itemName, "Bow") and classWeaponProfs["Bow"]) or
                                               (string.find(itemName, "Crossbow") and classWeaponProfs["Crossbow"]) or
                                               (string.find(itemName, "Gun") and classWeaponProfs["Gun"]) or
                                               (string.find(itemName, "Wand") and classWeaponProfs["Wand"]) or
                                               (string.find(itemName, "Fist") and classWeaponProfs["Fist"]) or
                                               (string.find(itemName, "Thrown") and classWeaponProfs["Thrown"]) or
                                               ((itemStackCount == "INVTYPE_2HWEAPON") and (
                                                    (string.find(itemName, "Sword") and classWeaponProfs["Two-Handed Sword"]) or
                                                    (string.find(itemName, "Mace") and classWeaponProfs["Two-Handed Mace"]) or
                                                    (string.find(itemName, "Axe") and classWeaponProfs["Two-Handed Axe"])
                                                )) then
                                                isEquippable = true
                                            end
                                        elseif itemStackCount == "INVTYPE_FINGER" or itemStackCount == "INVTYPE_TRINKET" then
                                            isEquippable = true
                                        end

                                        if isEquippable then
                                            local statScore = GetStatScore(itemName, priorityStat)
                                            if statScore > bestScore or (statScore == bestScore and itemRarity > bestRarity) then
                                                bestScore = statScore
                                                bestRarity = itemRarity
                                                bestRewardIndex = i
                                                bestItemName = itemName
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end

                    -- Use original working completion sequence
                    if bestRewardIndex > 0 and bestItemName then
                        GetQuestReward(bestRewardIndex)
                        GetQuestReward(QuestFrameRewardPanel, bestRewardIndex)
                        CompleteQuest()
                        self.waitTimer = GetTimeEX() + 2000
                        UseItem(bestItemName)
                    else
                        GetQuestReward(1)
                        GetQuestReward(QuestFrameRewardPanel, 1)
                        CompleteQuest()
                        self.waitTimer = GetTimeEX() + 2000
                    end

                    return true
                end
                return true
            end
        elseif x ~= 0 and GetDistance3D(px, py, pz, x, y, z) > 4 and ((script_grind.lootObj == nil or script_grind.skipLooting) or (script_grind.lootObj ~= nil and script_grind:isTargetLootBlacklisted(script_grind.lootObj:GetGUID()))) then
            local name = _questDB:getReturnTargetName()
            if not IsInCombat() and PlayerHasTarget() and GetTarget():GetUnitName() ~= name then
                ClearTarget()
            end
            _quest.message = "Moving to quest return target"
            script_navEX:moveToTarget(GetLocalPlayer(), x, y, z)
            if not IsMoving() then Move(x, y, z) end
            return
        end
        return true
    end
    return false
end

function _questDBReturnQuest:getReturnTargetID()
    local id = nil
    for i = 0, _questDB.numQuests - 1 do
        if _questDB.questList[i]['completed'] == "no" then
            if _questDB.questList[i]['questName'] ~= "nil" then
                if _questDB.questList[i]['questName'] == _questDB.curListQuest then
                    if _questDB.questList[i]['desc'] == _questDB.curDesc then
                        id = _questDB.questList[i]['returnTarget']
                    end
                end
            end
        end
    end

    local i, t = GetFirstObject()
    while i ~= 0 do
        if id == i:GetObjectDisplayID() then
            return i
        end
        i, t = GetNextObject(i)
    end

    return nil
end