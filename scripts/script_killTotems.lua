script_killTotems = {}

function script_killTotems:checkForTotems(range)
    -- Table of Shaman totem names
    local totemNames = {
        "Searing Totem", "Magma Totem", "Fire Elemental Totem", "Frost Resistance Totem",
        "Earthbind Totem", "Stoneclaw Totem", "Earth Elemental Totem", "Strength of Earth Totem",
        "Healing Stream Totem", "Mana Spring Totem", "Poison Cleansing Totem", "Fire Resistance Totem",
        "Windfury Totem", "Grace of Air Totem", "Grounding Totem", "Nature Resistance Totem", "Greater Healing Ward"
    }

    -- Initialize table to store detected totems
    local totems = {}

    -- Get local player
    local localObj = GetLocalPlayer()
    if localObj == nil or localObj:IsDead() then
        return false
    end

    -- Scan for totems using object manager
    local currentObj, typeObj = GetFirstObject()
    while currentObj ~= 0 do
        if typeObj == 3 and not currentObj:IsDead() and not currentObj:IsCritter() then
            local name = currentObj:GetUnitName()
            local dist = currentObj:GetDistance()
            -- Check if the object is a totem by matching name
            for _, totemName in ipairs(totemNames) do
                if name == totemName and dist <= (range or 40) then
                    table.insert(totems, {
                        guid = currentObj:GetGUID(),
                        name = name,
                        distance = dist,
                        obj = currentObj
                    })
                    break
                end
            end
        end
        currentObj, typeObj = GetNextObject(currentObj)
    end

    -- Check if totems table is empty using next()
    if next(totems) == nil then
        return false
    end

    -- Find closest totem
    local closestTotem = nil
    local minDist = 999
    for _, totem in ipairs(totems) do
        if totem.distance < minDist then
            minDist = totem.distance
            closestTotem = totem
        end
    end

    -- Set closest totem as script_grind.enemyObj
    if closestTotem then
        script_grind.enemyObj = closestTotem.obj
        return true
    end

    return false
end