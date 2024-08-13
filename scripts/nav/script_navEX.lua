script_navEX = {

	waitTimer = 0,

}

function script_navEX:moveToTarget(localObj, _x, _y, _z) -- use when moving to moving targets

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

	-- If the target moves more than 2 yard then make a new path
	if(GetDistance3D(_x, _y, _z, script_nav.navPosition['x'], script_nav.navPosition['y'], script_nav.navPosition['z']) > 2
		or GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > 25) then
		script_nav.navPosition['x'] = _x;
		script_nav.navPosition['y'] = _y;
		script_nav.navPosition['z'] = _z;
		GeneratePath(_lx, _ly, _lz, _x, _y, _z);
		script_nav.lastnavIndex = 1; -- start at index 1, index 0 is our position
		--script_grind:setWaitTimer(135);
	end

	if (not IsPathLoaded(5)) then
		return "Generating path...";
	end

	-- Get the current path node's coordinates
	_ix, _iy, _iz = GetPathPositionAtIndex(5, script_nav.lastnavIndex);

	-- If we are close to the next path node, increase our nav node index
	if(GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) <= script_grind.nextToNodeDist+1) then 
		script_nav.lastnavIndex = script_nav.lastnavIndex + 1;
		if (GetPathSize(5) <= script_nav.lastnavIndex) then
			script_nav.lastnavIndex = GetPathSize(5);
		end
	end

	-- Check: If move to coords are too far away, something wrong, dont move... BUT WHY ?!
	if (GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > script_grind.nextToNodeDist*2.3) then
		GeneratePath(_lx, _ly, _lz, _lx, _ly, _lz);
		return "Generating a new path...";
	end

	if (self.waitTimer > GetTimeEX()) then
		return;
	end

	local mX, mY, mZ = GetLocalPlayer():GetPosition();

	if (IsMoving()) then
		if (script_grind.nextToNodeDist < 6) then
			self.waitTimer = GetTimeEX() + ((script_grind.nextToNodeDist*2) + (GetDistance3D(mX, mY, mZ ,_lx, _ly, _lz))*1000);
		end	-- Move to the next destination in the path
	end
		
	Move(_ix, _iy, _iz);

	if (IsMoving()) then
		script_unstuck:unstuck();
	end

	if (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) and (script_grind.hotspotReached) and (script_vendor:getStatus() == 0) then
		script_grind.message = "Moving To Target NavEX - " ..math.floor(script_grind.enemyObj:GetDistance()).. " (yd) "..script_grind.enemyObj:GetUnitName().. "";
	else
		return "Moving to target... Nav EX";
	end

end

function script_navEX:resetPath()
	script_nav.lastnavIndex = 0;
	script_nav.navPosition['x'], script_nav.navPosition['y'], script_nav.navPosition['z'] = 0, 0, 0;
	local x, y, z = GetLocalPlayer():GetPosition();
	GeneratePath(x, y, z, x+1, y+1, z);
end

function script_navEX:moveToLoot(localObj, _x, _y, _z) -- use when moving to moving targets

	-- Please load and enable the nav mesh
	if (not IsUsingNavmesh() and script_nav.useNavMesh) then
		return "Please load and and enable the nav mesh...";
	end

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
		--script_grind:setWaitTimer(135);
	end

	if (not IsPathLoaded(5)) then
		if (not IsMoving()) and (GetLocalPlayer():GetUnitsTarget() ~= 0) then
			local x, y, z = GetLocalPlayer():GetUnitsTarget():GetPosition();
			Move(x, y, z);
			return "NavEX - we are stuck out of navmap boundary";
		end
		return "Generating path...";
	end

	-- Get the current path node's coordinates
	_ix, _iy, _iz = GetPathPositionAtIndex(5, script_nav.lastnavIndex);

	-- If we are close to the next path node, increase our nav node index
	if(GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) < script_nav.nextNavNodeDistance) then
		script_nav.lastnavIndex = script_nav.lastnavIndex + 1;		
		if (GetPathSize(5) <= script_nav.lastnavIndex) then
			script_nav.lastnavIndex = GetPathSize(5);
		end
	end

	-- Check: If move to coords are too far away, something wrong, dont move... BUT WHY ?!
	if (GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > 25) then
		GeneratePath(_lx, _ly, _lz, _lx, _ly, _lz);
		return "Generating a new path...";
	end

	-- Move to the next destination in the path
	Move(_ix, _iy, _iz);

	if (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) and (script_grind.hotspotReached) and (script_vendor:getStatus() == 0) then
		script_grind.message = "Moving To Target NavEX - " ..math.floor(script_grind.enemyObj:GetDistance()).. " (yd) "..script_grind.enemyObj:GetUnitName().. "";
	else
		return "Moving to target... Nav EX";
	end

end