script_druidHealsAndBuffs = {}

function script_druidHealsAndBuffs:healsAndBuffs()
	
	local localMana = 0; local localRage = 0; local localEnergy = 0; local localObj = GetLocalPlayer();

	if GetLocalPlayer():HasBuff("Clearcasting") then localMana = 100; localRage = 100; localEnergy = 100;
	else localMana = localObj:GetManaPercentage(); localRage = localObj:GetRagePercentage(); localEnergy = localObj:GetEnergyPercentage(); end

	local localHealth = localObj:GetHealthPercentage(); local localLevel = localObj:GetLevel();
	local hasRejuv = localObj:HasBuff("Rejuvenation");  local hasRegrowth = localObj:HasBuff("Regrowth");
	local myTarget = GetLocalPlayer():GetUnitsTarget(); local localCP = GetComboPoints("player", "target");
	if (script_druid.useBear or script_druid.useCat) or (not script_druid.useBear and not script_druid.useCat and localMana <= 30 and IsInCombat()) then script_druid.spellRange = script_druid.meleeDistance;
	elseif not script_druid.useBear and not script_druid.useCat and localMana >= 30 then script_druid.spellRange = 27; end script_grind.combatScriptRange = script_druid.spellRange;

	if (IsCasting()) or (IsChanneling()) then script_druid.waitTimer = GetTimeEX() + 1000; end if script_druid.waitTimer > GetTimeEX() then return; end

	if (not IsStanding()) then JumpOrAscendStart();	end

	if (PlayerHasTarget()) then if (IsBearForm()) and (HasSpell("Bash")) and (not IsSpellOnCD("Bash")) and (localRage >= 10) and (myTarget:GetDistance() <= script_druid.meleeDistance) and (targetHealth >= 15) and (localHealth <=script_druid.healthToShift) then
			CastSpellByName("Bash"); return true; end end

	if ( (IsBearForm()) and (localHealth <= script_druid.healthToShift) and (localMana >= script_druid.shapeshiftMana) and localMana > 25 and (not hasRejuv) and (not hasRegrowth) )
	or ( (IsBearForm() ) and (localHealth <= 75) and (not IsInCombat()) and (localMana >= 75) and (not hasRejuv) and (not hasRegrowth) )
	then
		if (not script_grind.adjustTickRate) then script_grind.tickRate = 135; end
		if (script_druidEX:bearForm()) then if IsMoving() then StopMoving(); return true; end if (script_druid.tickRate ~= nil and script_druid.tickRate ~= 0) then
				script_druid.waitTimer = GetTimeEX() + 1000; end end end

	if ( (IsCatForm()) and (localHealth <= script_druid.healthToShift) and (localMana >= script_druid.shapeshiftMana) and localMana > 25 and (not hasRejuv) and (not hasRegrowth) )
	or ( (IsCatForm()) and (localHealth <= 75) and (not IsInCombat()) and (localMana >= 75) and (not hasRejuv) and (not hasRegrowth) )
	then

		if (not script_grind.adjustTickRate) then
			script_grind.tickRate = 335;
		end
		if (IsCatForm()) then CastSpellByName("Cat Form"); script_druid.waitTimer = GetTimeEX() + 1200; script_grind:setWaitTimer(1200);
		end end

