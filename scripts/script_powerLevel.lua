script_powerLevel = {playerName = nil}

-- should be similar to follower script without the needed party leader information and just a single target player follow while out of group to powerlevel on elites. you should tag the target on your main character and the bot will kill and do the rest.

function script_powerLevel:menu()

-- run a new window

-- get textbox for player name to be added

-- show combat draw

-- show heals if needed

end

function script_powerLevel:getTargetToAssist()

-- add to name textbox

-- run object manager and return player to assist

	local i, t = GetFirstObject()
	while i ~= 0 do
		if t == 4 then
			if t:GetUnitName() == self.playerName then
				return i;
			end
		end
	i, t = GetNextObject(i);
	end
return nil;
end

function script_powerLevel:moveToPlayer()

-- should be able to use moveToTarget script already set up but it would be nice to have a table of coords the assist target moved

return false;
end

function script_powerLevel:getTarget()

-- run object manager for playerName and get that targets target else return nil

	local assistTarget = script_powerLevel:getTargetToAssist()
	local i, t = GetFirstObject()
	if assistTarget ~= nil then
		while i ~= 0 do
			if t == 4 then
				if t:GetUnitName() == assistTarget:GetUnitName() then
					if t:GetUnitsTarget() ~= nil and t:GetUnitsTarget() ~= 0 then
						return i;
				end
			end
		i, t = GetNextObject(i);
		end
	end
return nil;
end


function script_powerLevel:run()

if script_powerLevel:getTarget() ~= nil and script_powerLevel:getTarget() ~= 0 then
	-- run combat script
	return true;
end
	

return false;
end