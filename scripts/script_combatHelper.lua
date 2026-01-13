script_combatHelper =  { castingTimer = 0,
						castingTimerSet = false,
						tempHP = 100
						}


-- override combat script for "clutch" in combat situations...
function script_combatHelper:run()

		if script_grind.enemyObj == nil then script_grind.enemyObj = grind2.enemyTarget; end


		if GetMyClass() == "MAGE" then

			if GetLocalPlayer():HasBuff("Evocation") then return; end

			-- check casting timer of frostbolt to see if we need to stop casting a spell or not.
			-- we don't want to stop casting when almost done casting
			script_combatHelper:getFrostboltCastingTime();

			-- check mage for conditions to stop spell casting frostbolt
			script_combatHelper:mageStopFrostboltConditions();

			

			-- possible this is causing nav crashes being called from the grinder instead of combat script...
			-- run backwards during combat under ceratin conditions, entangle root / frost nova
			--script_combatHelper:checkRunBackwards();
		end

		if GetMyClass() == "WARRIOR" or GetMyClass() == "DRUID" then
			-- check warrior for conditions to stop spell casting frostbolt
			script_combatHelper:checkStopHeroicStrikeConditions();
		end

		if GetMyClass() == "HUNTER" then
			script_combatHelper:checkStopRaptorStrikeConditions()

				-- feign death if pet is dead
			if IsInCombat() and (script_hunter.hasPet) and HasPet() then
				if (GetPet():GetHealthPercentage() < 1 or GetPet():IsDead()) then
					if (HasSpell("Feign Death")) and (not IsSpellOnCD("Feign Death"))
					and (GetLocalPlayer():GetManaPercentage() >= 5) then
						if CastSpellByName("Feign Death") then
						script_grind.waitTimer = GetTimeEX() + 3850;
						end
					end
				end
			end
		end
end




function script_combatHelper:mageStopFrostboltConditions()

-- try to stop spell casting so we can use wand if target is really low health.. waste of mana
-- or stop spell casting so we can frost nova and run away
-- or stop casting so we can cone of cold and hope it procs freezing effects so we can run away

	if self.castingTimer > GetTimeEX() then

		-- make sure there's no polymorph adds that will be hurt with AoE spells
		if HasSpell("Frostbolt") and not GetLocalPlayer():IsStunned() and not IsMoving() and IsInCombat() and script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil and not script_magePolymorph:isAddPolymorphed() then
		
			local target = script_grind.enemyObj;
			if target == nil or target == 0 then target = grind2.enemyTarget; end
			-- if target is below wand health or my mana is below wand mana (OR) target is not frozen (OR) distance is too close
			if script_grind:enemiesAttackingUs() < 2 and IsCasting()
		
			-- if target range is 10 or less
			and (target:GetDistance() <= 8

				-- or target is within acceptable wand attack conditions
				or ((GetLocalPlayer():GetManaPercentage() < script_mage.useWandMana or target:GetHealthPercentage() < script_mage.useWandHealth) and script_mage.useWand and GetLocalPlayer():HasRangedWeapon()))

			-- check to make sure target doesn't have a CC debuff already
			and ((not target:HasDebuff("Frost Nova") and not target:HasDebuff("Frostbite"))
				
			-- or target is within acceptable wand attack conditions
			or (GetLocalPlayer():GetManaPercentage() < script_mage.useWandMana or target:GetHealthPercentage() < script_mage.useWandHealth) and script_mage.useWand)
			then

				-- we need to do a lot of checks to make one big ol' hard to read if statement
				if ((GetLocalPlayer():GetManaPercentage() < script_mage.useWandMana or target:GetHealthPercentage() < script_mage.useWandHealth) and script_mage.useWand and GetLocalPlayer():HasRangedWeapon())

				-- make sure we have frost nova and is not on cooldown and conditions are acceptable
				or (script_mage.useFrostNova and HasSpell("Frost Nova") and not IsSpellOnCD("Frost Nova") and GetLocalPlayer():GetManaPercentage() >= 10)

				-- make sure we have the cone of cold and is not on cooldown and conditions are acceptable
				or (script_mage.useConeOfCold and HasSpell("Cone of Cold") and not IsSpellOnCD("Cone of Cold") and target:GetHealthPercentage() >= script_mage.coneOfColdHealth and GetLocalPlayer():GetManaPercentage() >= script_mage.coneOfColdMana) then

					-- frost bolt spell table
					local fbTable = {[116] = true, [205] = true, [837] = true, [7322] = true, [8406] = true, [8407] = true, [8408] = true, [10179] = true, [10180] = true, [10181] = true, [25304] = true}

					-- if we are casting frostbolt then
					if fbTable[GetLocalPlayer():GetCasting()] and script_grind:enemiesAttackingUs() == 1 then
					
						-- stop it
						SpellStopCasting();

						-- target is too close!
						if script_grind.enemyObj:GetDistance() <= 9 then

							-- try to frost nova target
							if not IsSpellOnCD("Frost Nova") then
								CastSpellByName("Frost Nova")
							end
							-- try to cone of cold target
							if not IsSpellOnCD("Cone of Cold") then
								CastSpellByName("Cone of Cold");
							end
						end
	
					-- timer needed for bot to check everything and not recast frostbolt over and over...
					script_grind.waitTimer = GetTimeEX() + 550;
					script_mage.waitTimer = GetTimeEX() + 750;
	
					end
				end
			end
		end
	end
