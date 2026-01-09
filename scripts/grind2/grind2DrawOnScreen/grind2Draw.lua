grind2Draw = {

}

--[[

	EVERYTHING RUNS CONTINIOUSLY HERE THROUGH DLL SETUP

]]

function grind2Draw:run()



-- draw units on screen
	grind2DrawUnitData:drawUnitsOnScreen();

-- show grinder messages
	if grind2DrawDataMenu.drawMessages then

		grind2Messages:run()
	end

-- draw aggro circles
	if grind2DrawAggroCircles.drawAggroCircles then

		grind2DrawAggroCircles:run(grind2DrawAggroCircles.circleRange);
	end

-- draw gather and chest nodes
	if grind2DrawDataMenu.drawObjects then

		-- should we draw chest nodes
		if grind2DrawDataMenu.drawChestNodes then

			script_gather:drawChestNodes();
		end

		-- should we draw gather nodes
		if grind2DrawDataMenu.drawGatherNodes then

			script_gather:drawGatherNodes();
		end
	end


end