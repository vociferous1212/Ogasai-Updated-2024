script_vendorMenu = {
	quiverBag = 4,
	ammoName = "",
}

function script_vendorMenu:printAddVendor(canRepair, hasFood, hasWater, hasArrow, hasBullet)
	if (GetTarget() ~= 0 and GetTarget()~= nil) then
		local factionID = 1; -- horde
		local faction, __ = UnitFactionGroup("player");
		if (faction == 'Alliance') then
			factionID = 0;
		end
		local x, y, z = GetTarget():GetPosition();
		x = math.floor(x*100) / 100;
		y = math.floor(y*100) / 100;
		z = math.floor(z*100) / 100;
		local pos = ', ' .. x .. ', ' .. y .. ', ' .. z .. ");";
		DEFAULT_CHAT_FRAME:AddMessage('Add Vendor to Database by adding the line below in VendorDB.');
		DEFAULT_CHAT_FRAME:AddMessage('You can copy this line from logs folder.');
		local addString = 'vendorDB:addVendor("' .. UnitName("target") .. '", ' .. factionID .. ', ' .. GetContinentID() .. ', ' .. GetMapID() .. ', '
			.. tostring(canRepair) .. ', ' .. tostring(hasFood) .. ', ' .. tostring(hasWater) .. ', ' .. tostring(hasArrow) .. ', ' ..tostring(hasBullet) .. pos;

		DEFAULT_CHAT_FRAME:AddMessage(addString);
		ToFile(addString);
	end
end

