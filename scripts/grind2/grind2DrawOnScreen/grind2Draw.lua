grind2Draw = {

	isSetup = false,

	}

--[[

	EVERYTHING RUNS CONTINIOUSLY HERE THROUGH DLL SETUP

]]

function grind2Draw:setup()

	self.isSetup = true;
end

function grind2Draw:run()

	if not self.isSetup then
		grind2Draw:setup();
	end

	-- draw units on screen
	grind2DrawUnitData:drawUnitsOnScreen();

	-- draw aggro circles
	if grind2DrawAggroCircles.drawAggroCircles then

		grind2DrawAggroCircles:run(grind2DrawAggroCircles.circleRange);
	end

end