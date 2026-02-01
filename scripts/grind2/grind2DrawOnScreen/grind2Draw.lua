grind2Draw = {

}

--[[

	EVERYTHING RUNS CONTINIOUSLY HERE THROUGH DLL SETUP

]]

function grind2Draw:run()


-- draw units on screen
	grind2DrawUnitData:drawUnitsOnScreen();


-- show grinder messages
	if grind2DrawDataMenu.drawMessages and not grind2.pause then

		grind2Messages:run()
	end


-- draw aggro circles
	if grind2DrawAggroCircles.drawAggroCircles then

		grind2DrawAggroCircles:run(grind2DrawAggroCircles.circleRange);
	end


-- draw gather and chest nodes
	if grind2DrawDataMenu.drawObjects then

		-- should we draw chest nodes
		-- don't double up on chests. something wrong in gatherer
		if grind2DrawDataMenu.drawChestNodes and not grind2DrawDataMenu.drawGatherNodes then

			script_gather:drawChestNodes();
		end

		-- should we draw gather nodes
		if grind2DrawDataMenu.drawGatherNodes then

			script_gather:drawGatherNodes();
		end
	end

-- draw paranoid target over player position
	if grind2.useParanoia then
		if grind2Paranoia.paranoidTarget ~= nil and grind2Paranoia.paranoidTarget ~= 0 and grind2Paranoia.paranoidTargetGUID ~= nil and grind2Paranoia.paranoidTargetGUID ~= 0 then
			if grind2Paranoia.paranoidTargetName ~= nil and grind2Paranoia.paranoidTargetDistance ~= nil and grind2Paranoia.paranoidTargetDistance ~= 0 then
				local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition());
				DrawText("Player in range! | " .. grind2Paranoia.paranoidTarget:GetUnitName().. " | "..math.floor(grind2Paranoia.paranoidTarget:GetDistance()).." (yd)", tX - 75, tY - 100, 255, 255, 0);
			end
		end
	end

end