end



function script_combatHelper:getFrostboltCastingTime()

	-- don't stop spell casting if we are almost done casting a spell...
	-- 2/3 of the casting time of frostbolt is 1666.67MS at 2.5 second cast time
	if GetLocalPlayer():IsCasting() and not self.castingTimerSet then
		self.castingTimer = GetTimeEX() + 1667;
		self.castingTimerSet = true;
	end
	if not GetLocalPlayer():IsCasting() and self.castingTimerSet then
		self.castingTimer = 0;
		self.castingTimerSet = false;
	end



	-- try to add time to spell casting timer due to knockback from attacks
	-- reset temp health out of combat
	if not IsInCombat() then
		self.tempHP = GetLocalPlayer():GetHealthPercentage();
	end

	local currentHP = GetLocalPlayer():GetHealthPercentage();

	-- if we are casting
	if IsInCombat() and GetLocalPlayer():IsCasting() then

		-- assume we recovered health in combat
		if currentHP > self.tempHP then
			self.tempHP = currentHP;
		end

		-- if our HP is less than temp HP
		if currentHP < self.tempHP and self.castingTimerSet then

			--assume we were hit and suffered a knockback to spell casting time of 500ms.
			self.tempHP = currentHP;

			-- if we are being hit then increase the casting time, instead of reduce, we don't want to stay casting.. 1667ms MAX
			self.castingTimer = self.castingTimer + 500;
		end
	end
end

