_questRunRest = {}

function _questRunRest:runRest()

	-- return if we are in combat or looting
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

		-- stop moving if we are moving
		if (IsMoving()) and (not localObj:IsMovementDisabed()) then

			StopMoving();

		return true;
		end


		-- clear our target if nothing is targeting me
		if PlayerHasTarget() and not script_grind:isAnyTargetTargetingMe() and not IsInCombat() then

			ClearTarget();

		end

		-- if we are not in combat and our pet doesn't have a target (it will sometimes be in combat without you)
		if (not IsInCombat()) and (not petHasTarget) then

			if (IsEating() and localHealth < 95) or (IsDrinking() and localMana < 95) then
			
			-- set a timer
			_quest:setTimer(5000);


			return true;
			end
		end


		-- if we are done eating and drinking and we are close enough to full health then stand up/jump
		if (IsEating() and localHealth >= 95 and IsDrinking() and localMana >= 95)
			or (not IsDrinking() and IsEating() and localHealth >= 95) 
			or (not IsEating() and IsDrinking() and localMana >= 95) then

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