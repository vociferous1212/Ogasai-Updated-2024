script_priestEX = {
			waitTimer = 0, flashHealTimer = 0,

}

function script_priestEX:healsAndBuffs(localObj, localMana)
	
-- set target obj
	local targetObj = nil;
	local targetHealth = 0;

	local localObj = Player();
	local localMana = PlayerMana();

	if script_grind.enemyObj ~= nil and script_grind.enemyObj ~= 0 then
		targetObj = script_grind.enemyObj;
	elseif grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
		targetObj = grind2.enemyTarget;
	end
	
	-- get target health percentage
	if targetObj ~= nil and PlayerHasTarget() and IsInCombat() then

		targetHealth = targetObj:GetHealthPercentage();
	end

-- check adds before healing
	if PlayerHasTarget() then
		if (IsInCombat() and script_grind.skipHardPull) and (script_grind:isTargetingMe(targetObj)) and (targetObj:IsInLineOfSight()) and (not targetObj:IsCasting()) then
			if (script_checkAdds:checkAdds()) then
				return false;
			end
		end
	end

-- return false for any reason
	if IsCasting() or IsChanneling() or self.waitTimer > GetTimeEX() or IsMoving() or Player():IsStunned() then
		return false;
	end

	-- dismount before combat
	if (IsMounted()) then
		DisMount();
	end

	if (not IsMounted()) then
		-- inner focus
		if (not Player():HasBuff("Inner Focus")) and (HasSpell("Inner Focus")) then
			if (not IsSpellOnCD("Inner Focus")) then
				if (PlayerMana() <= 20) and (PlayerHealth() <= 20) then
					if (Buff("Inner Focus", Player())) then
						self.waitTimer = GetTimeEX() + 1550;
						return; -- keep trying until cast
					end
				end
			end
	
			-- cast heal while inner focus active
		elseif (Player():HasBuff("Inner Focus")) and not IsSpellOnCD("Flash Heal") then
			if (Cast("Flash Heal", Player())) then
				self.waitTimer = GetTimeEX() + 1550;
				return; -- keep trying until cast
			end
		end

		-- priest shadowguard
		if (script_priest.useShadowGuard) and (HasSpell("Shadowguard")) and (not Player():HasBuff("Shadowguard")) and (not IsSpellOnCD("Shadowguard")) and (PlayerMana() >= 15) then
			if (not CastSpellByName("Shadowguard")) then
				self.waitTimer = GetTimeEX() + 1500;
				return true;
			end
		end
	
		-- Power Infusion low health 50% or targets >= 1
		if (HasSpell("Power Infusion")) and (not IsSpellOnCD("Power Infusion")) then
			if (PlayerHealth() <= 50) or (script_priest:enemiesAttackingUs(8) >= 2) then
				if (Buff("Power Infusion")) then
					return; -- keep trying until cast
				end
			end
		end
	
		-- Buff Inner Fire
		if (not IsInCombat()) and (not Player():HasBuff("Inner Fire")) and (HasSpell("Inner Fire")) and (PlayerMana() >= 8)  and not IsSpellOnCD("Inner Fire") then
			Buff("Inner Fire", Player());
			self.waitTimer = GetTimeEX() + 1250;
			return true; -- keep trying until cast
		end
	
		-- Buff Fortitude
		if (not script_priest.shadowForm) then	-- if not in shadowform
			if (PlayerMana() >= 25) and (not IsInCombat()) and (not Player():HasBuff("Power Word: Fortitude")) and (HasSpell("Power Word: Fortitude")) and not IsSpellOnCD("Power Word: Fortitude") then
				Buff("Power Word: Fortitude", Player());
				self.waitTimer = GetTimeEX() + 1550;
				return true; -- if buffed 
			end
		end
		
		-- Buff Divine Spirit
		if (not script_priest.shadowForm) then	-- if not in shadowform
			if (PlayerMana() >= 25) and (not IsInCombat()) and (not Player():HasBuff("Divine Spirit")) and (HasSpell("Divine Spririt")) then
				if (Buff("Divine Spirit", Player())) then
					self.waitTimer = GetTimeEX() + 1500;
					return true;  -- if buffed 
				end
			end
		end
	
		-- Cast Shield Power Word: Shield
		if (PlayerMana() >= 10) and (PlayerHealth() <= script_priest.shieldHP) and (not Player():HasDebuff("Weakened Soul")) and (IsInCombat()) and (HasSpell("Power Word: Shield")) and not IsSpellOnCD("Power Word: Shield") then
			if ( (not PlayerHasTarget()) or (PlayerHasTarget() and script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil and script_grind.enemyObj:GetHealthPercentage() >= 20) ) then
				if not CastSpellByName("Power Word: Shield", Player()) then 
					self.waitTimer = GetTimeEX() + 750;
					script_priest.waitTimer = GetTimeEX() + 750;
					script_grind:setWaitTimer(750);
					script_rotation.waitTimer = GetTimeEX() + 750;
					return;
				end
			end
		end

		-- Cast Renew
		if (not script_priest.shadowForm) then	-- if not in shadowform
			if (PlayerMana() >= 12) and (PlayerHealth() <= script_priest.renewHP) and (not Player():HasBuff("Renew")) and (HasSpell("Renew")) and not IsSpellOnCD("Renew")  then
				Buff("Renew", Player())
				self.waitTimer = GetTimeEX() + 500;
				script_priest.waitTimer = GetTimeEX() + 500;
			
			end
		end
	
		

		-- Cast Greater Heal
		if (not script_priest.shadowForm) and HasSpell("Greater Heal") and not IsSpellOnCD("Greater Heal") then
			if (PlayerMana() >= 20) and (PlayerHealth() <= script_priest.greaterHealHP) then
				if (CastHeal("Greater Heal", Player())) then
					self.waitTimer = GetTimeEX() + 1500;
					return true;
				end
			end
		end	
	
		-- Cast Heal(spell)
		if (not script_priest.shadowForm) and HasSpell("Heal") then
			if (PlayerMana() >= 15) and (PlayerHealth() <= script_priest.healHP) then
				if (CastHeal("Heal", Player())) then
					self.waitTimer = GetTimeEX() + 500;
					script_priest.waitTimer = GetTimeEX() + 500;
					return true;
				end
			end
		end
	
		-- Cast Flash Heal
		if (not script_priest.shadowForm) and HasSpell("Flash Heal") then
			if (PlayerMana() >= 8) and (PlayerHealth() <= script_priest.flashHealHP) then
				script_priestEX:castFlashHeal();
				self.waitTimer = GetTimeEX() + 1700;
				script_priest.waitTimer = GetTimeEX() + 500;
				return true;
			end
		end
	
		-- Cast Lesser Heal
		if (not script_priest.shadowForm) then
			if not HasSpell("Flash Heal") then
				if (PlayerMana() >= 10) and (PlayerHealth() <= script_priest.lesserHealHP) then
					if (CastHeal("Lesser Heal", Player())) then
						self.waitTimer = GetTimeEX() + 1700;
						script_priest.waitTimer = GetTimeEX() + 500;
						return;
					end
				end
			end
	
			-- ELSE IF player level >= 20
			if HasSpell("Flash Heal") then
				if (PlayerMana() <= 10) and (PlayerHealth() <= script_priest.flashHealHP) then
					if (CastHeal("Lesser Heal", Player())) then
						self.waitTimer = GetTimeEX() + 1700;
						return;
					end
				end
			end
		end
	
		--Check Disease Debuffs -- cure disease
		if (script_checkDebuffs:hasDisease()) then
			if (PlayerMana() > 20) and (HasSpell("Cure Disease")) then
				CastSpellByName("Cure Disease", Player());
				self.waitTimer = GetTimeEX() + 1750;
				return true;
			end
		end

		-- check magic debuffs - dispel magic
		if (script_checkDebuffs:hasMagic()) then
			if (PlayerMana() > 20) and (HasSpell("Dispel Magic")) then
				if (PlayerHasTarget()) and (Player():GetUnitsTarget():GetGUID() ~= Player():GetGUID()) then
					ClearTarget(); local name = Player():GetUnitName(); TargetByName(name);
					CastSpellByName("Dispel Magic", Player());
					self.waitTimer = GetTimeEX() + 1750;
					return 4;
				end
			end
		end
		if (GetTarget() ~= 0 and GetTarget() ~= nil) and (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) then
			if (GetTarget():GetGUID() ~= script_grind.enemyObj:GetGUID()) then
				ClearTarget();
				self.waitTimer = GetTimeEX() + 1500;
			end
		end

		if (not IsMoving()) and  (Player():GetUnitsTarget() ~= 0) and (IsInCombat() and PlayerHasTarget()) then
			targetHealth = GetTarget():GetHealthPercentage();
			if (HasSpell("Mind Blast")) and (not IsSpellOnCD("Mind Blast")) and (IsInCombat()) then
				if (targetHealth >= 20) and (PlayerMana() >= script_priest.mindBlastMana) and (Player():GetUnitsTarget() ~= 0) then
					if IsAutoCasting("Shoot") then
						SpellStopCasting();
					end
					CastSpellByName("Mind Blast", targetObj);
					self.waitTimer = GetTimeEX() + 1550;
					return true;
				end
			end
		end
	end
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