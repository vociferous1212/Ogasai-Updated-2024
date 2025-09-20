script_grindAttackTargetAttackingMe = {}


-- return a grind enemy object attacking PlayerHasTarget

function script_grindAttackTargetAttackingMe:attackTargetAttackingMe()

	if (not PlayerHasTarget()) and (script_grind.enemyObj == 0 or script_grind.enemyObj == nil) then

		local i, t = GetFirstObject();

		while i ~= 0 do

			if t == 3 then

				-- limit the check by distance... anything over 40 yards must move closer...
				if i:GetDistance() <= 40 then
					
					if (script_grind:isTargetingMe(i)) then

						script_grind.enemyObj = i;
						return true;
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end
return false;
end
