script_mageRest = {}
	
function script_mageRest:rest()

	if (not script_mage.isSetup) then
		script_mage:setup();
	end

	local localObj = GetLocalPlayer();
	local localMana = localObj:GetManaPercentage();
	local localHealth = localObj:GetHealthPercentage();

	if (script_mage.moveAwayRest) and (localHealth < script_mage.eatHealth or localMana < script_mage.drinkMana) then
		if (script_checkAdds:moveWhileResting(10)) then
			script_mage.waitTimer = GetTimeEX() + 500;
			script_grind.waitTimer = GetTimeEX() + 500;
			script_mage.message = "Moving away from adds to drink/eat.";
			return true;
		end
	end

	if (script_mage.waitTimer > GetTimeEX() or IsMounted()) then
		return;
	end

	-- if we are undead then use cannibalize on humanoids or other undeads
	if (HasSpell("Cannibalize")) and (not IsSpellOnCD("Cannibalize")) then
		if (Cannibalize()) then
			script_mage.waitTimer = GetTimeEX() + 10000;
			script_grind:setWaitTimer(2500);
			return true;
		end
	end

	--if (not IsDrinking() and localMana < script_mage.drinkMana) and (not IsSwimming()) then
	--	if IsMoving() then
	--		StopMoving(); 
	--	return true;
	--	end
	--end

	--Create Water
	local waterIndex = -1;
	for i=0,script_mage.numWater do
		if (HasItem(script_mage.water[i])) then
			waterIndex = i;
			break;
		end
	end

	if (not IsEating()) and (not IsDrinking()) and (IsStanding()) then 
		if (waterIndex == -1) and (HasSpell('Conjure Water')) then
			script_mage.message = "Conjuring water...";
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			if (not IsStanding()) then
				StopMoving();
				return true;
			end
			if(IsMounted()) then 
				DisMount(); 
			end
			if (localMana > 10 and not IsDrinking() and not IsEating() and not AreBagsFull()) then
				if (HasSpell('Conjure Water')) then
					if IsMoving() then StopMoving() return true; end
					CastSpellByName('Conjure Water')
					script_mage.waitTimer = GetTimeEX() + 1700;
					script_grind:setWaitTimer(1500);
					return true;
				end
			end
		end
	end

	--Create Food
	local foodIndex = -1;
	for i=0,script_mage.numfood do
		if (HasItem(script_mage.food[i])) then
			foodIndex = i;
			break;
		end
	end

	if (not IsEating()) and (not IsDrinking()) and (IsStanding()) then
		if (foodIndex == -1) and (HasSpell('Conjure Food')) then 
			script_mage.message = "Conjuring food...";
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			if (not IsStanding()) then
				StopMoving();
				return true;
			end
			if(IsMounted()) then 
				DisMount(); 
				return true;
			end
			if (localMana > 10 and not IsDrinking() and not IsEating() and not AreBagsFull()) then
				if (HasSpell('Conjure Food')) then
					if IsMoving() then StopMoving() return true; end
					CastSpellByName('Conjure Food')
					script_mage.waitTimer = GetTimeEX() + 1700;
					script_grind:setWaitTimer(1500);
					return true;
				end
			end
		end
	end
	
	--Create Mana Gem
	local gemIndex = -1;
	for i=0,script_mage.numGem do
		if (HasItem(script_mage.manaGem[i])) then
			gemIndex = i;
			break;
		end
	end

	if (not IsEating()) and (not IsDrinking()) and (IsStanding()) then
		if (gemIndex == -1 and (HasSpell('Conjure Mana Ruby') 
					or HasSpell('Conjure Mana Citrine') 
					or HasSpell('Conjure Mana Jade')
					or HasSpell('Conjure Mana Agate')))
					and (not IsEating() and not IsDrinking()) then 
			script_mage.message = "Conjuring mana gem...";
			if(IsMounted()) then 
				DisMount(); 
			end
	
			if (IsMoving()) then
				StopMoving();
				return true;
			end
	
			if (not IsStanding()) and (not IsInCombat()) then
				JumpOrAscendStart();
			end

			if (IsStanding()) then
				StopMoving();
			end

			if (localMana > 30 and not IsDrinking() and not IsEating() and not AreBagsFull() and not IsInCombat()) then
				if (HasSpell('Conjure Mana Ruby')) then
					if IsMoving() then StopMoving() return true; end
					CastSpellByName('Conjure Mana Ruby')
					script_mage.waitTimer = GetTimeEX() + 1800;
					return true;
				elseif (HasSpell('Conjure Mana Citrine')) then
					if IsMoving() then StopMoving() return true; end
					CastSpellByName('Conjure Mana Citrine')
					script_mage.waitTimer = GetTimeEX() + 1800;
					return true;
				elseif (HasSpell('Conjure Mana Jade')) then
					if IsMoving() then StopMoving() return true; end
					CastSpellByName('Conjure Mana Jade')
					script_mage.waitTimer = GetTimeEX() + 1800;
					return true;
				elseif (HasSpell('Conjure Mana Agate')) then
					if IsMoving() then StopMoving() return true; end
					CastSpellByName('Conjure Mana Agate')
					script_mage.waitTimer = GetTimeEX() + 1800;
					return true;
				end
			end
		end
	end

	-- Stop moving before we can rest
	if(localHealth < script_mage.eatHealth or localMana < script_mage.drinkMana) and not script_rotation.usingRotation then
		if (IsMoving()) then
			StopMoving();
			return true;
		end
	end
	
	-- stand up if sitting after drinking/eating -- used for buffs
	if (not IsEating()) and (not IsDrinking()) and not IsMounted() then

		if (not IsStanding()) then
			JumpOrAscendStart();
			local x, y, z = GetLocalPlayer():GetPosition();
			Move(x+1, y, z);
		end
	
		-- arcane intellect
		if not IsMounted() and (HasSpell("Arcane Intellect")) and (not localObj:HasBuff("Arcane Intellect")) and (localMana > 25) then
				if PlayerHasTarget() then if GetTarget():GetGUID() ~= GetLocalPlayer():GetGUID() then ClearTarget(); end end
			if (CastSpellByName("Arcane Intellect", localObj)) then
				script_grind:setWaitTimer(1700);
			end
		end
		
		-- ice armor / frost armor
		if not IsMounted() and script_mage.useFrostArmor and (HasSpell("Ice Armor")) and (not localObj:HasBuff("Ice Armor")) and (localMana > 20) then
			if not IsSpellOnCD("Ice Armor") then
				if (CastSpellByName("Ice Armor", localObj)) then
					script_grind:setWaitTimer(1700);
				end
			end
		elseif script_mage.useFrostArmor and (not HasSpell("Ice Armor")) and (HasSpell("Frost Armor")) and (not localObj:HasBuff("Frost Armor")) and (localMana > 20) then	
			if not IsSpellOnCD("Frost Armor") then
				if (CastSpellByName("Frost Armor", localObj)) then
					script_grind:setWaitTimer(1700);
				end
			end
		elseif script_mage.useMageArmor and HasSpell("Mage Armor") and not localObj:HasBuff("Mage Armor") and localMana >= 20 then
			if not IsSpellOnCD("Mage Armor") then
				if (CastSpellByName("Mage Armor", localObj)) then
					script_grind:setWaitTimer(1700);
				end
			end
		end
		-- dampen magic
		if (script_mage.useDampenMagic) then
			if (HasSpell("Dampen Magic")) and (not localObj:HasBuff("Dampen Magic")) and (localMana > 15) then
					if PlayerHasTarget() then if GetTarget():GetGUID() ~= GetLocalPlayer():GetGUID() then ClearTarget(); end end
					if (CastSpellByName("Dampen Magic", localObj)) then
					script_grind:setWaitTimer(1700);
				end
			end
		end
	
		-- combustion
		if (HasSpell("Combustion")) and (not IsSpellOnCD("Combustion")) and not (localObj:HasBuff("Combustion")) and (script_mage.fireMage) then	
			if (CastSpellByName("Combustion")) then
				script_grind:setWaitTimer(1700);
			end
		end

		-- frost ward
		if IsStanding() and (script_mage.useFrostWard) and (HasSpell("Frost Ward")) and (not localObj:HasBuff("Frost Ward")) then
			if (localMana > 25) and (not localObj:HasBuff("Fire Ward")) then
				if (CastSpellByName("Frost Ward", localObj)) then
					script_grind:setWaitTimer(1700);
				end
			end
		end
	
		-- fire ward
		if IsStanding() and (script_mage.useFireWard) and (HasSpell("Fire Ward")) and (not localObj:HasBuff("Fire Ward")) then
			if (localMana > 50) and (not localObj:HasBuff("Frost Ward")) then
				if (CastSpellByName("Fire Ward", localObj)) then
					script_grind:setWaitTimer(1700);
				end
			end
		end

		-- remove curse
		if (HasSpell("Remove Lesser Curse")) and (script_checkDebuffs:hasCurse()) and (localMana > 10) then
			if CastSpellByName("Remove Lesser Curse", localObj) then
				script_grind:setWaitTimer(1800);
			end
		end
	end

