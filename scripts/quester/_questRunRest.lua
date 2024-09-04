_questRunRest = {}

function _questRunRest:runRest()
	if (IsInCombat()) or (IsLooting()) then
		return false;
	end
	local localObj = GetLocalPlayer();
	local localHealth = localObj:GetHealthPercentage();
	local localMana = localObj:GetManaPercentage();
	

	_quest.needRest = true;

	-- run the rest script for grind/combat
	if(RunRestScript()) then

		_quest.message = "Resting...";

		if (IsMoving()) and (not localObj:IsMovementDisabed()) then
			StopMoving();
		return true;
		end

		if (not IsInCombat()) and (not petHasTarget) then
			if (IsEating() and localHealth < 95) or (IsDrinking() and localMana < 95) then

			return true;
			end
		end
		if (IsEating() and localHealth >= 95 and IsDrinking() and localMana >= 95) or (not IsDrinking() and IsEating() and localHealth >= 95) or (not IsEating() and IsDrinking() and localMana >= 95)
		then
			if (not IsStanding()) then
				JumpOrAscendStart();
			return false;
			end
		end
	return true;
	end

_quest.needRest = false;
return false;
end