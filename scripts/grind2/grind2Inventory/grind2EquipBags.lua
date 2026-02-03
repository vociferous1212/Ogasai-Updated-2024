grind2EquipBags = {

	isBagsSetup = false,

	bagTable = {},

	bagTableNum = 0,

	checkBagTimer = 0,
	
	localTimer = 0,

}

function grind2EquipBags:checkForBagsToEquip()

	if GetTimeEX() > self.checkBagTimer then

		if GetMyClass() == "HUNTER" then

			if GetBagName(3) == nil then

				grind2EquipBags:checkInventoryForBags();

				self.checkBagTimer = GetTimeEX() + 120000;

				return true;
			end

		elseif GetBagName(4) == nil then

			grind2EquipBags:checkInventoryForBags()
			
			self.checkBagTimer = GetTimeEX() + 120000;

			return true;
		end
	end

return false;
end

function grind2EquipBags:addBagsToTable(name)

	self.bagTable[self.bagTableNum] = {};

	self.bagTable[self.bagTableNum]['name'] = name;

	self.bagTableNum = self.bagTableNum + 1;
end

function grind2EquipBags:bagsSetup()

	grind2EquipBags:addBagsToTable("Small Brown Pouch");

	grind2EquipBags:addBagsToTable("Small Red Pouch");

	grind2EquipBags:addBagsToTable("Small Black Pouch");

	grind2EquipBags:addBagsToTable("Small Blue Pouch");

	grind2EquipBags:addBagsToTable("Small Green Pouch");

self.isBagsSetup = true;
end

--check inventory for bags
function grind2EquipBags:checkInventoryForBags()

	if not self.isBagsSetup then

		grind2EquipBags:bagsSetup();
	end

	local name = nil;

	-- run inventory and find item name that matches current _questDB quest name or _quest current quest name 
	for i = 0, 5 do 

		for y = 0, GetContainerNumSlots(i) do 
	
			if GetContainerItemLink(i,y) ~= nil then

				_,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
			
				itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink); 

				for u = 0, self.bagTableNum -1 do

					if itemName == self.bagTable[u]['name'] then

						name = itemName

					end
				end

				if name ~= nil and GetTimeEX() > self.localTimer then

					UseItem(name);

					name = nil;

					self.localTimer = GetTimeEX() + 200;
						
					return true;
				end
			end
		end 
	end

return false;
end