if localObj:HasBuff("Nature's Grasp") and IsInCombat() then return false; end

	if IsInCombat() and HasSpell("Nature's Grasp") and not IsSpellOnCD("Nature's Grasp") and not HasForm() and not IsIndoors() and localHealth <= 55 and GetTimeEX() > script_druid.naturesGraspTimer then
		CastSpellByName("Nature's Grasp", localObj); script_druid.waitTimer = GetTimeEX() + 2550; script_grind:setWaitTimer(2550);
		script_druid.naturesGraspTimer = GetTimeEX() + 60000; return true;
	end

	if not IsInCombat() and IsStanding() and
		( (HasSpell("Omen of Clarity") and not localObj:HasBuff("Omen of Clarity")) or
		(HasSpell("Thorns") and not localObj:HasBuff("Thorns") and not localObj:HasBuff("Razorhide")) ) and HasForm() then
		RemoveForm(); if not HasForm() then CastSpellByName("Thorns", GetLocalPlayer()); return true; end
	end

	if HasSpell("Omen of Clarity") and (not localObj:HasBuff("Omen of Clarity") or GetTimeEX() > script_druid.omenOfClarityTimer) and localMana >= 10 and not HasForm() then
		CastSpellByName("Omen of Clarity", localObj);
		script_druid.waitTimer = GetTimeEX() + 1650;
		script_grind:setWaitTimer(1650); script_druid.omenOfClarityTimer = GetTimeEX() + 600000; return true;
	end

	-- healing touch rank 3
	if not IsCasting() and not IsSpellOnCD("Healing Touch") and not IsInCombat() and not HasForm() and IsStanding() and localMana > 10 and HasSpell("Healing Touch") and localHealth <= 75  then
		if not script_grind.adjustTickRate then script_grind.tickRate = 100; end
		if (IsMoving()) then StopMoving(); return true; end local time = 2250;
		local rankHeal = "Rank 1"; if localObj:GetLevel() >= 24 then rankHeal = "Rank 3"; time = 2750; end
		if CastSpellByName("Healing Touch("..rankHeal, localObj) then script_druid.waitTimer = GetTimeEX() + time; return true; end
	end

	if not IsSpellOnCD("Rejuvenation") and (not IsInCombat()) and (not IsBearForm()) and (not IsCatForm()) and (not IsTravelForm()) and (localHealth <= 65) and (localMana >= 75) and (not hasRejuv) and (not hasRegrowth) and (IsStanding()) and (not IsMounted()) then
		if CastSpellByName("Rejuvenation", localObj) then script_grind:setWaitTimer(1650); script_druid.waitTimer = GetTimeEX() + 1650; return true; end end

	if (not IsInCombat()) and (not IsBearForm()) and (not IsCatForm()) and (not IsTravelForm()) and (not HasForm()) and (localHealth <= 70) and (localMana >= 35) and (not hasRegrowth) and (not IsMoving()) and (IsStanding()) and (not IsMounted()) and (not IsCasting()) and (not script_druid.hasRegrowth) then
		if (HasSpell("Regrowth")) and (not localObj:HasBuff("Regrowth")) and (not IsSpellOnCD("Regrowth")) and (not IsCasting()) and (not script_druid.hasRegrowth) then
			if (not localObj:HasBuff("Regrowth")) then
				if (not IsMoving()) and (not IsLooting()) and (not localObj:HasBuff("Regrowth")) then	
					script_druid.tickRate = 1500;
					if (IsMoving()) then StopMoving(); return true; end
					if (script_druid.hasRegrowth) then return false; end
					if (not script_druid.hasRegrowth) then
						if (IsMoving()) then StopMoving(); return true; end
						script_druid.hasRegrowth = true; if not CastHeal("Regrowth", localObj) then script_druid.waitTimer = GetTimeEX() + 2850
						script_grind:setWaitTimer(2850); grind2:setTimer(3000); return 4; end return 4;
					end return 4; end end end end

	if (script_druid.useBear and (IsBearForm() )) and (localHealth <= script_druid.healthToShift - 20) and (localMana >= 65) and (hasRejuv) and (hasRegrowth) and (not IsCasting()) and (not IsChanneling()) then
		if (not script_grind.adjustTickRate) then
			script_grind.tickRate = 335;
		end
		if (script_druidEX.bearForm()) then
			script_druid.waitTimer = GetTimeEX() + 1550;
			script_grind:setWaitTimer(1550);
			return true;
		end
		if not IsSpellOnCD("Healing Touch") and (not IsCasting()) and (not IsChanneling()) then
			if IsMoving() then StopMoving(); return true; end
			if (not CastSpellByName("Healing Touch", localObj)) then
				script_druid.waitTimer = GetTimeEX() + 3000;
				script_grind:setWaitTimer(3000);
			end
			script_druid.waitTimer = GetTimeEX() + 300;
			
		end
	end

	if (script_druid.useCat and IsCatForm()) and (localHealth <= script_druid.healthToShift - 15) and (localMana >= 65) and (hasRejuv) and (hasRegrowth) then
		if (not script_grind.adjustTickRate) then	
			script_grind.tickRate = 335;
		end
		if (IsCatForm()) then
			CastSpellByName("Cat Form");
			script_druid.waitTimer = GetTimeEX() + 500;
			script_grind:setWaitTimer(500);
			return true;
		end
		if not IsSpellOnCD("Healing Touch") and (not IsCasting()) and (not IsChanneling()) then
			if IsMoving() then StopMoving(); return true; end
			if (not CastSpellByName("Healing Touch", localObj)) then
				script_druid.waitTimer = GetTimeEX() + 3000;
				script_grind:setWaitTimer(3000);
			end
			script_druid.waitTimer = GetTimeEX() + 300;
		end
	end

	if (localMana > 15) and (HasSpell("Thorns")) and (not localObj:HasBuff("Thorns")) and not localObj:HasBuff("Razorhide") and (not IsMounted()) and (not IsSpellOnCD("Thorns")) and (not IsBearForm()) and (not IsCatForm()) and (not IsTravelForm()) and (not isMoonkin) and (GetLocalPlayer():GetHealthPercentage() >= 65) and (GetLocalPlayer():GetUnitsTarget() == 0 or GetLocalPlayer():GetUnitsTarget() ~= 0 and not GetLocalPlayer():GetUnitsTarget():HasBuff("Thorns")) then
		
		if PlayerHasTarget() then
			if GetTarget():GetGUID() ~= GetLocalPlayer():GetGUID() then
				ClearTarget();
			end
		end
		if (CastSpellByName("Thorns", localObj)) then
			script_druid.waitTimer = GetTimeEX() + 2550;
			script_druid.thornsTimer = GetTimeEX() + 600000;
			return true;
		end
	end
	if (localMana > 10) and (HasSpell("Omen of Clarity")) and (not localObj:HasBuff("Omen of Clarity")) and (not IsMounted()) and (not IsSpellOnCD("Omen of Clarity")) and not HasForm() then
		if CastSpellByName("Omen of Clarity", localObj) then
			script_druid.waitTimer = GetTimeEX() + 2550;
			script_druid.omenOfClarityTimer = GetTimeEX() + 600000;
			return true;
		end
	end

	if (not IsBearForm()) and (not IsCatForm()) and (not IsTravelForm()) and (IsStanding()) and (not IsEating()) and (not IsDrinking()) and (not IsLooting()) and (not IsMounted()) and (not script_checkDebuffs:hasSilence()) then

		if not HasForm() and (IsInCombat()) and (HasSpell("Innervate")) and (not IsSpellOnCD("Innervate")) and (not localObj:HasBuff("Innervate")) and (localMana <= script_druid.shapeshiftMana + 10) then
			CastSpellByName("Innervate");
			script_druid.waitTimer = GetTimeEX() + 3500;
			return true;
		end

		-- Mark of the Wild
		if (HasSpell("Mark of the Wild")) and (not IsMounted()) and (not localObj:HasBuff("Mark of the Wild")) and (localHealth >= script_druid.healthToShift) and (not IsSpellOnCD("Mark of the Wild")) and (GetLocalPlayer():GetUnitsTarget() == 0 or GetLocalPlayer():GetUnitsTarget() ~= 0 and not GetLocalPlayer():GetUnitsTarget():HasBuff("Mark of the Wild")) then
			if (IsInCombat() and script_grind.enemiesAttackingUs(10) < 2 and localMana >= 30) or (not IsInCombat() and localMana >= 25) then
				if PlayerHasTarget() then
					if GetTarget():GetGUID() ~= GetLocalPlayer():GetGUID() then
						ClearTarget();
					end
				end
				if (CastHeal("Mark of the Wild", localObj)) then
					script_druid.waitTimer = GetTimeEX() + 2500;
					script_grind:setWaitTimer(1600);
					return true;
				end
			end
		end
	end

	-- if not IsBearForm() and not IsCatForm() and not IsTravelForm()
	if (not IsBearForm()) and (not IsCatForm()) and (not IsTravelForm()) and (IsStanding()) and (not IsEating()) and (not IsDrinking()) and (not IsLooting()) and (not localObj:IsStunned()) and (not IsMounted()) and (not script_checkDebuffs:hasSilence()) then

		if (IsInCombat()) then
			-- Check: Use Healing Potion 
			if (localHealth < script_druid.potionHealth) then 
				if (script_helper:useHealthPotion()) then 
					return 0; 
				end 
			end
	
			-- Check: Use Mana Potion 
			if (localMana < script_druid.potionMana) then 
				if (script_helper:useManaPotion()) then 
					return 0; 
				end 
			end
		end

		-- Regrowth
		if (HasSpell("Regrowth")) and (not localObj:HasBuff("Regrowth")) and (not IsSpellOnCD("Regrowth")) and (IsInCombat()) and (not IsCasting()) and (not script_druid.hasRegrowth) then
			if (localHealth <= script_druid.regrowthHealth) and (localMana >= 40) and (not localObj:HasBuff("Regrowth")) then
				if (not IsMoving()) and (not IsLooting()) and (not localObj:HasBuff("Regrowth")) then	
					script_druid.tickRate = 1500;
					if (IsMoving()) then
						StopMoving();
						return true;
					end
					if (script_druid.hasRegrowth) then
						return false;
					end
					if (not script_druid.hasRegrowth) then
						if (IsMoving()) then
							StopMoving();
							return true;
						end
						script_druid.hasRegrowth = true;
						CastHeal("Regrowth", localObj);
						script_druid.waitTimer = GetTimeEX() + 3050
						script_grind:setWaitTimer(3050);
						grind2:setTimer(3050);
						return 4;
					end
				return 4;
				end
			end
		end

		-- Rejuvenation
		if (HasSpell("Rejuvenation")) and (not localObj:HasBuff("Rejuvenation")) and (localHealth <= script_druid.rejuvenationHealth) and (not IsLooting()) and (IsStanding()) and (localHealth <= 80) and (not IsSpellOnCD("Rejuvenation")) then
			if (localLevel < 10 and localMana >= 25) or (localLevel >= 10 and localMana >= script_druid.shapeshiftMana + 5) then 
				CastSpellByName("Rejuvenation", localObj);
				script_druid.waitTimer = GetTimeEX() + 1750;
				if not IsMoving() then script_grind:setWaitTimer(1650); end
				return true;
			end
		end

		-- Healing Touch
		if (HasSpell("Healing Touch")) and (not IsLooting()) and (IsStanding()) then
			if (localHealth <= script_druid.healingTouchHealth) and (localMana >= 25) and (not IsSpellOnCD("Healing Touch")) then
				if (not IsCasting()) and (not IsChanneling()) then
				if IsMoving() then StopMoving(); return true; end
					if (CastSpellByName("Healing Touch", localObj)) then
						script_druid.waitTimer = GetTimeEX() + 5000;
						script_grind:setWaitTimer(3000);
						return true;
					end
					script_druid.waitTimer = GetTimeEX() + 300;
				end
			end
		end

		-- cast rejuvenation if we have regrowth
		if (localObj:HasBuff("Regrowth")) and (not localObj:HasBuff("Rejuvenation")) and (localMana >= 15) and (not IsMoving()) and (IsStanding()) and (localHealth <= 80) and (not IsSpellOnCD("Rejuvenation")) then
			if (CastSpellByName("Rejuvenation", targetObj)) then
				script_druid.waitTimer = GetTimeEX() + 1750;
				if not IsMoving() then script_grind:setWaitTimer(1650); end
			end
		end

		if (not HasSpell("Abolish Poison")) and (HasSpell("Cure Poison")) and (script_checkDebuffs:hasPoison()) and (localMana >= 45) and (not IsMoving()) and (IsStanding()) and (not IsSpellOnCD("Cure Poison")) then
			if (CastSpellByName("Cure Poison", localObj)) then 
				script_druid.waitTimer = GetTimeEX() + 1750; 
				return true; 
			end
		elseif (HasSpell("Abolish Poison")) and (not localObj:HasBuff("Abolish Poison")) and (script_checkDebuffs:hasPoison()) and (localMana >= 25) and (not IsMoving()) and (IsStanding()) and (not IsSpellOnCD("Abolish Poison")) then
			if (CastSpellByName("Abolish Poison", localObj)) then
				script_druid.waitTimer = GetTimeEX() + 1750;
				return true;
			end
		end

		if (HasSpell("Remove Curse")) and (script_checkDebuffs:hasCurse()) and (IsStanding()) and (not IsSpellOnCD("Remove Curse")) then
			if (localMana >= 30) then
