script_followSetWaitTimer = {}

function script_followSetWaitTimer:setWaitTimer(ms)

	script_follow.waitTimer = GetTimeEX() + (ms);

end