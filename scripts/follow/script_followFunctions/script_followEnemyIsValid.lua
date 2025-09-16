script_followEnemyIsValid = {}

function script_followEnemyIsValid:enemyIsValid(i)

	if (i ~= 0) then
		-- Valid Targets: Tapped by us, or is attacking us or our pet
		if (script_followIsTargetingMe:IsTargetingMe(i)
			or (script_followIsTargetingPet:IsTargetingPet(i) and (i:IsTappedByMe() or not i:IsTapped())) 
			or (i:IsTappedByMe() and not i:IsDead())) then 
				return true; 
		end
		-- Valid Targets: Within pull range, levelrange, not tapped, not skipped etc
		if (not i:IsDead()) and (i:CanAttack()) and (not i:IsCritter())
			and (i:GetDistance() < 100) and (not i:IsTapped() or i:IsTappedByMe()) then
			return true;
		end
	end
	return false;

end