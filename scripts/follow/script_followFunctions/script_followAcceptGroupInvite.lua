script_followAcceptGroupInvite = {}

function script_followAcceptGroupInvite:acceptGroupInvite()

-- Accept group invite
	if (GetNumPartyMembers() < 1 and script_follow.acceptTimer < GetTimeEX()) then

		script_follow.acceptTimer = GetTimeEX() + 5000;

		AcceptGroup();
	end
end