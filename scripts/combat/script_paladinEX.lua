script_paladinEX = {

	waitTimer = 0,
	holyLightTimer = 0,


}

function script_paladinEX:healsAndBuffs(localObj, localMana)
	
	if ((self.waitTimer + script_grind.tickRate) > GetTimeEX()) or (IsCasting()) or (IsChanneling()) then
		return;
	end

	local localMana = GetLocalPlayer():GetManaPercentage();
	local localHealth = GetLocalPlayer():GetHealthPercentage();
	local localObj = GetLocalPlayer();

	if (not IsMounted()) then
		if (not IsDrinking()) and (not IsEating()) then
			if (not IsStanding()) then
				JumpOrAscendStart();
			end
		end
	end
	-- Set aura - cast aura
	if (script_paladin.aura ~= 0 and not IsMounted()) then
		if (not localObj:HasBuff(script_paladin.aura) and HasSpell(script_paladin.aura)) then
			CastSpellByName(script_paladin.aura);
			script_grind:setWaitTimer(1750);
			self.waitTimer = GetTimeEX() + 1750;
		end
	end

	-- Buff with Blessing
	if (script_paladin.blessing ~= 0) and (HasSpell(script_paladin.blessing)) then
		if (localMana > 10) and (not localObj:HasBuff(script_paladin.blessing)) then
			Buff(script_paladin.blessing, localObj);
			script_grind:setWaitTimer(1750);
			self.waitTimer = GetTimeEX() + 1750;
			return true;
		end
	end

	if (IsInCombat()) and (localObj:HasBuff("Judgement")) and (not IsSpellOnCD("Judgement")) and (localObj:HasBuff("Seal of Righteousness")) then
		CastSpellByName("Judgement", targetObj);
		script_grind:setWaitTimer(1650);
		self.waitTimer = GetTimeEX() + 1750;
		return true;
	end

	-- Check: Use Lay of Hands
	if (localHealth < script_paladin.lohHealth) and (HasSpell("Lay on Hands")) and (not IsSpellOnCD("Lay on Hands")) then 
		if (Cast("Lay on Hands", localObj)) then 
			self.waitTimer = GetTimeEX() + 1750;
			script_paladin.message = "Cast Lay on Hands...";
			return true;
		end
	end

	-- bubble hearth on player engange

	if (script_paladin.useBubbleHearth) and (HasSpell("Divine Shield")) and (not IsSpellOnCD("Divine Shield")) then
		if (GetTarget() ~= nil) and (targetObj ~= nil) then
			if (UnitIsPlayer(targetObj)) and (UnitIsPVP(targetObj)) and (GetTarget() ~= localObj) then
				script_grind.tickRate = 50;
				CastSpellByName("Divine Shield");
				script_paladin.message = "Cast Divine Shield...";
				return 0;
			end
		end
	end

	if (script_paladin.useBubbleHearth) and (localObj:HasBuff("Divine Shiel")) then
		UseItem("Hearthstone");
		script_grind:setWaitTimer(12000);
		self.waitTimer = GetTimeEX() + 12050;
		StopBot();
		return;
	end
			
	-- Check: Divine Protection if BoP on CD
	if(localHealth <= script_paladin.shieldHealth) and (not localObj:HasDebuff("Forbearance")) then
		if (HasSpell("Divine Shield")) and (not IsSpellOnCD("Divine Shield")) then
			CastSpellByName("Divine Shield");
			script_paladin.message = "Cast Divine Shield...";
			self.waitTimer = GetTimeEX() + 1750;
			return true;
		elseif (HasSpell("Divine Protection")) and (not IsSpellOnCD("Divine Protection")) then
			CastSpellByName("Divine Protection");
			script_paladin.message = "Cast Divine Protection...";
			self.waitTimer = GetTimeEX() + 1750;
			return true;
		elseif (HasSpell("Blessing of Protection")) and (not IsSpellOnCD("Blessing of Protection")) then
			CastSpellByName("Blessing of Protection");
			script_paladin.message = "Cast Blessing of Protection...";
			self.waitTimer = GetTimeEX() + 1750;
			return true;
		end
	end

	-- force cast heal when buffed with shield
	if (localObj:HasBuff("Divine Shield") or localObj:HasBuff("Divine Protection") or localObj:HasBuff("Blessing of Protection")) then
		if (localMana > 15) then
			if (IsMoving()) then
				StopMoving();
			end
			CastSpellByName("Holy Light", localObj);
			script_grind:setWaitTimer(2550);
			self.waitTimer = GetTimeEX() + 3050;
			script_paladin.waitTimer = GetTimeEX() + 3050
			return 4;
		else
			if (localMana > 8) and (HasSpell("Flash of Light")) then
				if (IsMoving()) then
					StopMoving();
				end
				CastSpellByName("Flash of Light", localObj);
				script_grind:setWaitTimer(1550);
				self.waitTimer = GetTimeEX() + 1750;
				return 0;
			end
		end
	end

	-- cleanse
	if (script_checkDebuffs:hasPoison()) or (script_checkDebuffs:hasDisease()) or (script_checkDebuffs:hasMagic()) then
		if (HasSpell("Cleanse")) and (localMana > 60) then
			if (Buff("Cleanse", localObj)) then 
				script_paladin.message = "Cleansing..."; 
					script_grind:setWaitTimer(1750); 
					self.waitTimer = GetTimeEX() + 1750;
					return true; 
			end
		end
	end

	-- remove disease with purify
	if (script_checkDebuffs:hasDisease()) or (script_checkDebuffs:hasPoison()) then
		if (HasSpell("Purify")) and (localMana > 60) then
			if (Buff("Purify", localObj)) then 
				script_paladin.message = "Cleansing..."; 
				script_grind:setWaitTimer(1750); 
				self.waitTimer = GetTimeEX() + 1750;
				return true; 
			end
		end
	end

	-- Check: Remove movement disables with Freedom
	if (localObj:IsMovementDisabed() or script_checkDebuffs:hasDisabledMovement()) and (HasSpell("Blessing of Freedom")) then
		Buff("Blessing of Freedom", localObj);
		self.waitTimer = GetTimeEX() + 1750;
		return true;
	end

	-- flash of light not in combat
	if (not IsInCombat()) and (localMana > script_paladin.drinkMana + 6) and (GetLocalPlayer():GetUnitsTarget() == 0) then
		if (HasSpell("Flash of Light")) and (localHealth >= script_paladin.holyLightHealth) and (localHealth <= 82) and (not IsLooting()) and (script_grind.lootObj == nil) then
			script_grind.tickRate = 100;
			if (IsMoving()) then
				StopMoving();
			end
			CastHeal("Flash of Light", localObj);
			ClearTarget();
			script_grind:setWaitTimer(1500);
			self.waitTimer = GetTimeEX() + 2050;
			return true;

		end
		return;
	end

	-- holy light
	if (localMana > 18) and (script_paladinEX:doubleCheckHealthPercentage() < script_paladin.holyLightHealth) and (not IsMoving()) then
		if (not IsCasting()) and (not IsChanneling()) and (GetLocalPlayer():GetHealthPercentage() < script_paladin.holyLightHealth) then
			script_grind.tickRate = 2500;
			if (IsMoving()) then
				StopMoving();
			end
			script_paladinEX:castHolyLight(localObj);
			script_grind:setWaitTimer(2250);
			self.waitTimer = GetTimeEX() + 2250;
		return 4;
		end
		
	end
	-- Flash of Light in combat
	if (script_paladin.useFlashOfLightCombat) then
		if (IsInCombat()) and (HasSpell("Flash of Light")) and (script_paladinEX:doubleCheckHealthPercentage() <= script_paladin.flashOfLightHP) and (localMana >= 10) then
			if (not IsCasting()) and (not IsChanneling()) and (GetLocalPlayer():GetHealthPercentage() <= script_paladin.flashOfLightHP) then
				script_grind.tickRate = 2500;
				if (IsMoving()) then
					StopMoving();
				end
				if (not CastSpellByName("Flash of Light", localObj)) then
					script_grind:setWaitTimer(2750);
					self.waitTimer = GetTimeEX() + 2750;
					script_paladin.waitTimer = GetTimeEX() + 2750
					script_paladin.message = "Flash of Light enabled - Healing!";
				return 4;
				end
			return 4;			
			end
		end
	end	

	--flash of light in combat very low health and mana
	if (HasSpell("Flash of Light")) and (IsInCombat()) and (localMana < 15) and (localMana > 5) and (localHealth < script_paladin.holyLightHealth) then
		script_grind.tickRate = 100;
		if (IsMoving()) then
			StopMoving();
		end

		if (not CastHeal("Flash of Light", localObj)) then
			script_grind:setWaitTimer(1500);
			self.waitTimer = GetTimeEX() + 1750;
			script_paladin.message = "We are dying - trying to save!";
			return 4;
		end
	end

	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(550, 1100);

		if (IsMoving()) or (not IsInCombat()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end
	
return false;
end

function script_paladinEX:menu()

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
		end

		if (HasSpell("Consecration")) then
			Text("Consecrate Mana when 2 or more adds");
			script_paladin.consecrationMana = SliderFloat("Consecration above Mana %", 1, 99, script_paladin.consecrationMana);
		end

		if (HasSpell("Devotion Aura")) then
			if (CollapsingHeader("|+| Auras and Blessings")) then
				Text("Aura options:");
				script_paladin.aura = InputText("Aura", script_paladin.aura);
				if (HasSpell("Blessing of Might")) then
					Text("Blessing Options");
					script_paladin.blessing = InputText("Blessing", script_paladin.blessing);
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
				script_paladin.flashOfLightHP = SliderInt("FL", 1, 99, script_paladin.flashOfLightHP);
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

function script_paladinEX:doubleCheckHealthPercentage()
	local localObj = GetLocalPlayer();
	local localHealth = localObj:GetHealthPercentage();
	
	for i=0, 5 do
		if (localHealth > 0) then
			return localHealth;
		end
	end
return 0;
end

function script_paladinEX:castHolyLight(localObj)
	if (self.holyLightTimer > GetTimeEX()) then
		return false;
	end
	if (HasSpell("Holy Light")) then
		if (not IsSpellOnCD("Holy Light")) then
			if (not IsMoving()) and (IsStanding()) then
				if (not IsCasting()) and (not IsChanneling()) then
					self.holyLightTimer = GetTimeEX() + 5500;
					self.waitTimer = GetTimeEX() + 3500;
					if (CastSpellByName("Holy Light", localObj)) then
						return 4;
					end
				end
			end
		end
	end
return false;
end