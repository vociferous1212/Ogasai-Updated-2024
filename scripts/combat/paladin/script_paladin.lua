script_paladin = {

	message = "Paladin Combat Script",
	paladinMenuLoaded = include("scripts\\combat\\paladin\\script_paladinMenu.lua"),
	paladinRestLoaded = include("scripts\\combat\\paladin\\script_paladinRest.lua"),
	paladinSetupLoaded = include("scripts\\combat\\paladin\\script_paladinSetup.lua"),
	paladinHealsAndBuffsLoaded = include("scripts\\combat\\paladin\\script_paladinHealsAndBuffs.lua"),
	paladinCheckHealhPercentageLoaded = include("scripts\\combat\\paladin\\script_paladinCheckHealthPercentage.lua"),
	paladinCastHolyLightLoaded = include("scripts\\combat\\paladin\\script_paladinCastHolyLight.lua"),
	paladinCheckAuraLoaded = include("scripts\\combat\\paladin\\script_paladinCheckAura.lua"),
	paladinCheckBlessingLoaded = include("scripts\\combat\\paladin\\script_paladinCheckBlessing.lua"),
	isSetup = false, stopIfMHBroken = true, useFlashOfLightInCombat = false,
	waitTimer = 0,
	eatHealth = 30, drinkMana = 25,
	shieldHealth = 16, lohHealth = 12, holyLightHealth = 45, flashOfLightHealth = 70,
	potionHealth = 15, potionMana = 20,
	consecrationMana = 50,
	meleeDistance = 3.5,
	useSealOfCrusader = false, useJudgement = true, useFlashOfLightInCombat = false, useBubbleHearth = false,
	onlyUseSealOfCrusader = false,
	-- auras
	devoAura = true, retAura = false, sancAura = false,
	-- blessings
	might = false, wisdom = false,
	startedNewCharacter = false,

}

function script_paladin:window()
	if (self.isChecked) then
		EndWindow();
		if(NewWindow("Class Combat Options", 200, 200)) then
			script_paladin:menuEX();
		end
	end
end

function script_paladin:setup()

	if not self.isSetup then
		script_paladinSetup:setup();
	end

	self.isSetup = true;
end

function script_paladin:runBackwards(targetObj, range) 

	local localObj = GetLocalPlayer();

	if (targetObj ~= 0)
	and not script_checkDebuffs:hasDisabledMovement()
	and not IsChanneling() and not IsCasting()

	then
		local xT, yT, zT = targetObj:GetPosition();
		local xP, yP, zP = localObj:GetPosition();
		local distance = targetObj:GetDistance();
		local xV, yV, zV = xP - xT, yP - yT, zP - zT;	
		local vectorLength = math.sqrt(xV^2 + yV^2 + zV^2);
		local xUV, yUV, zUV = (1/vectorLength)*xV, (1/vectorLength)*yV, (1/vectorLength)*zV;		
		local moveX, moveY, moveZ = xT + xUV*10, yT + yUV*10, zT + zUV;		
		if (distance < range)  then
				script_navEXCombat:moveToTarget(localObj, moveX, moveY, moveZ)
				if not IsMoving() then
					Move(moveX, moveY, moveZ)
					script_nav:resetNavigate();
				end
			if script_checkAdds:checkAdds() then
				return 4;
			end
			script_grind:setWaitTimer(200);
		return 4;
		end
	end
	return false;
end

function script_paladin:draw()
	local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition());
	if (onScreen) then
		if (script_grind.adjustText) and (script_grind.drawEnabled) then
			tX = tX + script_grind.adjustX;
			tY = tY + script_grind.adjustY;
		end
		DrawText(self.message, tX+30, tY+100, 255, 250, 205);

	else
		if (script_grind.adjustText) and (script_grind.drawEnabled) then
			tX = tX + script_grind.adjustX;
			tY = tY + script_grind.adjustY;
		end
		DrawText(self.message, 25, 185, 255, 250, 205);
	end
end

