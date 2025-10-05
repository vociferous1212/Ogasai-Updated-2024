script_grindIsEliteTargetingMe = {}


-- if there is any elite targeting me or the pet then return true or false
-- used mainly for vanish and feign death conditions
function script_grindIsEliteTargetingMe:isEliteTargetingMe()

local i, t = GetFirstObject()

	while i ~= 0 do

		if t == 3 and (i:GetClassification() == 1 or i:GetClassification() == 2)
		and (script_grind:isTargetingMe(i) or script_grind:isTargetingPet(i))
		
		then

			return true;
		end

	i, t = GetNextObject(i);
	end

return false;
end