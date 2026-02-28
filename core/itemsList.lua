itemsList = {

	quiverList = {
        ["Ancient Sinew Wrapped Lamina"] = true,
        ["Bandolier of the Night Watch"] = true,
        ["Gnoll Skin Bandolier"] = true,
        ["Harpy Hide Quiver"] = true,
        ["Heavy Leather Ammo Pouch"] = true,
        ["Heavy Quiver"] = true,
        ["Hunting Ammo Sack"] = true,
        ["Hunting Quiver"] = true,
        ["Light Leather Quiver"] = true,
        ["Light Quiver"] = true,
        ["Medium Quiver"] = true,
        ["Medium Shot Pouch"] = true,
        ["Quickdraw Quiver"] = true,
        ["Ribbly's Bandolier"] = true,
        ["Ribbly's Quiver"] = true,
        ["Small Ammo Pouch"] = true,
        ["Small Leather Ammo Pouch"] = true,
        ["Small Quiver"] = true,
        ["Small Shot Pouch"] = true,
        ["Thick Leather Ammo Pouch"] = true,
        ["Quiver of the Night Watch"] = true,
    },

}

function itemsList:pickupAmmoSlotFromBag1AndPlaceInBag4()

    local slot1 = ContainerIDToInventoryID(1) -- bag slot 1
    local slot4 = ContainerIDToInventoryID(4) -- bag slot 4

    -- Get the item equipped in slot 4
    local equippedLink = GetInventoryItemLink("player", slot4)

    -- If slot 4 has a quiver equipped, return false
    if equippedLink then
        local name = GetItemInfo(equippedLink)
        if name and quiverList[name] then
            return false
        end
    end

    -- Otherwise: pick up slot 1 and place it into slot 4
    PickupBagFromSlot(slot1)
    PutItemInBag(slot4)

end