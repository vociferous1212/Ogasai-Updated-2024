script_druidCatForm = {


}

-- run cat form combat
function script_druidCatForm:runInCombat(targetObj)

	local targetHealth = targetObj:GetHealthPercentage();

-- Run backwards if we are too close to the target
	if (targetObj:GetDistance() <= 0.4) then 

		if (script_druid:runBackwards(targetObj, 1)) then 

			return 4; 
		end 
	end

-- keep auto attack on
	if (not IsAutoCasting("Attack")) and (not IsMoving()) then

		targetObj:AutoAttack();
	end

-- keep faerie fire up
	if PlayerHasTarget() and HasForm() and HasSpell("Faerie Fire (Feral)") and not IsSpellOnCD("Faerie Fire (Feral)") and not targetObj:HasDebuff("Faerie Fire (Feral)") and targetObj:IsInLineOfSight() then
		CastSpellByName("Faerie Fire (Feral)()");
		script_druid.waitTimer = GetTimeEX() + 1600;
		return 0;
	end

-- Rip with 3 CPs
	if IsCatForm() and (PlayerComboPoints() >= 3) and (PlayerEnergy() >= 30) and (not HasSpell("Ferocious Bite")) and (not targetObj:HasDebuff("Rip")) and (targetObj:GetCreatureType() ~= "Elemental") and (targetObj:GetCreatureType() ~= "Mechanical") then
		if (script_druidEX2:castRip("Rip")) then
			script_druid.waitTimer = GetTimeEX() + 1000;
			return 0;
		end
	end

-- Ferocious Bite with 5 CPs
	if IsCatForm() and (PlayerComboPoints() > 4) and (PlayerEnergy() >= 35) and (HasSpell("Ferocious Bite")) and not IsSpellOnCD("Ferocious Bite") then
		if (CastSpellByName("Ferocious Bite", targetObj)) then
			script_druid.waitTimer = GetTimeEX() + 1600;
			return 0;
		end
	end
			
-- Dynamic health check when using Ferocious Bite between 1 and 4 CP
	if IsCatForm() and (targetHealth - 10 <= (10 * PlayerComboPoints())) and (PlayerEnergy() >= 35) and (HasSpell("Ferocious Bite")) and not IsSpellOnCD("Ferocious Bite") then
		if (CastSpellByName("Ferocious Bite", targetObj)) then
			script_druid.waitTimer = GetTimeEX() + 1000;
			return;
		end
	end
		
-- keep rake up
	if IsCatForm() and (HasSpell("Rake")) and (not targetObj:HasDebuff("Rake")) and (targetHealth >= 30) and (PlayerEnergy() >= script_druid.rakeEnergy) and (targetObj:GetCreatureType() ~= "Elemental") and targetObj:GetCreatureType() ~= "Undead" and (targetObj:GetCreatureType() ~= "Mechanical") and (not IsSpellOnCD("Rake")) then
		if (CastSpellByName("Rake", targetObj)) then
			script_druid.waitTimer = GetTimeEX() + 2200;
			return 0;
		end
	end

-- Use Claw
	if IsCatForm() and (PlayerEnergy() >= script_druid.clawEnergy) and (not IsSpellOnCD("Claw")) and not IsCasting() and not IsChanneling() then
		if not CastSpellByName("Claw") then
			script_druid.waitTimer = GetTimeEX() + 1600;
			return 0;
		end
	end

return false;
end