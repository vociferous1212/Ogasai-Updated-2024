script_followIsTargetingMe = {}

function script_followIsTargetingMe:IsTargetingMe(i) 
	local localPlayer = GetLocalPlayer();
	if (localPlayer ~= nil and localPlayer ~= 0 and not localPlayer:IsDead()) then
		if (i:GetUnitsTarget() ~= nil and i:GetUnitsTarget() ~= 0) then
			return i:GetUnitsTarget():GetGUID() == localPlayer:GetGUID();
		end
	end
	return false;
end