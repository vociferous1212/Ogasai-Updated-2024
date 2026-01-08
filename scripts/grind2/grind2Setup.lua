grind2Setup = {

	isSetup = false

}

function grind2Setup:run()

	if not self.isSetup then

		-- set all timers to current time at each reload
		grind2.timer = GetTimeEX();
		grind2.obtainNewTargetTimer = GetTimeEX();

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


		if GetMyClass() == "WARRIOR" or GetMyClass() == "ROGUE" then
			grind2.restMana = 0;
		end

		if GetLocalPlayer():GetLevel() < 6 then
			grind2SafePull.skipSafePull = true;
		end


	end


	self.isSetup = true;
end