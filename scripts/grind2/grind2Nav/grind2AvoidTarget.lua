grind2AvoidTarget = {

}

function script_runner:avoidToAggro(safeMargin) 
	local countUnitsInRange = 0;
	local currentObj, typeObj = GetFirstObject();
	local localObj = GetLocalPlayer();
	local closestEnemy = 0;
	local closestDist = 999;
	local aggro = 0;

	while currentObj ~= 0 do
 		if typeObj == 3 then
			aggro = currentObj:GetLevel() - localObj:GetLevel() + 21;
			local range = aggro + safeMargin;
			if currentObj:CanAttack() and not currentObj:IsDead() and not currentObj:IsCritter() and currentObj:GetDistance() <= range then	
				if (closestEnemy == 0) then
					closestEnemy = currentObj;
				else
					local dist = currentObj:GetDistance();
					if (dist < closestDist) then
						closestDist = dist;
						closestEnemy = currentObj;
					end
				end
 			end
 		end
 		currentObj, typeObj = GetNextObject(currentObj);
 	end

	-- avoid the closest mob
	if (closestEnemy ~= 0) then

			local xT, yT, zT = closestEnemy:GetPosition();

 			local xP, yP, zP = localObj:GetPosition();

			local safeRange = safeMargin+1;
			local intersectMob = script_runner:aggroIntersect(closestEnemy);
			if (intersectMob ~= nil) then
				local aggroRange = intersectMob:GetLevel() - localObj:GetLevel() + 21 + aggro; 
				local x, y, z = closestEnemy:GetPosition();
				local xx, yy, zz = intersectMob:GetPosition();
				local centerX, centerY = (x+xx)/2, (y+yy)/2;
				script_runner:avoid(centerX, centerY, zP, aggroRange, safeRange);
			else
				script_runner:avoid(xT, yT, zP, aggro, safeRange);
			end

			return true;
	end

	return false;
end

function script_aggro:avoid(pointX,pointY,pointZ, radius, safeDist)

	-- thx benjamin
	local r = 255;
	local g = 255;
	local b = 0;

	-- position
	local x = 25;

	-- we will go by radians, not degrees
	local sqrt, sin, cos, PI, theta, points, pointsTwo, point = math.sqrt, math.sin, math.cos,math.pi, 0, {}, {}, 0;
	
	local closestDist = 999;
	local closestPoint = 0;
	local closestTargetPoint = 0;
	local closestTargetDist = 999;
	local quality = 120;

	while theta <= 2*PI do
		point = point + 1 -- get next table slot, starts at 0 
		points[point] = { x = pointX + radius*cos(theta), y = pointY + radius*sin(theta) }
		pointsTwo[point] = { x = pointX + (safeDist+radius)*cos(theta), y = pointY + (safeDist+radius)*sin(theta) }
		theta = theta + 2*PI / quality -- get next theta
	end
	
	local closestPointToDest = nil;
	local bestDestDist = 10000;

	for i = 1, point do
		local firstPoint = i
		local secondPoint = i + 1

		if firstPoint == point then
			secondPoint = 1
		end

		if points[firstPoint] and points[secondPoint] then

			local myX, myY, myZ = GetLocalPlayer():GetPosition();

			local dist = math.sqrt((points[secondPoint].x-myX)^2 + (points[secondPoint].y-myY)^2);

			-- Set closest theta point to move to
			if (dist < closestDist) then
				closestDist = dist;
				closestPoint = i;
			end

			-- Calculate the point closest to our destination
			if (IsPathLoaded(5)) then
				local lastNodeIndex = GetPathSize(5)-1;
				local destX, destY, destZ = GetPathPositionAtIndex(5, lastNodeIndex); 
				local destDist = math.sqrt((points[secondPoint].x-destX)^2 + (points[secondPoint].y-destY)^2);
				if (destDist < bestDestDist) then
					bestDestDist = destDist;
					closestPointToDest = i;
				end
			end
		end
	end


	-- Move just outside the aggro range
	local moveToPoint = closestPoint;

	if (closestPointToDest ~= nil) then	
		local diffPoint = closestPointToDest - moveToPoint;
		if (diffPoint <= 0) then
			moveToPoint = closestPoint - 4;
		else
			moveToPoint = closestPoint + 4;
		end
	else
		moveToPoint = closestPoint + 4;
	end
	
	-- out of bound
	if (moveToPoint > point or moveToPoint == 0) then
		moveToPoint = 1;
	end

	Move(pointsTwo[moveToPoint].x, pointsTwo[moveToPoint].y, pointZ);
end