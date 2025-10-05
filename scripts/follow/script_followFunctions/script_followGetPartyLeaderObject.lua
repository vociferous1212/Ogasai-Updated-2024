script_followGetPartyLeaderObject = {}

function GetPartyLeaderObject()

	local leaderObj = 0;

	if GetNumPartyMembers() > 0 then

		leaderObj = GetPartyMember(GetPartyLeaderIndex());

		if leaderObj ~= nil and leaderObj ~= 0 then
	
		return leaderObj;
		end
	end
	return 0;
end