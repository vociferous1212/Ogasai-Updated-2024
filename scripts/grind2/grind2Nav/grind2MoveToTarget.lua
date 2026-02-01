grind2MoveToTarget = {

	nextNavNodeDistance = 5.5,		-- distance to next nav node

	lastPathIndex = -1,				-- last path node

	navPosition = {},				-- current position in nav

	lastnavIndex = 0,				-- last position in nav

	timer = 0,						-- script timer

	message = "idle..."
	

}

function grind2MoveToTarget:run(player, _x, _y, _z)

	if GetLocalPlayer():HasBuff("Aspect of the Cheetah") or IsMounted() or GetLocalPlayer():GetSpeed() >= 8 then
		self.nextNavNodeDistance = 6;
	end

-- set timer
	if self.timer == 0 or self.timer == nil

		then self.timer = GetTimeEX();
	end

-- return for timer or for any reason
	if self.timer > GetTimeEX() then
		return;
	end

	localObj = GetLocalPlayer();

	NavmeshSmooth(self.nextNavNodeDistance/2);

	-- get current position
	local _lx, _ly, _lz = localObj:GetPosition();

	local _ix, _iy, _iz = GetPathPositionAtIndex(5, self.lastnavIndex);	


	-- If the target moves more than 2 yard then make a new path
	if (GetDistance3D(_x, _y, _z, self.navPosition['x'], self.navPosition['y'], self.navPosition['z']) >= 2
		or GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) >= 20) then
		self.navPosition['x'] = _x;
		self.navPosition['y'] = _y;
		self.navPosition['z'] = _z;
		GeneratePath(_lx, _ly, _lz, _x, _y, _z);
		self.lastnavIndex = 1.5; -- start at index 1, index 0 is our position
		self.message = "Generating Path";
	end	
	
	if (not IsPathLoaded(5)) then
		self.timer = GetTimeEX() + 50;
		self.message = "Path is loading";
		return;
	end

	-- Get the current path node's coordinates
	_ix, _iy, _iz = GetPathPositionAtIndex(5, self.lastnavIndex);

	self.message = "Navigating...";

	-- Move to the next destination in the path
	Move(_ix, _iy, _iz);

	-- If we are close to the next path node, increase our nav node index
	if (GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) <= self.nextNavNodeDistance + .5) then
		self.lastnavIndex = 1 + self.lastnavIndex;		
		if (GetPathSize(5) <= self.lastnavIndex) then
			self.lastnavIndex = GetPathSize(5);
		end
	end

	self.timer = GetTimeEX() + 75;

return false;
end