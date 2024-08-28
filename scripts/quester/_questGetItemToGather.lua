_questGetItemToGather = {}

function _questGetItemToGather:getItemToGather()
	local i, t = GetFirstObject();
	local bestDist = 9999;
	local bestTarget = nil;
	while i ~= 0 do
		if (t == 5) then
			if (ItemIsItemIDOfQuest) then
			local dist = i:GetDistance();
				if( dist < someRange and bestDist > dist) then
					local _x, _y, _z = i:GetPosition();
					if (not IsNodeBlacklisted(_x, _y, _z, 5)) then
						bestDist = dist;
						bestTarget = targetObj;
						return i:GetGUID();
					end
				end
			end
		end
		i, t = GetNextObject(i);
	end

end
