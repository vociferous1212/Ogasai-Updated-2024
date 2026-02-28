script_hunterPreCombatState = {

}

function script_hunterPreCombatState:run(targetObj)

	if targetObj == nil or targetObj == 0 then
		return;
	end

	if (not IsStanding()) then 

		JumpOrAscendStart();
	end

	if IsMounted() then

		script_helper:mountUp();
	end

	if script_hunter.waitTimer > GetTimeEX() or ( (IsCasting() or IsChanneling()) and not instantCastSpells:isSpellInstantCast()) then

		return;
	end

	-- use Hunter's Mark
	if PlayerHasTarget() and HasSpell("Hunter's Mark") and not IsSpellOnCD("Hunter's Mark") and not IsInCombat() and script_hunter.useMark then
		if not targetObj:HasDebuff("Hunter's Mark") and PlayerMana() >= script_hunter.useMarkMana then

			local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Hunter's Mark");

			if ((cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana >= 5) then
				if not CastSpellByName("Hunter's Mark") then
					if GetTimeEX() > script_hunter.petAttackTimer then
						PetAttack();
						script_hunter.petAttackTimer = GetTimeEX() + 1000;
					end
					script_hunter.waitTimer = GetTimeEX() + 500;
				end
			end
		end
	end

	if script_hunter.hasPet and HasPet() and not IsMoving() and not targetObj:IsDead() and targetObj:CanAttack() and IsAutoCasting("Shoot") then

		if GetTimeEX() > script_hunter.petAttackTimer then

			PetAttack();

			script_hunter.petAttackTimer = GetTimeEX() + 500;
		end
	end

	-- pull with viper Sting
	if script_hunter.useViperSting and HasSpell("Viper Sting") and not IsSpellOnCD("Viper Sting") and not targetObj:HasDebuff("Viper Sting") and CurrentTargetsMana(targetObj) >= 25 then
		local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Viper Sting");
		if targetObj:GetHealthPercentage() >= 25 and ((cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() > 10) then
			if targetObj:IsInLineOfSight() and targetObj:GetCreatureType() ~= "Elemental" and targetObj:GetCreatureType() ~= "Mechanical" then
				if not CastSpellByName("Viper Sting") then
					self.waitTimer = GetTimeEX() + 500;
				end
			end
		end
	end

	-- aimed Shot
	if HasSpell("Aimed Shot") and not IsSpellOnCD("Aimed Shot") and PlayerMana() >= 15 and script_hunter.useAimedShot then
		local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Aimed Shot");
		if (((cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana >= 15) and cost ~= 0) or PlayerMana() >= 10 then
			if targetObj:GetDistance() <= script_hunter.spellRange and targetObj:IsInLineOfSight() then
				if IsMoving() then StopMoving() return true;
				end
				if not CastSpellByName("Aimed Shot") then
					if GetTimeEX() > script_hunter.petAttackTimer then
						PetAttack();
						script_hunter.petAttackTimer = GetTimeEX() + 1000;
					end
				script_hunter.waitTimer = GetTimeEX() + 500;
				end
			return;
			end
		end
	end

	-- auto shot
	if (not IsAutoCasting("Auto Shot")) and (targetObj:IsInLineOfSight())
	and (IsStanding()) and (targetObj:GetDistance() > script_hunter.minSpellRange)
	and not targetObj:IsDead() and not IsMoving() and script_hunter.useRangedAttacks then
		
		if CastSpellByName("Auto Shot", targetObj) then 

			if targetObj:GetDistance() <= script_hunter.spellRange then
				script_hunter.waitTimer = GetTimeEX() + 500;
			end
			if (GetPet() ~= 0) and (script_hunter.hasPet) then
				if GetTimeEX() > script_hunter.petAttackTimer then
					PetAttack();
					script_hunter.petAttackTimer = GetTimeEX() + 1000;
				end
			end
		script_hunter.waitTimer = GetTimeEX() + 250;
		end
	end

	-- use concussive shot
	-- only use this to pull if we don't have an active pet'
	if (not IsSpellOnCD("Concussive Shot")) and IsStanding() then
		if (HasSpell("Concussive Shot")) and (targetObj:IsInLineOfSight()) and (PlayerMana() > script_hunter.serpentStingMana) then
			if not CastSpellByName("Concussive Shot") then
				if GetTimeEX() > script_hunter.petAttackTimer then PetAttack();
					script_hunter.petAttackTimer = GetTimeEX() + 1000;
				end
				script_hunter.waitTimer = GetTimeEX() + 500;
			end		
		end
	end

	-- use viper sting
	if script_hunter.useViperSting and CurrentTargetsMana(targetObj) >= 1 and HasSpell("Viper Sting") then
		if not IsSpellOnCD("Viper Sting") and not targetObj:HasDebuff("Viper Sting") and IsStanding() then
			if (targetObj:IsInLineOfSight()) and (PlayerMana() > 10)
			and targetObj:GetCreatureType() ~= "Elemental" and targetObj:GetCreatureType() ~= "Demon" and targetObj:GetCreatureType() ~= "Mechanical" then
			local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Viper Sting");
				if ((cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana >= 15) then
					if not CastSpellByName("Serpent Sting") then
						if GetTimeEX() > script_hunter.petAttackTimer then
							PetAttack();
							script_hunter.petAttackTimer = GetTimeEX() + 1000;
						end
						script_hunter.waitTimer = GetTimeEX() + 500;
					end
				end
			end
		end
	else
	-- use serpent sting
		if script_hunter.useSerpentSting and HasSpell("Serpent Sting") and not IsSpellOnCD("Serpent Sting") and (not targetObj:HasDebuff("Serpent Sting")) and (not script_hunter.useScorpidSting) and (IsStanding()) then
			if (targetObj:IsInLineOfSight()) and (PlayerMana() > script_hunter.serpentStingMana)
				and targetObj:GetCreatureType() ~= "Elemental" and targetObj:GetCreatureType() ~= "Demon" and targetObj:GetCreatureType() ~= "Mechanical" then
				local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Serpent Sting");
				if ((cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana >= 15) then
					if not CastSpellByName("Serpent Sting") then
						if GetTimeEX() > script_hunter.petAttackTimer then
							PetAttack();
							script_hunter.petAttackTimer = GetTimeEX() + 1000;
						end
						script_hunter.waitTimer = GetTimeEX() + 500;
					end
				end
			end
		end
	end

	-- use Scorpid Sting
	--if (not targetObj:HasDebuff("Scorpid Sting")) then
	--	if (HasSpell("Scorpid Sting")) and (targetObj:IsInLineOfSight()) and (PlayerMana() > 20) and (targetHealth > 30) then
	--		CastSpellByName("Scorpid Sting");
	--		if GetTimeEX() > script_hunter.petAttackTimer then PetAttack(); script_hunter.petAttackTimer = GetTimeEX() + 1000; end;		--		
	--	end
	--end
					
	-- use arcane shot
	if (not IsSpellOnCD("Arcane Shot")) and (IsStanding()) and (not HasSpell("Aimed Shot") or not script_hunter.useAimedShot) then
		if (HasSpell("Arcane Shot")) and (targetObj:IsInLineOfSight()) and (PlayerMana() > script_hunter.arcaneShotMana) then
			local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Arcane Shot");
			if ((cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana >= 15) then
				if not CastSpellByName("Arcane Shot") then
					if GetTimeEX() > script_hunter.petAttackTimer then
						PetAttack();
						script_hunter.petAttackTimer = GetTimeEX() + 1000;
					end
					script_hunter.waitTimer = GetTimeEX() + 500;
				end	
			end
		end
	end

	if (targetObj:GetDistance() <= 10) then

		if not IsAutoCasting("Attack") then
			CastSpellByName("Attack");
		end

	elseif targetObj:GetDistance() > script_hunter.meleeDistance then 
		return 3;
	end

return false;
end

