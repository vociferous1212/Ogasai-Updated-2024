script_warlock2 = {

isSetup = false, message = "A Warlock Script", summonPetTimer = 0, immolateTimer = 0, corruptionTimer = 0, curseOfAgonyTimer = 0, useVoidwalker = false, useImp = false, drinkMana = 50, drinkHealth = 50, potionHealth = 10, potionMana = 10, addFeared = false, usingThisScript = false, waitTimer = 0,

}

function script_warlock2:setup()

	self.usingThisScript = true;
	self.waitTimer = GetTimeEX();
	self.immolateTimer = GetTimeEX();
	self.corruptionTimer = GetTimeEX();
	self.curseOfAgonyTimer = GetTimeEX();
	self.summonPetTime = GetTimeEX();
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
		self.corruptionTimer = GetTimeEX() + 2000;
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

	self.usingThisScript = true;

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
	local hasHealthstone = false;
	local hasSoulstone = false;

	local hasPet = false;
	local hasConsumeShadows = false;
	local hasSufferingSpell = false;
	local hasSacrificeSpell = false;

	--if (script_grind.enemyObj ~= nil and script_grind.enemyObj ~= 0) then
	--	myTarget = script_grind.enemyObj;
	--end

	if (GetPet() ~= 0 and GetPet() ~= nil) then
		hasPet = true;
		petHealth = GetPet():GetHealthPercentage();
		petMana = GetPet():GetManaPercentage();
	end

	if (hasPet) and (self.useVoid) then
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

	if (HasItem("Healthstone")) then
		hasHealthstone = true;
	end
	if (HasItem("Soulstone")) then
		hasSoulstone = true;
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

	if (hasPet) and (not self.useImp) and (self.useVoidwaler) and (localObj:HasBuff("Blood Pact")) and (HasItem("Soul Shard")) then
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
		self.message = "Pulling ".. myTarget:GetUnitName()..", "..myTarget:GetDistance().."";
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

	if (hasPet) and (self.useVoid) and (hasSacrificeSpell) and (myHealth <= 10 or GetPet():GetHealthPercentage() <= 5) then
		CastSpellByName("Sacrifice");
		script_warlock:setTimer(2);
	end

		-- we need to summon pet here

	if (PlayerHasTarget()) and (not localObj:IsStunned()) and (script_checkDebuffs:hasSilence()) and (localObj:HasRangedWeapon()) and (IsInCombat()) then
		if (not IsAutoCasting("Shoot")) then
			PetAttack();
			CastSpellByName("Shoot");
			script_warlock2:setTimer(0.2);
			return true;
		end
	end

	-- Use Healthstone
	if (myHealth < 30) and (IsInCombat()) and (hasHealthstone) then
		if (script_warlockEX:useHealthstones()) then
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
		return 4;
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
		CastSpellByName("Drain Soul", myTarget);
		script_warlock2:setTimer(1);
	return;
	end
	
	if (hasPet) and (myTarget:HasDebuff("Immolate")) or (myTarget:HasDebuff("Corruption")) or (myTarget:HasDebuff("Curse of Agony")) or (targetHealth <= 99) or (IsInCombat()) then
		PetAttack();
	end

	if (not IsInCombat()) and (not script_grind:isAnyTargetTargetingMe()) then

		if (HasSpell("Immolate")) and (not myTarget:HasDebuff("Immolate")) and (currentTime > self.immolateTimer) and (not IsMoving()) then
			myTarget:FaceTarget();
			script_warlock2:castImmolate(myTarget);
			script_warlock2:setTimer(2);
		end
		if (HasSpell("Corruption")) and (not myTarget:HasDebuff("Corruption")) and (currentTime > self.corruptionTimer) and (not IsMoving()) then
			myTarget:FaceTarget();
			script_warlock2:castCorruption(myTarget);
			self.corruptionTimer = currentTime + 2500;
			script_warlock2:setTimer(2);
		end
		if (HasSpell("Shadow Bolt")) and (myTarget:GetDistance() <= 27) and (myMana >= 20) and (not IsMoving()) then
			myTarget:FaceTarget();
			CastSpellByName("Shadow Bolt", myTarget);
			script_warlock2:setTimer(2);
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

		if (hasPet) and (self.useVoid) and (not IsSpellOnCD("Suffering")) and (script_grind:enemiesAttackingUs() >= 2) and (self.hasSufferingSpell) then
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
		if (hasPet) and (self.useVoid) and (script_grind.enemiesAttackingUs() == 1) then
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
		
		if (localObj:HasRangedWeapon()) then
		end
		if (HasSpell("Curse of Agony")) and (not myTarget:HasDebuff("Curse of Agony")) and (currentTime > self.curseOfAgonyTimer) then
			myTarget:FaceTarget();
			script_warlock2:castCurseOfAgony(myTarget);
			self.curseOfAgonyTimer = currentTime + 3000;
			script_warlock2:setTimer(2);
		end
		if (HasSpell("Corruption")) and (not myTarget:HasDebuff("Corruption")) and (currentTime > self.corruptionTimer) then
			myTarget:FaceTarget();
			script_warlock2:castCorruption(myTarget);
			self.corruptionTimer = currentTime + 2500;
			script_warlock2:setTimer(2);
		end
		if (HasSpell("Immolate")) and (not myTarget:HasDebuff("Immolate")) and (currentTime > self.immolateTimer) then
			myTarget:FaceTarget();
			self.immolateTimer = currentTime + 4000;
			script_warlock2:setTimer(2);
		end
		if (HasSpell("Shadow Bolt")) and (myTarget:GetDistance() <= 27) and (myMana >= 20) and (not IsMoving()) then
			myTarget:FaceTarget();
			CastSpellByName("Shadow Bolt", myTarget);
			script_warlock2:setTimer(2);
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

	if (GetPet() ~= 0 and GetPet() ~= nil) then
		petHealth = GetPet():GetHealthPercentage();
		petMana = GetPet():GetManaPercentage();
	end
end

function script_warlock2:menu()

	if (CollapsingHeader("Warlock")) then
		Text("Nothing here yet!");
	end
end