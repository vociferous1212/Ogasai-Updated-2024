script_followIsTargetingLeader = {}

function script_followIsTargetingLeader:isTargetingLeader(i) 

	local leader = GetPartyLeaderObject();

	if (leader ~= nil and leaderr ~= 0 and not leader:IsDead()) then

		if (i:GetUnitsTarget() ~= nil and i:GetUnitsTarget() ~= 0) then

			return i:GetUnitsTarget():GetGUID() == leader:GetGUID();
		end
	end
	return false;
end