script_navEXCombat = {	waitTimer = 0,

}

function script_navEXCombat:moveToTarget(localObj, _x, _y, _z) -- use when moving to moving targets

	if not script_grind.adjustTickRate then
		script_grind.tickRate = 135;
	end

	local ax, ay, az = GetLocalPlayer():GetPosition();

	-- Please load and enable the nav mesh
	if (not IsUsingNavmesh() and script_nav.useNavMesh) then
		return "Please load and and enable the nav mesh...";
	end

	script_nav.drawNav = false;

	-- Fetch our current position
	localObj = GetLocalPlayer();
	local _lx, _ly, _lz = localObj:GetPosition();

	local _ix, _iy, _iz = GetPathPositionAtIndex(5, script_nav.lastnavIndex);	

	-- If the target moves more than combat script range by yards then make a new path
		-- the intent of this script is to preserve movement elsewhere while limiting the calls to the nav which can crash the game
		-- using a separate script with a separate timer was easier on the nav table than an long if then else statement.
	if (GetDistance3D(_x, _y, _z, script_nav.navPosition['x'], script_nav.navPosition['y'], script_nav.navPosition['z']) > script_grind.combatScriptRange

		or GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > 20) then
		script_nav.navPosition['x'] = _x;
		script_nav.navPosition['y'] = _y;
		script_nav.navPosition['z'] = _z;
		GeneratePath(_lx, _ly, _lz, _x, _y, _z);
		script_nav.lastnavIndex = 1; -- start at index 1, index 0 is our position
		script_grind:setWaitTimer(135);
	end

	if (not IsPathLoaded(5)) then
		return "Generating path...";
	end

	-- Get the current path node's coordinates
	_ix, _iy, _iz = GetPathPositionAtIndex(5, script_nav.lastnavIndex);

	-- If we are close to the next path node, increase our nav node index
	if not script_grindEX:areWeSwimming() and (GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) <= script_grind.nextToNodeDist) then 
		script_nav.lastnavIndex = script_nav.lastnavIndex + 1;
		if (GetPathSize(5) <= script_nav.lastnavIndex) then
			script_nav.lastnavIndex = GetPathSize(5);
		end
	end
	if script_grindEX:areWeSwimming() and (math.sqrt((_lx - _ix)^2 + (_ly - _iy)^2) <= script_grind.nextToNodeDist) then 
		script_nav.lastnavIndex = script_nav.lastnavIndex + 1;
		if (GetPathSize(5) <= script_nav.lastnavIndex) then
			script_nav.lastnavIndex = GetPathSize(5);
		end
	end
	if (not IsMoving()) and ((_lx - _ix)^2 < 2) and not script_grindEX:areWeSwimming() then
		GeneratePath(_lx, _ly, _lz, _ix, _iy, _iz);
	end

	if (GetTimeEX() > self.waitTimer) and not script_grindEX:areWeSwimming() then
		if (GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > script_grind.nextToNodeDist*3) then	
			GeneratePath(_lx, _ly, _lz, _lx, _ly, _lz);
		end
	elseif (GetTimeEX() > self.waitTimer) and script_grindEX:areWeSwimming() then
		-- players Z location is current go to Z
		_, _, _iz = GetLocalPlayer():GetPosition();
		if (GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > 1) then	
			GeneratePath(_lx, _ly, _lz, _lx, _ly, _lz);
		end
	end

	if (self.waitTimer > GetTimeEX()) then
		return;
	end

	local mX, mY, mZ = GetLocalPlayer():GetPosition();
	
	Move(_ix, _iy, _iz);

return false;

end
function script_navEXCombat:moveToVendor(localObj, _x, _y, _z) -- use when moving to moving targets
	script_nav.drawNav = false;
	-- Fetch our current position
	localObj = GetLocalPlayer();
	local _lx, _ly, _lz = localObj:GetPosition();
	local _ix, _iy, _iz = GetPathPositionAtIndex(5, script_nav.lastnavIndex);	
	-- If the target moves more than 2 yard then make a new path
	if(GetDistance3D(_x, _y, _z, script_nav.navPosition['x'], script_nav.navPosition['y'], script_nav.navPosition['z']) > 2
		or GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > 25) then
		script_nav.navPosition['x'] = _x;
		script_nav.navPosition['y'] = _y;
		script_nav.navPosition['z'] = _z;
		GeneratePath(_lx, _ly, _lz, _x, _y, _z);
		script_nav.lastnavIndex = 1; -- start at index 1, index 0 is our position
	end	
	if (not IsPathLoaded(5)) then
		return "Generating path...";
	end
	-- Get the current path node's coordinates
	_ix, _iy, _iz = GetPathPositionAtIndex(5, script_nav.lastnavIndex);
	-- If we are close to the next path node, increase our nav node index
	if(GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) < script_nav.nextNavNodeDistance) then
		script_nav.lastnavIndex = 1 + script_nav.lastnavIndex;		
		if (GetPathSize(5) <= script_nav.lastnavIndex) then
			script_nav.lastnavIndex = GetPathSize(5)-1;
		end
	end
	-- Check: If move to coords are too far away, something wrong, dont move... BUT WHY ?!
	if (GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > 25) then
		GeneratePath(_lx, _ly, _lz, _lx+2, _ly+2, _lz);
		return "Generating a new path...";
	end
	-- Move to the next destination in the path
	Move(_ix, _iy, _iz);
end