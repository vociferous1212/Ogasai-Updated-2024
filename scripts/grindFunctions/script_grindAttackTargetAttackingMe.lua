script_grindAttackTargetAttackingMe = {}


-- return a grind enemy object attacking PlayerHasTarget

function script_grindAttackTargetAttackingMe:attackTargetAttackingMe()

	if (script_grind.enemyObj == 0 or script_grind.enemyObj == nil) then

		local i, t = GetFirstObject();

		while i ~= 0 do

			if t == 3 then

				if i:GetDistance() <= 50 then
					
					if (script_grind:isTargetingMe(i) or script_grind:isTargetingPet(i)) then

						script_grind.enemyObj = i;
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end
return false;
end
