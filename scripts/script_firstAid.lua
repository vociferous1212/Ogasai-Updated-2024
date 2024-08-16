script_firstAid = {

	bookOpen = false,
	showFirstAid = false,
}

function script_firstAid:howMuchLinenDoWeHave()
	for i = 0,5 do 
		for y=0,GetContainerNumSlots(i) do 
			if (GetContainerItemLink(i,y) ~= nil) then
				_,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
				itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
   				itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
				-- check skill level here
				if (itemName == "Linen Cloth") then
					texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(i, y);
					number = itemCount;
				end	
			end
		end
	end	
return number;	
end
function script_firstAid:howMuchWoolDoWeHave()
	for i = 0,5 do 
		for y=0,GetContainerNumSlots(i) do 
			if (GetContainerItemLink(i,y) ~= nil) then
				_,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
				itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
   				itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
				-- check skill level here
				if (itemName == "Wool Cloth") then
					texture, itemCount, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(i, y);
					number = itemCount;
				end	
			end
		end
	end	
return number;	
end
function script_firstAid:openMenu()

	if (not self.bookOpen) then
	local name = "First Aid";
		self.bookOpen = true;
		CastSpellByName(name)
		return true;
	end
return false;
end
function script_firstAid:closeMenu()
	if (self.bookOpen) then  
		self.bookOpen = false;
		CloseTradeSkill();
		return true;
	end
return false;
end
function script_firstAid:craftBandages()

	-- wool bandage
	if (HasItem("Wool Cloth")) then
				script_firstAid:openMenu();

		for i = 0, GetNumTradeSkills(i) do
			local name, _, _, _, _ = GetTradeSkillInfo(i);
			if (name == "Heavy Wool Bandage") then

				if script_firstAid:howMuchWoolDoWeHave() >= 2 then
					DoTradeSkill(i, 20);
					return true;
				end
			elseif (name == "Wool Bandage") then
				DoTradeSkill(i, 20);
				return true;
			end
		end
	end

	
	-- linen bandage
	if (HasItem("Linen Cloth")) then
				script_firstAid:openMenu();

		for i = 0, GetNumTradeSkills(i) do
			local name, _, _, _, _ = GetTradeSkillInfo(i);
			if (name == "Heavy Linen Bandage") then

				if script_firstAid:howMuchLinenDoWeHave() >= 2 then
					DoTradeSkill(i, 20);
					return true;
				end
			elseif (name == "Linen Bandage") then
				DoTradeSkill(i, 20);
				return true;
			end
		end
	end
if (self.bookOpen) then
CloseTradeSkill();
end
return false;
end

function script_firstAid:Menu()

	if (self.showFirstAid) then

		wasClicked, self.linenBandage = Checkbox("Craft Linen Bandage", self.linenBandage);
		if (self.linenBandage) then
			script_firstAid:craftBandages();
		end

		wasClicked, self.heavyLinenBandage = Checkbox("Craft Heavy Linen Bandage", self.heavyLinenBandage);
		if (self.heavyLinenBandage) then
			script_firstAid:craftBandages();
		end

	end
end