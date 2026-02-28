script_hunterInCombatState = {


}

function script_hunterInCombatState:run(targetObj)

	if targetObj == nil or targetObj == 0 then
		return;
	end

	targetHealth = targetObj:GetHealthPercentage();

	local pet = GetPet();
	local petHP = 0;
	if pet ~= nil and pet ~= 0 then
		petHP = pet:GetHealthPercentage();
		local petMana = GetPet():GetManaPercentage();
		local petFocus = GetPet():GetFocus();
	end

-- Check: If pet is dismissed then Call pet 
	if (GetPet() == 0) and (script_hunter.hasPet) and (IsStanding()) and (not IsMounted()) then
		script_hunter.message = "Pet is missing, calling pet...";
		CallPet();
		script_hunter.waitTimer = GetTimeEX() + 1850;
	return true;
	end

	script_hunter.message = "Killing " .. targetObj:GetUnitName() .. "...";

-- check line of sight
	if (not targetObj:IsInLineOfSight() or targetObj:GetDistance() > script_hunter.spellRange) and (GetTimeEX() >= script_hunter.petFollowTimer or not IsInCombat()) and (not targtObj:IsStunned() or not HasPet()) then
		return 3;
	end

-- check range if not using ranged attacks
	if targetObj ~= 0 and targetObj ~= nil then
		if not script_hunter.useRangedAttacks and (targetObj:GetDistance() > script_hunter.meleeDistance or not targetObj:IsInLineOfSight()) then
			return 3;
		end
	end

-- war stomp targets until level 6 then save for interrupts
	if (IsInCombat())
	and targetObj ~= nil
	and targetObj ~= 0
	and (targetObj:GetHealthPercentage() > 10) 
	and (HasSpell("War Stomp"))
	and (not IsSpellOnCD("War Stomp"))
	and (not Player():IsStunned())
	and (targetObj:GetDistance() <= 8)
	and (not targetObj:IsStunned())
	and (not IsMoving())
			
	then

		CastSpellByName("War Stomp");
	end

-- force auto shot if in combat
	if (IsInCombat()) 
	and targetObj ~= 0
	and targetObj ~= nil
	and script_hunter.useRangedAttacks
	and not IsMoving()
			
	then
		if not IsMoving() then
						
			end

		if (not IsAutoCasting("Auto Shot"))
		and (targetObj:GetDistance() > script_hunter.minSpellRange)
		and (targetObj:GetDistance() < script_hunter.spellRange)
		and (targetObj:IsInLineOfSight())
		and not targetObj:IsDead()
		and targetObj:CanAttack()
				
		then

			if not CastSpellByName("Auto Shot", targetObj) then
				if targetObj:GetDistance() <= script_hunter.spellRange then
					script_hunter.waitTimer = GetTimeEX() + 500;
				end
				if GetTimeEX() > script_hunter.petAttackTimer and GetTimeEX() >= script_hunter.petFollowTimer then
					PetAttack();
					script_hunter.petAttackTimer = GetTimeEX() + 1000; script_hunter.petFollowTimer = GetTimeEX() + 1000;
				end
			end
		end
	end
	
-- Check: Use Healing Potion 
	if (PlayerHealth() <= script_hunter.potionHealth) then 
		if (script_helper:useHealthPotion()) then 
					 
		end 
	end
	
-- Check: Use Mana Potion 
	if (PlayerMana() <= script_hunter.potionMana) then 
		if (script_helper:useManaPotion()) then 
					 
		end 
	end
	
-- Check: Use Rapid Fire if we have adds
	if (script_grind:enemiesAttackingUs() > 1)
	and (HasSpell("Rapid Fire"))
	and (not IsSpellOnCD('Rapid Fire')) 
	and (PlayerMana() > 10)
	and script_hunter.useRangedAttacks
			
	then

		if CastSpellByName('Rapid Fire') then
			script_hunter.waitTimer = GetTimeEX() + 500;
		end
				
	end

	if totemsList:isTargetTotem(targetObj) then
		if targetObj:IsInLineOfSight() and (targetObj:GetDistance() > script_hunter.minSpellRange or (targetObj:GetDistance() < script_hunter.minSpellRange and targetObj:GetDistance() > script_hunter.meleeDistance)) then
			if IsAutoCasting("Auto Shot") then
				return;
			end
		end
	end

-- range / los ?
	if targetObj ~= nil and targetObj ~= 0 then
		if (targetObj:GetDistance() > script_hunter.spellRange or not targetObj:IsInLineOfSight()) and (GetTimeEX() >= script_hunter.petFollowTimer or not IsInCombat()) then
			return 3;
		end
	end
	
