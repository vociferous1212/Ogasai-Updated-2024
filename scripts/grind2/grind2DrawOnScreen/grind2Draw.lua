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
	
	local tX, tY, onScreen = WorldToScreen(Player():GetPosition());

-- show paranoia texts
	if grind2.useParanoia and not grind2.pause then
		if grind2Paranoia.paranoidTargetGUID ~= nil and grind2Paranoia.paranoidTargetGUID ~= 0 then
			if grind2Paranoia.paranoidTargetName ~= nil then
				if grind2Paranoia.paranoidTargetDistance ~= nil and grind2Paranoia.paranoidTargetDistance ~= 0 then
					-- for some reason bot is randomly closing when trying to display this data?
					local name = grind2Paranoia.paranoidTargetName;
					local distance = grind2Paranoia.paranoidTargetDistance;
					DrawText("Player in range - "..name.." | "..math.floor(distance).." (yd)", tX- 65, tY-120, 0, 255, 0);
					DrawText("Timer - "..math.floor((GetTimeEX() - grind2Paranoia.paranoidTime) + grind2Paranoia.paranoidSetTime) / 1000, tX - 65, tY - 100, 0, 255, 0);
				end
			end
		end
	end

-- draw nav path
	if grind2DrawDataMenu.drawPath and not grind2.pause then

		grind2DrawNavPath:drawPath()
	end

end