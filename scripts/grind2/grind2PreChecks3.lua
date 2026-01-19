grind2PreChecks3 = {

}

function grind2PreChecks3:run()

-- check if bags are full
	grind2AreBagsFull:checkIfBagsAreFull()

-- if bags are full then do vendor
	if (AreBagsFull() or grind2.bagsAreFull or script_vendor.status == 2) and not IsInCombat() and grind2.useVendor then
				
			-- sell to vendor
			script_vendor:sell();

			grind2.grinderMessage = "Running the vendor routine: sell..."; 

			if not IsMoving() then grind2:setTimer(200); end

			-- return if we still need to sell
			if script_vendor.status == 2 then return true; end

		return true;
	end

	-- repair
	if script_vendor.status == 3 then
		script_vendor:repair();
		return true;
	end

	-- refill drink/food

	-- buy ammo hunter

end