-- eat AND drink....
	if (localHealth <= script_mage.eatHealth
	or (IsEating() and not IsDrinking() and localMana <= 85))
	or (localMana <= script_mage.drinkMana or (IsDrinking() and not IsEating() and localHealth <= 80))
	and not IsSwimming() then
		if IsMoving() and not script_rotation.usingRotation then StopMoving(); return true; end

		-- if we need to eat
		if (not IsEating() and localHealth <= script_mage.eatHealth)

		-- if we are drinking and we are not eating then we should eat
		or (IsDrinking() and localHealth <= 80 and not IsEating()) then

			-- eat something
			if (script_helper:eat()) then

				-- drink something if we should
				if not IsDrinking() and localMana <= 85 then
					script_helper:drinkWater();
				end

				script_mage.message = "Eating..."; 
				script_grind.autoBlacklistTimer = GetTimeEX() + 15000;
				script_mage.waitTimer = GetTimeEX() + 500;
				return true; 

			-- we have no food
			else
				script_mage.message = "No food! (or food not included in script_helper)";
				return true; 
			end
		end
		
		-- if we need to drink
		if (not IsDrinking() and localMana <= script_mage.drinkMana) and not IsSwimming()
		
		-- if we are eating and we are not drinking then we should drink
		or (IsEating() and localMana <= 85 and not IsDrinking()) and not IsSwimming() then
			
			-- drink something
			if (script_helper:drinkWater()) then 

				-- eat something if we should
				if not IsEating() and localHealth <= 80 then
					script_helper:eat();
				end

				script_mage.message = "Drinking...";
				script_grind.autoBlacklistTimer = GetTimeEX() + 15000; 
				script_mage.waitTimer = GetTimeEX() + 500;
				return true; 

			-- we have no drinks
			else 
				script_mage.message = "No drinks! (or drink not included in script_helper)";
				return true; 
			end
		end
	end

	
	if (localMana < script_mage.drinkMana or localHealth < script_mage.eatHealth) and not IsSwimming() then
		if (IsMoving()) then
			StopMoving();
			return true;
		end
	end

	if (IsDrinking() and localMana >= 95 and not IsEating())
	or (IsEating() and localHealth >= 95 and not IsDrinking())
	or (IsDrinking() and IsEating() and localHealth >= 95 and localMana >= 95) then
		if (not IsInCombat()) then
			JumpOrAscendStart();
			local x, y, z = GetLocalPlayer():GetPosition();
			Move(x+1, y, z);
		end
	end
	
	if (IsDrinking() or IsEating()) then
		script_mage.message = "Resting to full hp/mana...";
		--script_grind:setWaitTimer(2000);
		--script_mage.waitTimer = GetTimeEX() + 2000;
		return true;
	end

	-- No rest / buff needed
	return false;
end