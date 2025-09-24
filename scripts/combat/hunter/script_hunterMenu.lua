script_hunterMenu = {
	
		quickGrind = false	
}



function script_hunterMenu:menu()

	local wasClicked = false;

	if (CollapsingHeader("Hunter Combat Options")) then

-- use ranged attacks or melee attacks
		wasClicked, script_hunter.useRangedAttacks = Checkbox("Use Ranged Attacks", script_hunter.useRangedAttacks);

		if script_hunter.useRangedAttacks then

			Text("Ranged Attack Distsance");
			script_hunter.spellRange = SliderInt("Dist yards", 30, 41, script_hunter.spellRange);
		end

		Separator();

-- if we have a pet we can disable some settings and focus solely on grinding mobs
		if GetLocalPlayer():GetLevel() > 10 then

			wasClicked, self.quickGrind = Checkbox("Disable Some Settings - Quick Grind", self.quickGrind);

			if self.quickGrind then

				script_grind.skipLooting = true;
				script_grind.gather = false;
				script_hunter.useMark = false;
				script_hunter.drinkMana = 15;
				script_hunter.waitAfterCombat = false;
				script_warlock.waitAfterCombat = false;
				script_grindMenu.adjustTickRate = true;
			end
		end

-- set bandages
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
		
			self.menuBandages = true;
		else
			self.menuBandages = false;
		end
		
		if (self.menuBandages) or (GetLocalPlayer():GetLevel() >= 10) then
			Separator();
		end

-- use pet button
		if (GetLocalPlayer():GetLevel() >= 10) then
			wasClicked, script_hunter.hasPet = Checkbox("Use Pet", script_hunter.hasPet);
			if (script_grindMenu.helpMenu) then
				Text("*Use hunter class without pet enabled*");
			end
		end

-- use bandages button
		if (self.menuBandages) then
			SameLine();
			wasClicked, script_hunter.useBandage = Checkbox("Use Bandages", script_hunter.useBandage);
			if (script_grindMenu.helpMenu) then
				Text("*Use bandaged instead of food*")
			end
		end

-- aspect of cheetah button
		if (HasSpell("Aspect of the Cheetah")) then
			Separator();
			wasClicked, script_hunter.useCheetah = Checkbox("Use Cheetah", script_hunter.useCheetah);
			if (script_grindMenu.helpMenu) then
				Text("*Use Aspect of Cheetah between combat phases*")
				Separator();
			end
		end

-- hunters mark button
		if (HasSpell("Hunter's Mark")) then
			wasClicked, script_hunter.useMark = Checkbox("Use Hunter's Mark", script_hunter.useMark);
		end
		
		Separator();

-- wait after combat button
		if (GetPet() ~= 0) and (GetLocalPlayer():GetLevel() >= 10) then

			wasClicked, script_hunter.waitAfterCombat = Checkbox("Wait After Combat", script_hunter.waitAfterCombat)

				

			if (script_hunter.waitAfterCombat) then

				-- these are tied together elsewhere...
				 script_warlock.waitAfterCombat = true;

				Text("This will not allow the bot to chain pull targets'")
			end
		end
		Separator();

-- drink mana slider
		Text('Drink below mana percentage');
		script_hunter.drinkMana = SliderInt("M%", 1, 100, script_hunter.drinkMana);
		if (script_grindMenu.helpMenu) then
			Text("*Choose to drink when mana is at or below this percent*")
			Separator();
		end

-- eat slider
		Text('Eat below health percentage');
		script_hunter.eatHealth = SliderInt("H%", 1, 100, script_hunter.eatHealth);
		if (script_grindMenu.helpMenu) then
			Text("**")
		end

-- health potions slider
		Text('Use health potions below percentage');
		script_hunter.potionHealth = SliderInt("HP%", 1, 99, script_hunter.potionHealth);

-- mana potions slider
		Text('Use mana potions below percentage');
		script_hunter.potionMana = SliderInt("MP%", 1, 99, script_hunter.potionMana);

		Separator();

