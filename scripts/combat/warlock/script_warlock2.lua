script_warlock2 = {

isSetup = false, message = "A Warlock Script", summonPetTimer = 0, immolateTimer = 0, corruptionTimer = 0, curseOfAgonyTimer = 0, useVoidwalker = false, useImp = false, eatHealth = 50, drinkMana = 50, potionHealth = 10, potionMana = 10, addFeared = false, waitTimer = 0, hasHealthstone = faslse, hasSoulstone = false,

warlock2handleSpellsLoaded = include("scripts\\combat\\warlock\\script_warlock2handleSpells.lua"),
warlock2handlePetLoaded = include("scripts\\combat\\warlock\\script_warlock2handlePet.lua"),
}

function script_warlock2:setup()
	
	self.soulstoneTimer = GetTimeEX();
	script_warlock2handlePet.waitTimer = GetTimeEX();
	self.waitTimer = GetTimeEX();
	self.immolateTimer = GetTimeEX();
	self.corruptionTimer = GetTimeEX();
	self.curseOfAgonyTimer = GetTimeEX();
	self.summonPetTime = GetTimeEX();


	if (HasSpell("Summon Imp")) and (not HasSpell("Summon Voidwalker")) then
		self.useImp = true;
	end
	if (HasSpell("Summon Voidwalker")) then
		self.useVoidwalker = true;
	end
	self.isSetup = true;
end

function script_warlock2:draw()
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


function script_warlock2:setTimer(num)
	script_warlock2.waitTimer = GetTimeEX() + num * 1000;
end

function script_warlock2:castImmolate(myTarget)
	if (HasSpell("Immolate")) and (not myTarget:HasDebuff("Immolate")) and (GetTimeEX() > self.immolateTimer) then
		CastSpellByName("Immolate", myTarget);
		self.immolateTimer = GetTimeEX() + 4000;
		return true;
	end
end

function script_warlock2:castCorruption(myTarget)
	if (HasSpell("Corruption")) and (not myTarget:HasDebuff("Corruption")) and (GetTimeEX() > self.corruptionTimer) then
		CastSpellByName("Corruption", myTarget);
		self.corruptionTimer = GetTimeEX() + 2500;
		return true;
	end
end

function script_warlock2:castCurseOfAgony(myTarget)
	if (HasSpell("Curse of Agony")) and (not myTarget:HasDebuff("Curse of Agony")) and (GetTimeEX() > self.curseOfAgonyTimer) then
		CastSpellByName("Curse of Agony", myTarget);
		self.curseOfAgonyTimer = GetTimeEX() + 2000;
		return true;
	end
end

function script_warlock2:fearAdd(myTarget) 
	local i, t = GetFirstObject(); 
	local localObj = GetLocalPlayer();
	while i ~= 0 do 
		if t == 3 then
			if i:CanAttack() and not i:IsCritter() and not i:IsDead() and i:GetCreatureType() ~= "Undead" and not i:GetCreatureType() ~= 'Elemental' then
				if i:GetGUID() ~= myTarget and script_grind:isTargetingMe(i) or script_grind:isTargetingPet(i) and not i:HasDebuff("Fear") then
					if (i:IsInLineOfSight()) then
						CastSpellByName("Fear", myTarget);
						script_warlock2:setTimer(2);
						script_grind:setWaitTimer(1650);
						script_warlock2.addFeared = true; 
					return true; 
					end 
				end 
			end 
		end
	i, t = GetNextObject(currentObj);
	end
return false;
end

function script_warlock2:run(targetGUID)

	if (not script_warlock2.isSetup) then
		script_warlock2:setup();
	end

	if (GetLocalPlayer():IsDead()) then
		return;
	end

	local localObj = GetLocalPlayer();
	local myMana = localObj:GetManaPercentage();
	local myHealth = localObj:GetHealthPercentage();
	local currentTime = GetTimeEX();
	local petHealth = 0;
	local petMana = 0;
	local myTarget = 0;
	local targetHealth = 0;

	local hasPet = false;
	local hasConsumeShadows = false;
	local hasSufferingSpell = false;
	local hasSacrificeSpell = false;

	if (GetPet() ~= 0 and GetPet() ~= nil) then
		hasPet = true;
		petHealth = GetPet():GetHealthPercentage();
		petMana = GetPet():GetManaPercentage();
	end

