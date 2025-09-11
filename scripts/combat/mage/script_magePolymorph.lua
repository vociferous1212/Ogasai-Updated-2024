script_magePolymorph = {}

function script_magePolymorph:getTargetNotPolymorphed() -- check polymorph
   	local unitsAttackingUs = 0; 
   	local currentObj, typeObj = GetFirstObject(); 
   	while currentObj ~= 0 do 
   		if typeObj == 3 then
			if (currentObj:CanAttack() and not currentObj:IsDead()) then
               	if (script_grind:isTargetingMe(currentObj) and not currentObj:HasDebuff('Polymorphed')) then 
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
				if script_grind:isTargetingMe(currentObj) and currentObj:IsInLineOfSight() then
					if not currentObj:HasDebuff("Polymorph") and currentObj:GetCreatureType() ~= 'Elemental' and currentObj:GetCreatureType() ~= "Undead" and currentObj:GetCreatureType() ~= "Demon" then

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
			if (currentObj:CanAttack() and not currentObj:IsDead()) then
				if (currentObj:GetGUID() ~= targetObjGUID and script_grind:isTargetingMe(currentObj)) then
					if script_magePolymorph:isPolymorphTargetValid() then
						if (currentObj:IsInLineOfSight()) then
							if (not script_grind.adjustTickRate) then
								script_grind.tickRate = 100;
							end
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
        currentObj, typeObj = GetNextObject(currentObj); 
    end
    return false;
end