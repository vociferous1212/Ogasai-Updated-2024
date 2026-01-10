script_hunterSetAmmo = {}

-- was having problems with setup. use this to call the check in the run function, or elsewhere, with a check for | script_hunter.ammoName == 0 then |

function script_hunterSetAmmo:setAmmo()

-- Save the name of ammo we use
	local bagSlots = GetContainerNumSlots(script_hunter.quiverBagNr-1);
	if (GetContainerItemLink(script_hunter.quiverBagNr-1, bagSlots)  ~= nil) then
		_,_,itemLink = string.find(GetContainerItemLink(script_hunter.quiverBagNr-1, bagSlots),"(item:%d+)");
		itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
   		itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
		script_hunter.ammoName = itemName;
		script_vendor.ammoName = itemName;
		script_vendorMenu.ammoName = itemName;
	end

	--DEFAULT_CHAT_FRAME:AddMessage('script_hunter: Ammo name is set to: "' .. script_hunter.ammoName .. '" ...');
	if (not strfind(itemName, "Arrow")) then
	--DEFAULT_CHAT_FRAME:AddMessage('script_hunter: Ammo will be bought at "Bullet" vendors...');
		script_vendor.itemIsArrow = false;
		script_hunter.ammoIsArrow = false;
		script_vendor.ammoName = itemName;
		script_vendorMenu.ammoName = itemName;
	else
	--	DEFAULT_CHAT_FRAME:AddMessage('script_hunter: Ammo will be bought at "Arrow" vendors...');
		script_vendor.ammoName = script_hunter.ammoName;
		script_vendorMenu.ammoName = script_hunter.ammoName;
		script_hunter.ammoIsArrow = true;
	end

	-- Save the name of pet food we use
	if (GetContainerItemLink(script_hunter.bagWithPetFood-1, script_hunter.slotWithPetFood)  ~= nil) then
		local _, _, iLink = string.find(GetContainerItemLink(script_hunter.bagWithPetFood-1, script_hunter.slotWithPetFood), "(item:%d+)");
		local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
   		itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(iLink);
		script_hunter.foodName = itemName;
		--DEFAULT_CHAT_FRAME:AddMessage('script_hunter: Pet food name is set to: "' .. script_hunter.foodName .. '" ...');
	else
		--DEFAULT_CHAT_FRAME:AddMessage('script_hunter: Please set the pet food name in hunter options...');
	end

end