function script_vendorMenu:menu()
	wasClicked, script_grind.vendorRefill = Checkbox("Refill Food/Drinks At Vendor", script_grind.vendorRefill);
	-- Always show a cancel button to any vendor actions
	if (script_vendor.status ~= 0) then 
		if Button("Cancel Current Vendor Action") then 
			script_vendor.message = "Idle..."; 
			script_vendor.status = 0;
			script_grind.bagsFull = false;
		end 
	end

	wasClicked, script_grind.repairWhenYellow = Checkbox("Repair When Gear Is Yellow", script_grind.repairWhenYellow);

	if (CollapsingHeader(">>> |+| Selling Options:")) then
		local wasClicked = false;
		local keepBox = false;
		wasClicked, script_vendor.sellPoor = Checkbox("Sell Poor Items (Grey)", script_vendor.sellPoor);
		wasClicked, script_vendor.sellCommon = Checkbox("Sell Common Items (White)", script_vendor.sellCommon);
		wasClicked, script_vendor.sellUncommon = Checkbox("Sell Uncommon Items (Green)", script_vendor.sellUncommon);
		wasClicked, script_vendor.sellRare = Checkbox("Sell Rare Items (Blue)", script_vendor.sellRare);
		wasClicked, script_vendor.sellEpic = Checkbox("Sell Epic Items (Purple)", script_vendor.sellEpic);
		Separator();
		Text("Unique Keep Items:");
		wasClicked, script_vendor.selectedKeepItemNr = ComboBox("", script_vendor.selectedKeepItemNr, unpack(script_vendor.keepItems));
		if Button("Remove") then
			script_vendor:deleteKeepItem(script_vendor.selectedKeepItemNr+1);
		end
		SameLine();
		Text(" - Removes Selected Item From The Keep List...");
		if Button("Add Item") then
			script_vendor:addSaveItem(script_vendor.addItemName);
		end
		SameLine();
		script_vendor.addItemName = InputText("", script_vendor.addItemName);
		Separator();
		Text("All items in your inventory will be added to the");
		Text("keep item list when reloading scripts...");
	end

	if (CollapsingHeader(">>> |+| Vendor NPC And Buy Options")) then
		wasClicked, script_grind.autoSelectVendors = Checkbox("Auto Load Closest Vendors", script_grind.autoSelectVendors);
			SameLine();
			local x, y, z = GetLocalPlayer():GetPosition();
			Text(" - Reload Dist (yd) "..math.floor(GetDistance3D(x, y, z, script_grind.myLastX, script_grind.myLastY, script_grind.myLastZ.. "")) - 500);
			Separator();

			Text("Repair Vendor:");
				if (script_vendor.repairVendor ~= 0) then
					SameLine();
					Text('' .. script_vendor.repairVendor['name'] .. ' loaded.');
					if Button("Repair Now") then script_vendor.status = 1; end
				end
				if (not script_grind.autoSelectVendors) then
					if Button("Set Current Target As Repair Vendor") then 
						script_vendorMenu:setRepairVendor(); 
						script_vendorMenu:printAddVendor(true, false, false, false, false); 
					end
				end
			Separator();
			Text("Sell Vendor:");
			if (script_vendor.sellVendor ~= 0) then
				SameLine();
				Text('' .. script_vendor.sellVendor['name'] .. ' loaded.');
				if Button("Sell Now") then script_vendor.status = 2; end
			end
			if (not script_grind.autoSelectVendors) then
				if Button("Set Current Target As Sell Vendor") then 
					script_vendorMenu:setSellVendor(); 
					script_vendorMenu:printAddVendor(false, false, false, false, false); 
				end
			end
				Separator();
			Text("Buy Food Vendor:");
			if (script_vendor.foodVendor ~= 0) then
				SameLine();
				Text('' .. script_vendor.foodVendor['name'] .. ' loaded.');
				
					if Button("Buy Food Now") then 
						script_vendor.status = 4;
						script_vendor.itemName = script_vendor.foodName;
						script_vendor.itemNum = script_vendor.foodNr;
						script_vendor.itemIsFood = true;
						script_vendor.itemIsDrink = false;
						script_vendor.itemIsAmmo = false;
					SameLine();
					if Button("Cancel Buy Food") then
						script_vendor.message = "Idle...";
						script_vendor.status = 0;
					end
				end
			end
					
			Text("Input Food Name And Number Of Stacks: 1 stack = 5 drinks");
			script_vendor.foodName = InputText("Food", script_vendor.foodName); 
			SameLine();
			script_vendor.foodNr = InputText("FX", script_vendor.foodNr);
			
			if (not script_grind.autoSelectVendors) then
				if Button("Set Current Target As Food Vendor") then 
					script_vendorMenu:setFoodVendor(); 
					script_vendorMenu:printAddVendor(false, true, false, false, false); 
				end
			end

			Separator();
				Text("Buy Drink Vendor:");
				if (script_vendor.drinkVendor ~= 0) then
				SameLine();
				Text('' .. script_vendor.drinkVendor['name'] .. ' loaded.');
					if Button("Buy Drink Now") then 
						script_vendor.status = 4;
						script_vendor.itemName = script_vendor.drinkName;
						script_vendor.itemNum = script_vendor.drinkNr;
						script_vendor.itemIsFood = false;
						script_vendor.itemIsDrink = true;
						script_vendor.itemIsAmmo = false;
					SameLine();
					if Button("Cancel Buy Drinks") then
						script_vendor.message = "Idle...";
						script_vendor.status = 0;
					end
				end
			end
		
			Text("Input Drink Name And Number Of Stacks: 1 stack = 5 drinks");
			
			script_vendor.drinkName = InputText("Drink", script_vendor.drinkName); 
			
			SameLine(); script_vendor.drinkNr = InputText("DX", script_vendor.drinkNr);

			if (not script_grind.autoSelectVendors) then
				if Button("Set Current Target As Drink Vendor") then 
					script_vendorMenu:setDrinkVendor(); 
					script_vendorMenu:printAddVendor(false, false, true, false, false); 
				end
			end
	
			Separator();
			if (script_vendor.arrowVendor ~= 0) then
				Text("Buy Ammo Vendor:");
				SameLine();
				Text('' .. script_vendor.arrowVendor['name'] .. ' loaded.');
			end
				if (script_vendor.bulletVendor ~= 0) then
					Text("Buy Bullet Vendor:");
					SameLine();
					Text('' .. script_vendor.bulletVendor['name'] .. ' loaded.'); 
				end
			if (script_vendor.bulletVendor ~= 0 or script_vendor.arrowVendor ~= 0) then
				wasClicked, script_vendor.itemIsArrow = Checkbox("Ammo Is 'Arrows'", script_vendor.itemIsArrow);

					if Button("Buy Ammo Now") then 
						script_vendor.status = 3; 
						script_vendor.ammoName = self.ammoName;
						script_vendor.itemIsBullet = not script_vendor.itemIsArrow;
						script_vendor.quiverBag = self.quiverBag-1;
					end
				
					SameLine();
				
					if Button("Cancel Buy Ammo") then 
						script_vendor.message = "Idle..."; 
						script_vendor.status = 0; 
					end
				
			end
	
				Text("Input Ammo Name:");
			
			self.ammoName = InputText("Ammo", self.ammoName); 
			
			Text("Input Quiver Bag Number:");
			self.quiverBag = InputText("Bag Number 1-5", self.quiverBag);
	
			if (not script_grind.autoSelectVendors) then
				if Button("Set Current Target As Arrow Vendor") then 
					script_vendorMenu:setArrowVendor();
					script_vendor.itemIsArrow = true;
					script_vendorMenu:printAddVendor(false, false, false, true, false); 
				end
				
				if Button("Set Current Target As Bullet Vendor") then 
					script_vendorMenu:setBulletVendor(); 
					script_vendor.itemIsArrow = false;
					script_vendorMenu:printAddVendor(false, false, false, false, true); 
				end
			end
		end