function script_combatHelper:checkRunBackwards()

	-- run backwards target has frost nova
	if (GetLocalPlayer():GetUnitsTarget() ~= 0) and GetNumPartyMembers() < 1 and not IsCasting() and not IsChanneling() then

		if (GetLocalPlayer():GetUnitsTarget():GetHealthPercentage() > 10 or GetLocalPlayer():GetHealthPercentage() < 35)
		and (GetLocalPlayer():GetUnitsTarget():HasDebuff("Frostbite") or GetLocalPlayer():GetUnitsTarget():HasDebuff("Frost Nova"))
		and (not GetLocalPlayer():HasBuff('Evocation'))
		and (not script_checkDebuffs:hasDisabledMovement())
		and (not script_grindAreWeSwimming:areWeSwimming())
		and (GetLocalPlayer():GetUnitsTarget():IsInLineOfSight())

		then

			-- Moves if the target is closer than 8 yards
			if (script_mage:runBackwards(targetObj, 10)) then
				script_grind.waitTimer = GetTimeEX();
				script_grind.message = "Moving away from target...";

				-- face the target
				if (GetLocalPlayer():GetUnitsTarget():GetDistance() >= 10) and (not IsMoving()) then
					GetLocalPlayer():GetUnitsTarget():FaceTarget();
				end

			return true;
			end
		end
	end

	-- run backwards target has entangled roots
	if (GetLocalPlayer():GetUnitsTarget() ~= 0)
	and (GetLocalPlayer():GetManaPercentage() >= 25)
	and not IsBearForm()
	and not IsCatForm()

	then

		if (GetLocalPlayer():GetUnitsTarget():GetHealthPercentage() > 10 or GetLocalPlayer():GetHealthPercentage() < 35)
		and (GetLocalPlayer():GetUnitsTarget():HasDebuff("Entangling Roots"))
		and (not script_checkDebuffs:hasDisabledMovement())
		and (not script_grindAreWeSwimming:areWeSwimming())
		and (GetLocalPlayer():GetUnitsTarget():IsInLineOfSight())
		
		then

			-- Moves if the target is closer than 10 yards
			if (script_druid:runBackwards(targetObj, 10)) then
				script_grind.tickRate = 0;
				script_grind.waitTimer = GetTimeEX();
				script_grind.message = "Moving away from target...";

				-- face the target
				if (GetLocalPlayer():GetUnitsTarget():GetDistance() >= 9) and (not IsMoving()) then
					GetLocalPlayer():GetUnitsTarget():FaceTarget();
				end

			return true;
			end
		end
	end
end


function script_combatHelper:checkStopHeroicStrikeConditions()

-- heroic strike or maul stuck on and target moved away or we stopped casting auto attack

	-- heroic strike spell table
	local hstable = {[78] = true, [284] = true, [285] = true, [1605] = true, [1606] = true, [1607] = true, [1608] = true, [1610] = true, [1611] = true, [6158] = true, [11564] = true, [11565] = true, [11566] = true, [11567] = true, [11570] = true, [11571] = true, [25286] = true, [25354] = true, [25710] = true, [25712] = true, [25958] = true, [12282] = true, [12663] = true, [12664] = true, [6807] = true, [6808] = true, [6809] = true, [7092] = true, [8972] = true, [9745] = true, [9880] = true, [9881] = true, [12161] = true, [20751] = true};


	-- check casting table and stop spell casting if target moves
	if (HasSpell("Heroic Strike") or HasSpell("Maul"))
	and (PlayerHasTarget())
	and (GetTarget():GetDistance() > script_grind.combatScriptRange+3)
	and (not IsMoving())
	
	then
	
		-- face the target
		GetTarget():FaceTarget();

		-- stop spell casting
		if hstable[GetLocalPlayer():GetCasting()] then
			SpellStopCasting();
		end

		if (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) and (not script_checkAdds:checkAdds()) and not IsAutoCasting("Attack") then
			script_grind.enemyObj:AutoAttack();
		end
	end
end

function script_combatHelper:checkStopRaptorStrikeConditions()

	-- raptor strike spell table
	local rstable = {
	[2973] = true,  -- Raptor Strike (Rank 1)
    [14260] = true, -- Raptor Strike (Rank 2)
    [14261] = true, -- Raptor Strike (Rank 3)
    [14262] = true, -- Raptor Strike (Rank 4)
    [14263] = true, -- Raptor Strike (Rank 5)
    [14264] = true, -- Raptor Strike (Rank 6)
    [14265] = true, -- Raptor Strike (Rank 7)
    [14266] = true, -- Raptor Strike (Rank 8)
    [27014] = true, -- Raptor Strike (Rank 9)
    [48995] = true, -- Raptor Strike (Rank 10)
    [48996] = true  -- Raptor Strike (Rank 11)
};

-- check casting table and stop spell casting if target moves
	if (HasSpell("Raptor Strike"))
	and (PlayerHasTarget())
	and (GetLocalPlayer():GetUnitsTarget():GetDistance() > script_hunter.meleeDistance+2)
	and (not IsMoving())

	then

		-- stop spell casting
		if rstable[GetLocalPlayer():GetCasting()] then
		    SpellStopCasting();
		end
	end
end