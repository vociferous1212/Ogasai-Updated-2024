script_paladinHealsAndBuffs = {

	waitTimer = 0

}


function script_paladinHealsAndBuffs:healsAndBuffs()
	
	if IsCasting() or IsChanneling() then self.waitTimer = GetTimeEX() + 1000; end

	if (IsCasting()) or (IsChanneling()) then
		return;
	end
	
	local localMana = GetLocalPlayer():GetManaPercentage();
	local localHealth = GetLocalPlayer():GetHealthPercentage();
	local localObj = GetLocalPlayer();

	if localObj:IsDead() then return false; end

	if (not IsMounted()) then
		if (not IsDrinking()) and (not IsEating()) then
			if (not IsStanding()) then
				JumpOrAscendStart();
			end
		end
	end

	-- check aura
	if not localObj:HasBuff("Deovotion Aura") and not localObj:HasBuff("Retribution Aura") and not localObj:HasBuff("Sanctity Aura") then
		if script_paladinCheckAura:checkAura() then
			script_paladin.waitTimer = GetTimeEX() + 1000;
			return true;
		end
	end

	-- check blessing
	if (not localObj:HasBuff("Blessing of Wisdom") and script_paladin.wisdom) or (not localObj:HasBuff("Blessing of Might") and script_paladin.might) then
		if localMana >= 10 then
			if script_paladinCheckBlessing:checkBlessing() then
				script_paladin.waitTimer = GetTimeEX() + 1500;
				return true;
			end
		end
	end

	-- Check: Use Lay of Hands
	if (localHealth < script_paladin.lohHealth) and (HasSpell("Lay on Hands")) and (not IsSpellOnCD("Lay on Hands")) then 
		if (Cast("Lay on Hands", localObj)) then 
			script_paladin.waitTimer = GetTimeEX() + 1750;
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
				return true;
			end
		end
	end

	if (script_paladin.useBubbleHearth) and (localObj:HasBuff("Divine Shield")) then
		UseItem("Hearthstone");
		script_grind:setWaitTimer(12000);
		script_paladin.waitTimer = GetTimeEX() + 12050;
		StopBot();
		return true;
	end
			
	-- Check: Divine Protection if BoP on CD
	if(localHealth <= script_paladin.shieldHealth) and (not localObj:HasDebuff("Forbearance")) then
		if (HasSpell("Divine Shield")) and (not IsSpellOnCD("Divine Shield")) then
			CastSpellByName("Divine Shield");
			script_paladin.message = "Cast Divine Shield...";
			script_paladin.waitTimer = GetTimeEX() + 1750;
			return true;
		elseif (HasSpell("Divine Protection")) and (not IsSpellOnCD("Divine Protection")) then
			CastSpellByName("Divine Protection");
			script_paladin.message = "Cast Divine Protection...";
			script_paladin.waitTimer = GetTimeEX() + 1750;
			return true;
		elseif (HasSpell("Blessing of Protection")) and (not IsSpellOnCD("Blessing of Protection")) then
			CastSpellByName("Blessing of Protection");
			script_paladin.message = "Cast Blessing of Protection...";
			script_paladin.waitTimer = GetTimeEX() + 1750;
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
			script_paladin.waitTimer = GetTimeEX() + 3050;
			script_paladin.waitTimer = GetTimeEX() + 3050
			return 4;
		else
			if (localMana > 8) and (HasSpell("Flash of Light")) then
				if (IsMoving()) then
					StopMoving();
				end
				CastSpellByName("Flash of Light", localObj);
				script_grind:setWaitTimer(1550);
				script_paladin.waitTimer = GetTimeEX() + 1750;
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
					script_paladin.waitTimer = GetTimeEX() + 1750;
					return true; 
			end
		end
	end

	if (script_checkDebuffs:hasDisease()) or (script_checkDebuffs:hasPoison()) then
		if (HasSpell("Purify")) and (localMana > 60) then
			if (Buff("Purify", localObj)) then 
				script_paladin.message = "Cleansing..."; script_grind:setWaitTimer(1750); script_paladin.waitTimer = GetTimeEX() + 1750; return true; 
			end
		end
	end

	if (localObj:IsMovementDisabed() or script_checkDebuffs:hasDisabledMovement()) and (HasSpell("Blessing of Freedom")) then
		Buff("Blessing of Freedom", localObj);
		script_paladin.waitTimer = GetTimeEX() + 1750;
		return true;
	end

	-- flash of light not in combat
	if not IsInCombat() and localMana > 10 and HasSpell("Flash of Light") and localHealth <= 80  then
		if not script_grind.adjustTickRate then	script_grind.tickRate = 100; end
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			CastSpellByName("Flash of Light(Rank 1", localObj);
			script_grind:setWaitTimer(1950);
			script_paladin.waitTimer = GetTimeEX() + 2050;
			return true;
	end

		-- Flash of Light in combat
	if (script_paladin.useFlashOfLightInCombat) and localMana >= 7 and localHealth <= script_paladin.flashOfLightHealth then
		script_paladinCastFlashOfLight.healthFull = false;
		if GetLocalPlayer():GetHealthPercentage() >= 85 then
			self.healthFull = true;
		end
		if script_paladinCastFlashOfLight:castFlashOfLight() then
			script_paladin.tickRate = 0;
			return true;
		end
	end	


	-- holy light
	if script_paladinCastHolyLight.holyLightTimer < GetTimeEX() and (localMana > 18) then
		if (script_paladinCheckHealthPercentage:doubleCheckHealthPercentage() < script_paladin.holyLightHealth) and localHealth < script_paladin.holyLightHealth then
			if (not IsMoving()) and not IsCasting() and not IsChanneling() then
				script_paladin.tickRate = 1500
				if (not IsCasting()) and (not IsChanneling()) then
					if (IsMoving()) then
						StopMoving();
						return true;
					end
					script_paladinCastHolyLight:castHolyLight(localObj)
					script_paladinCastHolyLight.holyLightTimer = GetTimeEX() + 4550;
					script_grind:setWaitTimer(1550);
					script_paladin.waitTimer = GetTimeEX() + 1550;
				return 4;
				end
			return 4;
			end
		return 4;
		end
	end

	--flash of light in combat very low health and mana
	if (HasSpell("Flash of Light")) and (IsInCombat()) and (localMana < 15) and (localMana > 5) and (localHealth < script_paladin.holyLightHealth) then
		if not script_grind.adjustTickRate then script_grind.tickRate = 100; end
		if (IsMoving()) then
			StopMoving();
		end

		if (not CastHeal("Flash of Light", localObj)) then
			script_grind:setWaitTimer(1500);
			script_paladin.waitTimer = GetTimeEX() + 1750;
			script_paladin.message = "We are dying - trying to save!";
			return 4;
		end
	end

	-- holy light out of combat
	if not IsCasting() and not IsChanneling() and (not IsInCombat() or not script_grind:isAnyTargetTargetingMe()) and not HasSpell("Flash of Light")
	and (not PlayerHasTarget() or (PlayerHasTarget() and GetTarget():GetHealthPercentage() >= 99)) then
		if localHealth <= 70 then
			if IsMoving() then StopMoving(); return true; end
 			if not CastSpellByName("Holy Light(Rank 1", localObj) then
				script_paladin.waitTimer = GetTimeEX() + 500;
				script_grind:setWaitTimer(500);
				return false;
			end
		return 4;
		end
	end
return false;
end