-- Check: If pet is stunned, feared etc use Bestial Wrath
	if (script_hunter.hasPet) and (HasPet()) and HasSpell("Bestial Wrath") and not IsSpellOnCD("Bestial Wrath") and PlayerMana() >= 10 then
		if (targetHealth >= 55 and targetHealth <= 98) or petHP <= script_hunter.mendPetHealth or pet:IsStunned() or pet:IsConfused() or pet:IsFleeing() then 
			CastSpellByName("Bestial Wrath");
			return true; 
		end
	end

-- pet intimidation
	if targetObj ~= nil and targetObj ~= 0 then
		if HasSpell("Intimidation") and not IsSpellOnCD("Intimidation") and HasPet() and script_hunter.hasPet and ( (IsInCombat() and targetHealth >= 55 and CurrentTargetsMana(targetObj) <= 10 and PlayerMana() >= 15) or targetObj:IsCasting() and PlayerManaTotal() >= 150) then
			if not CastSpellByName("Intimidation") then
				script_hunter.waitTimer = GetTimeEX() + 500;
			end
		end
	end

-- mend pet
	if (HasSpell("Mend Pet")) and (GetPet() ~= 0) then
		-- Check: Mend the pet if it has lower than 70% HP and out of combat
		if (script_hunter.hasPet) and (petHP <= script_hunter.mendPetHealth) and (petHP > 0) then	

		local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Mend Pet");
			if (cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 20 then

				-- pet is too far away to mend
				if (GetPet():GetDistance() > 20) then
					if GetTimeEX() > script_hunter.petFollowTimer and GetTimeEX() >= script_hunter.petAttackTimer then
						PetFollow();
						script_hunter.petFollowTimer = GetTimeEX() + 500;
						script_hunter.petAttackTimer = GetTimeEX() + 500;
					end
					return true;
				-- pet is close enough to mend
				elseif (GetPet():GetDistance() < 20) then
					if (script_hunter.hasPet) and (petHP <= script_hunter.mendPetHealth) and (petHP > 0) then
						script_hunter.message = "Pet has lower than 50% HP, mending pet...";	
						if (IsMoving()) or (not IsStanding()) then
							StopMoving();
							return true;
						end
						if not CastSpellByName('Mend Pet') then
							script_hunter.waitTimer = GetTimeEX() + 550; 
							script_grind:setWaitTimer(5000);
							grind2:setTimer(5000);
							return true;
						end
					end
				end
			end
		end
	end

--Racial
	if (not IsMoving()) and targetObj ~= nil and targetObj ~= 0 then
		if (targetObj:GetDistance() <= 6) then
			CheckRacialSpells();
			script_hunter.waitTimer = GetTimeEX() + 200;
		end
	end

-- mend pet
	if (HasSpell("Mend Pet")) and (GetPet() ~= 0) then
		-- Check: Mend the pet if it has lower than 70% HP and out of combat
		if (script_hunter.hasPet) and (petHP <= script_hunter.mendPetHealth) and (petHP > 0) then	

			local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Mend Pet");
			if (cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 20 then

				if (GetPet():GetDistance() > 20) then
					if GetTimeEX() > script_hunter.petFollowTimer and GetTimeEX() >= script_hunter.petAttackTimer then
						PetFollow();
						script_hunter.petFollowTimer = GetTimeEX() + 500; script_hunter.petAttackTimer = GetTimeEX() + 500;
					end
					script_hunter.waitTimer = GetTimeEX() + 1000;
				return true;
				elseif (GetPet():GetDistance() < 20) then
					if (script_hunter.hasPet) and (petHP <= script_hunter.mendPetHealth) and (petHP > 0) then
						script_hunter.message = "Pet has lower than 50% HP, mending pet...";	
						if not CastSpellByName('Mend Pet') then
							script_hunter.waitTimer = GetTimeEX() + 1850; 
							return true;
						end
					end
				end
			end
		end
	end

-- follower walk away from any target that is not attacking me and I am attacking it
	if (GetNumPartyMembers() > 0) and not script_rotation.usingRotation and script_hunter.useRangedAttacks and targetObj ~= 0 and targetObj ~= nil then
		if (targetObj:IsInLineOfSight())
		and (targetObj:GetUnitsTarget() ~= 0
		and targetObj:GetUnitsTarget():GetGUID() ~= Player():GetGUID()) or targetObj:IsStunned() then

				if (script_hunter:runBackwards(targetObj, script_hunter.minSpellRange)) then
					if GetTimeEX() > script_hunter.petAttackTimer and GetTimeEX() >= script_hunter.petFollowTimer then
						PetAttack();
						script_hunter.petAttackTimer = GetTimeEX() + 1000; script_hunter.petFollowTimer = GetTimeEX() + 1000;
					end
					script_hunter.message = "Moving away from target for range attacks...";
				return 4;
				end

		end
	end

-- target is far enough to use ranged attacks

	if targetObj ~= nil and targetObj ~= 0 then
		if (targetObj:GetDistance() > script_hunter.minSpellRange) and (targetObj:GetDistance() < script_hunter.spellRange) and script_hunter.useRangedAttacks then

			-- use Hunter's Mark first
			if (script_hunter.useMark) and not IsSpellOnCD("Hunter's Mark") then
				if (HasSpell("Hunter's Mark")) and (not targetObj:HasDebuff("Hunter's Mark"))
				and (targetObj:IsInLineOfSight()) and (targetHealth >= 50) and (PlayerMana() >= script_hunter.useMarkMana) then
					local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Hunter's Mark");
					if (cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 10 then
						if not CastSpellByName("Hunter's Mark") then
							script_hunter.waitTimer = GetTimeEX() + 500;
							if GetTimeEX() > script_hunter.petAttackTimer then
								PetAttack(); script_hunter.petAttackTimer = GetTimeEX() + 1000;
							end
						end
					end
				end
			end
		
-- use concussive shot
			if (HasSpell("Concussive Shot")) then
				if (not IsSpellOnCD("Concussive Shot")) then
					if script_grind:isTargetingMe(targetObj) or targetObj:IsFleeing() or script_hunter.hasImprovedConcussiveShot or not HasPet() then
					local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Concussive Shot");
						if (cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 5 then
							if not CastSpellByName("Concussive Shot") then
								script_hunter.waitTimer = GetTimeEX() + 500;
							end
						end
					end
				end
			end	

-- use viper Sting
			if script_hunter.useViperSting and HasSpell("Viper Sting") and not IsSpellOnCD("Viper Sting") and not targetObj:HasDebuff("Viper Sting") and CurrentTargetsMana(targetObj) >= 25 then
				local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Viper Sting");
				if targetObj:GetHealthPercentage() >= 25 and ((cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() > 10) then
					if targetObj:IsInLineOfSight() and targetObj:GetCreatureType() ~= "Elemental" and targetObj:GetCreatureType() ~= "Mechanical" then
						if not CastSpellByName("Viper Sting") then
							script_hunter.waitTimer = GetTimeEX() + 500;
						end
					end
				end
			end
								
-- use serpent sting
			if script_hunter.useSerpentSting and not script_hunter.useScorpidSting and (not targetObj:HasDebuff("Viper Sting") or CurrentTargetsMana(targetObj) <= 5) then
				if HasSpell("Serpent Sting") and not IsSpellOnCD("Serpent Sting") and not targetObj:HasDebuff("Serpent Sting") then
					if (targetObj:IsInLineOfSight()) and (PlayerMana() > script_hunter.serpentStingMana) then
						if targetObj:GetCreatureType() ~= "Elemental" or targetObj:GetUnitName() == "Tar Creeper" then
							if targetObj:GetCreatureType() ~= "Demon" and targetObj:GetCreatureType() ~= "Mechanical" and targetHealth >= 25 then
								local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Serpent Sting");
								if (cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 10 then
									if not CastSpellByName("Serpent Sting") then
										script_hunter.waitTimer = GetTimeEX() + 500;
									end
								end
							end
						end	
					end
				end
			end

-- use arcane shot
			if (not IsSpellOnCD("Arcane Shot")) and not IsSpellOnCD("Aimed Shot") and PlayerMana() >= script_hunter.arcaneShotMana and (not HasSpell("Aimed Shot") or not script_hunter.useAimedShot) then
				if (HasSpell("Arcane Shot")) and (targetObj:IsInLineOfSight()) then
					local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Arcane Shot");
					if (cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 10 then
						if not CastSpellByName("Arcane Shot") then
							script_hunter.waitTimer = GetTimeEX() + 500;
						end
					end
				end
			end

-- aimed Shot
			if script_hunter.useAimedShot and not IsMoving() and HasSpell("Aimed Shot") and not IsSpellOnCD("Aimed Shot") and not IsSpellOnCD("Arcane Shot") and PlayerMana() >= script_hunter.arcaneShotMana and targetHealth >= 15 then
				local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Aimed Shot");
				if (cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 10 then
					if IsMoving() then StopMoving(); return; end
					if not CastSpellByName("Aimed Shot") then
						script_hunter.waitTimer = GetTimeEX() + 500;
						return;
					end
				end
			end


-- multi shot
			if (script_hunter.useMultiShot) and NumberTargetsAttackingPlayer() >= 2 then
				if (HasSpell("Multi-Shot")) and (not IsSpellOnCD("Multi-Shot")) and (PlayerMana() >= 15) then
					local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Multi-Shot");
					if (cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 10 then
						if not CastSpellByName("Multi-Shot") then
							script_hunter.waitTimer = GetTimeEX() + 500;
						end
					end
				end
			end
	
-- mend pet
			if (HasSpell("Mend Pet")) and (GetPet() ~= 0) then
				-- Check: Mend the pet if it has lower than 70% HP and out of combat
				if (script_hunter.hasPet) and (petHP <= script_hunter.mendPetHealth) and (petHP > 0) then	

				local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Mend Pet");
					if (cost ~= nil and PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 20 then

						if (GetPet():GetDistance() > 20) then
							if GetTimeEX() > script_hunter.petFollowTimer and GetTimeEX() >= script_hunter.petAttackTimer then
								PetFollow();
								script_hunter.petFollowTimer = GetTimeEX() + 500; script_hunter.petAttackTimer = GetTimeEX() + 500;
							end
							return true;
						elseif (GetPet():GetDistance() < 20) then
							if (script_hunter.hasPet) and (petHP <= script_hunter.mendPetHealth) and (petHP > 0) then
								script_hunter.message = "Pet has lower than 50% HP, mending pet...";	
								if not CastSpellByName('Mend Pet') then
									script_hunter.waitTimer = GetTimeEX() + 1850; 
									return true;
								end
							end
						end
					end
				end
			end
		end
	end
-- melee attacks otherwise

	if targetObj ~= nil and targetObj ~= 0 and (targetObj:GetDistance() < script_hunter.minSpellRange) then

		if IsInCombat() and targetObj:GetDistance() > script_hunter.meleeDistance and targetObj:GetDistance() < script_hunter.minSpellRange and ( (( (script_grind:isTargetingMe(targetObj) and not targetObj:IsCasting()) or targetObj:IsStunned()) and GetTimeEX() >= script_hunter.petFollowTimer) or (not IsInCombat() or (not HasPet() and IsInCombat())) ) then
			return 3;
		end

		
	if script_hunter.disengageUsed then
		CastSpellByName("Attack");
		script_hunter.disengageUsed = false;
	end

		if targetObj:GetDistance() <= script_hunter.meleeDistance then
		
			if IsInCombat() and GetPet() ~= 0 and GetPet() ~= nil and script_hunter.hasPet and script_grind:isTargetingMe(targetObj) and not targetObj:IsCasting() then
				if ((targetObj:GetDistance() > script_hunter.meleeDistance and targetObj:GetDistance() < script_hunter.minSpellRange) or not targetObj:IsInLineOfSight()) and (GetTimeEX() >= script_hunter.petFollowTimer or not IsInCombat()) then
					return 3;
				end
			end

-- cast raptor strike
			if (HasSpell("Raptor Strike")) and (not IsSpellOnCD("Raptor Strike")) and (PlayerMana() > 10) 
			and (targetObj:GetDistance() <= script_hunter.meleeDistance) and not IsCasting() and not IsChanneling() then
				
				if (not IsSpellOnCD("Raptor Strike")) then
					if not CastSpellByName("Raptor Strike") then
						if HasPet() and script_hunter.hasPet then
							if GetTimeEX() > script_hunter.petAttackTimer and GetTimeEX() >= script_hunter.petFollowTimer then
								PetAttack();
								script_hunter.petAttackTimer = GetTimeEX() + 1000; script_hunter.petFollowTimer = GetTimeEX() + 1000;
							end
						end
						script_hunter.waitTimer = GetTimeEX() + 500;
					end
				end
			end
					
-- check distance
			if (targetObj:GetDistance() > script_hunter.meleeDistance) and (GetNumPartyMembers() == 0)
			and (script_grind.isTargetingMe(targetObj) and not targetObj:IsCasting()) and GetTimeEX() >= script_hunter.petFollowTimer then
				return 3;
			end

-- cast wing clip
			if (HasSpell("Wing Clip")) and (not IsSpellOnCD("Wing Clip")) and not targetObj:HasDebuff("Wing Clip") and (PlayerMana() > 10) and (targetHealth < 35) then
				CastSpellByName("Wing Clip");
				script_hunter.waitTimer = GetTimeEX() + 500;
			end

-- cast raptor strike
			if (HasSpell("Raptor Strike")) and (not IsSpellOnCD("Raptor Strike")) and (PlayerMana() > 10)
			and (targetObj:GetDistance() <= script_hunter.meleeDistance) then
					
				if (not IsSpellOnCD("Raptor Strike")) then
						
					if not CastSpellByName("Raptor Strike") then
						script_hunter.waitTimer = GetTimeEX() + 500;
					end
				end
			end
		end
	end
end