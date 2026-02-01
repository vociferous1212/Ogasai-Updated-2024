grind2Nav = {



}

script_nav = {
	useNavMesh = true,
	nextNavNodeDistance = 3.9, -- for mobs and loot
	nextPathNodeDistance = 3.9, -- for walking paths
	lastPathIndex = 0,
	navPosition = {},
	navPathPosition = {},
	lastnavIndex = 1,
	lastpathnavIndex = 0,
	navPath = nil,
	savedLocations = {},
	numSavedLocation = 0,
	currentGoToLocation = 0,
	currentHotSpotX = 0,
	currentHotSpotY = 0,
	currentHotSpotZ = 0,
	currentHotSpotName = 0,
	hotSpotDist = 0,
	drawNav = true,
}

function script_nav:setup()
end

function script_nav:drawPath()
	local firstIndex = 0;
	local mx, my, mz = GetLocalPlayer():GetPosition();
	if (IsPathLoaded(5)) then
		if (self.drawNav) then
			firstIndex = self.lastpathnavIndex;
		else
			firstIndex = self.lastnavIndex;
		end
		if (self.lastnavIndex-1 <= GetPathSize(5)-1) then
			for index = firstIndex, GetPathSize(5) - 2 do
				local _x, _y, _z = GetPathPositionAtIndex(5, index);
				local _xx, _yy, _zz = GetPathPositionAtIndex(5, index+1);
				local _tX, _tY, onScreen = WorldToScreen(_x, _y, _z);
				local _tXX, _tYY, onScreens = WorldToScreen(_xx, _yy, _zz);
				if(onScreen and onScreens) then
					DrawLine(_tX, _tY, _tXX, _tYY, 255, 255, 0, 1);
					if (GetDistance3D(mx, my, mz, _xx, _yy, _zz) < 100) then
						script_aggro:DrawCircles(_x, _y, _z, 0.2);
						script_aggro:DrawCircles(_xx, _yy, _zz, 0.2);
					end
				end
			end
		end
	end
end