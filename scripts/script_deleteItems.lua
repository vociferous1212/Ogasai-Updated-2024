script_deleteItems = {

	deleteItems = {},
	deleteNum = 0,
	selectionList = {},
	selectedListItem = 0,
	addDeleteItemByName = "Add Item Here",

}

function script_deleteItems:setup()

	-- add new items to delete here
	script_deleteItems:addDeleteItem("OOX-22/FE Distress Beacon");
	script_deleteItems:addDeleteItem("OOX-17/TN Distress Beacon");
	script_deleteItems:addDeleteItem("OOX-09/HL Distress Beacon");
	script_deleteItems:addDeleteItem("Mangled Journal");
	script_deleteItems:addDeleteItem("Vulture Gizzard");
	script_deleteItems:addDeleteItem("Blasted Boar Lung");
	script_deleteItems:addDeleteItem("Snickerfang Jowl");
	script_deleteItems:addDeleteItem("Imperfect Draenethyst Fragment");
	--script_deleteItems:addDeleteItem("");

	self.selectionList[self.deleteNum] = name;
	self.selectedListItem = 0;
end

-- add delete items in setup function
function script_deleteItems:addDeleteItem(name)
	self.deleteItems[self.deleteNum] = name;
	self.deleteNum = self.deleteNum + 1;
end

-- remove delete items in setup function
function script_deleteItems:removeDeleteItem(name)
	local tempList = self.deleteItems;
	self.deleteItems = {};
	local x = 0;
	local y = 0;
	for i=0, self.deleteNum - 1 do
		if (i ~= name) then
			self.deleteItems[x] = tempList[y];
			x = x+1;
			y = y+1;
		else
			y = y+1;
		end
	end
	
	-- Correct the number of keep items
	self.deleteNum = self.deleteNum - 1;
	if (self.deleteNum < 0) then
		self.deleteNum = 0;
	end

end

-- check for items to delete - called in grind script
function script_deleteItems:checkDeleteItems()
	for i = 0,4 do 
		for y=0,GetContainerNumSlots(i) do 
			if (GetContainerItemLink(i,y) ~= nil) then
				_,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
				itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
   				itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
				script_deleteItems:deleteItem(itemName);
			end
		end 
	end
return false;
end

-- check for items and delete them
function script_deleteItems:deleteItem(itemName)
	for i=0, self.deleteNum do
		if (itemName == self.deleteItems[i]) then
			DeleteItem(itemName);
			break;
		end
	end
return false;
end