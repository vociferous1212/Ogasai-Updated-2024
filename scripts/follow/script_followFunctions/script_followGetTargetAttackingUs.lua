script_followGetTargetAttackingUs = {}


function script_followGetTargetAttackingUs:getTargetAttackingUs() 
	local currentObj, typeObj = GetFirstObject(); 
   while currentObj ~= 0 do 
		if typeObj == 3 then
			if (currentObj:CanAttack() and not currentObj:IsDead()) then
					local localObj = GetLocalPlayer();		
				if (currentObj:GetUnitsTarget() == localObj) then 
					script_follow.objectAttackingUs = currentObj;
							return currentObj; 
				end 
			end
	end
		currentObj, typeObj = GetNextObject(currentObj); 
	end
	return nil;
end