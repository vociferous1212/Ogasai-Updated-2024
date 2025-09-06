script_killTotems = {}

function script_killTotems:checkForTotems(range)
    -- Table of Shaman totem names as a lookup table
    local totemNames = {
        ["Searing Totem"] = true,
        ["Magma Totem"] = true,
        ["Fire Elemental Totem"] = true,
        ["Frost Resistance Totem"] = true,
        ["Earthbind Totem"] = true,
        ["Stoneclaw Totem"] = true,
        ["Earth Elemental Totem"] = true,
        ["Strength of Earth Totem"] = true,
        ["Healing Stream Totem"] = true,
        ["Mana Spring Totem"] = true,
        ["Poison Cleansing Totem"] = true,
        ["Fire Resistance Totem"] = true,
        ["Windfury Totem"] = true,
        ["Grace of Air Totem"] = true,
        ["Grounding Totem"] = true,
        ["Nature Resistance Totem"] = true,
        ["Greater Healing Ward"] = true
    }

    -- Get local player
    local localObj = GetLocalPlayer()
    if localObj == nil or localObj:IsDead() then
        return false
    end

    -- Initialize variables for closest totem
    local closestTotem = nil
    local bestDist = range or 40

    -- Scan for totems using object manager
    local currentObj, typeObj = GetFirstObject()
    while currentObj ~= 0 do
        if typeObj == 3 and not currentObj:IsDead() and not currentObj:IsCritter() then
            local name = currentObj:GetUnitName()
            local dist = currentObj:GetDistance()
            -- Check if the object is a totem using lookup table
            if totemNames[name] and dist <= bestDist then
                -- Update closest totem if this one is closer
                if dist < bestDist then
                    bestDist = dist
                    closestTotem = {
                        guid = currentObj:GetGUID(),
                        name = name,
                        distance = dist,
                        obj = currentObj
                    }
                end
            end
        end
        currentObj, typeObj = GetNextObject(currentObj)
    end

    -- Set closest totem as script_grind.enemyObj
    if closestTotem then
        script_grind.enemyObj = closestTotem
        return true
    end

    return false
end