function script_paladin:run(targetGUID)

	local localObj = GetLocalPlayer();
	local localMana = localObj:GetManaPercentage();
	local localHealth = localObj:GetHealthPercentage();
	local localLevel = localObj:GetLevel();

	script_grind.combatScriptRange = self.meleeDistance;
	script_grind.eatHealth = self.eatHealth;
	script_grind.drinkMana = self.drinkMana;

	if localObj:GetLevel() <= 4 then
		self.startedNewCharacter = true;
	end
	if self.startedNewCharacter and not self.might then
		self.might = true;
		self.startedNewCharacter = false;
	end

	local knowsCrusader = HasSpell("Seal of the Crusader");
	local knowsCommand = HasSpell("Seal of Command");
	local knowsRighteousness = HasSpell("Seal of Righteousness");
	local knowsWisdom = HasSpell("Seal of Wisdom")
	local knowsLight = HasSpell("Seal of Light");

	local hasCrusader = localObj:HasBuff("Seal of the Crusader");
	local hasCommand = localObj:HasBuff("Seal of Command");
	local hasRighteousness = localObj:HasBuff("Seal of Righteousness");
	local hasWisdom = localObj:HasBuff("Seal of Wisdom");
	local hasLight = localObj:HasBuff("Seal of Light");

	-- setup
	if (not self.isSetup) then
		script_paladin:setup();
	end

	-- if dead run rest of script
	if (localObj:IsDead()) then
		return 0; 
	end

	-- Check: If Mainhand is broken stop bot
	isMainHandBroken = GetInventoryItemBroken("player", 16);
	
	if (self.stopIfMHBroken) and (isMainHandBroken) then
		self.message = "The main hand weapon is broken...";
		return 6;
	end

	-- Assign the target 
	targetObj = GetGUIDObject(targetGUID);

	local targetHealth = targetObj:GetHealthPercentage();

	local targetHasCrusader = targetObj:HasDebuff("Judgement of the Crusader");
	local targetHasWisdom = targetObj:HasDebuff("Judgement of Wisdom");
	local targetHasLight = targetObj:HasDebuff("Judgement of Light");



	if (targetObj == 0) or (targetObj == nil) then
		return 2;
	end	

	-- Check: Do nothing if we are channeling or casting or wait timer
	if (IsChanneling()) or (IsCasting()) or (self.waitTimer > GetTimeEX()) then
		return 4;
	end

	-- face the target
	if IsInCombat() and targetObj:GetDistance() <= self.meleeDistance + 2 and not IsMoving() then
		targetObj:FaceTarget();
	end

	-- intial heal check
	if script_paladinHealsAndBuffs:healsAndBuffs() then
		if IsMoving() then StopMoving(); return; end
		return true;
	end

	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then
		local tickRandom = random(350, 500);
		if (IsMoving()) or (not IsInCombat()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end

	-- dismount before combat
	if (IsMounted()) then
		DisMount();
	end

	--Valid Enemy
	if (targetObj ~= 0) and (not localObj:IsStunned()) then	

		-- check for adds around us during combat and move to prevent pulling multiple enemies
		if (IsInCombat()) and (script_grind.skipHardPull) and (GetNumPartyMembers() == 0)
		and (targetObj:GetHealthPercentage() >= 20) and (not script_checkDebuffs:hasDisabledMovement())
		and (not targetObj:IsCasting()) then
			if (script_checkAdds:checkAdds()) then
				if IsMoving() then
				self.waitTimer = GetTimeEX() + 1500;
				--script_grind:setWaitTimer(1500);
				end
				script_om:FORCEOM();
			return 4;
			end
		end

		-- Cant Attack dead targets
		if (targetObj:IsDead()) or (not targetObj:CanAttack()) then
			self.waitTimer = GetTimeEX() + 1200;
			return 0;
		end
		
		-- stand if we are not standing
		if (not IsStanding()) and (not IsEating()) and (not IsDrinking()) then
			JumpOrAscendStart();
		end

		-- Auto Attack
		if (targetObj:GetDistance() < 40) and (not IsAutoCasting("Attack")) then
			targetObj:AutoAttack();
		end
	
		-- Check: if we target player pets/totems
		if (GetTarget() ~= 0) then
			if (GetTarget():GetGUID() ~= GetLocalPlayer():GetGUID()) then
				if (UnitPlayerControlled("target")) then 
					script_grind:addTargetToBlacklist(targetObj:GetGUID());
					return 5; 
				end
			end
		end 
	
		-- Opener
	
		if (not IsInCombat()) then
	
			self.message = "Pulling " .. targetObj:GetUnitName() .. "...";
		
			-- Check: Exorcism
			if (targetObj:GetDistance() < 30) and (HasSpell("Exorcism")) and (not IsSpellOnCD("Exorcism")) then
				if (targetObj:GetCreatureType() == "Demon") or (targetObj:GetCreatureType() == "Undead") then
					if (CastSpellByName("Exorcism", targetObj)) then 
						self.message = ("Pulling with Exocism...");
						return 0;
					end
				end
			end
			
			-- reheck auto attack to initiate combat
			if not IsAutoCasting("Attack") then
				targetObj:AutoAttack();
			end

			if targetObj:GetDistance() <= 15 and knowsCommand and not hasCommand and not hasCrusader and localMana >= self.drinkMana + 10 then
				CastSpellByName("Seal of Command", localObj);
			end
	
			-- move to the target
			if targetObj:GetDistance() > self.meleeDistance or not targetObj:IsInLineOfSight() and not script_paladinHealsAndBuffs:healsAndBuffs() then
				return 3;
			end
	
				-- heal check
			if script_paladinHealsAndBuffs:healsAndBuffs() then
				if IsMoving() then StopMoving(); return; end
				return true;
			end
				
			if self.useJugement
			and HasSpell("Judgement")
			and not IsSpellOnCD("Judgement")
			and hasRighteousness or hasCommand
			and localMana >= 15
			and targetObj:GetDistance() <= 10
				
			then
				
				CastSpellByName("Judgement", targetObj);
			end	

	-- Combat WE ARE NOW IN COMBAT

		else	

			-- Check move into melee range
			if (targetObj:GetDistance() > self.meleeDistance) or (not targetObj:IsInLineOfSight()) then
				return 3;
			end

			self.message = "Killing " .. targetObj:GetUnitName() .. "...";

			-- Check: Do we have the right target (in UI) ??
			if (GetTarget() ~= 0 and GetTarget() ~= nil) then
				if (GetTarget():GetGUID() ~= targetObj:GetGUID()) then
					ClearTarget();
					self.waitTimer = GetTimeEX() + 1500;
					targetObj = 0;
					return 0;
				end
			end

			-- check heals and buffs
			if (not targetObj:IsFleeing()) and (localMana > 8) then
				if script_paladinHealsAndBuffs:healsAndBuffs() then
						if IsMoving() then StopMoving(); return; end

					return true;
				end
			end

			-- Run backwards if we are too close to the target
			if (targetObj:GetDistance() < .3) then 
				if (script_paladin:runBackwards(targetObj, 1.5)) then 
					script_paladin.tickRate = 80;
					return 4; 
				end 
			end
			
			-- recheck auto attack
			if (targetObj:GetDistance() <= self.meleeDistance + 2) and (not IsAutoCasting("Attack")) then
				targetObj:AutoAttack();
			end

			-- Check: Stun with HoJ before healing if available
			if (IsInCombat()) and (targetObj:GetDistance() <= self.meleeDistance)
			and (HasSpell("Hammer of Justice")) and (not IsSpellOnCD("Hammer of Justice")) then
				if (CastSpellByName("Hammer of Justice", targetObj)) then
					self.waitTimer = GetTimeEX() + 1750;
					return 0;
				end
			end

			-- Check: Use Healing Potion 
			if (localHealth < self.potionHealth) then 
				if (script_helper:useHealthPotion()) then 
					return 0; 
				end 
			end

			-- Check: Use Mana Potion 
			if (localMana < self.potionMana) then 
				if (script_helper:useManaPotion()) then 
					return 0; 
				end 
			end

			-- Check: Seal of the Crusader until we use judgement
			if ( (self.useSealOfCrusader or self.onlyUseSealOfCrusader)
			and (script_grind.enemiesAttackingUs() < 2 or localMana >= 80) )
			and (not targetHasCrusader)
			and (targetObj:GetDistance() < 15)
			and (not hasCrusader)
			and localMana > 15
			and (not IsSpellOnCD("Judgement") or self.onlyUseSealOfCrusader)
			and (targetObj:GetHealthPercentage() > 25) then
				if (CastSpellByName("Seal of the Crusader", targetObj)) then
					return 0;
				end
			end


		-- in melee range
			if (targetObj:GetDistance() <= self.meleeDistance) then
				
				if (not targetObj:IsFleeing()) and (localMana > 8) then
					if script_paladinHealsAndBuffs:healsAndBuffs() then
						if IsMoving() then StopMoving(); return; end
					return true;
					end
				end

				-- hammer of justice when fleeing
				if (targetObj:IsCasting()) or (targetObj:IsFleeing()) then
					if (HasSpell("Hammer of Justice")) and (not IsSpellOnCD("Hammer of Justice")) and (localMana > 8) then
						CastSpellByName("Hammer of Justice", targetObj)
						self.waitTimer = GetTimeEX() + 2000;
					end
				end
	
				-- On low health do seal of light
				if (knowsLight) and (not hasLight) and (localMana > 15) then
					if (targetHealth > 50) or (script_grind:enemiesAttackingUs() > 1) or (localMana >= 25 and localHealth <= 50) then
						CastSpellByName("Seal of Light")
						self.waitTimer = GetTimeEX() + 1000;
					end
				end

				-- on low mana do seal of wisdom
				if knowsWisdom and not hasLight and not hasWisdom then
					if (localMana <= 25 and localHealth >= 75) or (targetHealth > 50) then
						CastSpellByName("Seal of Wisdom", targetObj)
						self.waitTimer = GetTimeEX() + 1000;
					end
				end

				-- Seal of the Crusader until we use judgement
				if (self.useSealOfCrusader or self.onlyUseSealOfCrusader) and (knowsCrusader) and (localMana > 15) and (targetHealth > 55)
				and (script_grind.enemiesAttackingUs() < 2 or localMana >= 80) then
					if (targetHasCrusader) and (not hasCrusader) and (not hasLight) then
						CastSpellByName("Seal of the Crusader", localObj)
						self.waitTimer = GetTimeEX() + 1500; 
					end 
				end

				-- use Judgement when we have crusader buffed
				if (self.useJudgement) and(HasSpell("Judgement")) and (not IsSpellOnCD("Judgement")) and hasCrusader and (localMana > 15) then
					if (targetObj:GetDistance() < 10) and not targetHasCrusader and (hasCrusader and not self.onlyUseSealOfCrusader) then
						CastSpellByName("Judgement", targetObj)
						self.waitTimer = GetTimeEX() + 1500; 
					end
				end

				-- Check: Seal of Righteousness (before we have SoC)
				if (not hasRighteousness) and (not hasCrusader) and (not knowsCommand) and
					not hasLight and not hasWisdom and localMana > 15 then 
					CastSpellByName("Seal of Righteousness", localObj)
					self.waitTimer = GetTimeEX() + 1500;
				end

				-- Check: Judgement with Righteousness or Command if we have a lot of mana
				if (self.useJudgement) and (localMana > 50) and (not IsSpellOnCD("Judgement")) then
					if hasRighteousness or hasCommand then 
						CastSpellByName("Judgement", targetObj)
						self.waitTimer = GetTimeEX() + 750;
					end
				end

				-- Check: Use judgement if we are buffed with Righteousness or Command and the target is low
				if (self.useJudgement) and (targetHealth < 10) and (localMana > 15) then
					if hasRighteousness or hasCommand and (targetObj:GetDistance() < 10) then
						CastSpellByName("Judgement", targetObj)
						self.waitTimer = GetTimeEX() + 1500;
					end
				end

				-- Check: Seal of Command
				if (knowsCommand) and (not hasCommand) and (localMana > 15) then
					if not hasCrusader and (not localObj:HasBuff("Seal of Light")) and not localObj:HasBuff("Seal of Wisdom") then 
						CastSpellByName("Seal of Command", localObj)
						self.waitTimer = GetTimeEX() + 1500;
					end
				end

				-- Consecration when we have adds
				if (HasSpell("Consecration")) and (not IsSpellOnCD("Consecration")) and (localMana >= self.consecrationMana) then
					if (script_grind:enemiesAttackingUs() >= 2) then
						CastSpellByName("Consecration"); self.waitTimer = GetTimeEX() + 1500;
					end
				end

				if (targetObj:IsFleeing()) and (not script_grind.adjustTickRate) then
					script_grind.tickRate = 50;
				end end end end end

function script_paladin:rest()

	if(not self.isSetup) then script_paladin:setup(); end

	if script_paladinRest:rest() then return true; end

return false; end