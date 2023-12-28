script_followMoveToTarget = {

	navFunctionsLoaded = include("scripts\\script_nav.lua"),
	navFunctions2Loaded = include("scripts\\script_navEX.lua"),
	lastNavIndex = 0,
}


function script_followMoveToTarget:moveToTarget(localObj, _x, _y, _z) -- use when moving to moving targets

	script_follow.drawNav = true;

	-- Fetch our current position
	localObj = GetLocalPlayer();
	local _lx, _ly, _lz = localObj:GetPosition();

	local _ix, _iy, _iz = GetPathPositionAtIndex(5, self.lastnavIndex);	

	-- If the target moves more than 5 yard then make a new path
	if(GetDistance3D(_x, _y, _z, script_nav.navPosition['x'], script_nav.navPosition['y'], script_nav.navPosition['z']) > 5
		or GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > 25) then
		script_nav.navPosition['x'] = _x;
		script_nav.navPosition['y'] = _y;
		script_nav.navPosition['z'] = _z;
		GeneratePath(_lx, _ly, _lz, _x, _y, _z);
		self.lastnavIndex = 1; -- start at index 1, index 0 is our position
		script_follow:setWaitTimer(135);
	end	

	if (not IsPathLoaded(5)) then
		return "Generating path...";
	end

	-- Get the current path node's coordinates
	_ix, _iy, _iz = GetPathPositionAtIndex(5, self.lastnavIndex);

	-- If we are close to the next path node, increase our nav node index
	if(GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) < script_nav.nextNavNodeDistance) then
		self.lastnavIndex = 1 + self.lastnavIndex;		
		if (GetPathSize(5) <= self.lastnavIndex) then
			self.lastnavIndex = GetPathSize(5);
		end
	end

	-- Check: If move to coords are too far away, something wrong, dont move... BUT WHY ?!
	if (GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > 25) then
		GeneratePath(_lx, _ly, _lz, _lx, _ly, _lz);
		return "Generating a new path...";
	end

	-- Move to the next destination in the path
	Move(_ix, _iy, _iz);

	return "Moving to target...";
end