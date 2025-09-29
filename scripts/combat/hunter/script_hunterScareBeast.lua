script_hunterScareBeast = {}

function script_hunterScareBeast:getTargetNotScared()

   	local currentObj, typeObj = GetFirstObject(); 
   	while currentObj ~= 0 do 
   		if typeObj == 3 then
			if (currentObj:CanAttack() and not currentObj:IsDead()) then
               	if (script_grind:isTargetingMe(currentObj) and not currentObj:HasDebuff('Scare Beast')) and currentObj:IsInLineOfSight() then 
                	return currentObj;
               	end 
            end 
       	end
        	currentObj, typeObj = GetNextObject(currentObj); 
    end
   	return nil;
end

function script_hunterScareBeast:isTargetScared()

local currentObj, typeObj = GetFirstObject(); 
	local localObj = GetLocalPlayer();
	while currentObj ~= 0 do 
		if typeObj == 3 then
			if (currentObj:HasDebuff("Scare Beast")) then 
				return true; 
			end
		end
		currentObj, typeObj = GetNextObject(currentObj); 
	end
    return false;

end

function script_hunterScareBeast:isScareTargetValid()

	local currentObj, typeObj = GetFirstObject(); 

	while currentObj ~= 0 do 
    		if typeObj == 3 then
			if currentObj:CanAttack() and not currentObj:IsDead() and not currentObj:IsCritter() and currentObj:GetDistance() <= 50 then
				if script_grind:isTargetingMe(currentObj) and currentObj:IsInLineOfSight()
					and currentObj:GetGUID() ~= script_grind.enemyObj:GetGUID() then

					if not currentObj:HasDebuff("Scare Beast")

						-- we cannot polymorph these targets
					and currentObj:GetCreatureType() ==  "Beast"

					then

						-- enemy is valid to polymorph
						return true; 
					end
				end
			end 
		end
        currentObj, typeObj = GetNextObject(currentObj); 
    end
    return false;
end

function script_hunterScareBeast:scareAdd(targetObjGUID)

    local currentObj, typeObj = GetFirstObject(); 
    local localObj = GetLocalPlayer();
    while currentObj ~= 0 do 
    	if typeObj == 3 then
			if (currentObj:CanAttack() and not currentObj:IsDead()) and currentObj:IsInLineOfSight() then
				if (currentObj:GetGUID() ~= targetObjGUID and script_grind:isTargetingMe(currentObj)) then
					if script_hunterScareBeast:isScareTargetValid() then
						if (currentObj:IsInLineOfSight()) then
							if (not script_grind.adjustTickRate) then
								script_grind.tickRate = 100;
							end

							-- make sure we are close enough to Polymorph
							if currentObj:GetDistance() > 29 then
								_x, _y, _z = currentObj:GetPosition();
								script_navEXCombat:moveToTarget(GetLocalPlayer(), _x, _y, _z);
								return true;
							end
							if currentObj:GetDistance() <= 30 and not IsMoving() then
									CastSpellByName("Scare Beast", currentObj);
									script_hunter.addScared = true; 
								return true; 
							end
						end
					end 
				end 
			end 
		end
        currentObj, typeObj = GetNextObject(currentObj); 
    end
    return false;
end