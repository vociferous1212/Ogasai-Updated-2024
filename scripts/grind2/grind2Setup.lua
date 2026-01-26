grind2Setup = {

	isSetup = false

}

function grind2Setup:run()

	if not self.isSetup then

		-- check if bags are full
		grind2AreBagsFull:checkIfBagsAreFull()

		--TEMPORARY
		script_helper:setup()
		--

		hotspotDB:setup()

		-- set all timers to current time at each reload
		grind2.timer = GetTimeEX();
		grind2.obtainNewTargetTimer = GetTimeEX();

		vendorDB:setup()
		vendorDB:loadDBVendors();
		script_vendor:setup();


		-- setup draw on screen folder
		-- nothing here!

		-- setup helper folder
		grind2Bandage:setup();
		grind2Food:setup();
		grind2Mounts:setup();
		grind2OpenGates:setup();
		grind2Potions:setup();
		grind2Water:setup();


		-- setup menu folder
		grind2Menu:setup()


		-- setup talents folder
		grind2SelectTalents:setup()

		-- setup gatherer
		script_gather:setup()

		-- setup combat scripts
		script_hunter:setup();
		script_mage:setup();
		script_paladin:setup();
		script_priest:setup();
		script_druid:setup();
		script_warrior:setup();
		script_rogue:setup();
		script_warlock:setup();
		script_shaman:setup();

		if GetMyClass() == "WARRIOR" or GetMyClass() == "ROGUE" then
			grind2.restMana = 0;
		end

		if GetLocalPlayer():GetLevel() < 6 then
			grind2SafePull.skipSafePull = true;
		end

		grind2.startingMoney = GetMoney();
		grind2.currentMoney = GetMoney();

		if GetRealmName() == "Permadeath - EU" then 
		grind2FleeCombat.fleeWithAdds = true;
	end



	end
	self.isSetup = true;
end