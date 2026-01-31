grind2AvoidTarget = {

}

function script_runner:avoidToAggro(safeMargin) 
    local countUnitsInRange = 0
    local currentObj, typeObj = GetFirstObject()
    local localObj = GetLocalPlayer()
    local closestEnemy = 0
    local closestDist = 999
    local aggro = 0
    grindEnemy = nil;
     if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
        grindEnemy = grind2.enemyTarget:GetGUID();
    end

    while currentObj ~= 0 do
        if typeObj == 3 then
            aggro = currentObj:GetLevel() - localObj:GetLevel() + 18
            local range = aggro + safeMargin
            if currentObj:CanAttack() and not currentObj:IsDead() and not currentObj:IsCritter() and currentObj:GetDistance() <= range and currentObj:IsInLineOfSight()  then
                if grindEnemy == nil or (grindEnemy ~= nil and grindEnemy ~= currentObj:GetGUID()) then

                if (closestEnemy == 0) then
                    closestEnemy = currentObj
                else
                    local dist = currentObj:GetDistance()
                    if (dist < closestDist) then
                        closestDist = dist
                        closestEnemy = currentObj
                    end
                end
                end
            end
        end
        currentObj, typeObj = GetNextObject(currentObj)
    end

    if (closestEnemy ~= 0) then
        local xT, yT, zT = closestEnemy:GetPosition()
        local xP, yP, zP = localObj:GetPosition()
        local safeRange = safeMargin + 1
        local intersectMob = script_runner:aggroIntersect(closestEnemy)
        if (intersectMob ~= nil) then
            local aggroRange = intersectMob:GetLevel() - localObj:GetLevel() + 18
            local x, y, z = closestEnemy:GetPosition()
            local xx, yy, zz = intersectMob:GetPosition()
            local centerX, centerY = (x + xx) / 2, (y + yy) / 2
            script_runner:avoid(centerX, centerY, zP, aggroRange, safeRange - 1)
          --  self.oscillationCount = self.oscillationCount + 1
           -- if self.oscillationCount > 2 then
            --    self.oscillationCount = 0
                GeneratePath(xP, yP, zP, self.tx, self.ty, self.tz)
          --  end
            return true;
        else
            script_runner:avoid(xT, yT, zP, aggro, safeRange - 1)
           -- self.oscillationCount = self.oscillationCount + 1
          --  if self.oscillationCount > 2 then
             --   self.oscillationCount = 0
                GeneratePath(xP, yP, zP, self.tx, self.ty, self.tz)
           -- end
        return true;
        end
    end
return false;
end

function script_runner:aggroIntersect(target)
    local x, y, z = target:GetPosition()
    local currentObj, typeObj = GetFirstObject()
    local localObj = GetLocalPlayer()
    local grindEnemy = nil;
    if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
        grindEnemy = grind2.enemyTarget:GetGUID();
    end
    while currentObj ~= 0 do
        if typeObj == 3 then
            local aggro = currentObj:GetLevel() - localObj:GetLevel() + 18
            local range = aggro + (safeMargin or 5)
            if currentObj:CanAttack() and not currentObj:IsDead() and not currentObj:IsCritter() and currentObj:GetDistance() <= range and currentObj:IsInLineOfSight() then
                if grindEnemy == nil or (grindEnemy ~= nil and grindEnemy ~= currentObj:GetGUID()) then
                local xx, yy, zz = currentObj:GetPosition()
                local dist = math.sqrt((x - xx)^2 + (y - yy)^2)
                if (dist < aggro * 2) then
                    return currentObj
                end
                end
            end
        end
        currentObj, typeObj = GetNextObject(currentObj)
    end
    return nil
end

function script_runner:avoid(pointX,pointY,pointZ, radius, safeDist)
    local sqrt, sin, cos, PI, theta, points, pointsTwo, point = math.sqrt, math.sin, math.cos, math.pi, 0, {}, {}, 0
    
    local closestDist = 999
    local closestPoint = 0
    local closestTargetPoint = 0
    local closestTargetDist = 999
    local quality = 120

    while theta <= 2 * PI do
        point = point + 1
        points[point] = { x = pointX + radius * cos(theta), y = pointY + radius * sin(theta) }
        pointsTwo[point] = { x = pointX + (safeDist + radius) * cos(theta), y = pointY + (safeDist + radius) * sin(theta) }
        theta = theta + 2 * PI / quality
    end
    for i = 1, point do
        local firstPoint = i
        local secondPoint = i + 3

        if firstPoint == point then
            secondPoint = 1
        end

        if points[firstPoint] and points[secondPoint] then

            local myX, myY, myZ = GetLocalPlayer():GetPosition()

            local dist = math.sqrt((points[secondPoint].x - myX)^2 + (points[secondPoint].y - myY)^2)

            local distToDest = math.sqrt((points[secondPoint].x - self.tx)^2 + (points[secondPoint].y - self.ty)^2)

            -- Set target theta point
            if (distToDest < closestTargetDist) then
                closestTargetDist = distToDest
                closestTargetPoint = i
            end

            -- Set closest theta point to move to
            if (dist < closestDist) then
                closestDist = dist
                closestPoint = i
            end
        end
    end

    -- Move just outside the aggro range
    local moveToPoint = closestPoint
    
    moveToPoint = closestPoint
    
    if (moveToPoint >= point) then
        moveToPoint = 1
    end

    if (moveToPoint == 0) then
        moveToPoint = 1
    end

    Move(pointsTwo[moveToPoint].x, pointsTwo[moveToPoint].y, pointZ)
end
