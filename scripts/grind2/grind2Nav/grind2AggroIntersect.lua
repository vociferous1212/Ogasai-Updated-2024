
function script_runner:aggroIntersect(target)
	local x, y,z = target:GetPosition();
	while currentObj ~= 0 do
 		if typeObj == 3 then
			aggro = currentObj:GetLevel() - localObj:GetLevel() + 21;
			local range = aggro + safeMargin;
			if currentObj:CanAttack() and not currentObj:IsDead() and not currentObj:IsCritter() and currentObj:GetDistance() <= range then	
				local xx, yy, zz = currentObj:GetPosition();
				local dist = math.sqrt((x-xx)^2 +(y-yy)^2);
				if (dist < aggro*2) then
					return currentObj;
				end
 			end
 		end
 		currentObj, typeObj = GetNextObject(currentObj);
 	end
	return nil;
end