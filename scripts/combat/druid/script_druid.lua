script_druid = {
	message = 'Druid',
	menuIncluded = include("scripts\\combat\\druid\\script_druidEX.lua"),
	menu2Included = include("scripts\\combat\\druid\\script_druidEX2.lua"),
	healsAndBuffsLoaded = include("scripts\\combat\\druid\\script_druidHealsAndBuffs.lua"),
	catFormIncluded = include("scripts\\combat\\druid\\script_druidCatForm.lua"),
	bearFormIncluded = include("scripts\\combat\\druid\\script_druidBearForm.lua"),
	eatHealth = 35,
	drinkMana = 40,
	rejuvenationHealth = 80,	-- use rejuvenation below this health
	regrowthHealth = 70,
	healingTouchHealth = 55,
	healthToShift = 55,	-- health to shapeshift
	potionHealth = 18,
	potionMana = 20,
	isSetup = false,
	meleeDistance = 4.5,
	waitTimer = 0,
	stopIfMHBroken = true,
	useCat = false,		-- is cat form selected
	useBear = false,	-- is bear form selected
	isChecked = true,
	useEntanglingRoots = false,
	waitTimer = GetTimeEX(),
	useStealth = false,
	stealthOpener = "Ravage",
	shiftToDrink = false,	-- shapeshift out of form to drink
	useCharge = true,
	useRest = false,		-- rest in shapeshift form
	maulRage = 15,
	wasInCombat = false,	-- was in combat used to adjust tick rate
	runOnce = false,
	shapeshiftMana = 33,	-- cost of shapeshift mana
	hasDrinks = true,
	usePowerShift = false,
	hasRegrowth = false,
	thornsTimer = 0,
	clawEnergy = 45,
	rakeEnergy = 40,
	openerUsed = 0,
	autoAttackActionSlot = 0,
	naturesGraspTimer = 0,
	omenOfClarityTimer = 0,
	spellRange = 27,
	pullWithMoonfire = false,


}


-- switch to bear form when in cat form
-- adds >= 2 and when 1 dies switch back to cat form
-- add conditional to main phases ' don't do this when x is true '
-- if targets in combat = 2 then x = true else y
-- mana > 50 % else stay in bear form
-- switch when health is low and already out of form to heal then choose bear form over cat form
-- stun target if we switch back to cat form - or return maul and waste all rage
-- TELL CAT FORM TO ONLY BE USED WHEN <= 2 ADDS PROBABLY EASIEST SOLUTION


function script_druid:setup()

	local isMoonkin = Player():HasBuff("Moonkin Form");

	if (PlayerLevel() >= 20) then
		self.drinkMana = 45;
	end
	-- set entangle roots on startup
	if (not HasSpell("Entangling Roots")) then
		self.useEntanglingRoots = false;
	end

	if (not HasSpell("Bear Form")) then
		self.meleeDistance = 3.8;
	end

	if (not HasSpell("Ravage")) then
		self.stealthOpener = "Shred";
	end
	--if (HasSpell("Pounce")) then
	--	self.stealthOpener = "Pounce";
	--end
	if (not HasSpell("Shred")) then
		self.stealthOpener = "Claw";
	end
	if (not HasSpell("Prowl")) then
		useStealth = false;
	end

	if (Player():GetLevel() >= 20) then
		self.shapeshiftMana = 28;
	end
	
	if (Player():GetLevel() >= 30) then
		self.shapeshiftMana = 25;
	end

	if (Player():GetLevel() >= 35) then
		self.shapeshiftMana = 23;
	end
	
	if Player():GetLevel() >= 45 then
		self.shapeshiftMana = 20;
	end

	if Player():GetLevel() >= 58 then
		self.shapeshiftMana = 15;
	end

	if (Player():GetLevel() >= 10) and (not HasSpell("Cat Form")) and (HasSpell("Bear Form")) then
		self.useBear = true;
	end
	if (Player():GetLevel() >= 20) and (HasSpell("Cat Form")) then
		self.useBear = false;
		self.useCat = true;
	end

	if (not HasSpell("Regrowth")) and (HasSpell("Bear Form")) then
		self.healingTouchHealth = 60;
	end

	if (Player():GetLevel() < 10) then
		self.drinkMana = 25;
	end
	
	--if (not HasSpell("Bear Form")) then
	--	self.meleeDistance = 3.6;
	--end
	
	if (GetNumPartyMembers() ~= 0) then
		self.useEntanglingRoots = false;
	end

	local level = GetLocalPlayer():GetLevel();

	if (not HasSpell("Bear Form")) then
		shiftToDrink = false;
		useCharge = false;
		useRest = false;
		self.useBear = false;
	end
	if GetLocalPlayer():GetLevel() >= 50 then
		self.drinkMana = 45;
	end

	self.omenOfClarityTimer = GetTimeEX();
	self.thornsTimer = GetTimeEX();
	self.naturesGraspTimer = GetTimeEX();

	self.waitTimer = GetTimeEX();	

		-- check for spent talent points
	if GetLocalPlayer():GetLevel() >= 10 then
		script_grindCheckSpentTalentPoints:checkSpentTalentPoints()
	end
	
	self.isSetup = true;
end

function script_druid:enemiesAttackingUs(range) -- returns number of enemies attacking us within range
	local unitsAttackingUs = 0; 
	local currentObj, typeObj = GetFirstObject(); 
	while currentObj ~= 0 do 
		if typeObj == 3 or typeObj == 4 then
			if (currentObj:CanAttack() and not currentObj:IsDead()) then
				if (script_grind:isTargetingMe(currentObj) and currentObj:GetDistance() <= range) then 
					unitsAttackingUs = unitsAttackingUs + 1; 
				end 
			end 
		end
		currentObj, typeObj = GetNextObject(currentObj); 
	end
	return unitsAttackingUs;
end

-- Run backwards if the target is within range
function script_druid:runBackwards(targetObj, range) 
	if targetObj ~= 0 and (not script_checkDebuffs:hasDisabledMovement()) and not script_rotation.usingRotation then
		local xT, yT, zT = targetObj:GetPosition();
		local xP, yP, zP = Player():GetPosition();
		local distance = targetObj:GetDistance();
		local xV, yV, zV = xP - xT, yP - yT, zP - zT;	
		local vectorLength = math.sqrt(xV^2 + yV^2 + zV^2);
		local xUV, yUV, zUV = (1/vectorLength)*xV, (1/vectorLength)*yV, (1/vectorLength)*zV;	
		local moveX, moveY, moveZ = xT + xUV*16, yT + yUV*16, zT + zUV;		
		if (distance < range and targetObj:IsInLineOfSight()) then 
			if not grind2.usingGrinder2 then
				script_navEXCombat:moveToTarget(Player(), moveX, moveY, moveZ)
			else
				grind2MoveToTarget:run(Player(), moveX, moveY, moveZ+2);
			end
			return true;
		end

		-- move fall-back
				if not IsMoving() then
					Move(moveX, moveY, moveZ)
					script_nav:resetNavigate();
				end
	end
	return false;
end

function script_druid:draw()
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


