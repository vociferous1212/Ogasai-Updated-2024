script_priestEX2 = {}

function script_priestEX2:castDOTOnAdd()
	local i, t = GetFirstObject();
	while (i ~= 0) do
		if (t == 3) then
			if (script_grind:isTargetingMe(i)) and (i:GetDistance() <= 40) and (not i:HasDebuff("Shadow Word: Pain")) then
				if (Cast("Shadow Word: Pain", i)) then
					return true;
				end
			end
		end
	i, t = GetNextObject(i);
	end
return false;
end