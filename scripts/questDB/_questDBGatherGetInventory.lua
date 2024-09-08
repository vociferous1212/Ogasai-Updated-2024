_questDBGatherGetInventory = {}

function _questDBGatherGetInventory:getItemsInInventory()

	-- run inventory and find item name that matches current _questDB quest name or _quest current quest name 
	for i = 0,5 do 

		for y=0,GetContainerNumSlots(i) do 

			if (GetContainerItemLink(i,y) ~= nil) then

			_,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
			
			itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink); 

				if itemName == self.gatheringTargetName then

					texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(i, y);

					_quest.gatheredNum = itemCount;
				end

				if itemName == self.gatheringTargetName2 then
					
					texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(i, y);

					_quest.gatheredNum2 = itemCount;
				end
			end
		end 
	end
return false;
end