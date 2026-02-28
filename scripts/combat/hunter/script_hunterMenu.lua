script_hunterMenu = {
	
}



function script_hunterMenu:menu()

	local wasClicked = false;

	if CollapsingHeader("Hunter Combat Options") then

-- use ranged attacks or melee attacks
		wasClicked, script_hunter.useRangedAttacks = Checkbox("Use Ranged Attacks", script_hunter.useRangedAttacks);

-- ranged attack distance
		if script_hunter.useRangedAttacks then

			Text("MIN Ranged Attack Distsance");
			script_hunter.minSpellRange = SliderInt("Min Dist yards", 8, 16, script_hunter.minSpellRange);

			Text("MAX Ranged Attack Distsance");
			script_hunter.spellRange = SliderInt("Max Dist yards", 30, 41, script_hunter.spellRange);
		end

		if HasPet() and script_hunter.hasPet then
			Text("Mend Pet Health");
			script_hunter.mendPetHealth = SliderInt("Health to Mend Pet", 0, 100, script_hunter.mendPetHealth);
		end
		Separator();

-- conserve mana button
		if HasPet() then
			if Button("Conserve Mana for Mend Pet") then
				script_hunter.drinkMana = 5;
				script_hunter.arcaneShotMana = 45;
				script_hunter.useMarkMana = 10;
				script_hunter.serpentStingMana = 30;
				script_hunter.potionMana = 0;
			end
			SameLine();
			if Button("Conserve NO Mana") then
				script_hunter.drinkMana = 0;
				script_hunter.arcaneShotMana = 0;
				script_hunter.useMarkMana = 0;
				script_hunter.serpentStingMana = 0;
				script_hunter.potionMana = 0;
			end
		end

-- set bandages
		if HasItem("Linen Bandage") or 
			HasItem("Heavy Linen Bandage") or 
			HasItem("Wool Bandage") or 
			HasItem("Heavy Wool Bandage") or 
			HasItem("Silk Bandage") or 
			HasItem("Heavy Silk Bandage") or 
			HasItem("Mageweave Bandage") or 
			HasItem("Heavy Mageweave Bandage") or 
			HasItem("Runecloth Bandage") or 
			HasItem("Heavy Runecloth Bandage") then
		
			self.menuBandages = true;
		else
			self.menuBandages = false;
		end
		
-- seperate the menu if level to or we have bandages
		if self.menuBandages or GetLocalPlayer():GetLevel() >= 10 then
			Separator();
		end

-- use pet button
		if (GetLocalPlayer():GetLevel() >= 10) then
			wasClicked, script_hunter.hasPet = Checkbox("Use Pet", script_hunter.hasPet);
		end

-- use bandages button
		if (self.menuBandages) then
			SameLine();
			wasClicked, script_hunter.useBandage = Checkbox("Use Bandages", script_hunter.useBandage);
		end

-- aspect of cheetah button
		if (HasSpell("Aspect of the Cheetah")) then
			Separator();
			wasClicked, script_hunter.useCheetah = Checkbox("Use Cheetah |", script_hunter.useCheetah);
		end

-- aimed shot button
		if HasSpell("Aimed Shot") then
			SameLine();
			wasClicked, script_hunter.useAimedShot = Checkbox("Use Aimed Shot |", script_hunter.useAimedShot);
		end

		if HasSpell("Serpent Sting") then
			SameLine();
			wasClicked, script_hunter.useSerpentSting = Checkbox("Use Serpent Sting", script_hunter.useSerpentSting);
		end

-- hunters mark button
		if (HasSpell("Hunter's Mark")) then
			wasClicked, script_hunter.useMark = Checkbox("Use Hunter's Mark |", script_hunter.useMark);
		end
		
-- multi shot button
		if (HasSpell("Multi-Shot")) then
			SameLine();
			wasClicked, script_hunter.useMultiShot = Checkbox("Use MultiShot |", script_hunter.useMultiShot);
		end

-- viper sting
		if HasSpell("Viper Sting") then
			SameLine();
			wasClicked, script_hunter.useViperSting = Checkbox("Use Viper Sting", script_hunter.useViperSting);
		end

		Separator();

-- drink mana slider
		Text('Drink below mana percentage');
		script_hunter.drinkMana = SliderInt("M%", 0, 100, script_hunter.drinkMana);
		
		Separator();
-- eat slider
		Text('Eat below health percentage');
		script_hunter.eatHealth = SliderInt("H%", 0, 100, script_hunter.eatHealth);
		
		Separator();

-- health potions slider
		Text('Use health potions below percentage');
		script_hunter.potionHealth = SliderInt("HP%", 0, 99, script_hunter.potionHealth);

		Separator();

-- mana potions slider
		Text('Use mana potions below percentage');
		script_hunter.potionMana = SliderInt("MP%", 0, 99, script_hunter.potionMana);

		Separator();

-- hunters mark mana slider
		if (script_hunter.useMark) then
			Text("Use Hunter's' Mark above mana percentage");
			script_hunter.useMarkMana = SliderInt("MM", 0, 100, script_hunter.useMarkMana);
		end

-- serpent sting mana slider
		Text("Serpent Sting Mana")
		script_hunter.serpentStingMana = SliderInt("SSM", 0, 100, script_hunter.serpentStingMana);

-- arcane shot mana slider
		Text("Arcane/Aimed Shot Mana")
		script_hunter.arcaneShotMana = SliderInt("ASM", 0, 100, script_hunter.arcaneShotMana);

-- scorpid sting button
		--if (HasSpell("Scorpid Sting")) then
		--	SameLine();
		--	wasClicked, script_hunter.useScorpidSting = Checkbox("Scorpid Sting", script_hunter.useScorpidSting);
		--end

-- vendor settings
		if (CollapsingHeader("|+| Vendor Settings")) then
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

-- feed pet options
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