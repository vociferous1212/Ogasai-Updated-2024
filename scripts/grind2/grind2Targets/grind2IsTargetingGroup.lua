grind2IsTargetingGroup = {

}

function grind2IsTargetingGroup:target(i)

	if GetNumPartyMembers() >= 1 then
		
		local partyMember = GetPartyMember(i);

		if i:GetUnitsTarget() ~= nil and i:GetUnitsTarget() ~= 0 and partyMember ~= nil and partyMember ~= 0 then

			if i:GetUnitsTarget():GetGUID() == partyMember:GetGUID() then
			
				return true;
			end
		end
	end

return false;
end