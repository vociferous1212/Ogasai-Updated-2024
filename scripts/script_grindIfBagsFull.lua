script_grindIfBagsFull = {}

function script_grindIfBagsFull:checkBagsIfTheyAreFull()

-- Check bags if they are full
	if (not HasSpell("Auto Shot")) then
		local inventoryFull = true;
		for i = 1, 5 do 
			if (i ~= 0) then 
				for y=1,GetContainerNumSlots(i-1) do 
					local texture, itemCount, locked, quality, readable = GetContainerItemInfo(i-1,y);
					if (itemCount == 0 or itemCount == nil) then 
						inventoryFull = false; 
					end 
				end
			end 
		end 
	
		-- Tell the grinder we cant loot
		if (inventoryFull) then
			script_grind.bagsFull = true;
		end
		if (not inventoryFull) then
			script_grind.bagsFull = false;
		end
	elseif HasSpell("Auto Shot") then 
		local inventoryFull = true;

		-- skip slot 5, it's a quiver
		for i = 1, 4 do 
			if (i ~= 0) then 
				for y=1,GetContainerNumSlots(i-1) do 
					local texture, itemCount, locked, quality, readable = GetContainerItemInfo(i-1,y);
					if (itemCount == 0 or itemCount == nil) then 
						inventoryFull = false; 
					end 
				end
			end 
		end 
	
		-- Tell the grinder we cant loot
		if (inventoryFull) then
			script_grind.bagsFull = true;
		end
		if (not inventoryFull) then
			script_grind.bagsFull = false;
		end
	end
end

function script_grindIfBagsFull:ifBagsFull()

	-- if bags are full
		if (AreBagsFull() or script_grind.bagsFull or script_hunter.bagsFull) and not script_grind.useVendor
		and not IsInCombat()
		
		then
			
			if script_grind.useVendor then

				script_vendor:sell();

				script_grind.message = "Running the vendor routine: sell..."; 

			return true;

			elseif (script_grind.hsWhenFull and HasItem("Hearthstone")) then

			--	script_vendor:removeShapeShift();
				script_grind.message = 'Inventory is full, using Hearthstone...';

				if (IsMounted()) then DisMount(); script_grind.waitTimer = GetTimeEX()+3000;
					return true;
				end

				if (UseItem("Hearthstone")) then
					script_grind.waitTimer = GetTimeEX() + 15000;
					return true;
				end

				if (script_grind.logoutOnHearth) then
					Logout();
				end

			return true;

			elseif (script_grind.stopWhenFull) then
				script_grind.message = 'Bags are full, stopping...';
				Exit(); StopBot();

			return true;

			else	

				

			end

		return true;
		end
end