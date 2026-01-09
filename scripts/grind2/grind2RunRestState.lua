grind2RunRestState = {

	isSetup = false,

}

function grind2RunRestState:setup()

	self.isSetup = true;
end

function grind2RunRestState:run()

	local player = GetLocalPlayer();

	local health = player:GetHealthPercentage();

	local mana = player:GetManaPercentage();

	local pet = GetPet();


-- check setup
	if not self.isSetup then

		grind2RunRestState:setup();
	end


	self.needRest = true;

-- run rest
	if (RunRestScript()) then

		self.message = "Resting...";

		if not IsDrinking() and mana <= grind2.restMana then
			grind2Water:drink();
			return true;
		end

		if not IsEating() and health <= grind2.restHealth then
			grind2Food:eat();
			return true;
		end


		if (IsDrinking() or IsEating()) and (not IsInCombat()) then

			return true;
		end

-- Stop moving
		if not IsInCombat() and IsMoving() and not player:IsMovementDisabed() then

			StopMoving();

			return true;
		end

		if IsMounted() then

			DisMount();

			return true;
		end

-- stop to rest
		if not IsInCombat() and ( (IsEating() and health < 95) or (IsDrinking() and mana < 95) ) then

			return true;
		end
	
-- if done resting then stand up
		if not IsStanding()
		and (IsEating() and health >= 95 and IsDrinking() and mana >= 95) 
		or (not IsDrinking() and IsEating() and health >= 95)
		or (not IsEating() and IsDrinking() and mana >= 95) then

			if (not IsStanding()) then

				JumpOrAscendStart();

				return false;
			end
		end

	return true;	
	end

self.needRest = false;

return false;
end