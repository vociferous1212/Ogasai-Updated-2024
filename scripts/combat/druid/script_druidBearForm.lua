script_druidBearForm = {


}

-- run bear form combat
function script_druidBearForm:runInCombat(targetObj)

	local targetHealth = targetObj:GetHealthPercentage();

-- if we are switching froms from cat to bear then speed up script tick rate
	if (script_druid.wasInCombat) and (script_druid.runOnce) then
		script_grind.tickRate = 125;
		script_druid.runOnce = false;
	end

-- Run backwards if we are too close to the target
	if (targetObj:GetDistance() <= 0.8) then 
		if (script_druid:runBackwards(targetObj, 2)) then 
			return 4;
		end 
	end

-- keep auto attack on
	if (not IsAutoCasting("Attack")) and (not IsMoving()) then
		targetObj:AutoAttack();
	end

-- use charge in bear form
	if IsBearForm() and (script_druid.useCharge) and (HasSpell("Feral Charge")) and (not IsSpellOnCD("Feral Charge")) and (PlayerRage() >= 5) then
		if (script_druid.useBear) and (IsBearForm()) and (targetObj:GetDistance() < 26) and (targetObj:GetDistance() >= 11) then
			CastSpellByName("Feral Charge");
			return 4;
		end
	end

	if ((targetObj:GetDistance() > script_druid.spellRange and targetObj:GetDistance() > 2) or not targetObj:IsInLineOfSight()) and not IsCasting() and not IsChanneling() then
		return 3;
	end

-- growl in group
	if IsBearForm() and (GetNumPartyMembers() >= 2) and (not targetObj:IsTargetingMe()) and (targetObj:GetDistance() <= 10) then
		if (not IsSpellOnCD("Growl")) then
			CastSpellByName("Growl", targetObj);
			script_druid.waitTimer = GetTimeEX() + 800;
			return 0;
		end
	end

-- bash
	if IsBearForm() and (HasSpell("Bash")) and (not IsSpellOnCD("Bash")) and (PlayerRage() >= 10) and (targetObj:GetDistance() <= script_druid.meleeDistance) and (targetHealth >= 15) then
		if (targetObj:IsCasting()) or (PlayerHealth() <= script_druid.healthToShift + 15) then
			CastSpellByName("Bash");
			return 0;
		end
	end

-- frenzied regeneration
	if (IsBearForm()) and (HasSpell("Frenzied Regeneration")) and (not IsSpellOnCD("Frenzied Regeneration")) and (PlayerHealth() < 50) and (PlayerRage() >= 15) and (PlayerMana() < 40) then
		if (CastSpellByName("Frenzied Regeneration")) then
			script_druid.waitTimer = GetTimeEX() + 1000;
		end
	end

-- keep faerie fire up
	if PlayerHasTarget() and HasForm() and HasSpell("Faerie Fire (Feral)") and not IsSpellOnCD("Faerie Fire (Feral)") and not targetObj:HasDebuff("Faerie Fire (Feral)") and targetObj:IsInLineOfSight() then
		CastSpellByName("Faerie Fire (Feral)()");
		return 0;
	end

-- Enrage
	if IsBearForm() and (HasSpell("Enrage")) and (not IsSpellOnCD("Enrage")) and (targetObj:GetDistance() < 30) and (PlayerHealth() > 65) and (targetHealth >= 40) then
		if (CastSpellByName("Enrage")) then
			return 0;
		end
	end

-- demo Roar
	if IsBearForm() and (HasSpell("Demoralizing Roar")) and not IsSpellOnCD("Demoralizing Roar") and (not targetObj:HasDebuff("Demoralizing Roar")) and (PlayerRage() >= 10) then
		if (CastSpellByName("Demoralizing Roar")) then
			return 0;
		end
	end

-- Swipe
	if IsBearForm() and (script_druid:enemiesAttackingUs(10) >= 2) and not IsSpellOnCD("Swipe") and (not Player():HasBuff("Frenzied Regeneration")) then
		if (HasSpell("Swipe")) and (not targetObj:HasDebuff("Swipe")) and (PlayerRage() >= 15) then
			if (CastSpellByName("Swipe")) then
				return 0;
			end
		end
	end

-- maul non humanoids
	if IsBearForm() and (PlayerRage() >= script_druid.maulRage) and not IsSpellOnCD("Maul") then
		if (HasSpell("Maul")) and (not IsCasting()) and (not IsChanneling()) and (not IsMoving()) and (targetObj:GetCreatureType() ~= 'Humanoid')
		and (targetObj:GetDistance() <= script_druid.meleeDistance) and (not Player():HasBuff("Frenzied Regeneration"))
		then
			CastSpellByName("Maul", targetObj)
			if not IsAutoCasting("Attack") then
				targetObj:AutoAttack();
			end
			script_druid.waitTimer = GetTimeEX() + 500;
			return 0;
		end
	end

-- maul humanoids fleeing conditions
	if IsBearForm() and (PlayerRage() >= script_druid.maulRage) and not IsSpellOnCD("Maul") then
		if (HasSpell("Maul")) and (not IsCasting()) and (not IsChanneling()) and (not IsMoving()) and (targetObj:GetCreatureType() == 'Humanoid')
			and (targetHealth > 30) and (targetObj:GetDistance() <= script_druid.meleeDistance) and (not Player():HasBuff("Frenzied Regeneration"))
		then
			CastSpellByName("Maul", targetObj)
			if not IsAutoCasting("Attack") then
				targetObj:AutoAttack();
			end;
			script_druid.waitTimer = GetTimeEX() + 500;
			return 0;			
		end
	end
return false;
end