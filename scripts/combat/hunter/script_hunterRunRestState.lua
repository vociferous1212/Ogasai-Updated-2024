script_hunterRunRestState = {


}

function script_hunterRunRestState:run()

	local pet = GetPet();

	if (not script_hunter.isSetup) then
		script_hunter:setup();
	end

	if not IsInCombat() then
		if not PlayerHasTarget() then
			script_grind.combatScriptRange = script_hunter.spellRange;
		end
		if PlayerHasTarget() and GetTarget():GetDistance() <= script_hunter.minSpellRange then
			script_grind.combatScriptRange = script_hunter.meleeDistance;
		end
	end

	-- cancel feign death
	if GetLocalPlayer():HasBuff("Feign Death") then
		if (pet ~= 0 and pet ~= nil and not IsInCombat and pet:IsDead()) or (not IsInCombat() and not IsAnyTargetTargetingPlayer()) then
			local x, y, z = GetLocalPlayer():GetPosition();
			Move(x+1, y+1, z);
		end
	end

	-- if we have any bandages then we can use first aid skill
	if (HasItem("Linen Bandage")) or 
		(HasItem("Heavy Linen Bandage")) or 
		(HasItem("Wool Bandage")) or 
		(HasItem("Heavy Wool Bandage")) or 
		(HasItem("Silk Bandage")) or 
		(HasItem("Heavy Silk Bandage")) or 
		(HasItem("Mageweave Bandage")) or 
		(HasItem("Heavy Mageweave Bandage")) or 
		(HasItem("Runecloth Bandage")) or 
		(HasItem("Heavy Runecloth Bandage")) then

		script_hunter.hasBandages = true;
	else
		script_hunter.hasBandages = false;
		if (not script_grind.useFirstAid) then
			script_hunter.useBandage = false;
		end
	end

	-- craft bandages
	if (not GetLocalPlayer():IsDead()) and (not script_hunter.hasBandages) and (script_grind.useFirstAid) and (HasSpell("First Aid")) then
		if script_firstAid:canCraftBandage() then
			if (script_firstAid:craftBandages()) then
				return true;
			end
		end
		if (script_firstAid.bookOpen) then
			script_firstAid.bookOpen = false;
			CloseTradeSkill();
		end
	end

	local localObj = GetLocalPlayer();
	local localMana = localObj:GetManaPercentage();
	local localHealth = localObj:GetHealthPercentage();

	-- Stop moving before we can rest
	if(localHealth < script_hunter.eatHealth) or (localMana < script_hunter.drinkMana) then
		if (IsMoving()) then
			StopMoving();
			return true;
		end
	end

	-- if has bandage then use bandages
	if (script_hunter.hasBandages) and (script_hunter.useBandage) and (not IsMoving()) then
		if (not script_checkDebuffs:hasPoison()) and (not IsEating()) and (localHealth <= script_hunter.eatHealth)
		and (not localObj:HasDebuff("Recently Bandaged")) then
			if (IsMoving()) then
				StopMoving();
			end
			script_hunter.waitTimer = GetTimeEX() + 1200;
			if (IsStanding()) and (not IsInCombat()) and (not IsMoving()) and (not localObj:HasDebuff("Recently Bandaged")) then
				script_helper:useBandage()		
				script_hunter.waitTimer = GetTimeEX() + 6000;
			end
			
		end
	end

	-- Check: Let the feed pet duration last, don't engage new targets
	if not IsMounted() and (not IsInCombat()) and (script_hunter.feedTimer > GetTimeEX()) and (script_hunter.useFeedPet) and (not IsInCombat())
	and (script_hunter.hasPet) and (GetPet() ~= 0) then 
		script_hunter.message = "Feeding the pet, pausing... Make sure food is in correct slot!";
		if (GetPet():GetDistance() > 8) then
			if GetTimeEX() > script_hunter.petFollowTimer then
				PetFollow();
				script_hunter.petFollowTimer = GetTimeEX() + 500;
			end
			script_hunter.waitTimer = GetTimeEX() + 1250;
			grind2RunCombatState.blacklistTargetTimer = GetTimeEX() * 2;
			return true;
		end
	end

	-- Eat and Drink
	if not IsMoving() and (not IsDrinking() and localMana < script_hunter.drinkMana) then
			script_hunter.message = "Need to drink...";
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			if (script_helper:drinkWater()) then 
				script_hunter.waitTimer = GetTimeEX() + 500;
				script_hunter.message = "Drinking..."; 
				return true; 
			else 
				script_hunter.message = "No drinks! (or drink not included in script_helper)";
				ClearTarget();
				return true; 
			end
		end

	if not IsMoving() and (not IsEating() and localHealth < script_hunter.eatHealth) then	
		script_hunter.message = "We need to eat...";
		if (IsMoving()) then
			StopMoving();
			return true;
		end
		
		if (script_helper:eat()) then 
			script_hunter.message = "Eating..."; 
			return true; 
		else 
			script_hunter.message = "No food! (or food not included in script_helper)";
			return true; 
		end
	end
	
	if not IsInCombat() and (localMana < script_hunter.drinkMana or localHealth < script_hunter.eatHealth) then
		if (IsMoving()) then
			StopMoving();
		end
		return true;
	end

	-- night elve stealth while resting
	if (IsDrinking() or IsEating()) and (HasSpell("Shadowmeld")) and (not IsSpellOnCD("Shadowmeld"))
	and (not localObj:HasBuff("Shadowmeld")) then
		if (CastSpellByName("Shadowmeld")) then
			
		end
	end
	
	-- continue resting if eating or drinking
	if((localMana < 95 and IsDrinking()) or (localHealth < 95 and IsEating())) then
		script_hunter.message = "Resting, eating and/or drinking...";
		return true;
	elseif (not IsEating() or (IsEating() and localHealth >= 95)) or (not IsDrinking() or (IsDrinking() and localMana >= 95)) then
		if not IsStanding() then
			JumpOrAscendStart()
		end
	end

	-- Check hunter bags if they are full
	local inventoryFull = true;
	-- Check bags 1-4, except the quiver bag (quiverBagNr)
		for i=1,4 do 
		if (i ~= script_hunter.quiverBagNr) then 
			for y=1,GetContainerNumSlots(i-1) do 
				local texture, itemCount, locked, quality, readable = GetContainerItemInfo(i-1,y);
				if (itemCount == 0 or itemCount == nil) then 
					inventoryFull = false; 
				end 
			end 
		end 
	end

	-- Tell the grinder we cant loot
	if (inventoryFull) then
		script_grind.bagsFull = true;
	end

	if (script_grind.useVendor and grind2.useVendor and inventoryFull) then


		-- we must continue with sell script here because the check bag function in the DLL will override bag checks...
		script_vendor:sell();

		script_hunter.bagsFull = true;
	end

	-- Check: If Mainhand is broken stop bot
	local isRangedBroken = GetInventoryItemBroken("player", 18);
	
	if (isRangedBroken and script_grind.useVendor) then
		script_hunter.message = "Our weapon is broken, go to reapir...";
		script_vendor:repair();
		return false;
	end

	if (GetNumPartyMembers() == 0)
		and (not script_grind.useVendor)
		and inventoryFull
		and script_grind.stopBotWhenInvFull

	then

		script_hunter.message = "Inventory is full...";

		if (IsMoving()) then
			StopMoving();
		end
		
		if (script_hunter.hsWhenStop) then
			if (GetContainerItemCooldown(script_hunter.hsBag-1, script_hunter.hsSlot) == 0) then 
				UseItem('Hearthstone'); 
				script_hunter.message = "Inventory is full, using hearthstone...";
				return true; 
			else 
				Logout(); StopBot(); return true; 
			end 	
		end
		return true;
	end

	-- Quiver check : should we go buy ammo?
	if (script_hunter.buyWhenQuiverEmpty and script_hunter.ammoName ~= 0 and not IsInCombat()) and script_grind.useVendor then
		local ammoNr = 0;
		for y=1,GetContainerNumSlots(script_hunter.quiverBagNr-1) do
			local texture, itemCount, locked, quality, readable = GetContainerItemInfo(script_hunter.quiverBagNr-1,y);
			if (itemCount ~= nil) then 
				ammoNr = ammoNr + 1; 
			end 
		end

		-- Go buy ammo if we have just 1 stack of ammo left
		if (ammoNr <= 1 and script_hunter.ammoName ~= 0) then
			script_vendor:buyAmmo(script_hunter.quiverBagNr-1, script_hunter.ammoName, script_hunter.ammoIsArrow);
			script_grind.message = "Going to vndor to buy ammo...";
			return;
		end 
	end

	-- Quiver check : Stop when out of ammo?
	if (script_hunter.stopWhenQuiverEmpty and not IsInCombat()) then
		local quiverEmpty = true;
		for y=1,GetContainerNumSlots(script_hunter.quiverBagNr-1) do
			local texture, itemCount, locked, quality, readable = GetContainerItemInfo(script_hunter.quiverBagNr-1,y);
			if (itemCount ~= nil) then 
				quiverEmpty = false; 
			end 
		end

		if (quiverEmpty and script_hunter.hsWhenStop) then
			if (GetContainerItemCooldown(script_hunter.hsBag-1, script_hunter.hsSlot) == 0) then 
				UseItem('Hearthstone'); 
				script_hunter.message = "Quiver is empty, using hearthstone...";
				return true; 
			else 
				Logout(); StopBot(); return true; 
			end 	
		end
		if (quiverEmpty) then
			Logout(); StopBot(); return true;
		end
	end

	-- Check pet food, change bag and/or slot if the stack ran out
	script_hunterCheckPetFood:checkPetFood();

	-- Pet checks
	if (script_hunterDoPetChecks:doPetChecks()) then return true; end

	if not HasSpell("Mend Pet") and GetPet() ~= nil and GetPet() ~= 0 then
		if GetPet():GetHealthPercentage() <= 55 then
			script_hunter.message = "No mend pet spell... waiting for pet health";
			return true;
		end
	end
	if localMana > 95 and IsDrinking() or localHealth > 95 and IsEating() then JumpOrAscendStart(); end
	-- Aspect check
	if (not IsMounted()) then if (script_hunterChooseAspect:chooseAspect(script_grind:getTarget())) then return false; end end

	-- No rest / buff needed
	if (script_hunter.needToRest) then
		script_hunter.waitTimer = GetTimeEX() + 500;
		script_hunter.message = "Need to rest!";
		return;
	end
	return false;
end

