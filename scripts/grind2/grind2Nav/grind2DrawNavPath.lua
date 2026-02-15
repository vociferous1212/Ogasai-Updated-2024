grind2DrawNavPath = {

}

function grind2DrawNavPath:drawPath()

	local firstIndex = 0;

	local mx, my, mz = Player():GetPosition();

	--if (IsPathLoaded(5) or IsPathLoaded(4) or IsPathLoaded(3) or IsPathLoaded(2) or IsPathLoaded(1) or IsPathLoaded(0)) then

			firstIndex = grind2MoveToTarget.lastnavIndex;

			-- if we are moving and don't do path node in previous index
		if IsMoving() and (firstIndex - 1.5 <= GetPathSize(5)) then

			-- -2 or else that path 'tears' off the screen into the sky... ?? why?
			for index = firstIndex, GetPathSize(5) -5 do

				local _x, _y, _z = GetPathPositionAtIndex(5, index);

				local _xx, _yy, _zz = GetPathPositionAtIndex(5, index+1);

				local _tX, _tY, onScreen = WorldToScreen(_x, _y, _z - 1);

				local _tXX, _tYY, onScreens = WorldToScreen(_xx, _yy, _zz - 1);

				if(onScreen and onScreens) then

					if (GetDistance3D(mx, my, mz, _xx, _yy, _zz) <= 100) then
					
						DrawLine(_tX, _tY, _tXX, _tYY, 255, 255, 0, 0);
					end

					if (GetDistance3D(mx, my, mz, _xx, _yy, _zz) <= 20) then

						--script_aggro:DrawCircles(_x, _y, _z, 0.1);

						script_aggro:DrawCircles(_xx, _yy, _zz - 1, .3);
					end
				end
			end
		end
	--end
return false;
end