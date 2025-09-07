script_combatHelper = {

}


-- override combat script for "clutch" in combat situations...
function script_combatHelper:run()

	-- get counterspell out ASAP
	-- if target is casting and we are casting then stop casting and counterspell
	if HasSpell("Counterspell") and not IsSpellOnCD("Counterspell") and GetLocalPlayer():GetManaPercentage() >= 10 and not GetLocalPlayer():IsStunned() and not IsMoving() and IsInCombat() and IsCasting() and script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil then
		local target = script_grind.enemyObj;
		-- counterspell table... bot wants to stop spell casting when trying to cast counterspell...
		local cSTable = { [2139] = true, [11255] = true, [12598] = true, [12600] = true, [12601] = true, [12602] = true }
		if target:GetDistance() <= 30 and target:IsCasting() and GetLocalPlayer():IsCasting() and not cSTable[GetLocalPlayer():GetCasting()] then
				SpellStopCasting();
			if (CastSpellByName("Counterspell", target)) then
				script_mage.waitTimer = GetTimeEX() + 500;
			end
		end
	end


-- try to stop spell casting so we can use wand if target is really low health.. waste of mana
	-- or stop spell casting so we can frost nova and run away
	if HasSpell("Frostbolt") and not GetLocalPlayer():IsStunned() and not IsMoving() and IsInCombat() and script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil and not script_mage:isAddPolymorphed() then
		local target = script_grind.enemyObj;
		if script_grind:enemiesAttackingUs() < 2 and IsCasting() and (target:GetDistance() <= 9 or ((GetLocalPlayer():GetManaPercentage() < script_mage.useWandMana or target:GetHealthPercentage() < script_mage.useWandHealth) and script_mage.useWand and GetLocalPlayer():HasRangedWeapon())) and ((not target:HasDebuff("Frost Nova") and not target:HasDebuff("Frostbite")) or (GetLocalPlayer():GetManaPercentage() < script_mage.useWandMana or target:GetHealthPercentage() < script_mage.useWandHealth) and script_mage.useWand) then
			if ((GetLocalPlayer():GetManaPercentage() < script_mage.useWandMana or target:GetHealthPercentage() < script_mage.useWandHealth) and script_mage.useWand and GetLocalPlayer():HasRangedWeapon())
			or (script_mage.useFrostNova and HasSpell("Frost Nova") and not IsSpellOnCD("Frost Nova") and GetLocalPlayer():GetManaPercentage() >= 10)
			or (script_mage.useConeOfCold and HasSpell("Cone of Cold") and not IsSpellOnCD("Cone of Cold") and target:GetHealthPercentage() >= script_mage.coneOfColdHealth and GetLocalPlayer():GetManaPercentage() >= script_mage.coneOfColdMana) then
				-- stop spell casting frostbolt
				local fbTable = {[116] = true, [205] = true, [837] = true, [7322] = true, [8406] = true, [8407] = true, [8408] = true, [10179] = true, [10180] = true, [10181] = true, [25304] = true}
				if fbTable[GetLocalPlayer():GetCasting()] and script_grind:enemiesAttackingUs() == 1 then
					
					SpellStopCasting();
					if script_grind.enemyObj:GetDistance() <= 9 then
						if not IsSpellOnCD("Frost Nova") then
							CastSpellByName("Frost Nova")
						end
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