if (not IsInCombat()) then
				if (HasForm()) then
					RemoveForm();
				end
			end
				if (PlayerHasTarget()) and (localObj:GetUnitsTarget():GetGUID() ~= localObj:GetGUID()) then
					ClearTarget();
				end
				if (CastSpellByName("Remove Curse", localObj)) then
					script_druid.waitTimer = GetTimeEX() + 1750;
					return true;
				end
			end
		end
	end

	-- if we have regrowth and rejuvenation and 2 or more targets are attacking us then cast healing touch
	if not IsSpellOnCD("Healing Touch") and (HasSpell("Regrowth")) and (hasRegrowth or hasRejuv)
	and (script_grind:enemiesAttackingUs(10) > 2 or localHealth < script_druid.healthToShift)
	and (not IsBearForm() and not IsCatForm() and not isMoonkin and not IsTravelForm() and not IsMounted())
	and (not script_checkDebuffs:hasSilence()) then
		if (not IsCasting()) and (not IsChanneling()) then
			CastSpellByName("Healing Touch", localObj);
			script_druid.waitTimer = GetTimeEX() + 3000;
			return true;
		end
	end

	if not IsSpellOnCD("Healing Touch") and (not HasSpell("Regrowth")) and (not IsBearForm() and not IsCatForm() and not isMoonkin and not IsTravelForm() and not IsMounted()) and (localHealth < script_druid.healthToShift) and (not IsSpellOnCD("Healing Touch")) and (not script_checkDebuffs:hasSilence())  then
		if (not IsCasting()) and (not IsChanneling()) then if IsMoving() then StopMoving(); return true; end if (not CastSpellByName("Healing Touch", localObj)) then
				script_druid.waitTimer = GetTimeEX() + 3000; script_grind:setWaitTimer(3000); return true; end script_druid.waitTimer = GetTimeEX() + 300;
		end end
return false;
end