end

function script_vendorMenu:setRepairVendor()
	if (GetTarget() ~= nil and GetTarget() ~= 0) then
		local name, realm = UnitName("target");
		script_vendor.repairVendor = nil;
		script_vendor.repairVendor = {};
		script_vendor.repairVendor['name'] = name;
		script_vendor.repairVendor['pos'] = {};
		script_vendor.repairVendor['pos']['x'], script_vendor.repairVendor['pos']['y'], script_vendor.repairVendor['pos']['z'] = GetTarget():GetPosition();
		DEFAULT_CHAT_FRAME:AddMessage('Repair Vendor Set...');
		if (script_vendor.sellVendor == 0) then
			script_vendorMenu:setSellVendor();
		end
	else
		DEFAULT_CHAT_FRAME:AddMessage('Target A Vendor...');
	end
end

function script_vendorMenu:setSellVendor()
	if (GetTarget() ~= nil and GetTarget() ~= 0) then
		local name, realm = UnitName("target");
		script_vendor.sellVendor = nil;
		script_vendor.sellVendor = {};
		script_vendor.sellVendor['name'] = name;
		script_vendor.sellVendor['pos'] = {};
		script_vendor.sellVendor['pos']['x'], script_vendor.sellVendor['pos']['y'], script_vendor.sellVendor['pos']['z'] = GetTarget():GetPosition();
		DEFAULT_CHAT_FRAME:AddMessage('Sell Vendor Set...');
	else
		DEFAULT_CHAT_FRAME:AddMessage('Target A Vendor...');
	end
end

function script_vendorMenu:setFoodVendor()
	if (GetTarget() ~= nil and GetTarget() ~= 0) then
		local name, realm = UnitName("target");
		script_vendor.foodVendor = nil;
		script_vendor.foodVendor = {};
		script_vendor.foodVendor['name'] = name;
		script_vendor.foodVendor['pos'] = {};
		script_vendor.foodVendor['pos']['x'], script_vendor.foodVendor['pos']['y'], script_vendor.foodVendor['pos']['z'] = GetTarget():GetPosition();
		DEFAULT_CHAT_FRAME:AddMessage('Food Vendor Set...');
		if (script_vendor.sellVendor == 0) then
			script_vendorMenu:setSellVendor();
		end
	else
		DEFAULT_CHAT_FRAME:AddMessage('Target A Vendor...');
	end
end

function script_vendorMenu:setDrinkVendor()
	if (GetTarget() ~= nil and GetTarget() ~= 0) then
		local name, realm = UnitName("target");
		script_vendor.drinkVendor = nil;
		script_vendor.drinkVendor = {};
		script_vendor.drinkVendor['name'] = name;
		script_vendor.drinkVendor['pos'] = {};
		script_vendor.drinkVendor['pos']['x'], script_vendor.drinkVendor['pos']['y'], script_vendor.drinkVendor['pos']['z'] = GetTarget():GetPosition();
		DEFAULT_CHAT_FRAME:AddMessage('Drink Vendor Set...');
		if (script_vendor.sellVendor == 0) then
			script_vendorMenu:setSellVendor();
		end
	else
		DEFAULT_CHAT_FRAME:AddMessage('Target A Vendor...');
	end
end

function script_vendorMenu:setArrowVendor()
	if (GetTarget() ~= nil and GetTarget() ~= 0) then
		local name, realm = UnitName("target");
		script_vendor.arrowVendor = nil;
		script_vendor.arrowVendor = {};
		script_vendor.arrowVendor['name'] = name;
		script_vendor.arrowVendor['pos'] = {};
		script_vendor.arrowVendor['pos']['x'], script_vendor.arrowVendor['pos']['y'], script_vendor.arrowVendor['pos']['z'] = GetTarget():GetPosition();
		DEFAULT_CHAT_FRAME:AddMessage('Arrow Vendor Set...');
		if (script_vendor.sellVendor == 0) then
			script_vendorMenu:setSellVendor();
		end
	else
		DEFAULT_CHAT_FRAME:AddMessage('Target A Vendor...');
	end
