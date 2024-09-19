_questEquipItems = {isBagsSetup = false, bagTable = {}, bagTableNum = 0}

-- check to see if we have bags or not
function _questEquipItems:checkMyBags()

	if GetBagName(4) == nil then
		return true;
	end

return false;
end

function _questEquipItems:addBagsToTable(name)
	self.bagTable[self.bagTableNum] = {};
	self.bagTable[self.bagTableNum]['name'] = name;
	self.bagTableNum = self.bagTableNum + 1;
end

function _questEquipItems:bagsSetup()
	_questEquipItems:addBagsToTable("Small Brown Pouch");
	_questEquipItems:addBagsToTable("Small Red Pouch");
	_questEquipItems:addBagsToTable("Small Black Pouch");
	_questEquipItems:addBagsToTable("Small Blue Pouch");
	_questEquipItems:addBagsToTable("Small Green Pouch");
self.isBagsSetup = true;
end

--check inventory for bags
function _questEquipItems:checkInventoryForBags()

	if not self.isBagsSetup then
		_questEquipItems:bagsSetup();
	end

	if _quest.waitTimer > GetTimeEX() then
		return;
	end

	local name = nil;

	-- run inventory and find item name that matches current _questDB quest name or _quest current quest name 

	if _questEquipItems:checkMyBags() then

		for i = 0, 5 do 

			for y=0,GetContainerNumSlots(i) do 
	
				if (GetContainerItemLink(i,y) ~= nil) then

					_,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
			
					itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink); 

					for u = 0, self.bagTableNum -1 do
						if itemName == self.bagTable[u]['name'] then
							name = itemName
						end
					end
					if (UseItem(name)) then
						_quest:setTimer(500);
					end
				end
			end 
		end
	end

return false;
end