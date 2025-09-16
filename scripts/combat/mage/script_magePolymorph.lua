script_magePolymorph = {}

function script_magePolymorph:getTargetNotPolymorphed() -- check polymorph
   	local unitsAttackingUs = 0; 
   	local currentObj, typeObj = GetFirstObject(); 
   	while currentObj ~= 0 do 
   		if typeObj == 3 then
			if (currentObj:CanAttack() and not currentObj:IsDead()) then
               	if (script_grind:isTargetingMe(currentObj) and not currentObj:HasDebuff('Polymorphed')) and currentObj:IsInLineOfSight() then 
                	return currentObj;
               	end 
            end 
       	end
        	currentObj, typeObj = GetNextObject(currentObj); 
    end
   	return nil;
end

function script_magePolymorph:isAddPolymorphed() -- check polymorph
	local currentObj, typeObj = GetFirstObject(); 
	local localObj = GetLocalPlayer();
	while currentObj ~= 0 do 
		if typeObj == 3 then
			if (currentObj:HasDebuff("Polymorph")) then 
				return true; 
			end
		end
		currentObj, typeObj = GetNextObject(currentObj); 
	end
    return false;
end
function script_magePolymorph:isPolymorphTargetValid()

	local currentObj, typeObj = GetFirstObject(); 

	while currentObj ~= 0 do 
    		if typeObj == 3 then
			if currentObj:CanAttack() and not currentObj:IsDead() and not currentObj:IsCritter() and currentObj:GetDistance() <= 50 then
				if script_grind:isTargetingMe(currentObj) and currentObj:IsInLineOfSight()
					and currentObj:GetGUID() ~= script_grind.enemyObj:GetGUID() then

					if not currentObj:HasDebuff("Polymorph")

						-- we cannot polymorph these targets
					and currentObj:GetCreatureType() ~= 'Elemental'
					and currentObj:GetCreatureType() ~= "Undead"
					and currentObj:GetCreatureType() ~= "Demon"
					and currentObj:GetCreatureType() ~= "Dragonkin"
					and currentObj:GetCreatureType() ~= "Not specified"

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

function script_magePolymorph:polymorphAdd(targetObjGUID) -- cast the polymorph conditions
    local currentObj, typeObj = GetFirstObject(); 
    local localObj = GetLocalPlayer();
    while currentObj ~= 0 do 
    	if typeObj == 3 then
			if (currentObj:CanAttack() and not currentObj:IsDead()) and currentObj:IsInLineOfSight() then
				if (currentObj:GetGUID() ~= targetObjGUID and script_grind:isTargetingMe(currentObj)) then
					if script_magePolymorph:isPolymorphTargetValid() then
						if (currentObj:IsInLineOfSight()) then
							if (not script_grind.adjustTickRate) then
								script_grind.tickRate = 100;
							end

							-- make sure we are close enough to Polymorph
							if currentObj:GetDistance() > 29 then
								_x, _y, _z = currentObj:GetPosition();
								script_navEXCombat:moveToTarget(GetLocalPlayer(), _x, _y, _z);
							end
							if currentObj:GetDistance() <= 30 and not IsMoving() then
								if (script_mage:cast('Polymorph', currentObj)) then 
									script_mage.addPolymorphed = true; 
									polyTimer = GetTimeEX() + 8000;
									return true; 
								end
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