script_followIsTargetingPet = {}

function script_followIsTargetingPet:IsTargetingPet(target)
	local localPlayer = GetLocalPlayer();
	if (GetPet() ~= nil and GetPet() ~= 0 and not localPlayer:IsDead()) then
		if (target:GetUnitsTarget() ~= nil and target:GetUnitsTarget() ~= 0) then
			return target:GetUnitsTarget():GetGUID() == GetPet:GetGUID();
		end
	end
	return false;
end