grind2Draw = {

}

--[[

	EVERYTHING RUNS CONTINIOUSLY HERE THROUGH DLL SETUP

]]

function grind2Draw:run()

	-- draw units on screen
	grind2DrawUnitData:drawUnitsOnScreen();

	-- show grinder messages
	if grind2DisplayOptions.drawMessages then

		grind2Messages:run()
	end

	-- draw aggro circles
	if grind2DrawAggroCircles.drawAggroCircles then

		grind2DrawAggroCircles:run(grind2DrawAggroCircles.circleRange);
	end

end