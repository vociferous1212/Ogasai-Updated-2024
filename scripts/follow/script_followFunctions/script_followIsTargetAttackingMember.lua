script_followIsTargetAttackingMember = {}

function script_followIsTargetAttackingMember:isTargetAttackingMember() 
	local currentObj, typeObj = GetFirstObject(); 
	local member = 0;

	if (GetNumPartyMembers() > 0) then
		for i = 0, GetNumPartyMembers() do
			member = GetPartyMember(i);
		end

		while currentObj ~= 0 do 
				if typeObj == 3 then
				if (currentObj:CanAttack() and not currentObj:IsDead()) and (currentObj:GetDistance() <= 50) then
					if currentObj:GetUnitsTarget() ~= 0 and currentObj:GetUnitsTarget() ~= nil then
						if (currentObj:GetUnitsTarget():GetGUID() == member:GetGUID()) then 
							if (script_follow.assistInCombat) then
								script_follow.objectAttackingUs = currentObj;	
							end
									return true; 
						end
					end 
				end
			end
			  currentObj, typeObj = GetNextObject(currentObj); 
		end
	end
	return false;
end