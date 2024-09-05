script_rogueEX = {

}

function script_rogueEX:menu()

	local localObj = GetLocalPlayer();

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

	Separator();

	if (CollapsingHeader("Choose Grind or Rotation")) then
		if (not script_rogue.enableRotation) then -- if not showing rotation button
			wasClicked, script_rogue.enableGrind = Checkbox("Grinder", script_rogue.enableGrind); -- then show grind button
				SameLine();
		end
		
		if (not script_rogue.enableGrind) then -- if not showing grind button
			wasClicked, script_rogue.enableRotation = Checkbox("Rotation", script_rogue.enableRotation); -- then show rotation button
				SameLine();
		end	
	Separator();
	end

	if (script_rogue.enableGrind) then
		Separator();
		if (CollapsingHeader("Rogue Grind Options")) then
			local wasClicked = false;
			if (self.menuBandages) then
			wasClicked, script_rogue.useBandage = Checkbox("Use Bandages", script_rogue.useBandage);
			end
			Text('Eat below health percent');
			script_rogue.eatHealth = SliderInt('EHP %', 1, 100, script_rogue.eatHealth);
			Text("Potion below health percent");
			script_rogue.potionHealth = SliderInt('PHP %', 7, 15, script_rogue.potionHealth);
			Separator();
			Text("Melee Range to target");
			script_rogue.meleeDistance = SliderFloat('MR (yd)', 1, 6, script_rogue.meleeDistance);
			Separator();
			wasClicked, script_rogue.stopIfMHBroken = Checkbox("Stop bot if main hand is broken", script_rogue.stopIfMHBroken);

			if (HasSpell("Stealth")) then
				wasClicked, script_rogue.useStealth = Checkbox("Use Stealth", script_rogue.useStealth);
			end
			if (HasSpell("Pick Pocket")) and (script_rogue.useStealth) then
				SameLine();
				wasClicked, script_rogue.usePickPocket = Checkbox("Pick Pocket", script_rogue.usePickPocket);
			end
			if (HasSpell("Slice and Dice")) then
				SameLine();
				wasClicked, script_rogue.useSliceAndDice = Checkbox("Use Slice & Dice", script_rogue.useSliceAndDice);
			end

			if (script_rogue.useStealth) then
				Text("Stealth range to target");
			script_rogue.stealthRange = SliderInt('SR (yd)', 1, 100, script_rogue.stealthRange);
			end

			Separator();
			if (HasSpell("Expose Armor")) then
				wasClicked, script_rogue.useExposeArmor = Checkbox("Use Expose Armor", script_rogue.useExposeArmor);
			end
			if (HasSpell("Rupture")) then
				SameLine();
				wasClicked, script_rogue.useRupture = Checkbox("Use Rupture", script_rogue.useRupture);
			end

			if (CollapsingHeader("|+| Combo Point Generator")) then
				Text("Combo Point ability");
				script_rogue.cpGenerator = InputText("CPA", script_rogue.cpGenerator);
				Text("Energy cost of CP-ability");
				script_rogue.cpGeneratorCost = SliderInt("Energy", 20, 50, script_rogue.cpGeneratorCost);
			end
			
			if (HasSpell("Stealth")) then
				if(CollapsingHeader("|+| Stealth Ability Opener")) then
					Text("Stealth ability opener");
					script_rogue.stealthOpener = InputText("STO", script_rogue.stealthOpener);
				end
			end

			if (HasSpell("Adrenaline Rush")) and (HasSpell("Blade Flurry")) then
				if (CollapsingHeader("|+| Adrenaline Rush / Blade Flurry Options")) then
					Text("Use Adrenaline Rush with Blade Furry health percent");
					wasClicked, script_rogue.adrenRushCombo = Checkbox("Use Adren Blade Flurry combo", script_rogue.adrenRushCombo);
					script_rogue.adrenRushComboHP = SliderInt("Health below percent", 15, 75, script_rogue.adrenRushComboHP);
				end
			end

			if (HasSpell("Riposte")) then
				if (CollapsingHeader("|+| Riposte Skill Options")) then
					script_rogue.riposteActionBarSlot = InputText("RS", script_rogue.riposteActionBarSlot);	-- riposte
					Text("Action Bar Slots 1 - 12");
				end
			end
		
			--if (CollapsingHeader("|+| Throwing Weapon Options")) then
			--	wasClicked, script_rogue.throwOpener = Checkbox("Pull with throw (if stealth disabled)", script_rogue.throwOpener);	--
	--			Text("Throwing weapon");
	--			script_rogue.throwName = InputText("TW", script_rogue.throwName);
	--		end

			if (GetLocalPlayer():GetLevel() >= 20) then
				if (CollapsingHeader("|+| Poisons Options")) then
					wasClicked, script_rogue.usePoison = Checkbox("Use poison on weapons", script_rogue.usePoison);
					Text("Poison on Main Hand");
					script_rogue.mainhandPoison = InputText("PMH", script_rogue.mainhandPoison);
					Text("Poison on Off Hand");
					script_rogue.offhandPoison = InputText("POH", script_rogue.offhandPoison);
				end
			end
			script_rogueEX2:menu();
		end
	end
	
	if (script_rogue.enableRotation) then
		script_rogueEX2:rotationMenu();
	end
end