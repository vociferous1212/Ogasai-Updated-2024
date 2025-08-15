script_checkAdds = {
    addsRange = 30,
    checkAddsRange = 8,
    closestEnemy = 0,
    intersectEnemy = nil,
}

function script_checkAdds:checkAdds()
    local grindEnemy = script_grind and script_grind.enemyObj or nil
    local questEnemy = _quest and _quest.enemyTarget or nil

    if script_grind.skipHardPull and (grindEnemy ~= nil and grindEnemy ~= 0) and (not IsCasting()) and GetNumPartyMembers() < 2 and GetLocalPlayer():GetLevel() >= 6 then
        if script_grind:enemiesWithinRange() <= 3 and (grindEnemy:GetHealthPercentage() >= 25 and not TargetHasRangedWeapon(grindEnemy)) then 
            if self:avoidToAggro(self.checkAddsRange) then
                if not script_unstuck:pathClearAuto(2) then
                    script_unstuck:unstuck()
                    return true
                end
                if GetPet() ~= 0 then
                    PetFollow()
                end
                return true;
            end
        end
    end
    return false
end

function script_checkAdds:avoidToAggro(safeMargin) 
    local localObj = GetLocalPlayer()
    self.closestEnemy = 0
    local closestDist = 999
    local currentObj, typeObj = GetFirstObject()

    while currentObj ~= 0 do
        if typeObj == 3 then
            local test = currentObj:GetLevel() - GetLocalPlayer():GetLevel() + 24
            if currentObj:GetDistance() <= test then
                local grindEnemy = script_grind.enemyObj
                if (grindEnemy ~= nil)
                    and (currentObj:GetGUID() ~= grindEnemy:GetGUID())
                    and (not script_grind:isTargetingMe(currentObj))
                    and (not script_grind:isTargetingPet(currentObj))
                    and currentObj:CanAttack()
                    and (not currentObj:IsDead())
                    and (not currentObj:IsCritter())
                    and (not currentObj:HasDebuff("Polymorph"))
                    and (not currentObj:HasDebuff("Fear"))
                then
                    local dist = currentObj:GetDistance()
                    if dist <= (self.addsRange + 10) and dist < closestDist then
                        closestDist = dist
                        self.closestEnemy = currentObj
                    end
                end
            end
        end
        currentObj, typeObj = GetNextObject(currentObj)
    end

    if self.closestEnemy ~= 0 and not script_checkDebuffs:hasDisabledMovement() then
        local xT, yT, zT = self.closestEnemy:GetPosition()
        local xP, yP, zP = localObj:GetPosition()
        
        self.intersectEnemy = self:aggroIntersect(self.closestEnemy)
        if self.intersectEnemy ~= nil then
            local x, y = self.closestEnemy:GetPosition()
            local xx, yy = self.intersectEnemy:GetPosition()
            local centerX, centerY = (x + xx) / 2, (y + yy) / 2
            self:avoid(centerX, centerY, zP, self.addsRange / 2, self.checkAddsRange * 2)
            PetFollow()
            return true
        else
            self:avoid(xT, yT, zP, self.addsRange / 2, self.checkAddsRange)
            PetFollow()
            return true
        end
    end
    return false
end

function script_checkAdds:avoid(pointX, pointY, pointZ, radius, safeDist)
    local sqrt, sin, cos, PI, theta, points, pointsTwo, point = math.sqrt, math.sin, math.cos, math.pi, 0, {}, {}, 0
    local closestDist = 999
    local farthestDist = 0
    local farthestPoint = 0
    local quality = 250
    local myX, myY, myZ = GetLocalPlayer():GetPosition()

    while theta <= 2 * PI do
        point = point + 1
        points[point] = { x = pointX + radius * cos(theta), y = pointY + radius * sin(theta) }
        pointsTwo[point] = { x = pointX + (self.addsRange + safeDist + 5) * cos(theta), y = pointY + (self.addsRange + safeDist + 5) * sin(theta) }
        theta = theta + 2 * PI / quality
    end

    for i = 1, point do
        local secondPoint = i
        if pointsTwo[secondPoint] then
            local dist = sqrt((pointsTwo[secondPoint].x - myX)^2 + (pointsTwo[secondPoint].y - myY)^2)
            local enemyDist = sqrt((pointsTwo[secondPoint].x - pointX)^2 + (pointsTwo[secondPoint].y - pointY)^2)
            if dist < closestDist and enemyDist >= self.addsRange then
                closestDist = dist
                farthestPoint = i
            end
        end
    end

    if farthestPoint == 0 then
        farthestPoint = 3
    end

    if farthestPoint ~= 0 and pointsTwo[farthestPoint] and pointZ then
        if not script_unstuck:pathClearAuto(2) then
            script_unstuck:unstuck()
            return true
        end
        local grindEnemy = script_grind.enemyObj
        if grindEnemy and not grindEnemy:IsCasting() then
            if Move(pointsTwo[farthestPoint].x, pointsTwo[farthestPoint].y, pointZ) then
                if not script_grind.adjustTickRate and PlayerHasTarget() then
                    script_grind.tickRate = 135
                end
                self.closestEnemy = 0
                self.intersectEnemy = nil
                script_om:FORCEOM()
                return true
            end
        end
	return true;
    end
    return false
end

function script_checkAdds:aggroIntersect(target)
    local x, y, z = target:GetPosition()
    self.intersectEnemy = nil
    local currentObj, typeObj = GetFirstObject()

    while currentObj ~= 0 do
        if typeObj == 3 then
            local test = currentObj:GetLevel() - GetLocalPlayer():GetLevel() + 24
            if currentObj:GetDistance() <= test then
                if currentObj:CanAttack()
                    and not currentObj:IsDead()
                    and not currentObj:IsCritter()
                    and not script_grind:isTargetingMe(currentObj)
                    and not script_grind:isTargetingPet(currentObj)
                    and self.closestEnemy ~= 0
                    and currentObj:GetGUID() ~= self.closestEnemy:GetGUID()
                    and not currentObj:HasDebuff("Polymorph")
                    and not currentObj:HasDebuff("Fear")
                then
                    local xx, yy = currentObj:GetPosition()
                    local dist = sqrt((x - xx)^2 + (y - yy)^2)
                    if dist <= self.addsRange then
                        return currentObj
                    end
                end
            end
        end
        currentObj, typeObj = GetNextObject(currentObj)
    end
    return nil
end