end

function script_vendorMenu:setBulletVendor()
	if (GetTarget() ~= nil and GetTarget() ~= 0) then
		local name, realm = UnitName("target");
		script_vendor.bulletVendor = nil;
		script_vendor.bulletVendor = {};
		script_vendor.bulletVendor['name'] = name;
		script_vendor.bulletVendor['pos'] = {};
		script_vendor.bulletVendor['pos']['x'], script_vendor.bulletVendor['pos']['y'], script_vendor.bulletVendor['pos']['z'] = GetTarget():GetPosition();
		DEFAULT_CHAT_FRAME:AddMessage('Bullet vendor set...');
		if (script_vendor.sellVendor == 0) then
			script_vendorMenu:setSellVendor();
		end
	else
		DEFAULT_CHAT_FRAME:AddMessage('No vendor targeted...');
	end
end

function script_vendorMenu:checkVendor(useMana)

	local hasFood = HasItem(script_vendor.foodName);
	local hasDrink = HasItem(script_vendor.drinkName);
	
	if (script_vendor.dontBuyTime > GetTimeEX()) then
		return false;
	end

	if (not hasDrink and script_vendor.drinkVendor ~= 0 and useMana) then
		script_vendor:buy(script_vendor.drinkName, script_vendor.drinkNr, false, true, false, false);
		return true;
		
	end

	if (not hasFood and script_vendor.foodVendor ~= 0) then
		script_vendor:buy(script_vendor.foodName, script_vendor.foodNr, true, false, false, false);
		return true;
	end

	return false;
end

function script_vendorMenu:getInfo()
	if (not script_vendor.isSetup) then
		script_vendor:setup();
	end
	if (script_vendor.sellEpic) then
		return 'Unique keep items: ' .. script_vendor.keepNum-1 .. '. Sell: Epic items.';
	elseif (script_vendor.sellRare) then
		return 'Unique keep items: ' .. script_vendor.keepNum-1 .. '.Sell: Rare items.';
	elseif (script_vendor.sellUncommon) then
		return 'Unique keep items: ' .. script_vendor.keepNum-1 .. '. Sell: Uncommon items.';
	elseif (script_vendor.sellCommon) then
		return 'Unique keep items: ' .. script_vendor.keepNum-1 .. '. Sell: Common items.';
	elseif (script_vendor.sellPoor) then
		return 'Unique keep items: ' .. script_vendor.keepNum-1 .. '. Sell: Poor items.';
	else
		return 'Unique keep items: ' .. script_vendor.keepNum-1 .. '. Sell: Nothing.';
	end
end

function script_vendorMenu:sellLogic()
	script_vendor.message =	"Selling to vendor...";

	-- Update sell quality rule
	script_vendor:setSellQuality(script_vendor.sellPoor, script_vendor.sellCommon, script_vendor.sellUncommon, script_vendor.sellRare, script_vendor.sellEpic);

	--reset new target time for blacklisting
		script_grind.newTargetTime = GetTimeEX();
		script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);

	for i = script_vendor.currentBag,4 do 
		for y=script_vendor.currentSlot,GetContainerNumSlots(i) do 

			script_vendor.message = 'Selling, checking in bag: ' .. i ..' and slot ' .. y .. '...';
			
			-- At the last slot change status to idle again (sell routine done)
			if (i == 4 and y == GetContainerNumSlots(i)) then
				script_grind.bagsFull = false;
				script_vendor.message = 'Finished selling...';
				script_vendor.status = 0; -- set status back to idle
				ClearTarget();
				script_vendor.currentSlot = 0;
				script_vendor.currentBag = 0;
			end
					

			-- Increase the slotID/BagID
			if (script_vendor.currentSlot == GetContainerNumSlots(i)) then
				script_vendor.currentSlot = 0;
				script_vendor.currentBag = script_vendor.currentBag + 1;
			else
				script_vendor.currentSlot = script_vendor.currentSlot + 1;
			end

			if (GetContainerItemLink(i,y) ~= nil) then
				_,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
				itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
   				itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
				if (not script_vendor:keepItem(itemName) and itemRarity <= script_vendor.sellQuality
					and itemName ~= script_vendor.foodName and itemName ~= script_vendor.drinkName) then
					UseContainerItem(i,y);
				end
			end

			return true;
		end 
	end
end