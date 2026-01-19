grind2AreBagsFull = {

}

function grind2AreBagsFull:checkIfBagsAreFull()

	local bagsAreFull = true;

	-- Check bags if they are full

	-- if we are not hunter then check all bag slots
	if (not HasSpell("Auto Shot")) then

		-- check 1-5 bags
		for i = 1, 5 do

			-- if we have a bag to check
			if i ~= 0 then

				-- get container slots of each bag
				for y = 1, GetContainerNumSlots(i - 1) do 

					-- get container info of each item slot in each bag
					local texture, itemCount, locked, quality, readable = GetContainerItemInfo(i - 1, y);
					
					-- count the items in each slot
					if itemCount == 0 or itemCount == nil then

						-- if there is no item then inventory full is false
						bagsAreFull = false;
					end
				end
			end
		end
	
		-- Tell the grinder we can not loot
		if bagsAreFull then

			grind2.bagsAreFull = true;
		end
		if not bagsAreFull then

			grind2.bagsAreFull = false;
		end

	-- we are hunter so check bags 1-4 only
	elseif HasSpell("Auto Shot") then 

		-- skip slot 5, it's a quiver
		for i = 1, 4 do 

			-- if we have a bag to check
			if i ~= 0 then 

				-- get container slots of each bag
				for y = 1, GetContainerNumSlots(i - 1) do 

					-- get container info of each item slot in each bag
					local texture, itemCount, locked, quality, readable = GetContainerItemInfo(i - 1, y);

					-- count the items in each slot
					if itemCount == 0 or itemCount == nil then 
										
						-- if there is no item then inventory full is false
						bagsAreFull = false; 
					end 
				end
			end
		end

		-- Tell the grinder we can not loot
		if bagsAreFull or AreBagsFull() then

			grind2.bagsAreFull = true;
		end
		if not bagsAreFull then

			grind2.bagsAreFull = false;
		end
	end
end