if (GetPet() == 0 or GetPet() == nil) and (not IsCasting()) and (not IsChanneling()) and (self.useImp or self.useVoidwalker) then
			if (IsMoving()) then
				StopMoving();
				return true;
			end
		if (not IsMoving()) and (not IsCasting()) and (not IsChanneling()) and (script_warlock2handlePet:handlePetCalls()) then
			return true;
		end
	end

	if (hasPet) and (self.useVoidwalker) then
		for i = 0, 10 do
			name, __, __, __, __, __, __ = GetPetActionInfo(i);
			if (name == "Consume Shadows") then 
				hasConsumeShadowsSpell = true;
			end
			if (name == "Suffering") then 
				hasSufferingSpell = true;
			end
			if (name == "Sacrifice") then 
				hasSacrificeSpell = true;
			end
		end
	end

	if (hasPet) and (petHealth >= 1 and petHealth < 75) and (not IsInCombat()) and (not HasSpell("Health Funnel")) then
		self.message = "Pet has low health... we should wait.";
	return 4;
	end

	if (not PlayerHasTarget()) and (hasPet) and (PetHasTarget()) and (IsInCombat()) then
		if (GetPet():GetDistance() > 10) then
			AssistUnit("pet");
			PetFollow();
		end
	end

	if (hasPet) and (not self.useImp) and (self.useVoidwalker) and (localObj:HasBuff("Blood Pact")) and (HasItem("Soul Shard")) then
		PetDismiss();
	end

	if (script_grindEX:areWeSwimming()) then
		if (not localObj:HasBuff("Unending Breath")) and (myMana >= 20) then
			CastSpellByName("Unending Breath", localObj);
		end
	end

	myTarget = GetGUIDObject(targetGUID);
	targetHealth = myTarget:GetHealthPercentage();

	if (not IsInCombat()) and (IsMoving()) then
		self.message = "Pulling ".. myTarget:GetUnitName()..", "..math.floor(myTarget:GetDistance()).."";
	end

	if (myTarget == 0 or myTarget == nil or myTarget:IsDead()) then
		ClearTarget();
		return 2;
	end

	if (PlayerHasTarget()) and (hasPet) then
		if (GetTarget():GetGUID() ~= GetLocalPlayer():GetGUID()) and (GetTarget():GetGUID() ~= GetPet():GetGUID()) then
			if (UnitPlayerControlled("target")) then 
				script_grind:addTargetToBlacklist(myTarget:GetGUID());
				return 5; 
			end
		end
	end

	if (IsChanneling() or IsCasting()) then
		return 4;
	end

	if (hasPet) and (self.useVoidwalker) and (hasSacrificeSpell) and (myHealth <= 10 or GetPet():GetHealthPercentage() <= 5) then
		CastSpellByName("Sacrifice");
		script_warlock:setTimer(2);
	end

	if (PlayerHasTarget()) and (not localObj:IsStunned()) and (script_checkDebuffs:hasSilence()) and (localObj:HasRangedWeapon()) and (IsInCombat()) then
		if (not IsAutoCasting("Shoot")) then
			PetAttack();
			CastSpellByName("Shoot");
			script_warlock2:setTimer(0.2);
			return true;
		end
	end

	-- Use Healthstone
	if (myHealth < 30) and (IsInCombat()) and (script_warlock2handleSpells:hasHealthstone()) then
		if (script_warlock2:useHealthstones()) then
			hasHealthstone = false;
		end
	end

