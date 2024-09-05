script_priestEX = {
			waitTimer = 0, flashHealTimer = 0,

}

function script_priestEX:healsAndBuffs(localObj, localMana)

	if (GetLocalPlayer():GetUnitsTarget() ~= 0) then
		-- attempt to run away from adds - don't pull them
		if (IsInCombat() and script_grind.skipHardPull)
			and (script_grind:isTargetingMe(targetObj))
			and (targetObj:IsInLineOfSight())
			and (not targetObj:IsCasting()) then		
			if (script_checkAdds:checkAdds()) then
			end
		end
	end

	if (GetLocalPlayer():IsStunned()) then
		return false;
	end
	if (IsMoving()) then
		return false;
	end

	if (self.waitTimer > GetTimeEX()) then
		return false;
	end

	script_priest.waitTimer = self.waitTimer;

	-- get target health percentage
	if (GetLocalPlayer():GetUnitsTarget() ~= 0) and (IsInCombat()) then
		local targetHealth = targetObj:GetHealthPercentage();
	end
	local localHealth = GetLocalPlayer():GetHealthPercentage();

	local localObj = GetLocalPlayer();

	-- get self player level
	local localLevel = GetLocalPlayer():GetLevel();

	-- dismount before combat
	if (IsMounted()) then
		DisMount();
	end

	if (not IsMounted()) then
		-- inner focus
		if (not localObj:HasBuff("Inner Focus")) and (HasSpell("Inner Focus")) then
			if (not IsSpellOnCD("Inner Focus")) then
				if (GetLocalPlayer():GetManaPercentage() <= 20) and (GetLocalPlayer():GetHealthPercentage() <= 20) then
					if (Buff("Inner Focus", localObj)) then
						script_grind:setWaitTimer(1550);
						return; -- keep trying until cast
					end
				end
			end
	
			-- cast heal while inner focus active
		elseif (localObj:HasBuff("Inner Focus")) then
			if (Cast("Flash Heal", localObj)) then
				script_grind:setWaitTimer(1550);
				return; -- keep trying until cast
			end
		end

		-- priest shadowguard
		if (script_priest.useShadowGuard) and (HasSpell("Shadowguard")) and (not localObj:HasBuff("Shadowguard")) and (not IsSpellOnCD("Shadowguard")) and (localMana >= 15) then
			if (not CastSpellByName("Shadowguard")) then
				self.waitTimer = GetTimeEX() + 1500;
				return true;
			end
		end
	
		-- Power Infusion low health 50% or targets >= 1
		if (HasSpell("Power Infusion")) and (not IsSpellOnCD("Power Infusion")) then
			if (localHealth <= 50) or (script_priest:enemiesAttackingUs(8) >= 2) then
				if (Buff("Power Infusion")) then
					return; -- keep trying until cast
				end
			end
		end
	
		-- Buff Inner Fire
		if (not IsInCombat()) and (not localObj:HasBuff("Inner Fire")) and (HasSpell("Inner Fire")) and (localMana >= 8) then
			Buff("Inner Fire", localObj);
			script_grind:setWaitTimer(1250);
			return 0; -- keep trying until cast
		end
	
		-- Buff Fortitude
		if (not script_priest.shadowForm) then	-- if not in shadowform
			if (localMana >= 25) and (not IsInCombat()) and (not localObj:HasBuff("Power Word: Fortitude")) and (HasSpell("Power Word: Fortitude")) then
				Buff("Power Word: Fortitude", localObj);
				script_grind:setWaitTimer(1550);
				return 0; -- if buffed 
			end
		end
		
		-- Buff Divine Spirit
		if (not script_priest.shadowForm) then	-- if not in shadowform
			if (localMana >= 25) and (not IsInCombat()) and (not localObj:HasBuff("Divine Spirit")) and (HasSpell("Divine Spririt")) then
				if (Buff("Divine Spirit", localObj)) then
					script_grind:setWaitTimer(1500);
					return 0;  -- if buffed 
				end
			end
		end
	
		-- Cast Renew
		if (not script_priest.shadowForm) then	-- if not in shadowform
			if (localMana >= 12) and (localHealth <= script_priest.renewHP) and (not localObj:HasBuff("Renew")) and (HasSpell("Renew")) then
				if (Buff("Renew", localObj)) then
					script_grind:setWaitTimer(1700);
					return 0; -- if buffed 
				end
			end
		end
	
			-- Cast Shield Power Word: Shield
		if (localMana >= 10) and (localHealth <= script_priest.shieldHP) and (not localObj:HasDebuff("Weakened Soul")) and (IsInCombat()) and (HasSpell("Power Word: Shield")) then
			if ( (not PlayerHasTarget()) or (PlayerHasTarget() and script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil and script_grind.enemyObj:GetHealthPercentage() >= 20) )  then
				if (Buff("Power Word: Shield", localObj)) then 
					script_grind:setWaitTimer(1600);
					script_priest.waitTimer = GetTimeEX() + 1600;
					return 0;  -- if buffed 
				end
			end
		end

		-- Cast Greater Heal
		if (not script_priest.shadowForm) then	-- if not in shadowform
			if (localMana >= 20) and (localHealth <= script_priest.greaterHealHP) then
				if (CastHeal("Greater Heal", localObj)) then
					script_grind:setWaitTimer(1500);
					return 0;	-- if cast 
				end
			end
		end	
	
		-- Cast Heal(spell)
		if (not script_priest.shadowForm) then	-- if not in shadowform
			if (localMana >= 15) and (localHealth <= script_priest.healHP) then
				if (CastHeal("Heal", localObj)) then
					script_grind:setWaitTimer(1500);
					return 0;	-- if cast 
				end
			end
		end
	
		-- Cast Flash Heal
		if (not script_priest.shadowForm) then	-- if not in shadowform
			if (localMana >= 8) and (localHealth <= script_priest.flashHealHP) then
					script_priestEX:castFlashHeal();
					script_grind:setWaitTimer(1700);
					return true;
			end
		end
	
		-- Cast Lesser Heal
		if (not script_priest.shadowForm) then	-- if not in shadowform
			if (localLevel < 20) then	-- don't use this when we get flash heal ELSE very low mana
				if (localMana >= 10) and (localHealth <= script_priest.lesserHealHP) then
					if (CastHeal("Lesser Heal", localObj)) then
						script_grind:setWaitTimer(1700);
						return 0;	-- if cast return true
					end
				end
	
			-- ELSE IF player level >= 20
			elseif (localLevel >= 20) then
				if (localMana <= 8) and (localHealth <= script_priest.flashHealHP) then
					if (CastHeal("Lesser Heal", localObj)) then
						script_grind:setWaitTimer(1700);
						return 0;	-- if cast return true
					end
				end
			end
		end
	
		--Check Disease Debuffs -- cure disease
		if (script_checkDebuffs:hasDisease()) then
			if (localMana > 20) and (HasSpell("Cure Disease")) then
				CastSpellByName("Cure Disease", localObj);
				script_grind:setWaitTimer(1750);
				return true;
			end
		end
	
		-- check magic debuffs - dispel magic
		if (script_checkDebuffs:hasMagic()) then
			if (localMana > 20) and (HasSpell("Dispel Magic")) then
				if (PlayerHasTarget()) and (GetLocalPlayer():GetUnitsTarget():GetGUID() ~= GetLocalPlayer():GetGUID()) then
					ClearTarget();
					local name = GetLocalPlayer():GetUnitName();
					TargetByName(name);
					CastSpellByName("Dispel Magic", localObj);
					script_grind:setWaitTimer(1750);
					return 4;
				end
			end
		return;
		end


		-- Check: Do we have the right target (in UI) ??
		if (GetTarget() ~= 0 and GetTarget() ~= nil) and (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) then
			if (GetTarget():GetGUID() ~= script_grind.enemyObj:GetGUID()) then
				ClearTarget();
				self.waitTimer = GetTimeEX() + 1500;
			end
		end

	
		-- use mind blast on CD
				-- !! must be placed here to stop wand casting !!
		if (not IsMoving()) and  (GetLocalPlayer():GetUnitsTarget() ~= 0) and (IsInCombat()) then
			if (HasSpell("Mind Blast")) and (not IsSpellOnCD("Mind Blast")) and (IsInCombat()) then
				if (targetHealth >= 20) and (localMana >= script_priest.mindBlastMana) and (GetLocalPlayer():GetUnitsTarget() ~= 0) then
					targetObj:FaceTarget();
					CastSpellByName("Mind Blast", targetObj);
					script_grind:setWaitTimer(1550);
					return 0;
				end
			end
		end
	end
return false;
end
function script_priestEX:castFlashHeal()
	if (HasSpell("Flash Heal")) and (not IsSpellOnCD("Flash Heal")) and (GetTimeEX() > self.flashHealTimer) then
		if (CastSpellByName("Flash Heal")) then
			self.waitTimer = GetTimeEX() + 1500;
			self.flashHealTimer = GetTimeEX() + 2500;
			return 4;
		end
	end
return false;
end