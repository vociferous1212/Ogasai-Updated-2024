script_shamanHealsAndBuffs = {

	waitTimer = 0,

}

function script_shamanHealsAndBuffs:run()
	
	local localMana = Player():GetManaPercentage();
	local localHealth = Player():GetHealthPercentage();

	if script_shaman.waitTimer > GetTimeEX() or self.waitTimer > GetTimeEX() or ( (IsCasting() or IsChanneling()) and not instantCastSpells:IsSpellInstantCast()) then
		return;
	end

	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(250, 350);

		if (IsMoving()) or (not IsInCombat()) or (targetObj ~= nil and targetObj:IsFleeing()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end

	if not IsStanding() then
		JumpOrAscendStart();
	end

	if not IsStanding() then
		local x, y, z = GetLocalPlayer():GetPosition();
		Move(x+.1, y, z);
	end

-- remove ghost wolf before combat
	if Player():HasBuff("Ghost Wolf") then
		CastSpellByName("Ghost Wolf");
		return true;
	end

-- water breathing
	if not IsSpellOnCD("Water Breathing") and IsSwimming() and HasSpell("Water Breathing") and HasItem("Shiny Fish Scales") and not Player():HasBuff("Water Breathing") then
		local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Water Breathing");
		if ((cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 20) then
			if CastSpellByName("Water Breathing", Player()) then
				script_shaman.waitTimer = GetTimeEX() + 1750;
				script_grind:setWaitTimer(1750);
				return true;
			end
		end
	end

	-- healing wave rank 1
	if not IsCasting() and not IsSpellOnCD("Healing Wave") and not IsInCombat() and IsStanding() and localMana > 10 and localHealth <= 75 then
		if (IsMoving()) then
			StopMoving();
			return true;
		end
		local time = 1750;
		local rankHeal = "Rank 1";
		if PlayerLevel() >= 24 then
			rankHeal = "Rank 3";
			time = 2750;
		end
		if CastSpellByName("Healing Wave("..rankHeal, Player()) then
			script_shaman.waitTimer = GetTimeEX() + time;
			grind2:setTimer(time);
			return true;
		end
	end

-- Check: Healing
	if not IsSpellOnCD(script_shaman.healingSpell) then
		if localHealth < script_shaman.healHealth or (not IsInCombat() and localHealth < script_shaman.healHealth + 20) then
			if IsMoving() then
				StopMoving();
			end

			local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Healing Wave");
			if script_shaman.healingSpell == "Lesser Healing Wave" then
				castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Lesser Healing Wave");
			end

			if ((cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 20) then
				if script_shaman:castHealingSpell() then
					script_shaman.waitTimer = GetTimeEX() + 3000;
					script_grind:setWaitTimer(3000);
					return true;
				end
			end
		end
	end

-- check cure poison
	if (HasSpell("Cure Poison")) and (script_checkDebuffs:hasPoison()) and (IsStanding()) then
		if (not IsSpellOnCD("Cure Poison")) and (localMana >= 25) then
		local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Cure Poison");
			if ((cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 20) then
				if (CastSpellByName("Cure Poison", Player())) then
					script_shaman.waitTimer = GetTimeEX() + 1650;
					script_grind:setWaitTimer(1650);
					script_shaman.checkPoisonTimer = GetTimeEX() + 3000;
					return true;
				end
			end
		end
	end

	-- check cure disease
	if (HasSpell("Cure Disease")) and (script_checkDebuffs:hasDisease()) and (IsStanding()) then
		if (not IsSpellOnCD("Cure Disease")) and (localMana >= 25) then
			local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Cure Disease");
			if ((cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 20) then
				if (CastSpellByName("Cure Disease", Player())) then
					script_shaman.waitTimer = GetTimeEX() + 1650;
					script_grind:setWaitTimer(1650);
					return true;
				end
			end
		end
	end

	-- purge enemy of magic
	if (HasSpell("Purge")) and (script_checkDebuffs:enemyBuff()) and (PlayerHasTarget()) and not IsSpellOnCD("Purge") then
		local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Purge");
		if (localMana >= 20) and ((cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 20) then
			if (CastSpellByName("Purge", targetObj)) then
				script_shaman.waitTimer = GetTimeEX() + 1500;
				return true;
			end
		end
	end

	-- Check: Lightning Shield
	if IsStanding() and HasSpell("Lightning Shield") and localMana >= 35 and not Player():HasBuff("Lightning Shield") and not IsSpellOnCD("Lightning Shield") then
		local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Lightning Shield");
		if ((cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 20) then
			if (CastSpellByName("Lightning Shield")) then
				script_shaman.waitTimer = GetTimeEX() + 500;
				return true;
			end
		end
	end

	if IsStanding() and localMana >= script_shaman.drinkMana + 5 then
		if script_shaman:checkEnhancement() then
			script_shaman.enhanceWeaponTimer = GetTimeEX() + 300000;
			script_shaman.waitTimer = GetTimeEX() + 1500;
			return true;
		end
	end	

	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(250, 350);

		if (IsMoving()) or (not IsInCombat()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end

return false;
end