-- run combat valid enemy

	if (not myTarget:CanAttack() or myTarget:IsDead()) then
		ClearTarget();
		return 2;
	end

	if (myTarget:GetDistance() <= 30) and (not IsAutoCasting("Attack")) then
		myTarget:AutoAttack();
	end

	if (myTarget:GetDistance() > 27) or (not myTarget:IsInLineOfSight()) then
		return 3;
	end
	if (not localObj:HasRangedWeapon()) and (myMana <= 10) and (myTarget:GetDistance() > 5) then
		return 3;
	end

	if (hasPet) and (GetPet():GetDistance() > 30) then
		PetFollow();
	end

	if (self.waitTimer > currentTime) or (IsCasting()) or (IsChanneling()) then
		return;
	end

	if (PlayerHasTarget()) then
		if (GetTarget():GetGUID() ~= myTarget:GetGUID()) then
			ClearTarget();
			script_warlock2:setTimer(1);
			script_grind:setWaitTimer(1000);
			myTarget = 0;
		return 0;
		end
	end

	if (PlayerHasTarget()) and (not IsMoving()) then
		myTarget:FaceTarget();
	end

	if (HasSpell("Drain Soul")) and (not HasItem("Soul Shard")) and (targetHealth <= 25) and (myTarget:IsSpellInRange("Drain Soul")) then
		if (CastSpellByName("Drain Soul", myTarget)) then
			script_warlock2:setTimer(1);
			return true;
		end
	end
	
	if (hasPet) and (myTarget:HasDebuff("Immolate")) or (myTarget:HasDebuff("Corruption")) or (myTarget:HasDebuff("Curse of Agony")) or (targetHealth <= 99) or (IsInCombat()) then
		PetAttack();
	end

	if (not IsInCombat()) and (not script_grind:isAnyTargetTargetingMe()) then

		if (HasSpell("Immolate")) and (not myTarget:HasDebuff("Immolate")) and (currentTime > self.immolateTimer) and (not IsMoving()) then
			myTarget:FaceTarget();
			script_warlock2:castImmolate(myTarget);
			script_warlock2:setTimer(2.5);
		end
		if (HasSpell("Corruption")) and (not myTarget:HasDebuff("Corruption")) and (currentTime > self.corruptionTimer) and (not IsMoving()) then
			myTarget:FaceTarget();
			script_warlock2:castCorruption(myTarget);
			self.corruptionTimer = currentTime + 2500;
			script_warlock2:setTimer(2.5);
		end
		if (HasSpell("Shadow Bolt")) and (myTarget:GetDistance() <= 27) and (myMana >= 20) and (not IsMoving()) then
			myTarget:FaceTarget();
			CastSpellByName("Shadow Bolt", myTarget);
			script_warlock2:setTimer(2.5);
		end


	else
		if (myHealth < self.potionHealth) then 
			if (script_helper:useHealthPotion()) then 
				return 0; 
			end 
		end
		
		if (myMana < self.potionMana) then 
			if (script_helper:useManaPotion()) then 
				return 0; 
			end 
		end

		if (hasPet) and (self.useVoidwalker) and (not IsSpellOnCD("Suffering")) and (script_grind:enemiesAttackingUs() >= 2) and (self.hasSufferingSpell) then
			local thisTarget = 0;
			local i, t = GetFirstObject();
			while i ~= 0 do
				if t == 3 and i:GetDistance() <= 20 and i:GetUnitsTarget() ~= 0 then
					if i:GetUnitsTarget():GetGUID() == localObj:GetGUID() then
						thisTarget = i;
					end
				end
			i, t = GetNextObject(i);
			end
			if thisTarget ~= 0 then
				CastSpellByName("Suffering", thisTarget);
				script_warlock2:setTimer(0.25);
			end
		end
		if (hasPet) and (self.useVoidwalker) and (script_grind.enemiesAttackingUs() == 1) then
			if (myTarget:GetUnitsTarget():GetGUID() == localObj:GetGUID()) then
				CastSpellByName("Suffering", myTarget);
				script_warlock2:setTimer(0.25);
			end
		end

		if HasSpell("Life Tap") and not IsSpellOnCD("Life Tap") and (myHealth > 35) and (myMana < 15) then
			CastSpellByName("Life Tap", localObj);
			script_warlock2:setTimer(1.6);
			self.message = "Using Life Tap!";
			return true;
		end

		if (IsCasting() or IsChanneling() or self.waitTimer > currentTime) then
			return;
		end
		if (HasSpell("Curse of Agony")) and (not myTarget:HasDebuff("Curse of Agony")) and (currentTime > self.curseOfAgonyTimer) then
			myTarget:FaceTarget();
			script_warlock2:castCurseOfAgony(myTarget);
			self.curseOfAgonyTimer = currentTime + 3000;
			script_warlock2:setTimer(2);
			return true;
		end
		if (HasSpell("Corruption")) and (not myTarget:HasDebuff("Corruption")) and (currentTime > self.corruptionTimer) then
			myTarget:FaceTarget();
			script_warlock2:castCorruption(myTarget);
			self.corruptionTimer = currentTime + 2500;
			script_warlock2:setTimer(2);
			return true;
		end
		if (HasSpell("Immolate")) and (not myTarget:HasDebuff("Immolate")) and (currentTime > self.immolateTimer) then
			myTarget:FaceTarget();
			self.immolateTimer = currentTime + 4000;
			script_warlock2:setTimer(2);
			return true;
		end
		if (HasSpell("Shadow Bolt")) and (myTarget:GetDistance() <= 27) and (myMana >= 20) and (not IsMoving()) and ( (targetHealth >= 0 and not localObj:HasRangedWeapon()) or (targetHealth > 30 and localObj:HasRangedWeapon()) ) then
			myTarget:FaceTarget();
			if (CastSpellByName("Shadow Bolt", myTarget)) then
				script_warlock2:setTimer(2);
				return true;
			end
		end

	if (localObj:HasRangedWeapon()) and (targetHealth <= 30 or myMana <= 40) then
			if (not IsAutoCasting("Shoot")) then
				PetAttack();
				CastSpellByName("Shoot");
				script_warlock2:setTimer(.5);
				return true;
			end
		end
	end
