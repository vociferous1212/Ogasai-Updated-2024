script_followRandomFollowLeaderDistance = {}

function script_followRandomFollowLeaderDistance:randomFollowLeaderDistance()

	-- random follow leader distance
	if (GetTimeEX() > script_follow.followTimer) and (script_follow.randomFollow) then

		local r = math.random(10, 20);

		script_follow.followLeaderDistance = r;

		script_follow.followTimer = GetTimeEX() + 18000;
	end

end