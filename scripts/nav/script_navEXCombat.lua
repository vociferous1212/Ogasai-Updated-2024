script_navEXCombat = {	waitTimer = 0,
						moveTimer = 0,

}

function script_navEXCombat:moveToTarget(localObj, _x, _y, _z) -- use when moving to moving targets

	-- set the script to run faster while moving -- fall back redundancy
	if not script_grind.adjustTickRate then
		script_grind.tickRate = 135;
	end

	-- Please load and enable the nav mesh
	if (not IsUsingNavmesh() and script_nav.useNavMesh) then
		return "Please load and and enable the nav mesh...";
	end

	script_nav.drawNav = false;

	-- set local player variable
	localObj = GetLocalPlayer();

	-- get our current position
	local _lx, _ly, _lz = localObj:GetPosition();

	-- get our position in the navmesh path
	local _ix, _iy, _iz = GetPathPositionAtIndex(5, script_nav.lastnavIndex);	

	-- If the target moves more than combat script range by yards then make a new path
	if GetDistance3D(_x, _y, _z, script_nav.navPosition['x'], script_nav.navPosition['y'], script_nav.navPosition['z']) > 2
	or GetDistance3D(_x, _y, _z, script_nav.navPosition['x'], script_nav.navPosition['y'], script_nav.navPosition['z']) > script_grind.combatScriptRange
	or GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > script_grind.nextToNodeDist*3
	or IsNodeBlacklisted(_ix, _iy, _iz, script_grind.nextToNodeDist)
	then

		script_nav.navPosition['x'] = _x;

		script_nav.navPosition['y'] = _y;

		script_nav.navPosition['z'] = _z;

		GeneratePath(_lx, _ly, _lz, _x, _y, _z);

		script_nav.lastnavIndex = 1.5; -- start at index 1, index 0 is our position

	end

	if (not IsPathLoaded(5)) then

		return "Generating path...";
	end



	-- If we are not swimming and are close to the next path node, increase our nav node index
	if not script_grindAreWeSwimming:areWeSwimming() and (GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) <= script_grind.nextToNodeDist) then 
		script_nav.lastnavIndex = script_nav.lastnavIndex + 1;
		if (GetPathSize(5) <= script_nav.lastnavIndex + 2) then
			script_nav.lastnavIndex = GetPathSize(5) + 2;
		end
	end

	-- If we are swimming then our new path node is always changing
	if script_grindAreWeSwimming:areWeSwimming() and (math.sqrt((_lx - _ix)^2 + (_ly - _iy)^2) <= script_grind.nextToNodeDist) then 
		script_nav.lastnavIndex = script_nav.lastnavIndex + 1;
		if (GetPathSize(5) <= script_nav.lastnavIndex) then
			script_nav.lastnavIndex = GetPathSize(5);
		end
	end

	-- if we are not moving, and not swimming, try to generate a new path
	if (not IsMoving()) and not script_grindAreWeSwimming:areWeSwimming() then
		GeneratePath(_lx, _ly, _lz, _ix, _iy, _iz);
	end

	-- time based distance to node check if we are not swimming
	if not script_grindAreWeSwimming:areWeSwimming() and (GetTimeEX() > self.waitTimer) then

		-- normal speed is about 7. cat form/wolf form with increased speed is between 9 and 9.5
		local var = 1.8;
		local currentSpeed, maxSpeed = GetLocalPlayer():GetSpeed();
		if maxSpeed == 7 or maxSpeed < 9 then var = 2;
		elseif (maxSpeed > 9 and maxSpeed < 9.5) or IsMounted() then var = 3; end

		-- if we are moving and a new path can be made, uphill or downhill, then generate a new path
		if (GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > script_grind.nextToNodeDist*var) then	
			GeneratePath(_lx, _ly, _lz, _lx, _ly, _lz);
			script_nav.lastnavIndex = script_nav.lastnavIndex + 1
		end

	-- if we are swimming then
	elseif (GetTimeEX() > self.waitTimer) and script_grindAreWeSwimming:areWeSwimming() then
	
		-- udpate players position
		_, _, _iz = GetLocalPlayer():GetPosition();

		-- players Z location is go to Z location - don't swim downwards in water
		if (GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > 1) then	

			GeneratePath(_lx, _ly, _lz, _lx, _ly, _lz);
		end
	end
	-- move to next path node
	Move(_ix, _iy, _iz);
	self.waitTimer = GetTimeEX() + 75;
	self.moveTimer = GetTimeEX() + 300;
end