end

function script_warlock2:rest()

	local localObj = GetLocalPlayer();
	local myMana = localObj:GetManaPercentage();
	local myHealth = localObj:GetHealthPercentage();
	local currentTime = GetTimeEX();
	local petHealth = 0;
	local petMana = 0;
	local hasPet = false;
	local hasConsumeShadows = false;
	local hasSufferingSpell = false;
	local hasSacrificeSpell = false;

	if (GetPet() ~= 0 and GetPet() ~= nil) then
		hasPet = true;
		petHealth = GetPet():GetHealthPercentage();
		petMana = GetPet():GetManaPercentage();
	end

	if (hasPet) and (self.useVoidwalker) then
		for i = 0, 10 do
			name, __, __, __, __, __, __ = GetPetActionInfo(i);
			if (name == "Consume Shadows") then 
				hasConsumeShadowsSpell = true;
			end
			if (name == "Suffering") then 
				hasSufferingSpell = true;
			end
			if (name == "Sacrifice") then 
				hasSacrificeSpell = true;
			end
		end
	end


	if (not self.isSetup) then
		script_warlock2:setup();
	end

	-- if we are undead then use cannibalize on humanoids or other undeads
	if (HasSpell("Cannibalize")) and (not IsSpellOnCD("Cannibalize")) then
		if (Cannibalize()) then
			script_warlock2:setTimer(7);
			script_grind:setWaitTimer(2500);
			return true;
		end
	end

	-- create healthstone
	if (HasPet()) and (HasItem("Soul Shard")) and (not IsInCombat()) then
		if (script_warlock2handleSpells:createHealthstone()) then
			script_warlock2:setTimer(1.75);
			script_grind:setWaitTimer(1750);
		end
	end

	-- create soulstone
		if (HasPet()) and (HasItem("Soul Shard")) and (not IsInCombat()) and (not localObj:HasBuff("Soulstone Resurrection")) then
			if (script_warlock2handleSpells:createSoulstone()) then
			end
		end
	-- use soulstone
		if (GetTimeEX() >= self.soulstoneTimer) and (not localObj:HasBuff("Soulstone Resurrection")) then
			if (not localObj:HasBuff("Soulstone Resurrection")) and (not IsMoving()) then
				StopMoving();
				if (script_warlock2handleSpells:useSoulstone()) then