-- heroic strike or maul stuck on and target moved away or we stopped casting auto attack

	local hstable = {[78] = true, [284] = true, [285] = true, [1605] = true, [1606] = true, [1607] = true, [1608] = true, [1610] = true, [1611] = true, [6158] = true, [11564] = true, [11565] = true, [11566] = true, [11567] = true, [11570] = true, [11571] = true, [25286] = true, [25354] = true, [25710] = true, [25712] = true, [25958] = true, [12282] = true, [12663] = true, [12664] = true, [6807] = true, [6808] = true, [6809] = true, [7092] = true, [8972] = true, [9745] = true, [9880] = true, [9881] = true, [12161] = true, [20751] = true};

		if (HasSpell("Heroic Strike") or HasSpell("Maul")) and (IsInCombat()) and (PlayerHasTarget()) and (GetLocalPlayer():GetUnitsTarget():GetDistance() > script_grind.combatScriptRange+2) and (not script_checkAdds:checkAdds()) and (not IsMoving()) then
			GetTarget():FaceTarget();
			if hstable[GetLocalPlayer():GetCasting()] then
				SpellStopCasting();
			end

			-- check for auto attack slot
			if (IsAttackAction(script_grind.autoAttackActionSlot) ~= 1) and (not IsMoving()) then
				for i=0, 100 do
					if IsAttackAction(i) then
						script_grind.autoAttackActionSlot = i;
					end
				end
			end
			if (IsCurrentAction(script_grind.autoAttackActionSlot) ~= 1) and (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) and (not script_checkAdds:checkAdds()) then
				script_grind.enemyObj:AutoAttack();
			end
		end

	-- run backwards target has frost nova
	if (GetLocalPlayer():GetUnitsTarget() ~= 0) and GetNumPartyMembers() < 1 then
		if (GetLocalPlayer():GetUnitsTarget():GetHealthPercentage() > 10 or GetLocalPlayer():GetHealthPercentage() < 35) and (GetLocalPlayer():GetUnitsTarget():HasDebuff("Frostbite") or GetLocalPlayer():GetUnitsTarget():HasDebuff("Frost Nova")) and (not GetLocalPlayer():HasBuff('Evocation')) and (not script_checkDebuffs:hasDisabledMovement()) and (not script_grindEX:areWeSwimming()) and (GetLocalPlayer():GetUnitsTarget():IsInLineOfSight()) then
		if (script_mage:runBackwards(targetObj, 8)) then -- Moves if the target is closer than 7 yards
			script_grind.tickRate = 0;
			script_grind.waitTimer = GetTimeEX();
			script_grind.message = "Moving away from target...";
			if (GetLocalPlayer():GetUnitsTarget():GetDistance() >= 9) and (not IsMoving()) then
				GetLocalPlayer():GetUnitsTarget():FaceTarget();
			end
		return;
		end
	end
	end
	-- run backwards target has entangling roots
	if (GetLocalPlayer():GetUnitsTarget() ~= 0) and (GetLocalPlayer():GetManaPercentage() >= 25) and not IsBearForm() and not IsCatForm() then
		if (GetLocalPlayer():GetUnitsTarget():GetHealthPercentage() > 10 or GetLocalPlayer():GetHealthPercentage() < 35) and (GetLocalPlayer():GetUnitsTarget():HasDebuff("Entangling Roots")) and (not script_checkDebuffs:hasDisabledMovement()) and (not script_grindEX:areWeSwimming()) and (GetLocalPlayer():GetUnitsTarget():IsInLineOfSight()) then
		if (script_druid:runBackwards(targetObj, 10)) then -- Moves if the target is closer than 7 yards
			script_grind.tickRate = 0;
			script_grind.waitTimer = GetTimeEX();
			script_grind.message = "Moving away from target...";
			if (GetLocalPlayer():GetUnitsTarget():GetDistance() >= 9) and (not IsMoving()) then
				GetLocalPlayer():GetUnitsTarget():FaceTarget();
			end
		return;
		end
	end
	end



-- heroic strike stuck on and target moved away or we stopped casting auto attack

	local hstable = {[78] = true, [284] = true, [285] = true, [1605] = true, [1606] = true, [1607] = true, [1608] = true, [1610] = true, [1611] = true, [6158] = true, [11564] = true, [11565] = true, [11566] = true, [11567] = true, [11570] = true, [11571] = true, [25286] = true, [25354] = true, [25710] = true, [25712] = true, [25958] = true, [12282] = true, [12663] = true, [12664] = true};

		if (HasSpell("Heroic Strike") or HasSpell("Maul")) and (IsInCombat()) and (PlayerHasTarget()) and (GetLocalPlayer():GetUnitsTarget():GetDistance() > script_warrior.meleeDistance) and script_grind.enemyObj ~= nil and script_grind.enemyObj ~= 0 then
			if hstable[GetLocalPlayer():GetCasting()] then
				SpellStopCasting();
			
			end
if (not IsAutoCasting("Attack")) then
				script_grind.enemyObj:AutoAttack();
			end
		end






end