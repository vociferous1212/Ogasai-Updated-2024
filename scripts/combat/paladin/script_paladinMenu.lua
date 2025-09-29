script_paladinMenu = {}

function script_paladinMenu:menu()

	if (CollapsingHeader("Paladin Combat Options")) then

		local wasClicked = false;

		Text("Rest options:");
		Text("You can add more food/drinks in script_helper.lua");

		script_paladin.eatHealth = SliderInt("Eat below HP%", 1, 100, script_paladin.eatHealth);

		script_paladin.drinkMana = SliderInt("Drink below Mana%", 1, 100, script_paladin.drinkMana);

		script_paladin.potionHealth = SliderInt("Potion below HP %", 1, 99, script_paladin.potionHealth);

		script_paladin.potionMana = SliderInt("Potion below Mana %", 1, 99, script_paladin.potionMana);

		Separator();

		wasClicked, script_paladin.stopIfMHBroken = Checkbox("Stop bot if main hand is broken (red)...", script_paladin.stopIfMHBroken);
		
		Separator();

		script_paladin.meleeDistance = SliderFloat("Melee range", 1, 8, script_paladin.meleeDistance);
		if (HasSpell("Divine Shield")) then
			wasClicked, script_paladin.useBubbleHearth = Checkbox("Bubble/Hearth Enemy Player Combat", script_paladin.useBubbleHearth);
		end
		Separator();

		if (HasSpell("Judgement")) then
			wasClicked, script_paladin.useJudgement = Checkbox("Use Judgement", script_paladin.useJudgement);
		end
		if (HasSpell("Seal of the Crusader")) then
			SameLine();
			wasClicked, script_paladin.useSealOfCrusader = Checkbox("Use Crusader Seal", script_paladin.useSealOfCrusader);
			if script_paladin.useSealOfCrusader then
				wasClicked, script_paladin.onlyUseSealOfCrusader = Checkbox("Only Use Crusader Seal", script_paladin.onlyUseSealOfCrusader);
			end
		end

		if (HasSpell("Consecration")) then
			Text("Consecrate Mana when 2 or more adds");
			script_paladin.consecrationMana = SliderFloat("Consecration above Mana %", 1, 99, script_paladin.consecrationMana);
		end

		if (HasSpell("Devotion Aura")) then
			if (CollapsingHeader("|+| Auras and Blessings")) then
				Text("Aura options:");
				local a = script_paladin.devoAura; local b = script_paladin.retAura; local c = script_paladin.sancAura;
				wasClicked, script_paladin.devoAura = Checkbox("Devo Aura", script_paladin.devoAura)
				SameLine()
				wasClicked, script_paladin.retAura = Checkbox("Ret Aura", script_paladin.retAura)
				SameLine()
				wasClicked, script_paladin.sancAura = Checkbox("Sanc Aura", script_paladin.sancAura)

				if a then script_paladin.retAura = false; script_paladin.sancAura = false; end
				if b then script_paladin.devoAura = false; script_paladin.sancAura = false; end
				if c then script_paladin.devoAura = false; script_paladin.retAura = false; end

				if (HasSpell("Blessing of Might")) then

					Text("Blessing Options");
					local z = script_paladin.might; local y = script_paladin.wisdom;

					wasClicked, script_paladin.might = Checkbox("Blessing of Might", script_paladin.might)
					SameLine();
					wasClicked, script_paladin.wisdom = Checkbox("Blessing of Wisdom", script_paladin.wisdom)

					if z then script_paladin.wisdom = false; end if y then script_paladin.might = false; end
				end
			end
		end

		if (CollapsingHeader("|+| Heal Options")) then

			Text("Heal Options:")

			if (HasSpell("Flash of Light")) then
				Text("Otherwise the bot will use Holy Light only");
				wasClicked, script_paladin.useFlashOfLightCombat = Checkbox("Flash of Light in Combat On/Off", script_paladin.useFlashOfLightCombat);
			end

			Separator();

			Text("Holy Light Below Self HP Percent")
			script_paladin.holyLightHealth = SliderInt("HL (in combat)", 1, 99, script_paladin.holyLightHealth);
			
			if (HasSpell("Flash of Light")) then
				Text("Flash of Light Below Self HP Percent")
				script_paladin.flashOfLightHealth = SliderInt("FL", 1, 99, script_paladin.flashOfLightHealth);
			end

			if (HasSpell("Lay on Hands")) then
				Text("Lay on Hands Below Self HP Percent")
				script_paladin.lohHealth = SliderInt("LH", 5, 15, script_paladin.lohHealth);
			end

			if (HasSpell("Blessing of Protection")) then
				Text("Blessing of Protection Below Self HP Percent")
				script_paladin.shieldHealth = SliderInt("SBOP", 1, 20, script_paladin.shieldHealth);
			end
		end
	end
end
