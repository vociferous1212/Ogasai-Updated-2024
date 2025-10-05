script_followAssignTarget = {}

function script_followAssignTarget:assignTarget() 

    -- Instantly return the last target if we attacked it and it's still alive and we are in combat
    if (script_follow.enemyObj ~= 0 and script_follow.enemyObj ~= nil and not script_follow.enemyObj:IsDead() and IsInCombat()) then

        if (script_followIsTargetingMe:IsTargetingMe(script_follow.enemyObj) 
        or script_followIsTargetingPet:IsTargetingPet(script_follow.enemyObj) 
        or script_follow.enemyObj:IsTappedByMe())
            
        then

            return script_follow.enemyObj;
        end
    end

    -- Find the closest valid target if we have no target or we are not in combat
    local mobDistance = script_follow.pullDistance;

    local closestTarget = nil;

    local i, targetType = GetFirstObject();

    while i ~= 0 do

        if (targetType == 3 and not i:IsCritter() and not i:IsDead() and i:CanAttack()) then

            if (script_followEnemyIsValid:enemyIsValid(i)) then

                -- save the closest mob or mobs attacking us
                if (mobDistance > i:GetDistance()) then

                    mobDistance = i:GetDistance();	

                    closestTarget = i;
                end
            end
        end

        i, targetType = GetNextObject(i);
    end
        
    -- Check: If we are in combat but no valid target, kill the "unvalid" target attacking us
    if (closestTarget == nil and IsInCombat()) then

        if (GetTarget() ~= 0) then

            return GetTarget();
        end
    end

    -- Return the closest valid target or nil
    return closestTarget;
 end