local px, py, pz = GetLocalPlayer():GetPosition();
					local _tX, _tY, onScreen = WorldToScreen(px, py, pz);
					DrawText("Trying to use Soulstone in inventory!", _tX- 200, _tY-100, 255, 255, 255);
					-- 1,800,000 ---   1000miliseconds per second * 60 seconds per minute * 30 minutes per cooldown
					self.soulstoneTimer = GetTimeEX() + 1800000;
					return true;
					end
				return;
				end
			end

	-- Dark Pact instead of drink
	if (HasSpell("Dark Pact")) and (IsStanding()) and (myMana < 75) and (HasPet()) then
		if (not IsSpellOnCD("Dark Pact")) and (GetPet():GetManaPercentage() > 20) and (IsStanding()) then
			if (CastSpellByName("Dark Pact", localObj)) then
				script_warlock2:setTimer(1.75);
				self.message = "Casting Dark Pact instead of drinking!";
				return;
			end
		end
	end

	-- Stop moving before we can rest
	if (myMana < self.drinkMana or myHealth < self.eatHealth) and (not IsSwimming()) then
		script_warlock2:setTimer(2);
		if (IsMoving()) then
			StopMoving();
			return true;
		end	
	end

	-- Cast: Life Tap if conditions are right, see the function
	if (myMana < myHealth) and (HasSpell("Life Tap")) and (myHealth > 75) and (myMana < 80) then
		if (not IsInCombat()) and (not IsEating()) and (not IsDrinking()) and (not IsLooting()) and (IsStanding()) then
			if (not IsSpellOnCD("Life Tap")) then
				if (CastSpellByName("Life Tap", localObj)) then
					script_warlock2:setTimer(1.65);
				end
			end
		end
	end			
		
	-- Eat and Drink
	if (not IsDrinking() and myMana < self.drinkMana) and (not IsSwimming()) then
		self.message = "Need to drink...";
		script_warlock2:setTimer(2);
		if (IsMoving()) then
			StopMoving();
			script_warlock2:setTimer(2);
			return true;
		end

		if (script_helper:drinkWater()) then 
			self.message = "Drinking..."; 
			script_warlock2:setTimer(2);			
			return true; 
		else 
			self.message = "No drinks! (or drink not included in script_helper)";
			return true; 
		end
	end
	if (not IsEating() and myHealth < self.eatHealth) and (not IsSwimming()) then
		script_warlock2:setTimer(2);
		self.message = "Need to eat...";	
		if (IsMoving()) then
			StopMoving();
			return true;
		end
		
		if (script_helper:eat()) then 
			self.message = "Eating..."; 
			script_warlock2:setTimer(2);
			return true; 
		else 
			self.message = "No food! (or food not included in script_helper)";
			return true; 
		end	
	end

	if (myMana < 98 and IsDrinking()) or (myHealth < 98 and IsEating()) then
		self.message = "Resting to full hp/mana...";
		script_warlock2:setTimer(2);
		return true;
	end

	-- consume shadows
	if (HasPet()) and (self.useVoidwalker) and (GetPet():GetHealthPercentage() < 55) and (not GetPet():IsDead()) and (hasConsumeShadowsSpell) and (not IsSpellOnCD("Consume Shadows")) and (not GetPet():HasBuff("Consume Shadow")) and (GetPet():GetManaPercentage() >= 40) then
		CastSpellByName("Consume Shadows");
		script_warlock2:setTimer(2.5);
		script_grind:setWaitTimer(7000);
		StopMoving();
		self.message = "Using Voidwalker spell Consume Shadows";
		return true;
	end

	if (myMana > 30) and (IsStanding()) then
		if(HasSpell("Demon Armor")) then
			if (not localObj:HasBuff("Demon Armor")) then
				if (not Buff("Demon Armor", localObj)) then
					return false;
				else
					self.message = "Buffing...";
					return true;
				end
			end
		elseif (not localObj:HasBuff('Demon Skin') and HasSpell('Demon Skin')) and (IsStanding()) then
			if (not Buff('Demon Skin', localObj)) then
				return false;
			else
				self.message = "Buffing...";
				return true;
			end
		end
		if (HasSpell("Unending Breath")) and (self.useUnendingBreath) and (IsStanding())then
			if (not localObj:HasBuff('Unending Breath')) then
				if (not Buff('Unending Breath', localObj)) then
					return false;
				else
					self.message = "Buffing...";
					return true;
				end
			end
		end
	end

	-- Check: Health funnel on the pet or wait for it to regen if lower than 70%
	if (not IsInCombat()) and (HasPet()) and (HasSpell("Health Funnel")) then
		if (GetPet():GetHealthPercentage() < 50) and (myHealth > 60) then
			if (GetPet():GetDistance() > 8) then
				PetFollow();
				self.waitTimer = GetTimeEX() + 500; 
				return true;
			end
			if (GetPet():GetDistance() < 20 and myMana > 10) then
				if (HasPet() and GetPet():GetHealthPercentage() < 70 and GetPet():GetHealthPercentage() > 0) then
					self.message = "Pet has lower than 70% HP, using health funnel...";
					if (IsMoving() or not IsStanding()) then StopMoving(); return true; end
					if (HasSpell('Health Funnel')) then CastSpellByName('Health Funnel'); end
					self.waitTimer = GetTimeEX() + 600; 
					return true;
				end
			end
		end
	end

	-- No rest / buff needed
	return false;
end

function script_warlock2:menu()

	if (CollapsingHeader("Warlock")) then
		wasClicked, script_warlock2.useImp = Checkbox("Use Imp", script_warlock2.useImp);
		wasClicked, script_warlock2.useVoidwalker = Checkbox("Use Voidwalker", script_warlock2.useVoidwalker);
		script_warlock2.drinkMana = SliderInt("Drink Mana", 0, 100, script_warlock2.drinkMana);
		script_warlock2.eatHealth = SliderInt("Eat Health", 0, 100, script_warlock2.eatHealth);
	end
end