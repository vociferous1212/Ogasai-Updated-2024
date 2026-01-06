script_followMove = {
	
	navFunctionsLoaded = include("scripts\\nav\\script_nav.lua"),
	navFunctions2Loaded = include("scripts\\nav\\script_navEX.lua"),
}

function script_followMove:followLeader()

	local leaderObj = GetPartyLeaderObject();
	local distance = script_follow.followLeaderDistance;
	local localObj = GetLocalPlayer();

	if (leaderObj ~= 0 and leaderObj ~= nil) then

		local myX, myY, myZ = localObj:GetPosition();
		local leadX, leadY, leadZ = leaderObj:GetPosition();

		if (leaderObj:GetDistance() >= distance or GetDistance3D(myX, myY, myZ, leadX, leadY, leadZ) >= distance) 
			and (not leaderObj:IsDead())
			and (not localObj:IsDead())
			and (not IsCasting())
			and (not IsChanneling())
			and (not IsDrinking())
			and (not IsEating())
		then

			script_navEXCombat:moveToTarget(GetLocalPlayer(), leadX, leadY, leadZ);

			if not IsMoving() then
				Move(leadX, leadY, leadZ)
				script_follow.message = "Nav broke...";
			end
			
			script_follow.message = "Following Party Leader...";
		end
	return false;
	end
return false;
end