function script_druid:run(targetGUID)

	local isMoonkin = Player():HasBuff("Moonkin Form");

	script_grind.eatHealth = self.eatHealth;
	script_grind.drinkMana = self.drinkMana;

	
	if (Player():HasBuff("Regrowth")) then
		script_druid.hasRegrowth = true;

	elseif (not Player():HasBuff("Regrowth")) then
		script_druid.hasRegrowth = false;

	end

	-- change combat script range only if we don't have a form and mana is lower than 30
	-- don't change back to long range until combat has ended
	-- only change to melee distance when in combat
	if (self.useBear or self.useCat) or (not self.useBear and not self.useCat and PlayerMana() <= 30 and IsInCombat()) then

		self.spellRange = self.meleeDistance;
	elseif not self.useBear and not self.useCat and PlayerMana() >= 30 then

		self.spellRange = 27;
	end

	script_grind.combatScriptRange = self.spellRange;

	-- Assign the target 
	targetObj = GetGUIDObject(targetGUID);

	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = math.random(150, 350);
		if IsCatForm() then tickRandom = 250; self.waitTimer = self.waitTimer - 500; end

		if (IsMoving()) or (not IsInCombat()) or (targetObj:IsFleeing()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end
	
	if (not IsStanding()) then
		JumpOrAscendStart();
	end

	-- don't attack dead objects
	if (Player():IsDead()) then
		return 0; 
	end

	-- stop bot from moving target to target when stuck in combat and we need to rest
	if not GetLocalPlayer():HasBuff("Enrage") and (IsInCombat()) and (PlayerHasTarget()) and (not script_grind:isAnyTargetTargetingMe()) and (script_grind.enemiesAttackingUs() == 0) and (GetLocalPlayer():GetUnitsTarget():GetHealthPercentage() >= 99) then
		self.message = "Waiting! Stuck in combat phase!";
		return 4;
	end

	-- move away from add targets in combat
	if (IsInCombat()) and (script_grind.skipHardPull) and (GetNumPartyMembers() == 0)
	and (targetObj:GetHealthPercentage() >= 20) and (not script_checkDebuffs:hasDisabledMovement())
	and (GetLocalPlayer():GetHealthPercentage() >= self.healthToShift - 10) then
		if (script_checkAdds:checkAdds()) then
			script_om:FORCEOM();
			self.waitTimer = GetTimeEX() + 550;
		return 4;
		end
	end


	-- stuck casting maul
	local mtable = {[6807] = true, [6808] = true, [6809] = true, [7092] = true, [8972] = true, [9745] = true, [9880] = true, [9881] = true, [12161] = true, [20751] = true};

	if (IsInCombat()) and (PlayerHasTarget()) and (GetTarget():GetDistance() > self.meleeDistance+2) then
		if mtable[GetLocalPlayer():GetCasting()] then
			SpellStopCasting();
		end
	end

	if Player():HasBuff("Nature's Grasp") and IsInCombat() then
		return 4;
	end

	if IsInCombat() and not HasForm() and PlayerHealth() <= self.healthToShift and GetLocalPlayer():HasBuff("Regrowth") then
		if not IsCasting() and not IsChanneling() and PlayerMana() >= 25 then
			if not CastSpellByName("Healing Touch", Player()) then
				self.waitTimer = GetTimeEX() + 3500;
				script_grind.waitTimer = GetTimeEX() + 3500;
				grind2:setTimer(3500);
				return 4
			end
		end
	end

	-- remove curse of thorns - causes A LOT of damage and can easily kill you... best to just force the bot to remove this specific one at all times
	if (HasSpell("Remove Curse")) and (Player():HasDebuff("Curse of Thorns")) and (IsStanding()) and (not IsSpellOnCD("Remove Curse")) then
		if (PlayerMana() >= 30) then
			if (not IsInCombat()) then
				if (HasForm()) then
					RemoveForm();
				end
			end
		end
		if (PlayerMana() >= 30) and (not HasForm()) then
			if (PlayerHasTarget()) and (Player():GetUnitsTarget():GetGUID() ~= Player():GetGUID()) then
				ClearTarget();
			end
			if (CastSpellByName("Remove Curse", Player())) then
				self.waitTimer = GetTimeEX() + 1750;
				return true;
			end
		end
	end
	
	-- check for a valid target
	if(targetObj == 0 or targetObj == nil) then
		return 2;
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

	if (GetTarget() ~= 0 and GetTarget() ~= nil) and (GetTarget():CanAttack()) and (not GetTarget():IsDead()) then
		TargetHasRangedWeapon(target);
	end

	-- Check: Do nothing if we are channeling or casting or wait timer

	if (IsDrinking() and PlayerMana() < 95 and not IsInCombat()) or (IsEating() and PlayerHealth() < 95 and not IsInCombat()) and (IsChanneling() or IsCasting() or self.waitTimer > GetTimeEX()) then
		return 4;
	end
	if (IsChanneling() or IsCasting() or (self.waitTimer > GetTimeEX())) then
		return 4;
	end

		-- check heals and buffs
	if (not IsInCombat() or not script_grind:isAnyTargetTargetingMe()) and (not HasForm()) and not IsCasting() and not IsChanneling() then
		if (script_druidHealsAndBuffs:healsAndBuffs()) then
			if IsMoving() then StopMoving(); return true; end
			return true;
		end
	end

-- Innervate
	if not HasForm() and (IsInCombat()) and (HasSpell("Innervate")) and (not IsSpellOnCD("Innervate")) and (not Player():HasBuff("Innervate")) and (PlayerMana() <= self.shapeshiftMana + 10) then
		CastSpellByName("Innervate");
		self.waitTimer = GetTimeEX() + 3500;
		return true;
	end

-- use prowl before spamming auto attack and move in range of target!
	if (not IsInCombat()) and (self.useCat) and (IsCatForm()) and (self.useStealth) and (HasSpell("Prowl")) and (not IsSpellOnCD("Prowl")) and (not IsStealth()) and (script_grind.lootObj == nil or script_grind.lootObj == 0) and (not script_checkDebuffs:hasPoison()) and (not Player():HasDebuff("Rend")) and (IsStanding()) and (IsMoving()) then
		CastSpellByName("Prowl");
		if (script_grind.jump) then
			JumpOrAscendStart();
		end
	end

	

-- run backwards if target is entangled
	if targetObj:HasDebuff("Entangling Roots") and PlayerMana() > 36 and not IsCatForm() and not IsBearForm() then
		if (script_druid:runBackwards(targetObj, 8)) then
			self.waitTimer = GetTimeEX() + 500;
			return 4;
		end
	end

	-- run backwards last error == need to face target
		--if GetLastError() == 99 and not IsCasting() and not IsChanneling() then
		--	if (script_druid:runBackwards(targetObj, 1)) then
		--		ClearLastError();
		--		return 4;
		--	end
		--end

	-- remove travel form before combat
	if (IsTravelForm()) then
		if (script_druidEX:removeTravelForm()) then
			self.waitTimer = GetTimeEX() + 1500;
			return 0;
		end
	end

	-- check aquatic form
	if (not IsInCombat()) and (HasSpell("Aquatic Form")) and (IsSwimming()) and (not HasForm()) then
		if (CastSpellByName("Aquatic Form")) then
			self.waitTimer = GetTimeEX() + 1500;
		end
	end
	if (IsInCombat()) and (Player():HasBuff("Aquatic Form")) then
		if (CastSpellByName("Aquatic Form")) then
			self.waitTimer = GetTimeEX() + 1500;
		end
	end

	--Valid Enemy
	if (targetObj ~= 0) and (not Player():IsStunned()) then

		-- assign target health
		targetHealth = targetObj:GetHealthPercentage();

		-- Don't attack if we should rest first
		if (PlayerHealth() < self.eatHealth or PlayerMana() < self.drinkMana) and not HasForm() and not script_grind:isTargetingMe(targetObj)
			and targetHealth > 99 and not targetObj:IsStunned() then
			self.message = "Need to rest...";
			return 4;
		end

		-- use charge in bear form
		if (IsBearForm()) and (self.useCharge) and (HasSpell("Feral Charge")) and (not IsSpellOnCD("Feral Charge")) and (PlayerRage() >= 5) and (targetObj:GetDistance() <= 26) and (targetObj:GetDistance() >= 11) then
				script_druidEX:castCharge();
			end

			-- keep faerie fire up
			if PlayerHasTarget() and HasForm() and not self.useStealth and not targetObj:IsDead() and targetObj:IsInLineOfSight() and targetObj:GetDistance() <= 30 and HasSpell("Faerie Fire (Feral)") and not IsSpellOnCD("Faerie Fire (Feral)") and not targetObj:HasDebuff("Faerie Fire (Feral)") and (IsBearForm() or IsCatForm()) then
				CastSpellByName("Faerie Fire (Feral)()");
			end

		-- cast rejuvenaton before entering combat if have no form
		if (HasSpell("Rejuventation")) and (not Player():HasBuff("Rejuvenation")) and (targetObj:GetDistance() <= 45) and (PlayerMana() >= self.shapeshiftMana + 15) and (not HasForm()) and (not IsInCombat()) then
			CastSpellByName("Rejuvenation", Player());
			self.waitTimer = GetTimeEX() + 1500;
		end

		-- Cant Attack dead targets
		if targetObj ~= 0 and targetObj ~= nil then
		if (targetObj:IsDead() or not targetObj:CanAttack()) then
			return 0;
		end
		end

		-- stand up if sitting
		if (not IsStanding()) then
			JumpOrAscendStart();
		end
	
	-- force rejuvenation
	if (IsInCombat()) and (Player():HasBuff("Regrowth")) and (not Player():HasBuff("Rejuvenation")) and (not IsSpellOnCD("Rejuvenation")) and (PlayerMana() >= self.shapeshiftMana) and (not IsCatForm() and not IsBearForm()) and (not script_checkDebuffs:hasSilence()) then
		if (CastSpellByName("Rejuvenation")) then
			self.waitTimer = GetTimeEX() + 1650;
			script_grind:setWaitTimer(500);
		end
	end

		if targetObj ~= 0 and targetObj ~= nil then
-- stay in form bear if bear form is selected
		-- enemies greater than 2 then use bear form
		if (self.useBear) or (GetNumPartyMembers() == 0 and script_grind.enemiesAttackingUs(12) >= 2 and (HasSpell("Bear Form") or HasSpell("Dire Bear Form")) and (not IsDrinking()) and (not IsEating()) )

		-- enemy level greater than 2 then use bear form
		or ( (targetObj:GetLevel() > (Player():GetLevel() + 2)) and (IsInCombat()) and (HasSpell("Bear Form") or HasSpell("Dire Bear Form")) and (not IsDrinking()) and (not IsEating()) and (targetObj:GetHealthPercentage() >= 40) and (IsInCombat()) ) then
			
			-- if not in form and mana/health right then use bear form
			if (not IsBearForm()) and (not IsCatForm()) and (PlayerMana() >= self.shapeshiftMana) and (PlayerHealth() >= self.healthToShift) and (IsStanding()) then
				if (not script_grind.adjustTickRate) then
					script_grind.tickRate = 335;
				end
				if (script_druidEX.bearForm()) then
					self.waitTimer = GetTimeEX() + 1500;
				end
			end
		end
		end
	
-- stay in form cat if cat form is selected -- cast cat form
		-- only if enemies attacking us less than 2 and not in form and health/mana set right
			-- not if enemy level greater than 2
	if (script_grind.enemiesAttackingUs(10) < 2) and (HasSpell("Cat Form")) and (self.useCat)
		and (not IsCatForm()) and (not self.useBear) and (not IsBearForm())
		and (PlayerMana() >= self.shapeshiftMana) and (PlayerHealth() >= self.healthToShift or HasRegrowth)
		and (IsStanding()) and (not IsDrinking()) and (not IsEating())
		and (targetObj:GetLevel() <= Player():GetLevel() + 2)
		and (not IsSpellOnCD("Cat Form"))
	then
		if (not script_grind.adjustTickRate) then
			script_grind.tickRate = 335;
		end
		if (not CastSpellByName("Cat Form")) then
			self.waitTimer = GetTimeEX() + 1200;
		end
	end

		-- use prowl before spamming auto attack and move in range of target!
		if (not IsInCombat()) and (self.useCat) and (IsCatForm()) and (self.useStealth) and (HasSpell("Prowl")) and (not IsSpellOnCD("Prowl")) and (not IsStealth()) and (script_grind.lootObj == nil or script_grind.lootObj == 0) and (not script_checkDebuffs:hasPoison()) and (not Player():HasDebuff("Rend")) and (IsStanding()) and (IsMoving()) then
			CastSpellByName("Prowl");
			if (script_grind.jump) then
				JumpOrAscendStart();
			end
		end

-- keep faerie fire up
			if PlayerHasTarget() and HasForm() and not self.useStealth and targetObj:GetDistance() <= 30 and not IsSpellOnCD("Faerie Fire (Feral)") and not targetObj:HasDebuff("Faerie Fire (Feral)") and targetObj:IsInLineOfSight() then
				if HasSpell("Faerie Fire (Feral)") then
					CastSpellByName("Faerie Fire (Feral)()");
					return 0;
				end
			end

-- use charge in bear form
		if (IsBearForm()) and (self.useCharge) and (HasSpell("Feral Charge")) and (not IsSpellOnCD("Feral Charge")) and (PlayerRage() >= 5) and (targetObj:GetDistance() <= 26) and (targetObj:GetDistance() >= 11) then
				script_druidEX:castCharge();
			end

		-- face target
		if targetObj ~= 0 and targetObj ~= nil then
		if (not IsMoving() and targetObj:GetDistance() <= self.meleeDistance) then
		end
		end


	-- shapeshift out of cat form to use bear form 2 or more targets - leave form
		if (self.useCat) and (IsCatForm()) and (PlayerMana() >= self.shapeshiftMana) and (PlayerHealth() <= self.healthToShift) and (GetNumPartyMembers() == 0) then
			if (script_grind:enemiesAttackingUs(12) >= 2 or targetObj:GetLevel() > Player():GetLevel() + 2) and (IsInCombat()) then
		
				if (not script_grind.adjustTickRate) then
					script_grind.tickRate = 125;
				end
				if (IsCatForm()) then
					if (not CastSpellByName("Cat Form")) then
						self.wasInCombat = true;
						self.runOnce = true;
						self.waitTimer = GetTimeEX() + 500;
					end
				end
			end
		end

				local hasRegrowth = GetLocalPlayer():HasBuff("Regrowth");
				local hasRejuv = Player():HasBuff("Rejuvenation"); 

		-- stay in cat form - placed here to allow faster movement and stealth to target
		-- not in cat form
			-- not if enemies attack us greater than 1
				-- not if in form  -  not if enemy level greater than 2
		if (IsInCombat()) and (script_grind.enemiesAttackingUs() == 1) and (not IsCatForm()) and (self.useCat) and (not self.useBear) and (not IsBearForm()) and (PlayerHealth() >= self.healthToShift + 10 or ( (hasRegrowth and hasRejuv) or not hasRejuv and not HasSpell("Regrowth")) ) and (PlayerMana() >= self.shapeshiftMana) and (targetObj:GetLevel() <= Player():GetLevel() +2) and (not IsDrinking()) and (not IsEating()) then
			if (HasSpell("Cat Form")) and not IsSpellOnCD("Cat Form") and not IsCasting() and not IsChanneling() then
				if CastSpellByName("Cat Form") then
				end
			end
		end

		--Racial
			-- not in a party and not if target has entangling roots
				-- 2 or more enemies only
		if (not IsBearForm()) and (not IsCatForm()) and (IsInCombat()) and targetObj ~= 0 and targetObj ~= nil then
			if (targetObj:IsCasting() or script_druid:enemiesAttackingUs(6) >= 2) and (GetNumPartyMembers() == 0) and (not targetObj:HasDebuff("Entangling Roots")) and (targetObj:GetDistance() <= 8) then
				CheckRacialSpells();
				self.waitTimer = GetTimeEX() + 200;
			end
		end

		-- check heals and buffs
		if (PlayerHealth() <= self.healthToShift) and (not script_checkDebuffs:hasSilence()) and PlayerMana() >= self.shapeshiftMana then
			if (targetHealth >= 25 and script_grind.enemiesAttackingUs() == 1)
			or (targetHealth >= 10 and script_grind.enemiesAttackingUs() > 1)
			or (PlayerHealth() < self.healthToShift - 25 and targetHealth >= 10)
			or (not IsBearForm() and not IsCatForm())
			then
				if (not Player():HasBuff("Frenzied Regeneration")) and (not IsLooting()) then
					if (script_druidHealsAndBuffs:healsAndBuffs()) then
						if IsMoving() then StopMoving(); return true; end

					return true;
					end
				end
			end
		end

		-- move to target
		if targetObj ~= nil and targetObj ~= 0 and not IsCasting() and not IsChanneling() then
			if (targetObj:GetDistance() > self.spellRange and targetObj:GetDistance() > 2) or not targetObj:IsInLineOfSight() then
				return 3;
			end
		end
		
		----------
		----- OPENER 
		---------

		-- Opener
		if (not IsInCombat()) and (not IsTravelForm()) and targetObj ~= 0 and targetObj ~= nil then
			self.message = "Pulling " .. targetObj:GetUnitName() .. "...";

			-- stealth opener
			if (IsCatForm()) and (self.useCat) and (self.useStealth) and (IsStealth()) then
				if (HasSpell(self.stealthOpener)) and (not IsSpellOnCD(self.stealthOpener)) and (PlayerEnergy() >= 60) and (targetObj:GetDistance() <= 4) and (HasSpell("Shred") and self.openerUsed < 3) or (not HasSpell("Shred")) then
					
					if (not CastSpellByName(self.stealthOpener)) then
						if (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) then
						local x, y, z = GetLocalPlayer():GetPosition();
						local xx, yy, zz = script_grind.enemyObj:GetPosition();
						Move(xx-math.cos(script_grind.enemyObj:GetAngle()), yy+math.sin(GetLocalPlayer():GetAngle()), zz);
						end
						self.waitTimer = GetTimeEX() + 1550;
						script_grind:setWaitTimer(1550);
						self.openerUsed = self.openerUsed + 1;
						return 0;
					end
					if (not IsAutoCasting("Attack")) and (not IsMoving()) then
						targetObj:AutoAttack();
					end
				end
			end

			-- claw if stealth opener used too many times
			if (self.openerUsed > 3) then
				if (IsMoving()) then
					StopMoving();
					return true;
				end
				if (PlayerEnergy() >= self.clawEnergy) and (not IsSpellOnCD("Claw")) and targetObj:GetDistance() <= 5 then
					if not CastSpellByName("Claw", targetObj) then
						self.openerUsed = 0;
						self.waitTimer = GetTimeEX() + 1600;
						return 0;
					end
				end
			end
							
			-- Auto Attack
			if (targetObj:GetDistance() < 30) and (not IsInCombat()) and (not IsAutoCasting("Attack")) and (PlayerMana() >= self.drinkMana) and (not IsMoving()) then
				targetObj:AutoAttack();
				
			end

			-- keep faerie fire up
			if PlayerHasTarget() and HasForm() and not self.useStealth and targetObj:GetDistance() <= 30 and not IsSpellOnCD("Faerie Fire (Feral)") and not targetObj:HasDebuff("Faerie Fire (Feral)") and targetObj:IsInLineOfSight() then
				if HasSpell("Faerie Fire (Feral)") then
					CastSpellByName("Faerie Fire (Feral)()");
					return 0;
				end
			end

			-- use dash if stealthed
			if (HasSpell("Dash")) and (IsCatForm()) and (not IsSpellOnCD("Dash")) and (targetObj:GetDistance() >= 20) and (IsStealth()) then
				if (CastSpellByName("Dash", Player())) then
					self.waitTimer = GetTimeEX() + 300;
				end
			end

			-- enrage if has charge
			if (IsBearForm()) and (HasSpell("Feral Charge")) and (HasSpell("Enrage")) and (not IsSpellOnCD("Enrage")) and (not IsSpellOnCD("Feral Charge")) and (targetObj:GetDistance() <= 45) then
				if (CastSpellByName("Enrage", Player())) then
				end
			end

			-- use charge in bear form
			if (IsBearForm()) and (self.useCharge) and (HasSpell("Feral Charge")) and (not IsSpellOnCD("Feral Charge")) and (PlayerRage() >= 5) then
				if (self.useBear) and (targetObj:GetDistance() < 26) and (targetObj:GetDistance() <= 11) then
					CastSpellByName("Feral Charge", targetObj);
				end
			end

			-- keep faerie fire up
			if PlayerHasTarget() and HasForm() and not self.useStealth and targetObj:GetDistance() <= 30 and HasSpell("Faerie Fire (Feral)") and not IsSpellOnCD("Faerie Fire (Feral)") and not targetObj:HasDebuff("Faerie Fire (Feral)") and targetObj:IsInLineOfSight() then
				CastSpellByName("Faerie Fire (Feral)()");
				return 0;
			end

			-- Dismount
			if (IsMounted()) and (targetObj:GetDistance() < 25) then 
				DisMount(); 
				return 4; 
			end

			----
	-- pull in form
			----




	-- pull bear form
			------

	-- stay in form
	-- not in bear form and conditions right then stay in bear form
		--not is in form and mana/health set right	
		if ( (not IsBearForm()) and (self.useBear) and (not IsCatForm()) and (PlayerHealth() > self.healthToShift) and (PlayerMana() > self.shapeshiftMana) and (not IsDrinking()) and (not IsEating()) )
		
		-- or if enemies attacking us greater than 2 and mana/health set right
		or GetNumPartyMembers() == 0 and ( (script_grind.enemiesAttackingUs() >= 2) and (not IsBearForm()) and (not IsCatForm()) and (PlayerMana() >= self.shapeshiftMana) and (PlayerHealth() >= self.healthToShift) and (IsStanding()) and (HasSpell("Bear Form") or HasSpell("Dire Bear Form")) ) 

		-- or enemy level is greater than 2 and health/mana is set right
		or ( (targetObj:GetLevel() > (Player():GetLevel() + 2) ) and (not IsBearForm()) and (not IsCatForm()) and (PlayerMana() > self.shapeshiftMana) and (PlayerHealth() > self.healthToShift) and (IsStanding()) and (HasSpell("Bear Form") or HasSpell("Dire Bear Form")) )
		
		-- or hasregrowth and has rejuv and is in combat
		or ( (self.useBear or script_grind.enemiesAttackingUs(10) >= 2) and (hasRegrowth or hasRejuv) and (IsInCombat()) and (not IsBearForm() and not IsCatForm()) and (PlayerMana() >= self.shapeshiftMana) and (PlayerHealth() > self.healthToShift) )

		-- or if not has regrwoth yet and has rejuvenation and health/mana correct
		or ( (not HasSpell("Regrowth")) and (hasRejuv) and (IsInCombat()) and (not IsBearForm() and not IsCatForm()) and (PlayerMana() >= self.shapeshiftMana) and (PlayerHealth() > self.healthToShift) and (HasSpell("Bear Form")) and (self.useBear) )

		then
			-- cast bear form
			if (script_druidEX.bearForm()) then
				return true;
			end
		end
		
		-- if in bear form do these pulls
		if (IsBearForm()) and (not IsCatForm()) then

			-- Enrage
			if (HasSpell("Enrage")) and (not IsSpellOnCD("Enrage")) and (targetObj:GetDistance() < 45) and (PlayerHealth() > self.healthToShift + 25) then
				if (CastSpellByName("Enrage")) then
				end
			end

			-- Demoralizing Roar
			if (HasSpell("Demoralizing Roar")) and (not targetObj:HasBuff("Demoralizing Roar")) and (PlayerRage() > 10) and (not targetObj:HasDebuff("Demoralizing Shout")) and (not IsSpellOnCD("Demoralizing Roar")) then
				if script_grindNumEnemiesInRange:numEnemiesInRange(10) == 1 or NumberTargetsAttackingPlayer() >= 2 then
					if (CastSpellByName("Demoralizing Roar")) then
						return 0;
					end
				end
			end

			-- keep faerie fire up
			if PlayerHasTarget() and HasForm() and not self.useStealth and targetObj:GetDistance() <= 30 and HasSpell("Faerie Fire (Feral)") and not IsSpellOnCD("Faerie Fire (Feral)") and not targetObj:HasDebuff("Faerie Fire (Feral)") and targetObj:IsInLineOfSight() then
				CastSpellByName("Faerie Fire (Feral)()");
				return 0;
			end

		end


	-- end of bear form pulling




	-- pull cat form
			------

		-- stay in form
		-- not in cat form and conditions right then stay in cat form
			-- not if enemies attack us greater than 1 and mana/health set correct
				-- not if enemy level greater than 2
		if (script_grind.enemiesAttackingUs() == 1) and (not IsCatForm()) and (self.useCat) and (not self.useBear) and (not IsBearForm()) and (PlayerHealth() >= self.healthToShift) and (PlayerMana() >= self.shapeshiftMana) and (targetObj:GetLevel() <= (Player():GetLevel() + 2)) and (not IsDrinking()) and (not IsEating())
		-- or is in combat and has heals already and mana/health correct
		or ( (IsInCombat()) and (hasRegrowth) and (hasRejuv) and (not IsCatForm()) and (self.useCat) and (not self.useBear) and (not IsBearForm()) and (PlayerHealth() < self.healthToShift) and (PlayerMana() >= self.shapeshiftMana) )

		 then
			-- cast cat form
			if (HasSpell("Cat Form")) and not IsSpellOnCD("Cat Form") and not IsCasting() and not IsChanneling() then
				if CastSpellByName("Cat Form") then
				end
			end
		end

		-- if in cat form do these pulls	
		if (IsCatForm()) and (not IsBearForm()) then

			-- face target
			if (targetObj:GetDistance() <= self.meleeDistance + 2) and (not IsMoving()) then
			end

			-- cast tigers fury if we have time
			if (HasSpell("Tiger's Fury")) and (not Player():HasBuff("Tiger's Fury")) and (not IsSpellOnCD("Tiger's Fury")) and (PlayerEnergy() >= 30) then
				if (CastSpellByName("Tiger's Fury")) then
					self.waitTimer = GetTimeEX() + 1550;
					return 0;
				end
			end

			if not IsAutoCasting("Attack") and not IsStealth() then
				targetObj:AutoAttack();
			end
	
		end


	-- end of cat form pulling



			----
	-- pull no form
	-- or level less than 10
			----

		if (not IsBearForm() and not IsCatForm()) or (isMoonkin) and (not self.useBear and not self.useCat) then

			-- face target
			if (targetObj:GetDistance() <= self.spellRange) and (not IsMoving()) then
			end

			--pull with starfire
			if (HasSpell("Starfire")) and (PlayerMana() >= self.drinkMana) and targetObj:GetDistance() <= self.spellRange then
				if (CastSpellByName("Starfire", targetObj)) then
					return 0;
				end
			end

			-- Wrath to pull if no moonfire spell
			if (not HasSpell("Moonfire") or not self.pullWithMoonfire) and (PlayerMana() >= self.drinkMana) and (not IsMoving()) and (targetObj:GetDistance() <= self.spellRange) then
				if IsMoving() then StopMoving(); return true; end
				if (CastSpellByName("Wrath", targetObj)) then
					self.waitTimer = GetTimeEX() + 1950;
					script_grind:setWaitTimer(1950);
					self.tickRate = 1200;
					self.message = "Casting Wrath!";
					return 0; -- keep trying until cast
				end
			end
			
			-- use moonfire to pull if has spell
			if self.pullWithMoonfire and (HasSpell("Moonfire")) and (PlayerMana() >= self.drinkMana) and (not targetObj:HasDebuff("Moonfire")) and (not IsMoving()) and (targetObj:IsInLineOfSight()) and targetObj:GetDistance() <= self.spellRange then
				if (IsMoving()) then
					StopMoving();
				end
				if (CastSpellByName("Moonfire", targetObj)) then
					self.waitTimer = GetTimeEX() + 1950;
					script_grind:setWaitTimer(1950);
					return 0;
				end
			end
			
			-- Entangling roots when target is far enough away and we have enough mana
			if (not self.useBear) and (not self.useCat) and (self.useEntanglingRoots) and (not IsInCombat()) and (not IsMoving()) and (PlayerMana() >= self.drinkMana) and (not targetObj:IsCasting()) and (targetObj:GetDistance() <= self.spellRange) and (targetObj:GetDistance() >= 9) then
				if (HasSpell("Entangling Roots")) and (not targetObj:HasDebuff("Entangling Roots")) then
					if (CastSpellByName("Entangling Roots", targetObj)) then
						self.waitTimer = GetTimeEX() + 1850;
						return 0;
					end
				end
			end
		end

	-- end of pulling not in combat phase


	-- Combat -- start of combat phase! now in combat!


	-- IN COMBAT





		elseif IsInCombat() and targetObj ~= nil and targetObj ~= 0 then	

			-- dismount before combat
			if (IsMounted()) then
				DisMount();
			end

			if targetObj ~= nil and targetObj ~= 0 then
				self.message = "Killing " .. targetObj:GetUnitName() .. "...";
			end
			-- reset vars
			self.openerUsed = 0;

			-- check heals and buffs
		if (PlayerHealth() <= self.healthToShift) and (not script_checkDebuffs:hasSilence()) and PlayerMana() >= self.shapeshiftMana then
			if (targetHealth >= 25 and script_grind.enemiesAttackingUs() == 1) 
			or (targetHealth >= 10 and script_grind.enemiesAttackingUs() > 1)
			or (PlayerHealth() <self.healthToShift - 25 and targetHealth >= 10)
			or (not IsBearForm() and not IsCatForm())
			then
				if (not Player():HasBuff("Frenzied Regeneration")) and (not IsLooting()) then
					if (script_druidHealsAndBuffs:healsAndBuffs()) then
										if IsMoving() then StopMoving(); return true; end

					return true;
					end
				end
			end
		end


		if (self.usePowerShift) then
			if (self.useCat and IsCatForm()) then
				if (PlayerEnergy() < 40) and (PlayerMana() > self.shapeshiftMana * 2) and (targetHealth >= 35) and (PlayerComboPoints() < 5) and (PlayerHealth() >= self.shapeshiftHealth + 30) then
					if (CastSpellByName("Cat Form")) then
						self.waitTimer = GetTimeEX() + 250;
						return 0;
					end
				end
			end
		end

	-- attacks in bear form IN COMBAT PHASE

	-- stay in form - bear form conditions
			-- if use bear and not is cat form and mana/health correct
			if ( (self.useBear) and (not IsBearForm()) and (not IsCatForm())
				and (PlayerHealth() > self.healthToShift) and (PlayerMana() >= self.shapeshiftMana) )
			
			-- or enemies attacking us greater than 2 and mana/health correct
			or ( (self.useBear) and (not IsCatForm()) and (script_grind.enemiesAttackingUs(12) >= 2)
				and (not IsBearForm()) and (PlayerMana() >= self.shapeshiftMana) 
				and (not IsCatForm()) and (PlayerHealth() > self.healthToShift) )
		
			-- or enemy level greater than 2 and mana/health correct
			or ( (targetObj:GetLevel() > (Player():GetLevel() + 2) and IsInCombat())
				and (not IsBearForm()) and (PlayerMana() >= self.shapeshiftMana)
				and (not IsCatForm()) and (PlayerHealth() > self.healthToShift)
				and (HasSpell("Bear Form") or HasSpell("Dire Bear Form")) )

			then
				-- adjust tick rate of script to make shifting quicker
				if (not script_grind.adjustTickRate) then
					script_grind.tickRate = 100;
				end
				
				-- cast bear form
				script_druidEX:bearForm()
			end
			
			-- shift for debuff removal self use bear form
			if (self.hasDrinks) and (IsBearForm()) and (not IsCatForm() and not self.useCat)
			and (script_checkDebuffs:hasDisabledMovement()) and (PlayerMana() >= self.shapeshiftMana*2) and (PlayerHealth() > self.healthToShift + 20) and (script_grind.enemiesAttackingUs(12) < 2) 			then
				if (not script_grind.adjustTickRate) then
					script_grind.tickRate = 100;
				end
				if script_druidHealsAndBuffs:healsAndBuffs() then
					return true;
				end
				if (script_druidEX:bearForm()) then
				end
			end

			-- shift for debuff removal self use cat form - cat form
			if (self.hasDrinks) and (IsCatForm()) and (not IsBearForm() and not self.useBear) and (script_checkDebuffs:hasDisabledMovement()) and (PlayerMana() >= self.shapeshiftMana*2) and (PlayerHealth() > self.healthToShift + 20) then
				if (not script_grind.adjustTickRate) then
					script_grind.tickRate = 100;
				end
				script_druidHealsAndBuffs:healsAndBuffs();
				if (HasSpell("Cat Form")) then
					CastSpellByName("Cat Form");
					self.waitTimer = GetTimeEX() + 1000;
					return 0;
				end
			end

-- do these attacks only in bear form
			if (IsBearForm()) and (not IsCatForm()) then

				if ((targetObj:GetDistance() > self.spellRange and targetObj:GetDistance() > 2) or not targetObj:IsInLineOfSight()) and not IsCasting() and not IsChanneling() then
					return 3;
				end

				if script_druidBearForm:runInCombat(targetObj) then
					return true;
				end		

			end -- end of bear form in combat attacks

	-- attacks in cat form IN COMBAT PHASE

			-- shift for debuff removal - cat form
			if (self.hasDrinks) and (self.useCat) and (IsCatForm() or not IsCatForm()) and (script_checkDebuffs:hasDisabledMovement()) and (PlayerMana() >= self.shapeshiftMana*2) and (PlayerHealth() > self.healthToShift + 20) then
				if (not script_grind.adjustTickRate) then
					script_grind.tickRate = 100;
				end
				if (IsCatForm()) or (not IsCatForm()) then
					CastSpellByName("Cat Form");
					self.waitTimer = GetTimeEX() + 1500;
					return 0;
				end
			end

				local hasRegrowth = GetLocalPlayer():HasBuff("Regrowth");

			--stay in form
				-- not if enemies attacking us greater than 1
					-- not if enemy level greater than 2
			if (script_grind.enemiesAttackingUs() < 2) and (self.useCat and not IsCatForm()) and (not self.useBear and not IsBearForm()) and (PlayerHealth() >= self.healthToShift or hasRegrowth) and (PlayerMana() >= self.shapeshiftMana) and (IsStanding()) and (targetObj:GetLevel() <= (Player():GetLevel() + 2) ) then	
				if (not script_grind.adjustTickRate) then
					script_grind.tickRate = 100;
				end
				if not IsSpellOnCD("Cat Form") then
					if (not CastSpellByName("Cat Form")) then
						self.waitTimer = GetTimeEX() + 800;
					end
				end
			end

-- do these attacks only in cat form
			if (IsCatForm()) and (not IsBearForm()) then

				if script_druidCatForm:runInCombat(targetObj) then

					return true;
				end
			end
	-- attacks when not in form

		-- no bear form or cat form

			if ( (not IsBearForm()) and (not IsCatForm()) and (not self.useBear) and (not self.useCat) ) or (isMoonkin) then
				-- face target
				--if (targetObj:GetDistance() < 30) and (not IsMoving()) then
				--	if not IsMoving() then targetObj:FaceTarget(); end
				--end

				-- Run backwards if we are too close to the target
				if (targetObj:GetDistance() <= 0.7) then 
					if (script_druid:runBackwards(targetObj, 2)) then 
						return 4; 
					end 
				end
				
				-- cast entangling roots
				-- Check: Move backwards if the target is affected by Entangling Root
				if (self.useEntanglingRoots) and (not self.useBear) and (not self.useCat) then
					if (not targetObj:HasDebuff("Entangling Roots")) and (not Player():HasDebuff("Web")) and (not Player():HasDebuff("Encasing Webs")) and (PlayerMana() > 65) and (targetHealth >= 35) and (not IsCasting()) and (not IsChanneling()) and (not IsMoving()) then
						if (not script_grind.adjustTickRate) then
							script_grind.tickRate = 1700;
						end
						if (not targetObj:HasDebuff("Entangling Roots")) and (not targetObj:IsCasting()) and (not IsCasting()) and (not IsChanneling()) then
							if (CastSpellByName("Entangling Roots")) then
								self.waitTimer = GetTimeEX() + 1550;
								script_grind:setWaitTimer(1550);
								return 4;
							end
						end
					end 
				end	
					-- run backwards if target is entangled
				if (targetObj:HasDebuff("Entangling Roots")) and (PlayerMana() > 36) and not IsCatForm() and not IsBearForm() then
					if (script_druid:runBackwards(targetObj, 8)) then
						self.waitTimer = GetTimeEX() + 500;
					return 4;
					end
				end

				-- check heals and buffs
			if (PlayerHealth() <= self.healthToShift) and (not script_checkDebuffs:hasSilence()) and PlayerMana() >= self.shapeshiftMana then
				if (targetHealth >= 25 and script_grind.enemiesAttackingUs(10) == 1) 
				or (targetHealth >= 10 and script_grind.enemiesAttackingUs(10) > 1)
				or (PlayerHealth() <self.healthToShift - 25 and targetHealth >= 10)
				or (not IsBearForm() and not IsCatForm())
				then
					if (not Player():HasBuff("Frenzied Regeneration")) and (not IsLooting()) then
						if (script_druidHealsAndBuffs:healsAndBuffs()) then
							if IsMoving() then StopMoving(); return true; end				
						return true;	
						end	
					end
				end
			end

				-- racial
				if (targetObj:IsCasting() or script_druid:enemiesAttackingUs(10) >= 2) and (not IsMoving()) and (targetObj:GetDistance() <= 8) then
					CheckRacialSpells();
					self.waitTimer = GetTimeEX() + 200;
				end

				-- keep moonfire up
				if (PlayerMana() >= 30) and (targetHealth >= 5) and (not targetObj:HasDebuff("Moonfire")) and (HasSpell("Moonfire")) and (IsInCombat()) and (not HasForm()) and (not IsCasting()) and (not IsChanneling()) then
					if (CastSpellByName("Moonfire", targetObj)) then
						self.waitTimer = GetTimeEX() + 1550;
					end
				end

				-- spam moonfire until target is killed
				if (PlayerMana() > 30) and (targetHealth < 10) and (not IsSpellOnCD("Moonfire")) and (HasSpell("Moonfire")) then
					if (CastSpellByName("Moonfire", targetObj)) then
						self.waitTimer = GetTimeEX() + 1650;
						return 0;
					end
				end

				-- starfire
				if (HasSpell("Starfire")) and (PlayerMana() > 60) and (script_grind:enemiesAttackingUs(10) < 2) and (not IsMoving()) then
					if (CastSpellByName("Starfire", targetObj)) then
						self.waitTimer = GetTimeEX() + 800;
					end
				end

				local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Wrath");
				-- Wrath
				if (PlayerMana() > 30 and targetHealth > 15 and not HasSpell("Star Fire"))
				or (((PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana >= 30) and targetHealth >= 7 and HasSpell("Star Fire"))
				or (not HasSpell("Bear Form") and PlayerMana() >= 30 and targetHealth >= 15) and not IsMoving() then
					if (not IsMoving()) then
						CastSpellByName("Wrath", targetObj);
						self.waitTimer = GetTimeEX() + 2000;
						script_grind:setWaitTimer(2000);
					end
				end

				-- if low level use wrath on target if they have low health
				if (PlayerMana() >= 30) and (not HasSpell("Moonfire")) and not IsMoving() then
					if (CastSpellByName("Wrath", targetObj)) then
						self.waitTimer = GetTimeEX() + 1850;
						return 0;
					end
				end
	

			end -- end of if not bear or cat... no form attacks
			
			-- auto attack condition for melee
			if (PlayerMana() <= 40 or IsBearForm() or IsCatForm()) and (not targetObj:HasDebuff("Entangling Roots")) then
				if (targetObj:GetDistance() <= self.meleeDistance) then
					if (not IsMoving()) then
						if not IsAutoCasting("Attack") then
						targetObj:AutoAttack();
					end
						return 0;
					end
				end
			end
			if (targetObj:GetDistance() > self.spellRange and targetObj:GetDistance() > 2) and not IsCasting() and not IsChanneling() then
				return 3;
			end

		end -- end of else combat phase

		-- set tick rate for script to run
		if (not script_grind.adjustTickRate) then
	
			local tickRandom = math.random(150, 350);
		
			if (IsMoving()) or (not IsInCombat()) or (targetObj ~= nil and targetObj ~= 0 and targetObj:IsFleeing()) then
				script_grind.tickRate = 135;
			elseif (not IsInCombat()) and (not IsMoving()) then
				script_grind.tickRate = tickRandom;
			elseif (IsInCombat()) and (not IsMoving()) then
				script_grind.tickRate = tickRandom;
			end
		end
	end -- end valid target
end -- end of function

function script_druid:rest()

	if (not self.isSetup) then
		script_druid:setup();
	end

	local hasRegrowth = Player():HasBuff("Regrowth");

	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = math.random(150, 350);

		if (IsMoving()) or (not IsInCombat()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end

	-- shapeshift into cat form after bear form
	if (not IsInCombat()) and (IsBearForm()) and (self.useCat) and (not IsDrinking()) and (not IsEating()) and (PlayerMana() >= self.shapeshiftMana) then
		if (script_druidEX:bearForm()) then
		end
	end

	-- shift for debuff removal - cat form
	if (self.hasDrinks) and (self.useCat) and (IsCatForm() or not IsCatForm()) and (script_checkDebuffs:hasDisabledMovement()) and (PlayerMana() >= self.shapeshiftMana*2) and (PlayerHealth() > self.healthToShift + 20) then
		if (not script_grind.adjustTickRate) then
			script_grind.tickRate = 100;
		end
		if (IsCatForm()) then
			CastSpellByName("Cat Form");
			self.waitTimer = GetTimeEX() + 1500;
			return 0;
		end
	end

	-- shift for debuff removal - bear form
	if (self.hasDrinks) and (IsBearForm()) and (HasSpell("Bear Form") or HasSpell("Dire Bear Form")) and (script_checkDebuffs:hasDisabledMovement()) and (PlayerMana() >= self.shapeshiftMana*2) and (PlayerHealth() > self.healthToShift + 20) then
		if (not script_grind.adjustTickRate) then
			script_grind.tickRate = 100;
		end
		if (script_druidEX:bearForm()) then
			self.waitTimer = GetTimeEX() + 1500;
		end
	end

	-- check heals and buffs
	if (not IsLooting()) and (not IsDrinking()) and (not IsEating()) and (not Player():HasBuff("Frenzied Regeneration")) and (not IsInCombat()) and (not script_checkDebuffs:hasSilence()) then
		if (script_druidHealsAndBuffs:healsAndBuffs()) then
							if IsMoving() then StopMoving(); return true; end

		return true;
		end
	end	

	-- shift to drink - in bear form
	if (IsBearForm()) and (not IsInCombat()) and (self.shiftToDrink or (PlayerMana() < 15 and not HasRegrowth)) then
		if (PlayerMana() <= self.drinkMana - 15 and self.shiftToDrink) 
		or ((PlayerMana() <= 15 and not HasRegrowth and PlayerHealth() < 80) or (PlayerHealth() <= self.eatHealth and not HasRegrowth))
		then
			if PlayerMana() <= 15 then
				DEFAULT_CHAT_FRAME:AddMessage("Mana less than 15 percent, shifting to drink...");
			end
			if (script_druidEX:bearForm()) then
				self.waitTimer = GetTimeEX() + 1500;
				script_grind:setWaitTimer(1000);
			end
		end
	end

	-- shift to drink - in cat form
	if (self.shiftToDrink or (PlayerMana() < 15 and not HasRegrowth)) and (IsCatForm()) and (not IsInCombat()) then 	
		if (PlayerMana() <= self.drinkMana - 15 and self.shiftToDrink) 
		or ((PlayerMana() < 15 and not HasRegrowth and PlayerHealth() < 80) or (PlayerHealth() <= self.eatHealth and not HasRegrowth))
		then	
		if PlayerMana() <= 15 then
				DEFAULT_CHAT_FRAME:AddMessage("Mana less than 15 percent, shifting to drink...");
			end
			if (not CastSpellByName("Cat Form")) then
				self.waitTimer = GetTimeEX() + 1500;
				script_grind:setWaitTimer(1000);
			end
		end
	end

	-- Drink something if not in form
	if (not IsBearForm()) and (not IsCatForm()) and (not IsTravelForm()) and (not IsInCombat()) and (not IsDrinking()) and (PlayerMana() <= self.drinkMana) and (not Player():HasBuff("Innervate")) then
		
			self.message = "Need to drink...";

			self.waitTimer = GetTimeEX() + 1500;

	
			-- Dismount
			if(IsMounted()) then 
				DisMount(); 
				return true; 
			end
			if (IsMoving()) then
				StopMoving();
				return true;
			end

			if (script_helper:drinkWater()) and (not IsInCombat()) then 
				self.message = "Drinking..."; 
				self.waitTimer = GetTimeEX() + 1800;
				script_grind:setWaitTimer(1800);
				self.tickRate = 500;
				ClearTarget();
				return true; 
			else
				self.message = "No drinks! (or drink not included in script_helper)";
				self.shitToDrink = false;
				self.hasDrinks = false;
				if not IsDrinking() and not IsStanding() and not IsMoving() and not IsCasting() and not IsChanneling() then script_druid.shapeshiftMana = 50; end

				return true; 
			end
		end
	
	-- eat if not in form
	if (not IsBearForm()) and (not IsCatForm()) and (not IsTravelForm()) and (not IsInCombat()) and (not IsEating() and PlayerHealth() < self.eatHealth) then

			self.message = "Need to eat...";
			
			self.waitTimer = GetTimeEX() + 1500;

			-- Dismount
			if(IsMounted()) then
				DisMount();
			end
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			
			if (script_helper:eat()) and (not IsInCombat()) then 
				self.message = "Eating..."; 
				self.waitTimer = GetTimeEX() + 1500;
				return true; 
			else 
				self.message = "No food! (or food not included in script_helper)";
				self.waitTimer = GetTimeEX() + 1200;
				return true; 
			end	
		end

	-- rest in form
	if (IsBearForm() or IsCatForm()) and (self.useBear or self.useCat) and (self.useRest) then
		if (Player():GetUnitsTarget() == 0) then
			if (PlayerMana() <= 70 or PlayerHealth() <= 70) and (not IsInCombat()) then
				if (IsCatForm()) and (HasSpell("Prowl")) and (not IsSpellOnCD("Prowl")) and (not IsStealth()) and (not script_checkDebuffs:hasPoison()) then
					CastSpellByName("Prowl", Player());
				end
				self.message = "Waiting - low mana or health and shapeshifted! Change heal/drink!";
				return true;
			end
		end		
	end	

	-- stop bot to rest if we need to rest
	if (self.useRest) then
		if (PlayerMana() < 70 or PlayerHealth() < 70) then
			if (IsMoving()) then
				StopMoving();
				self.waitTimer = GetTimeEX() + 500;
			end
			return true;
		end
	end

	-- cast shadowmeld if eating and has shadowmeld
	if (IsEating()) or (IsDrinking()) and (not IsStanding()) and (HasSpell("Shadowmeld")) and (not IsSpellOnCD("Shadowmeld")) and (not IsCatForm()) and (not IsBearForm()) and (not IsTravelForm()) and (not script_checkDebuffs:hasPoison()) and (PlayerMana() < 75 or PlayerHealth() < 70) then
		if (CastSpellByName("Shadowmeld")) then
			self.waitTimer = GetTimeEX() + 2000;
			ClearTarget();
			return 0;
		end
	end

	if (IsDrinking() and PlayerMana() >= 95 and not IsEating())
	or (IsEating() and PlayerHealth() >= 95 and not IsDrinking())
	or (IsDrinking() and IsEating() and PlayerHealth() >= 95 and PlayerMana() >= 95) then
		if (not IsInCombat()) then
			JumpOrAscendStart();
		end
	end
	
	-- Continue resting
	if(PlayerHealth() < 98 and IsEating() or PlayerMana() < 98 and IsDrinking()) and not HasForm() then
		self.message = "Resting up to full HP/Mana...";
		self.waitTimer = GetTimeEX() + 1500;
		script_grind.waitTimer = GetTimeEX() + 1500;
		return true;
	end

-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = math.random(150, 350);

		if (IsMoving()) or (not IsInCombat()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end

	-- Don't need to rest
	return false;
end

function script_druid:window()

	if (self.isChecked) then
	
		--Close existing Window
		EndWindow();

		if(NewWindow("Class Combat Options", 200, 200)) then
			script_druidEX:menu();
		end
	end
end