script_followNumEnemiesAttackingUs = {}

-- returns number of enemies attacking us
function script_followNumEnemiesAttackingUs:numEnemiesAttackingUs() 

		local unitsAttackingUs = 0; 

		local currentObj, typeObj = GetFirstObject(); 

	while currentObj ~= 0 do 

		if typeObj == 3 then

			if (currentObj:CanAttack() and not currentObj:IsDead()) then

				if (script_followIsTargetingMe:IsTargetingMe(currentObj)) 

					or (script_followIsTargetingPet:IsTargetingPet(currentObj)) then

					unitsAttackingUs = unitsAttackingUs + 1; 

                end 
			end 
       	end

		currentObj, typeObj = GetNextObject(currentObj); 
	end

return unitsAttackingUs;
end