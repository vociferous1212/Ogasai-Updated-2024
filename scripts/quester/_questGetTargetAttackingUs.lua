_questGetTargetAttackingUs = {}

-- returns an object without a GUID
function _questGetTargetAttackingUs:getTargetAttackingUs() 

	local currentObj, typeObj = GetFirstObject(); 

	-- run object manager
	while currentObj ~= 0 do 
		
		-- NPC type 3
    		if typeObj == 3 then
	
			-- acceptable targets
			if (currentObj:CanAttack() and not currentObj:IsDead()) and (not currentObj:IsCritter()) then

			-- get targets target - target of target
			local localObj = GetLocalPlayer();
			local targetTarget = currentObj:GetUnitsTarget();

				-- target has a target and distance less than 50 (limit object manager by distance)
				if (targetTarget ~= 0 and targetTarget ~= nil) and (currentObj:GetDistance() < 50) then

					-- if target is targeting me then
					if (targetTarget:GetGUID() == localObj:GetGUID()) then
	
						-- return target
						return currentObj;
					end
				end	
            		end 
       		end

	-- get next target
	currentObj, typeObj = GetNextObject(currentObj); 
	end

	-- return nil if no target
	return nil;
end