-- hunters mark mana slider
		if (script_hunter.useMark) then
			Text("Use Hunter's' Mark above mana percentage");
			script_hunter.useMarkMana = SliderInt("MM", 5, 100, script_hunter.useMarkMana);
		end

-- serpent sting mana slider
		Text("Serpent Sting Mana")
		script_hunter.serpentStingMana = SliderInt("SSM", 5, 50, script_hunter.serpentStingMana);

-- arcane shot mana slider
		Text("Arcane Shot Mana")
		script_hunter.arcaneShotMana = SliderInt("ASM", 5, 50, script_hunter.arcaneShotMana);

-- multi shot button
		if (HasSpell("Multi-Shot")) then
			wasClicked, script_hunter.useMultiShot = Checkbox("Use MultiShot", script_hunter.useMultiShot);
		end

-- scorpid sting button
		--if (HasSpell("Scorpid Sting")) then
		--	SameLine();
		--	wasClicked, script_hunter.useScorpidSting = Checkbox("Scorpid Sting", script_hunter.useScorpidSting);
		--end

-- vendor settings
		if (CollapsingHeader("|+| Vendor Settings -- These May Be Defunct")) then
			Text('Vendor/Bag settings:');
			wasClicked, script_hunter.useVendor = Checkbox("Vendor when full inventory", script_hunter.useVendor);	
		
			if (script_grind.useVendor) then
				script_hunter.useVendor = true;
			end
			if (script_hunter.useVendor) then
				script_grind.useVendor = true;
			end
			if (script_hunter.useVendor) or (script_grind.useVendor) then
				script_hunter.stopWhenBagsFull = false;
			end
		end

		if (CollapsingHeader("|+| Buy Ammo")) then
			wasClicked, script_hunter.buyWhenQuiverEmpty = Checkbox("Buy ammo when only 1 stack left.", script_hunter.buyWhenQuiverEmpty);

			if (script_hunter.buyWhenQuiverEmpty) then
				script_hunter.quiverBagNr = InputText("Bag# for quiver (2-5)", script_hunter.quiverBagNr);
			end
		end

		Separator();

		if (CollapsingHeader("|+| Feed Pet Options")) then
			wasClicked, script_hunter.useFeedPet = Checkbox("Auto Feed Pet", script_hunter.useFeedPet);
	
			if (script_hunter.hasPet) and (script_hunter.useFeedPet) then	

				Text('Always put the pet food in the last slot of the bag.');

				Text("Bag # with pet food (2-5)");
				script_hunter.bagWithPetFood = InputText("BPF", script_hunter.bagWithPetFood);
	
				Text("Bagslot# with pet food (1-Maxslot)");
				script_hunter.slotWithPetFood = InputText("SPF", script_hunter.slotWithPetFood);

				Text("Pet Food Name:");
				script_hunter.foodName = InputText("PFN", script_hunter.foodName);

				Separator();
			end
		end

		Separator();	
		

-- stop hunter settings
		if (CollapsingHeader("|+| Stop Hunter Settings")) then

			Text('Stop settings:');

			wasClicked, script_hunter.stopWhenBagsFull = Checkbox("Stop when bags are full", script_hunter.stopWhenBagsFull);

			wasClicked, script_hunter.stopWhenQuiverEmpty = Checkbox("Stop when we run out of ammo", script_hunter.stopWhenQuiverEmpty);
		
			if (script_hunter.hasPet) then

				wasClicked, script_hunter.stopWhenNoPetFood = Checkbox("Stop when we run out of pet food", script_hunter.stopWhenNoPetFood);

			end
		
			wasClicked, script_hunter.hsWhenStop = Checkbox("Use HS before stopping the bot, if not on CD", script_hunter.hsWhenStop);

			if (script_hunter.hsWhenStop) then

				script_hunter.hsBag = InputText("Bag# for HS", script_hunter.hsBag);

				script_hunter.hsSlot = InputText("Bag-slot (1-X) for HS", script_hunter.hsSlot);
			end
		end
	end
end