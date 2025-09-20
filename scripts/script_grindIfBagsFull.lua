script_grindIfBagsFull = {}

function script_grindIfBagsFull:checkBagsIfTheyAreFull()

-- Check bags if they are full

	-- if we are not hunter then check all bag slots
	if (not HasSpell("Auto Shot")) then

		local inventoryFull = true;

		-- check 1-5 bags
		for i = 1, 5 do 

			-- if we have a bag to check
			if (i ~= 0) then 

				-- get container slots of each bag
				for y=1,GetContainerNumSlots(i-1) do 

					-- get container info of each item slot in each bag
					local texture, itemCount, locked, quality, readable = GetContainerItemInfo(i-1,y);
					
					-- count the items in each slot
					if (itemCount == 0 or itemCount == nil) then 

						-- if there is no item then inventory full is false
						inventoryFull = false; 
					end 
				end
			end 
		end 
	
		-- Tell the grinder we can not loot
		if (inventoryFull) then

			script_grind.bagsFull = true;
		end

		-- tell the grinder we can loot
		if (not inventoryFull) then

			script_grind.bagsFull = false;
		end

	-- we are hunter so check bags 1-4 only
	elseif HasSpell("Auto Shot") then 

		local inventoryFull = true;

		-- skip slot 5, it's a quiver
		for i = 1, 4 do 

			-- if we have a bag to check
			if (i ~= 0) then 

				-- get container slots of each bag
				for y=1,GetContainerNumSlots(i-1) do 

					-- get container info of each item slot in each bag
					local texture, itemCount, locked, quality, readable = GetContainerItemInfo(i-1,y);

					-- count the items in each slot
					if (itemCount == 0 or itemCount == nil) then 
										
						-- if there is no item then inventory full is false
						inventoryFull = false; 
					end 
				end
			end 
		end 
	
		-- Tell the grinder we can not loot
		if (inventoryFull) then

			script_grind.bagsFull = true;
		end

		-- tell the grinder we can loot
		if (not inventoryFull) then

			script_grind.bagsFull = false;
		end
	end
end

function script_grindIfBagsFull:ifBagsFull()

-- if bags are full

	-- only if we are not using vendoring then choose to do different things
	if (AreBagsFull() or script_grind.bagsFull or script_hunter.bagsFull) and not script_grind.useVendor
	and not IsInCombat()
		
	then
		
		-- if we checked the checkbox to use vendor then go ahead and sell
		if script_grind.useVendor then

			-- sell to vendor
			script_vendor:sell();

			script_grind.message = "Running the vendor routine: sell..."; 

		return true;

		-- use hearthstone when inventory full
		elseif (script_grind.hsWhenFull and HasItem("Hearthstone")) then

		--	script_vendor:removeShapeShift();
			script_grind.message = 'Inventory is full, using Hearthstone...';

			-- dismount
			if (IsMounted()) then
				DisMount();
				script_grind.waitTimer = GetTimeEX()+3000;
				return true;
			end

			-- use the hearthstone
			if (UseItem("Hearthstone")) then
				script_grind.waitTimer = GetTimeEX() + 15000;
				return true;
			end

			-- logout if checked in menu
			if (script_grind.logoutOnHearth) then
				Logout();
			end

		return true;

		-- else we stop the bot completely when full
		elseif (script_grind.stopWhenFull) then

			script_grind.message = 'Bags are full, stopping...';

			-- stop the bot scripts ( stop button )
			StopBot();

			-- exit the bot ( close the game )
			Exit();
		return true;
		end

	return true;
	end
end