script_checkAdds = {
    addsRange = 20,
    checkAddsRange = 3,
    closestEnemy = 0,
    intersectEnemy = nil,
}

function script_checkAdds:checkAdds()

    local grindEnemy = script_grind.enemyObj
    local questEnemy = nil;

    -- if we aren't using the grinder then flip the variable to use quester...'
    if grindEnemy == 0 or grindEnemy == nil then
        grindEnemy =  _quest.enemyTarget
    end

-- if we want to skip hard pulls and we have a valid enemy and we are greater than level 6 then
    if script_grind.skipHardPull and ( (grindEnemy ~= nil and grindEnemy ~= 0) or (questEnemy ~= nil and questEnemy ~= 0) )
        and not IsChanneling() and GetNumPartyMembers() < 2 and GetLocalPlayer():GetLevel() >= 6 then

	-- if there aren't too many enemies in range and the target isn't about to die and we aren't stunned, nor is enemy stunned
        if script_grind:enemiesWithinRange() <= 3 and (grindEnemy:GetHealthPercentage() >= 25 and not TargetHasRangedWeapon(grindEnemy))
            and ( (grindEnemy ~= 0 and grindEnemy ~= nil and not grindEnemy:IsStunned())
            or (questEnemy ~= nil and questEnemy ~= 0 and not questEnemy:IsStunned()) )
            
        then 

	-- move away from adds
            if self:avoidToAggro(self.checkAddsRange) then

        -- won't detect ismoving quick enough and is causing a stutter......
		    -- face the target if we are not moving... turn back around after walking away quicker...
		    --if not IsMoving() and grindEnemy ~= nil and grindEnemy ~= 0 then grindEnemy:FaceTarget(); end
		      --if not IsMoving() and questEnemy ~= nil and questEnemy ~= 0 then questEnemy:FaceTarget(); end

		-- check unstuck
             --   if not script_unstuck:pathClearAuto(2) then
               --     script_unstuck:unstuck()
                 --   return true
                --end
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
                    and currentObj:IsInLineOfSight()
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
            local centerX, centerY = (x + xx), (y + yy)
            self:avoid(centerX, centerY, zP, self.addsRange, self.checkAddsRange)
            PetFollow()
            return true
        else
            self:avoid(xT, yT, zP, self.addsRange, self.checkAddsRange)
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
        pointsTwo[point] = { x = pointX + (self.addsRange + safeDist + 10) * cos(theta), y = pointY + (self.addsRange + safeDist + 10) * sin(theta) }
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
            if not script_grind.adjustTickRate and PlayerHasTarget() then
                script_grind.tickRate = 135
            end
                
                script_navEXCombat:moveToTarget(GetLocalPlayer(), pointsTwo[farthestPoint].x, pointsTwo[farthestPoint].y, pointZ);
                self.closestEnemy = 0
                self.intersectEnemy = nil
                script_om:FORCEOM()
        end
	--return true;
    end
    return false
end

function script_checkAdds:aggroIntersect(target)
    local x, y, z = target:GetPosition()
    self.intersectEnemy = nil
    local currentObj, typeObj = GetFirstObject()

    while currentObj ~= 0 do
        if typeObj == 3 then
            local test = currentObj:GetLevel() - GetLocalPlayer():GetLevel() + 19
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
                    and currentObj:IsInLineOfSight()
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

function script_checkAdds:moveWhileResting(safeMargin)
    local localObj = GetLocalPlayer()
    local closestEnemy = 0
    local closestDist = 999
    local addsRange = 25 -- Fallback range if level-based calculation is invalid
    local currentObj, typeObj = GetFirstObject()

    -- Check for enemies within dynamic aggro range
    while currentObj ~= 0 do
        if typeObj == 3 then -- NPC type
            local aggro = currentObj:GetLevel() - localObj:GetLevel() + 21.5
            if aggro > 0 then
                addsRange = aggro -- Use level-based aggro range
            end
            if currentObj:GetDistance() <= addsRange then
                if currentObj:CanAttack()
                    and (not currentObj:IsDead())
                    and (not currentObj:IsCritter())
                    and (not currentObj:HasDebuff("Polymorph"))
                    and (not currentObj:HasDebuff("Fear"))
                    and currentObj:IsInLineOfSight()
                then
                    local dist = currentObj:GetDistance()
                    if dist <= (addsRange + 10) and dist < closestDist then
                        closestDist = dist
                        closestEnemy = currentObj
                    end
                end
            end
        end
        currentObj, typeObj = GetNextObject(currentObj)
    end

    -- If an enemy is found and player isn't movement-disabled
    if closestEnemy ~= 0 and not script_checkDebuffs:hasDisabledMovement() then
        local xT, yT, zT = closestEnemy:GetPosition()
        local xP, yP, zP = localObj:GetPosition()
        
        local intersectEnemy = self:aggroIntersect(closestEnemy)
        local avoidX, avoidY, avoidZ, radius, safeDist

        if intersectEnemy ~= nil then
            local x, y = closestEnemy:GetPosition()
            local xx, yy = intersectEnemy:GetPosition()
            avoidX, avoidY = (x + xx), (y + yy)
            avoidZ = zP
            radius = addsRange
            safeDist = addsRange
        else
            avoidX, avoidY, avoidZ = xT, yT, zP
            radius = addsRange
            safeDist = addsRange
        end

        -- Integrated avoid logic
        local sqrt, sin, cos, PI, theta, points, pointsTwo, point = math.sqrt, math.sin, math.cos, math.pi, 0, {}, {}, 0
        local closestDist = 999
        local farthestDist = 0
        local farthestPoint = 0
        local quality = 250
        local myX, myY, myZ = localObj:GetPosition()

        -- Generate points for avoidance circle
        while theta <= 2 * PI do
            point = point + 1
            points[point] = { x = avoidX + radius * cos(theta), y = avoidY + radius * sin(theta) }
            pointsTwo[point] = { x = avoidX + (addsRange + safeDist + 5) * cos(theta), y = avoidY + (addsRange + safeDist + 5) * sin(theta) }
            theta = theta + 2 * PI / quality
        end

        -- Find the farthest valid point from the player
        for i = 1, point do
            local secondPoint = i
            if pointsTwo[secondPoint] then
                local dist = sqrt((pointsTwo[secondPoint].x - myX)^2 + (pointsTwo[secondPoint].y - myY)^2)
                local enemyDist = sqrt((pointsTwo[secondPoint].x - avoidX)^2 + (pointsTwo[secondPoint].y - avoidY)^2)
                if dist < closestDist and enemyDist >= addsRange then
                    closestDist = dist
                    farthestPoint = i
                end
            end
        end

        if farthestPoint == 0 then
            farthestPoint = 3
        end

        -- Move to the avoidance point
        if farthestPoint ~= 0 and pointsTwo[farthestPoint] and avoidZ then
            if not script_unstuck:pathClearAuto(2) then
                script_unstuck:unstuck()
                return true
            end

                script_navEXCombat:moveToTarget(GetLocalPlayer(), pointsTwo[farthestPoint].x, pointsTwo[farthestPoint].y, pointZ);
                closestEnemy = 0
                intersectEnemy = nil
                script_om:FORCEOM()
                PetFollow()
       -- return true;
        end
    end
    return false
end