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
		or GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > 20) then
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
	if(GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) <= script_grind.nextToNodeDist) then 
		script_nav.lastnavIndex = script_nav.lastnavIndex + 1;
		if (GetPathSize(5) <= script_nav.lastnavIndex) then
			script_nav.lastnavIndex = GetPathSize(5);
		end
	end
	if (not IsMoving()) and ((_lx - _ix)^2 < 1) then
		GeneratePath(_lx, _ly, _lz, _ix, _iy, _iz);
	end

	if (GetTimeEX() > self.waitTimer) then
			if (GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > script_grind.nextToNodeDist*3) then	
				GeneratePath(_lx, _ly, _lz, _lx, _ly, _lz);
			--return "Generating a new path...";
		end
	end

	if (self.waitTimer > GetTimeEX()) then
		return;
	end

	local mX, mY, mZ = GetLocalPlayer():GetPosition();

	if (not script_unstuck:pathClearAuto(2)) then
		script_unstuck:unstuck();
	end

	if (IsMoving()) then
		if (script_grind.nextToNodeDist < 6) then
			self.waitTimer = GetTimeEX() + ((script_grind.nextToNodeDist) + (GetDistance3D(mX, mY, mZ ,_lx, _ly, _lz))*1000);
		end	-- Move to the next destination in the path
	end
	
	Move(_ix, _iy, _iz);

	if (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) and (script_grind.hotspotReached) and (script_vendor:getStatus() == 0) then
		script_grind.message = "Moving To Target NavEX - " ..math.floor(script_grind.enemyObj:GetDistance()).. " (yd) "..script_grind.enemyObj:GetUnitName().. "";
	else
		--script_grind.message = "Moving to target... Nav EX";
		return true 
	end
return false;

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

		--if (not IsPathLoaded(5)) then
		--	if (not IsMoving()) and (GetLocalPlayer():GetUnitsTarget() ~= 0) then
		--		local x, y, z = GetLocalPlayer():GetUnitsTarget():GetPosition();
		--		Move(x, y, z);
		--		return "NavEX - we are stuck out of navmap boundary";
		--	end
		--return "Generating path...";
		--end

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
		-- cannot find a path node so it will try to walk as far as needed to find one
		-- this can be tested from orgrimmar trying to walk to the west of barrens
	if (GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) > 45) then
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

function script_navEX:moveFallback(x, y, z)
    -- Prevent execution during casting/channeling or if waitTimer is active
    if self.waitTimer > GetTimeEX() or IsCasting() or IsChanneling() then
        return false
    end

    local localObj = GetLocalPlayer()
    if localObj:IsDead() then
        StopMoving()
        return false
    end

    -- Current player position
    local px, py, pz = localObj:GetPosition()
    local dist = GetDistance3D(px, py, pz, x, y, z)

    -- If close enough, move directly
    if dist < 2 then
        Move(x, y, z)
        self.waitTimer = GetTimeEX() + 50
        return true
    end

    -- Configuration
    local clearance = 2.0 -- Width around obstacles (yards)
    local maxRetries = 5 -- Max attempts to find clear path
    local stepDistance = 5.0 -- Distance to check ahead
    local maxAngle = math.rad(45) -- Max angle to try for path deviation

    -- Helper function to check if path is clear
    local function isPathClear(startX, startY, startZ, endX, endY, endZ)
        local hit, hitX, hitY, hitZ = Raycast(startX, startY, startZ, endX, endY, endZ)
        return not hit
    end

    -- Calculate direction vector to target
    local dx = x - px
    local dy = y - py
    local dz = z - pz
    local length = math.sqrt(dx^2 + dy^2 + dz^2)
    if length == 0 then
        return false
    end
    dx, dy, dz = dx/length, dy/length, dz/length

    -- Try direct path first
    if isPathClear(px, py, pz, x, y, z) then
        Move(x, y, z)
        self.waitTimer = GetTimeEX() + 50
        return true
    end

    -- Try alternative paths
    for i = 1, maxRetries do
        -- Ensure i is an integer
        i = math.floor(i)
        -- Calculate angle for this attempt (spreading out in a cone)
        local angle = maxAngle * (i / maxRetries) * (math.floor(i/2)*2 == i and 1 or -1)
        
        -- Rotate direction vector
        local sinA, cosA = math.sin(angle), math.cos(angle)
        local newDx = dx * cosA - dy * sinA
        local newDy = dx * sinA + dy * cosA
        local newDz = dz

        -- Calculate intermediate point with clearance
        local midX = px + newDx * stepDistance
        local midY = py + newDy * stepDistance
        local midZ = pz + newDz * stepDistance

        -- Check if path to intermediate point is clear
        if isPathClear(px, py, pz, midX, midY, midZ) then
            -- Verify path from intermediate to target
            if isPathClear(midX, midY, midZ, x, y, z) then
                Move(midX, midY, midZ)
                self.waitTimer = GetTimeEX() + 50
                return true
            else
                -- Try wider path by increasing clearance
                local widerX = midX + newDy * clearance
                local widerY = midY - newDx * clearance
                local widerZ = midZ
                if isPathClear(px, py, pz, widerX, widerY, widerZ) and 
                   isPathClear(widerX, widerY, widerZ, x, y, z) then
                    Move(widerX, widerY, widerZ)
                    self.waitTimer = GetTimeEX() + 50
                    return true
                end
                -- Try other side
                widerX = midX - newDy * clearance
                widerY = midY + newDx * clearance
                if isPathClear(px, py, pz, widerX, widerY, widerZ) and 
                   isPathClear(widerX, widerY, widerZ, x, y, z) then
                    Move(widerX, widerY, widerZ)
                    self.waitTimer = GetTimeEX() + 50
                    return true
                end
            end
        end
    end

    -- If no clear path found, stop moving and log
    StopMoving()
    return false
end