script_priestMenu = {}


function script_priestMenu:menu()

	local localObj = GetLocalPlayer();
	-- obtain class from game using wow api
	local _ , class = UnitClass("player");

	-- if we are priest then show menu
	if (class == 'PRIEST') then

		local wasClicked = false;

		-- priest combat options all COMBAT spells under here. skills spells talents
		if (CollapsingHeader("Priest Combat Options")) then

	-- hide wand menu if no ranged weapon equipped
			if (localObj:HasRangedWeapon()) then

				-- wand options menu
				if (CollapsingHeader(">>> |+| Wand Options")) then

					Text('Wand options:');
						if (not script_priest.useWand) then
							SameLine();
							Text("    Priest script was built with using wand");	
						end
					wasClicked, script_priest.useWand = Checkbox("Use Wand", script_priest.useWand);
						if (not script_priest.useWand) then
							SameLine();
							Text("     Disabling will greatly hinder survivability");
						end
					Text('Wand below Self mana percent');
					script_priest.useWandMana = SliderInt("WM%", 10, 100, script_priest.useWandMana);

					Text('Wand below target HP percent');
					script_priest.useWandHealth = SliderInt("WH%", 10, 100, script_priest.useWandHealth);
				end
				Separator();
			end

			-- MIND BLAST
			-- hide spell if not obtained yet
			if (HasSpell("Mind Blast")) then
				Text('Mind Blast above Self mana percent');
				script_priest.mindBlastMana = SliderInt("MBM%", 10, 100, script_priest.mindBlastMana);
			end

			Separator();

			-- SHADOW WORD PAIN
			-- hide spell if not obtained yet
			if (HasSpell("Shadow Word: Pain")) then
				Text("Shadow Word: Pain above mana percent");
				SameLine();
				wasClicked, script_priest.useDOTOnAdds = Checkbox("DOT Adds", script_priest.useDOTOnAdds);
				script_priest.swpMana = SliderInt("SPM", 10, 100, script_priest.swpMana)
			end

			Separator();

			-- MIND FLAY
			-- hide spell if not obtained yet
			if (script_priest.useMindFlay) then
				Text("Use Mind Flay above target health percent")
				script_priest.mindFlayHealth = SliderInt("MFH", 1, 100, script_priest.mindFlayHealth);
				Text("Use Mind Flay above Self mana percent");
				script_priest.mindFlayMana = SliderInt("MFM", 1, 100, script_priest.mindFlayMana);
			end	

			-- shadowform appears in menu if has the spell
			if (HasSpell("Shadowform")) then

				Text("Health to exit Shadowform to Heal!");
				script_priest.shadowFormHealth = SliderInt("SFH", 1, 70, script_priest.shadowFormHealth);

				Separator();

			end

			-- hide spell if not obtained yet
			if (HasSpell("Psychic Scream")) then
				wasClicked, script_priest.useScream = Checkbox("Use Fear", script_priest.useScream);
			end

			SameLine();

			wasClicked, script_priest.useSmite = Checkbox("Use Smite", script_priest.useSmite);
			
			-- mind flay appears in menu if has the spell
			if (HasSpell("Mind Flay")) then
				
				SameLine();

				wasClicked,script_priest.useMindFlay = Checkbox("Mind Flay instead of Wand", script_priest.useMindFlay);
				
				-- if mind flay is clicked then set useWand to false/unclicked
				if script_priest.useMindFlay then
					
					script_priest.useWand = false;

				end

			end

			if (HasSpell("Hex of Weakness")) then
				wasClicked, script_priest.useHexOfWeakness = Checkbox("Hex of Weakness", script_priest.useHexOfWeakness);
			end
			if (HasSpell("Shadowguard")) then
				SameLine();
				wasClicked, script_priest.useShadowGuard = Checkbox("Use Shadowguard", script_priest.useShadowGuard);
			end
						
		end

		if (CollapsingHeader("Priest Heal Options - Self")) then

			Text('Drink below mana percentage');
			script_priest.drinkMana = SliderInt("DM%", 10, 99, script_priest.drinkMana);

			Text('Eat below health percentage');
			script_priest.eatHealth = SliderInt("EH%", 10, 99, script_priest.eatHealth);

			Separator();

			Text('Self Heals');

			-- if level >= 20 then hide lesser heal
			if (GetLocalPlayer():GetLevel() <= 20) then
				script_priest.lesserHealHP = SliderInt("Lesser heal HP%", 1, 99, script_priest.lesserHealHP);	
			end
			
			-- hide spell if not obtained yet
			if (HasSpell("Renew")) then
				script_priest.renewHP = SliderInt("Renew HP%", 1, 99, script_priest.renewHP);	
			end

			-- hide spell if not obtained yet
			if (HasSpell("Power Word: Shield")) then
				script_priest.shieldHP = SliderInt("Shield HP%", 1, 99, script_priest.shieldHP);
			end

			-- hide spell if not obtained yet
			if (HasSpell("Flash Heal")) then
				script_priest.flashHealHP = SliderInt("Flash heal HP%", 1, 99, script_priest.flashHealHP);
			end

			-- hide spell if not obtained yet
			if (HasSpell("Heal")) then
				script_priest.healHP = SliderInt("Heal HP%", 1, 99, script_priest.healHP);	
			end

			-- hide spell if not obtained yet
			if (HasSpell("Greater Heal")) then
				script_priest.greaterHealHP = SliderInt("Greater Heal HP%", 1, 99, script_priest.greaterHealHP);
			end

			script_priest.potionHealth = SliderInt("Potion HP%", 1, 99, script_priest.potionHealth);
			script_priest.potionMana = SliderInt("Potion Mana%", 1, 99, script_priest.potionMana);

		end
	end
end