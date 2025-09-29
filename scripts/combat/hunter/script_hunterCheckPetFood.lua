script_hunterCheckPetFood = {}

function script_hunterCheckPetFood:checkPetFood()

	-- Check for pet food, change bag/slot if we have too
	if (GetContainerItemLink(script_hunter.bagWithPetFood-1, script_hunter.slotWithPetFood)  == nil) then

		bagNr = 0;

		bagSlot = 0;

		for i = 0, 4 do

			if i ~= script_hunter.quiverBagNr-1 then

				for y = 0, GetContainerNumSlots(i) do

					if (GetContainerItemLink(i, y) ~= nil) then

						local _, _, iLink = string.find(GetContainerItemLink(i, y), "(item:%d+)");

						local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,

   							itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(iLink);

						if (script_hunter.foodName == itemName) then

							script_hunter.bagWithPetFood = i+1;

							script_hunter.slotWithPetFood = y;
							break;
						end
					end
				end
			end
		end
	end
end