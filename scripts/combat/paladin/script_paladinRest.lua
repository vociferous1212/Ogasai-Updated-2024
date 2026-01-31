script_paladinRest = {}

function script_paladinRest:rest()

	if (GetLocalPlayer():GetHealthPercentage() <= script_paladin.eatHealth) and (not IsInCombat()) then
		ClearTarget();
	end

	if IsInCombat() then return false; end

	if(not script_paladin.isSetup) then
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

	local localObj = GetLocalPlayer();
	local localLevel = localObj:GetLevel();
	local localHealth = localObj:GetHealthPercentage();
	local localMana = localObj:GetManaPercentage();

	-- heal before eating
	if (IsStanding()) and (not IsEating()) and (not IsDrinking()) and (not IsMoving()) and (not IsInCombat()) and (localMana > 8) then
		if script_paladinHealsAndBuffs:healsAndBuffs() then
				if IsMoving() then StopMoving(); return; end
			return true;
		end
	end

	if (IsEating() and localHealth >= 90)
	or (IsDrinking() and localMana >= 90)
	or (not IsEating() and not IsDrinking() and not IsStanding())
	then
		JumpOrAscendStart();
	end

	-- Stop moving before we can rest
	if (localHealth <= script_paladin.eatHealth or localMana <= script_paladin.drinkMana) and (not IsEating()) and (not IsDrinking()) and not IsSwimming() then
		if (IsMoving()) then
			StopMoving();
			return true;
		end
	end

	-- Eat and Drink
	if (not IsDrinking() and localMana < script_paladin.drinkMana) and not IsSwimming() then
		script_paladin.message = "Need to drink...";
		script_paladin.waitTimer = GetTimeEX() + 2000;
		-- Dismount
		if(IsMounted()) then 
			DisMount(); 
			return true; 
		end
		if (IsMoving()) then
			StopMoving();
			return true;
		end

		if (script_helper:drinkWater()) then 
			script_paladin.message = "Drinking..."; 
			script_paladin.waitTimer = GetTimeEX() + 2000;
			return true; 
		else 
			script_paladin.message = "No drinks! (or drink not included in script_helper)";
			ClearTarget();
			return true; 
		end
	end

	if (not IsEating() and localHealth < script_paladin.eatHealth) and not IsSwimming() then
		-- Dismount
		if(IsMounted()) then DisMount(); end
		script_paladin.message = "Need to eat...";
		script_paladin.waitTimer = GetTimeEX() + 2000;	
		if (IsMoving()) then
			StopMoving();
			return true;
		end
		
		if (script_helper:eat()) then 
			script_paladin.message = "Eating..."; 
			script_paladin.waitTimer = GetTimeEX() + 2000;
			return true; 
		else 
			script_paladin.message = "No food! (or food not included in script_helper)";
			ClearTarget();
			return true; 
		end	
	end
	if (IsDrinking()) and (not IsEating()) and (localHealth <= 65) then
		if (script_helper:eat()) then 
			script_paladin.message = "Eating..."; 
			script_paladin.waitTimer = GetTimeEX() + 2000;
			return true; 
		end
	end
	if (IsEating()) and (not IsDrinking()) and (localMana <= 65) then
		if (script_helper:drinkWater()) then 
			script_paladin.message = "Drinking..."; 
			script_paladin.waitTimer = GetTimeEX() + 2000;
			return true; 
		end
	end		
	-- rest to full mana/health when eating/drinking
	if ((localMana < 98 and IsDrinking()) or (localHealth < 98 and IsEating())) then
		script_paladin.message = "Resting to full hp/mana...";
		return true;
	end
	-- Don't need to rest
	return false;
end