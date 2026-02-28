script_paladinRest = {}

function script_paladinRest:rest()

	local player = GetLocalPlayer();
	local health = player:GetHealthPercentage();
	local mana = player:GetManaPercentage();
	local localLevel = player:GetLevel();

	-- if we need to eat then clear any target we have
	if health <= script_paladin.eatHealth and not IsInCombat() then
		ClearTarget();
	end

	-- return if we are in combat
	if IsInCombat() then
		return false;
	end

	-- run setup if not already setup
	if not script_paladin.isSetup then

		script_paladin:setup();
	end
	
	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(350, 500);

		if (IsMoving()) or (not IsInCombat()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end

	-- heal before eating
	if IsStanding() and not IsEating() and not IsDrinking() and not IsMoving() and not IsInCombat() and mana > 8 then
		if script_paladinHealsAndBuffs:healsAndBuffs() then
			if IsMoving() then
				StopMoving();
				return;
			end
		return true;
		end
	end

	-- if casting or channeling then return
	if IsCasting() or IsChanneling() then
		return false;
	end

	-- stand up / jump if we are done eating and drinking
	if (IsEating() and health >= 90) or (IsDrinking() and mana >= 90) then
		JumpOrAscendStart();
	end

	-- Stop moving before we can rest
	if (health <= script_paladin.eatHealth or mana <= script_paladin.drinkMana) and not IsEating() and not IsDrinking() and not IsSwimming() then
		if IsMoving() then
			StopMoving();
			return true;
		end
	end

	-- Eat and Drink
	if PlayerLevel() >= 2 and (not IsDrinking() and mana < script_paladin.drinkMana) and not IsSwimming() and not IsCasting() and not IsSpellOnCD("Drink") and IsStanding() then

		script_paladin.message = "Need to drink...";

		script_paladin.waitTimer = GetTimeEX() + 2000;
		grind2:setTimer(500);

		-- Dismount
		if IsMounted() then 

			DisMount(); 

			return true; 
		end

		if IsMoving() then

			StopMoving();

			return true;
		end

		if script_helper:drinkWater() then 

			script_paladin.message = "Drinking..."; 

			script_paladin.waitTimer = GetTimeEX() + 2000;
			grind2:setTimer(500);

			return true; 
		else 

			script_paladin.message = "No drinks! (or drink not included in script_helper)";

			ClearTarget();

			return true; 
		end
	end

	if not IsEating() and health < script_paladin.eatHealth and not IsSwimming() and not IsCasting() and not IsSpellOnCD("Eat") then

		-- Dismount
		if IsMounted() then

			DisMount();
		end

		script_paladin.message = "Need to eat...";

		script_paladin.waitTimer = GetTimeEX() + 2000;
		grind2:setTimer(500);

		if IsMoving() then

			StopMoving();

			return true;
		end
		
		if script_helper:eat() then 

			script_paladin.message = "Eating...";
			
			script_paladin.waitTimer = GetTimeEX() + 2000;
			grind2:setTimer(500);

			return true; 
		else 

			script_paladin.message = "No food! (or food not included in script_helper)";

			ClearTarget();

			return true; 
		end	
	end

	if IsDrinking() and not IsEating() and health <= 65 then

		if script_helper:eat() then 

			script_paladin.message = "Eating..."; 

			script_paladin.waitTimer = GetTimeEX() + 2000;

			return true; 
		end
	end

	if IsEating() and not IsDrinking() and mana <= 65 then

		if (script_helper:drinkWater()) then 

			script_paladin.message = "Drinking..."; 

			script_paladin.waitTimer = GetTimeEX() + 2000;

			return true; 
		end
	end		

	-- rest to full mana/health when eating/drinking
	if (mana < 98 and IsDrinking()) or (health < 98 and IsEating()) then

		script_paladin.message = "Resting to full hp/mana...";

		return true;
	end

	-- Don't need to rest
	return false;
end