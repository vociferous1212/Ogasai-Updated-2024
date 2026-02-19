script_hunterDoPetChecks = {}

function script_hunterDoPetChecks:doPetChecks()


-- set variables
	local localObj = GetLocalPlayer();

	local localMana = localObj:GetManaPercentage();

	local pet = GetPet();

	local petHP = 0;

	if (pet ~= nil and pet ~= 0) then

		petHP = pet:GetHealthPercentage();
	end
	


-- has pet check
	if (localObj:GetLevel() < 10) then

		script_hunter.hasPet = false;
	end



-- Check: If pet is dismissed then Call pet 
	if (GetPet() == 0) and (script_hunter.hasPet) and (IsStanding()) and (not IsMounted()) and HasSpell("Call Pet") then

		script_hunter.message = "Pet is missing, calling pet...";

		if not IsInCombat() and (IsMoving()) or (not IsStanding()) then

			StopMoving();
		end

		CallPet();

		script_hunter.waitTimer = GetTimeEX() + 1850;

		return true;
	end



-- Check: If pet is dead, then revive pet
	if GetLocalPlayer():GetLevel() >= 10 and not IsMounted() and HasSpell("Call Pet")  then

		if (GetPet() == nil or GetPet() == 0) or (GetPet() ~= 0 and GetPet() ~= nil and GetPet():IsDead()) then

			if IsStanding() and (script_hunter.hasPet) and (GetPet() ~= nil and GetPet():IsDead())
			and (not IsInCombat()) and (HasSpell("Revive Pet")) then	

				script_hunter.message = "Pet is dead, reviving pet...";

				if (IsMoving()) or (not IsStanding()) then 

					StopMoving(); 

					return true; 
				end

				if GetPet() == 0 then

				CastSpellByName("Call Pet");
				end

				if (localMana > 60) then 

					CastSpellByName('Revive Pet'); 

					script_hunter.waitTimer = GetTimeEX() + 1850;

					script_grind:setWaitTimer(1850);

					return true; 
				else 

					script_helper:drinkWater();

					script_hunter.message = "Pet is dead, need more mana to ress it...";

					return true; 
				end
			end
		end
	end



-- Check: Stop if we ran out of pet food in the "pet food slot"
	if (script_hunter.stopWhenNoPetFood) and (script_hunter.hasPet) and (not IsInCombat()) then

		local texture, itemCount, locked, quality, readable = GetContainerItemInfo(script_hunter.bagWithPetFood-1, script_hunter.slotWithPetFood);

		if (itemCount == nil) then

			script_hunter.message = "No more pet food, stopping the bot..."; 

			if (IsMoving() or not IsStanding()) then

				StopMoving();

				return true;
			end

			if (GetContainerItemCooldown(script_hunter.hsBag-1, script_hunter.hsSlot) == 0 and script_hunter.hsWhenStop) then 

				UseItem('Hearthstone'); 

				script_hunter.waitTimer = GetTimeEX() + 1850; 

				return true; 
			else 

				Logout(); 

				StopBot(); 

				return true;  
			end 
		end
	end



-- Check: If pet isn't happy, feed it 
	if not IsMounted() and (petHP > 0) and (script_hunter.hasPet) and (script_hunter.useFeedPet) then
	
		local happiness, damagePercentage, loyaltyRate = GetPetHappiness();

		if (not GetPet():IsDead()) and (script_hunter.feedTimer < GetTimeEX()) and (not IsInCombat()) then

			if (happiness < 3 or loyaltyRate < 0) and (GetPet():GetDistance() <= 8) and (not IsInCombat()) then

				script_hunter.message = "Pet is not happy, feeding the pet...";

				if (not IsStanding()) then

					StopMoving();

					return true;
				end

				CastSpellByName("Feed Pet"); 

				TargetUnit("Pet"); 

				PickupContainerItem(script_hunter.bagWithPetFood-1, script_hunter.slotWithPetFood);

				-- Set a 20 seconds timer for this check (Feed Pet duration)
				script_hunter.feedTimer = GetTimeEX() + 20000; 

				script_hunter.waitTimer = GetTimeEX() + 5000; 

				return true;
			end
		end
	end	



-- mend pet
	local mendPet = HasSpell("Mend Pet");

	if (mendPet) then

		-- Check: Mend the pet if it has lower than 70% HP and out of combat
		if (script_hunter.hasPet) and (petHP <= script_hunter.mendPetHealth) and (petHP > 0) and (not IsInCombat()) then

			if (GetPet():GetDistance() > 8) and GetTimeEX() >= script_hunter.petFollowTimer then

				PetFollow();

				script_hunter.petFollowTimer = GetTimeEX() + 500;

				script_hunter.waitTimer = GetTimeEX() + 1850; 

				return true;
			end

			local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Mend Pet");


			if GetPet():GetDistance() < 20 and ((PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 20) and not IsInCombat() then

				script_hunter.message = "Pet has lower than 60% HP, waiting for HP or mana...";


				if (script_hunter.hasPet) and (petHP <= script_hunter.mendPetHealth) and (not IsInCombat()) and (petHP > 0) then

					script_hunter.message = "Pet has lower than 60% HP, mending pet...";

					if (IsMoving()) or (not IsStanding()) then

						StopMoving();

						return true;
					end

					if CastSpellByName('Mend Pet') then

						script_hunter.waitTimer = GetTimeEX() + 5000; 

						script_grind:setWaitTimer(5000);
						grind2:setTimer(5000);
						return true;
					end
				end
			end
		return true;
		end
	end
	return false;
end