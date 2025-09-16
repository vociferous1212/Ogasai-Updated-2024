script_followNumEnemiesAttackingLeader = {}

function script_followNumEnemiesAttackingLeader:numEnemiesAttackingLeader()

	local numEnemies = 0;

	if GetPartyLeaderObject() ~= nil and GetPartyLeaderObject() ~= 0 then


		local i, t = GetFirstObject();

		while i ~= 0 do
			if t == 3 then
				if i:GetUnitsTarget() ~= 0 and i:GetUnitsTarget() ~= nil then
					if i:GetUnitsTarget():GetGUID() == GetPartyLeaderObject():GetGUID() then
						numEnemies = numEnemies + 1;
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end
return numEnemies;
end