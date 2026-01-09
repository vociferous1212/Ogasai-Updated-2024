grind2DrawAggroCircles = {

	circleRange = 55,

	drawAggroCircles = true,

}


function grind2DrawAggroCircles:DrawCircles(pointX, pointY, pointZ, radius, r, g, b) 	-- thx benjamin

	local x = 25;

	local qualityOfCircles = 32;

	-- we will go by radians, not degrees
	local sqrt, sin, cos, PI, theta, points, point = math.sqrt, math.sin, math.cos, math.pi, 0, {}, 0;

	while theta <= 2 * PI do

		point = point + 1 -- get next table slot, starts at 0 

		points[point] = { x = pointX + radius*cos(theta), y = pointY + radius*sin(theta) }

		theta = theta + 2*PI / qualityOfCircles -- get next theta
	end

	-- draw points
	for i = 1, point do

		local firstPoint = i

		local secondPoint = i + 1

		-- do next point
		if firstPoint == point then

			secondPoint = 1
		end

		-- draw points
		if points[firstPoint] and points[secondPoint] then

			local x1, y1, onScreen1 = WorldToScreen(points[firstPoint].x, points[firstPoint].y, pointZ)
			
			local x2, y2, onScreen2 = WorldToScreen(points[secondPoint].x, points[secondPoint].y, pointZ)

			-- make boolean string so i can post it to console
			onScreen1String = tostring(onScreen1);
			
			--ToConsole('x1 inside draw cirlces: ' .. x1 .. 'onScreen1: ' .. onScreen1String .. y1 .. x2 .. y2 .. redVar .. greenVar .. blueVar .. lineThickness);
			if onScreen1 == true and onScreen2 == true then

				DrawLine(x1, y1, x2, y2, r, g, b, 1)
				
			end
		end
	end
end

-- draw the actual aggro circles on the screen based on target and range
function grind2DrawAggroCircles:run(maxRange)

	local countUnitsInRange = 0;

	local i, t = GetFirstObject();

	local localObj = GetLocalPlayer();

	local closestEnemy = 0;

	maxRange = self.circleRange;

	-- run object manager
	while i ~= 0 do
		
		-- acceptable targets
 		if t == 3 and i:GetDistance() < maxRange and not i:IsDead() and i:CanAttack() and not i:IsCritter() and i:GetLevel() ~= 1 then

			-- set conditions
			local aggro = i:GetLevel() - localObj:GetLevel() + 17.3;

			local cx, cy, cz = i:GetPosition();

			local px, py, pz = localObj:GetPosition();

			if cz >= pz + 7 or pz >= cz + 7 and GetDistance3D(cx, cy, cz, px, py, pz) <= 17.3 then
				aggro = i:GetLevel() - localObj:GetLevel() + 16;
			end
		
			-- run draw circles based on target - not targeting me or I am targeting it
			if i:GetUnitsTarget() == 0 or i:GetUnitsTarget() == nil then

				grind2DrawAggroCircles:DrawCircles(cx, cy, cz, aggro, 255, 255, 0);
			end

			-- run draw circles on target - target is targeting me
			if i:GetUnitsTarget() ~= 0 and i:GetUnitsTarget() ~= nil then

				if grind2IsTargetingMe:target(i) or grind2IsTargetingPet:target(i) then

					grind2DrawAggroCircles:DrawCircles(cx, cy, cz, aggro, 255, 0, 0);
				end
			end
 		end

		-- get next target
 		i, t = GetNextObject(i);
 	end
end
