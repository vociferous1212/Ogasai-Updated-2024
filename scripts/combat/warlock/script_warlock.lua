script_warlock = {
	message = 'Warlock Combat Script',
	warlockMenu = include("scripts\\combat\\warlock\\script_warlockEX.lua"),
	warlockExtra2 = include("scripts\\combat\\warlock\\script_warlockEX2.lua"),
	warlockDOTS = include("scripts\\combat\\warlock\\script_warlockDOTS.lua"),
	drinkMana = 40,
	eatHealth = 55,
	potionHealth = 10,
	potionMana = 20,
	healthStone = {},
	numStone = 0,
	stoneHealth = 30,
	isSetup = false,
	fearTimer = 0,
	cooldownTimer = 0,
	addFeared = false,
	fearAdds = true,
	waitTimer = 0,
	useWand = true,
	isChecked = true,
	lifeTapHealth = 75,
	lifeTapMana = 80,
	soulShard = 0;
	useShadowBolt = false,
	useWandHealth = 35,
	useWandMana = 20,
	enableGatherShards = false,
	enableSiphonLife = true,
	enableCurseOfAgony = true,
	enableImmolate = true,
	enableCorruption = true,
	drainLifeHealth = 55,
	healPetHealth = 40,
	sacrificeVoid = true,
	sacrificeVoidHealth = 20,
	useUnendingBreath = false,
	alwaysFear = false,
	useDrainMana = false,
	hasPet = false,
	useVoid = false,
	useImp = false,
	useSuccubus = false,
	useFelhunter = false,
	wandHealthPreset = 10, -- preset to attack target with 10% HP using wand
	drainSoulHealthPreset = 20,
	hasSufferingSpell = false,
	hasConsumeShadowsSpell = false,
	hasSacrificeSpell = false,
	followTargetDistance = 100,
	rangeDistance = 35,
	followFeared = true,
	useCurseOfWeakness = false,
	useCurseOfTongues = false,
	useDeathCoil = false,
	hasHealthstone = false,
	varUsed = false,
	waitAfterCombat = false,
	feelingLucky = false,
	howLucky = 3,
	debuffCheck = 5,
	corruptionCastTime = 0,
}

function script_warlock:castImmolate(target)
	if (target ~= 0 and target ~= nil) then
		if (not script_warlock:targetHasImmolate(target)) then
			if (not targetObj:HasDebuff("Immolate")) then
				if (not IsCasting()) and (not IsChanneling()) then
					CastSpellByName("Immolate");
					return true;
				else
					return 4;
				end
			end
		end
	end
return false;
end
function script_warlock:castCorruption(target)
	if (target ~= 0 and target ~= nil) then
		if (not script_warlock:targetHasCorruption(target)) then
			if (not targetObj:HasDebuff("Corruption")) then
				if (not IsCasting()) and (not IsChanneling()) then
					target:FaceTarget();
					CastSpellByName("Corruption");
					return true;
				else
					return 4;
				end
			end
		end
	end
return false;
end

--if a target is targeting me and not my pet then send pet to attack
--only if 2 targets or only check 2 targets

function script_warlock:petAssistMe()
	local i, t = GetFirstObject();
	if (GetPet() ~= 0 and GetPet() ~= nil and script_warlockEX2:isPetActive()) and (script_grind.enemiesAttackingUs() <= 3) then
		while i ~= 0 do
			if t == 3 then
				if (script_grind:isTargetingMe(i)) and (not script_grind:isTargetingPet(i))
				and (not GetPet():GetUnitsTarget():GetGUID() ==  i:GetGUID()) then
					PetAttack(i);
				end
			end
		i, t = GetNextObject(i); 
		end
	end
end
-- need to make a sperate function to check
function script_warlock:targetHasImmolate(target)
	if (GetLocalPlayer():GetUnitsTarget() ~= 0 and GetLocalPlayer():GetUnitsTarget() ~= nil) then
		for i=0, self.debuffCheck do
			if (target:HasDebuff("Immolate")) then
				return true;
			end
		end
	end
return false;
end

-- might as well do it for the rest because it works
function script_warlock:targetHasCorruption(target)
	if (GetLocalPlayer():GetUnitsTarget() ~= 0 and GetLocalPlayer():GetUnitsTarget() ~= nil) then
		for i=0, self.debuffCheck do
			script_warlock.waitTimer = GetTimeEX() + 500;
			if (target:HasDebuff("Corruption")) then
				return true;
			end
		end
	end
return false;
end

-- checking for debuffs in a way that actually works
function script_warlock:targetHasCurseOfAgony(target)
		if (GetLocalPlayer():GetUnitsTarget() ~= 0 and GetLocalPlayer():GetUnitsTarget() ~= nil) then
			for i=0, self.debuffCheck do
				script_warlock.waitTimer = GetTimeEX() + 500;
				if (target:HasDebuff("Curse of Agony")) then
					return true;
				end
			end
		end
return false;
end

function script_warlock:cast(spellName, target)
	if (HasSpell(spellName)) then
		if (target:IsSpellInRange(spellName)) then
			if (not IsSpellOnCD(spellName)) then
				if (not IsAutoCasting(spellName)) then
					target:FaceTarget();
					target:TargetEnemy();
					return target:CastSpell(spellName);
				end
			end
		end
	end
	return false;
end

function script_warlock:petAttack()

	if (GetPet() ~= 0 and GetPet() ~= nil and GetPet():GetHealthPercentage() > 1) then
		if (script_warlock.useVoid or script_warlock.useImp or script_warlock.useSuccubus or script_warlock.useFelhunter) then
			PetAttack();
		end
	end

return true;
end

function script_warlock:getTargetNotFeared()
   	local unitsAttackingUs = 0; 
   	local currentObj, typeObj = GetFirstObject(); 
   	while currentObj ~= 0 do 
   		if typeObj == 3 then
			if (currentObj:CanAttack() and not currentObj:IsDead()) then
               			if ((script_grind:isTargetingMe(currentObj)
				or script_grind:isTargetingPet(currentObj))
				and not currentObj:HasDebuff('Fear')) then 
           		return currentObj;
              	 	end 
           	end 
       	end
        currentObj, typeObj = GetNextObject(currentObj); 
    end
	return nil;
end

function script_warlock:isAddFeared()
	local currentObj, typeObj = GetFirstObject(); 
	local localObj = GetLocalPlayer();
	while currentObj ~= 0 do 
		if typeObj == 3 then
			if (currentObj:HasDebuff("Fear")) then
				self.addFeared = true; 
				return true;
			else 
				self.addFeared = false;
			end
		end
		currentObj, typeObj = GetNextObject(currentObj); 
	end
    return false;
end

function script_warlock:fearAdd(targetObjGUID) 
	local currentObj, typeObj = GetFirstObject(); 
	local localObj = GetLocalPlayer();
	while currentObj ~= 0 do 
		if typeObj == 3 then
			if (currentObj:CanAttack() and not currentObj:IsDead()) and (not currentObj:GetCreatureType() == "Undead") then
				if (currentObj:GetGUID() ~= targetObjGUID) and (script_grind:isTargetingMe(currentObj) or script_grind:isTargetingPet(currentObj)) then
					if (not currentObj:HasDebuff("Fear") and currentObj:GetCreatureType() ~= 'Elemental' and not currentObj:IsCritter()) then
						if (currentObj:IsInLineOfSight()) then
							if (not script_grind.adjustTickRate) and (IsInCombat()) then
								script_grind.tickRate = 100;
								script_rotation.tickRate = 100;
							end
							if (script_warlock:cast('Fear', currentObj)) then 
								self.addFeared = true; 
								fearTimer = GetTimeEX() + 8000;
								return true; 
							end
						end
					end 
				end 
			end 
		end
        currentObj, typeObj = GetNextObject(currentObj); 
	end
    return false;
end

-- Run backwards if the target is within range
function script_warlock:runBackwards(targetObj, range) 
	local localObj = GetLocalPlayer();
 	if (targetObj ~= 0) and (not script_checkDebuffs:hasDisabledMovement()) then
 		local xT, yT, zT = targetObj:GetPosition();
 		local xP, yP, zP = localObj:GetPosition();
 		local distance = targetObj:GetDistance();
 		local xV, yV, zV = xP - xT, yP - yT, zP - zT;	
 		local vectorLength = math.sqrt(xV^2 + yV^2 + zV^2);
 		local xUV, yUV, zUV = (1/vectorLength)*xV, (1/vectorLength)*yV, (1/vectorLength)*zV;		
 		local moveX, moveY, moveZ = xT + xUV*20, yT + yUV*20, zT + zUV;		
 		if (distance < range and targetObj:IsInLineOfSight()) then
 			script_navEX:moveToTarget(localObj, moveX, moveY, moveZ);
			if (IsMoving()) then
				self.waitTimer = GetTimeEX() + 1500;
				JumpOrAscendStart();
			end
 			return true;
 		end
	end
	return false;
end

function script_warlock:setup()

	self.waitTimer = GetTimeEX();
	self.fearTimer = GetTimeEX();
	self.cooldownTimer = GetTimeEX();

	local localObj = GetLocalPlayer();
	local localLevel = localObj:GetLevel();

	if (localLevel == 10) then
		self.corruptionCastTime = 400;
	elseif (localLevel == 11) then
		self.corruptionCastTime = 800;
	elseif (localLevel == 12) then
		self.corruptioncastTime = 1200;
	elseif (localLevel == 13) then
		self.corruptionCastTime = 1600;
	elseif (localLevel == 14) then
		self.corruptionCastTime = 2000;
	end

	if (not localObj:HasRangedWeapon()) then
		self.useWand = false;
	end

	if (GetNumPartyMembers() >= 1) then
		self.fearAdds = false;
		self.useImp = true;
		self.healPetHealth = 20;
		self.drainLifeHealth = 20;
		self.wandHealthPreset = 5;
		self.drainSoulHealthPreset = 10;
		self.waitAfterCombat = false;
		
	end

	if (GetNumPartyMembers() < 1) then
		if (not HasSpell("Summon Voidwalker")) and (HasSpell("Summon Imp")) then
			self.useImp = true;
			self.useVoid = false;
			self.useSuccubus = false;
			self.useFelhunter = false;
			self.hasPet = false;
		elseif (HasSpell("Summon Voidwalker")) then
			self.useImp = false;
			self.useVoid = true;
			self.useSuccubus = false;
			self.useFelhunter = false;
			self.hasPet = false;
		elseif (not HasSpell("Summon Imp")) then
			self.useImp = false;
			self.useVoid = false;
			self.useSuccubus = false;
			self.useFelhunter = false;
			self.hasPet = false;
		-- elseif (HasSpell("Summon Succubus")) then
		-- 	self.useSuccubus = true;
		-- 	self.useImp = false;
		-- 	self.useVoid = false;
		-- elseif ("HasSpell("Summon Felhunter")) then
		-- 	self.useSuccubus = false;
		-- 	self.useImp = false;
		-- 	self.useVoid = false;
		--	self.useFelhunter = true;
		end
	end
		
	if (not localObj:HasRangedWeapon()) then
		self.useShadowBolt = true;
	end

	self.isSetup = true;
end

function script_warlock:draw()
	local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition());
	if (onScreen) then
		if (script_grind.adjustText) and (script_grind.drawEnabled) then
			tX = tX + script_grind.adjustX;
			tY = tY + script_grind.adjustY;
		end

	DrawText(self.message, tX+230, tY+9, 255, 250, 205);
	else
		if (script_grind.adjustText) and (script_grind.drawEnabled) then
			tX = tX + script_grind.adjustX;
			tY = tY + script_grind.adjustY;
		end

	DrawText(self.message, 25, 185, 255, 250, 205);
	end
end

--[[ error codes: 	0 - All Good , 
			1 - missing arg , 
			2 - invalid target , 
			3 - not in range, 
			4 - do nothing , 
			5 - targeted player pet/totem  ]]--

function script_warlock:run(targetGUID)
	
	if(not self.isSetup) then
		script_warlock:setup();
	end

	if (self.enableGatherShards) then
		self.alwaysFear = false;
	end

	local localObj = GetLocalPlayer();
	local localMana = localObj:GetManaPercentage();
	local localHealth = localObj:GetHealthPercentage();
	local localLevel = localObj:GetLevel();
	local playerHasTarget = GetLocalPlayer():GetUnitsTarget();

	if (GetPet() ~= 0) then
		self.hasPet = true;
		local petHasTarget = GetPet():GetUnitsTarget();
	elseif (GetPet() == 0 or (GetPet() ~= 0 and GetPet():GetHealthPercentage() <= 1)) then
		self.hasPet = false;
	end

	-- Check: If the pet is void and has spell Consume Shadows
	if (self.hasPet) and (self.useVoid) and (GetPet() ~= 0) then
		name, __, __, __, __, __, __ = GetPetActionInfo(6);
		if (name == "Consume Shadows") then 
			self.hasConsumeShadowsSpell = true;
		end
	end
	
	-- Check: If the pet is void and has spell suffering
	if (self.hasPet) and (self.useVoid) and (GetPet() ~= 0) then
		name, __, __, __, __, __, __ = GetPetActionInfo(7);
		if (name == "Suffering") then 
			self.hasSufferingSpell = true;
		end
	end

	-- Check: If the pet is void and has spell sacrifice
	if (self.hasPet) and (self.useVoid) and (GetPet() ~= 0) then
		name, __, __, __, __, __, __ = GetPetActionInfo(5);
		if (name == "Sacrifice") then 
			self.hasSacrificeSpell = true;
		end
	end

	-- don't attack dead targets
	if (localObj:IsDead()) then
		return 0;
	end

	-- wait for pet health low level
	if (HasPet() and GetPet():GetHealthPercentage() > 1 and GetPet():GetHealthPercentage() < 75) and (not IsInCombat()) and (not HasSpell("Health Funnel")) then
		self.message = "Waiting for pet health > 75";
		return 4;
	end

	-- stuck in combat
	if (self.waitAfterCombat) and (self.hasPet) and (IsInCombat()) and (GetPet() ~= 0) then
		if (not PlayerHasTarget()) and (not PetHasTarget()) and (GetNumPartyMembers() < 1) and (script_vendor.status == 0) then
			AssistUnit("pet");
			self.message = "No Target - stuck in combat! WAITING!";
			return 4;
		end
	end


	-- force bot to attack pets target
	if (GetNumPartyMembers() == 0) and (self.waitAfterCombat) and (IsInCombat()) and (GetPet() ~= 0 and GetPet():GetHealthPercentage() > 1) and (playerHasTarget == 0) and (self.hasPet) then
		if (petHasTarget ~= 0) then
			if (GetPet():GetDistance() > 10) then
				AssistUnit("pet");
				PetFollow();
			end
		elseif (petHasTarget == 0) then
			AssistUnit("pet");
			self.message = "Stuck in combat! WAITING!";
			return 4;
		end
	end

	-- dismiss imp if we have it for some reason and we don't want it
	if (not IsInCombat()) and (GetPet() ~= 0 and GetPet() ~= nil) and (self.useVoid or self.useSuccubus or self.useFelhunter or not self.useImp) then
		if (localObj:HasBuff("Blood Pact")) then
			PetDismiss();
		end
	end

	-- Assign the target 
	targetObj = GetGUIDObject(targetGUID);

	if (not IsInCombat() and IsMoving()) then
		self.message = "Pulling " .. targetObj:GetUnitName() .. "...";
	end

	-- clear target
	if(targetObj == 0 or targetObj == nil or targetObj:IsDead()) then
		ClearTarget();
		return 2;
	end

	-- Check: if we target player pets/totems
	if (GetTarget() ~= 0) and (GetPet() ~= 0) then
		if (GetTarget():GetGUID() ~= GetLocalPlayer():GetGUID())
		and (GetTarget():GetGUID() ~= GetPet():GetGUID()) then
			if (UnitPlayerControlled("target")) then 
				script_grind:addTargetToBlacklist(targetObj:GetGUID());
				return 5; 
			end
		end
	end 

	-- Check: Do nothing if we are channeling, casting
	if (IsChanneling() or IsCasting()) then
		return 4;
	end

if (self.useVoid or self.useImp or self.useSuccubus or self.useFelhunter) and ((GetPet() == 0) or ((GetPet() ~= 0 and GetPet():GetHealthPercentage() < 1) and (HasSpell("Summon Imp")) and ( (localMana >= 45)) or (localObj:HasBuff("Fel Domination") and localMana >= 30) )) then
		if (IsMoving()) then
			StopMoving();
			return true;
		end
		if (self.useImp or self.useVoid or self.useSuccubus or self.useFelhunter) and (not script_warlockEX2:isPetActive()) and (not IsCasting()) and (not IsChanneling()) and (not localObj:HasBuff("Blood Pact")) then
			if (script_warlockEX2:summonPet()) then
				self.waitTimer = GetTimeEX() + 15000;
				script_grind:setWaitTimer(15000);
				return 4;
			end
			return 4;
		end
	end

	-- sacrifice voidwalker low health
	if (GetPet() ~= 0 and GetPet():GetHealthPercentage() > 1) then
		if (self.useVoid) and (self.hasSacrificeSpell) and (self.sacrificeVoid) and (localHealth <= self.sacrificeVoidHealth or GetPet():GetHealthPercentage() <= self.sacrificeVoidHealth) then
			if (not script_grind.adjustTickRate) then
			script_grind.tickRate = 100;
			end
			CastSpellByName("Sacrifice");
			self.waitTimer = GetTimeEX() + 1500;
			self.hasPet = false;
			return 0;
		end
	end

	-- resummon when sacrifice is active
	if (not self.HasPet) and (GetPet == 0) or (GetPet() ~= 0 and GetPet():GetHealthPercentage() <= 1) then
		if (self.useVoid) and (self.sacrificeVoid) and (localObj:HasBuff("Sacrifice")) and (not self.hasPet) and (localMana >= 35) then
			if (not script_grind.adjustTickRate) then
			script_grind.tickRate = 100;
			end
			if (CastSpellByName("Summon Voidwalker")) then
			self.waitTimer = GetTimeEX() + 12000;
			script_grind:setWaitTimer(1200);
			self.hasPet = true;
			return true;
			end
		end
	end

	if (GetPet() ~= 0) and (GetPet():GetHealthPercentage() > 1) then
		if (IsInCombat()) and (not targetObj:IsInLineOfSight() or not GetPet():IsInLineOfSight()) then
			PetFollow();
			return 3;

		end
	end

	if (GetPet() ~= 0) then
		local petHasTarget = GetPet():GetUnitsTarget();
	end
		local playerHasTarget = GetLocalPlayer():GetUnitsTarget();

	-- force bot to attack pets target
	if (GetNumPartyMembers() == 0) and (self.waitAfterCombat) and (IsInCombat()) and (GetPet() ~= 0 and GetPet():GetHealthPercentage() > 1) and (playerHasTarget == 0) and (self.hasPet) then
		if (petHasTarget ~= 0) then
			if (GetPet():GetDistance() > 10) then
				AssistUnit("pet");
				PetFollow();
			end
		elseif (petHasTarget == 0) then
			AssistUnit("pet");
			self.message = "Stuck in combat! WAITING!";
			return 4;
		end
	end

	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(350, 900);

		if (IsMoving()) or (not IsInCombat()) and (not localObj:IsCasting()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) or (localObj:IsCasting()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving()) or (localObj:IsCasting()) then
			script_grind.tickRate = tickRandom;
		end
	end

	-- check for silence and use wand
	if (targetObj ~= 0 and targetObj ~= nil) and (not localObj:IsStunned()) and (script_checkDebuffs:hasSilence()) and (localObj:HasRangedWeapon()) and (IsInCombat()) then
		if (not IsAutoCasting("Shoot")) then
			script_warlock:petAttack();
			targetObj:FaceTarget();
			CastSpellByName("Shoot");
			self.waitTimer = GetTimeEX() + 250; 
			return true;
		end
	end

	-- dismount before combat
	if (IsMounted()) then
		DisMount();
	end


	-- Use Healthstone
	if (localHealth < 30) and (IsInCombat()) and (self.hasHealthstone) then
		if (script_warlockEX:useHealthstones()) then
			self.hasHealthstone = false;
		end
	end

	--Valid Enemy
	if (targetObj ~= 0 and targetObj ~= nil) and (not localObj:IsStunned()) and (not script_checkDebuffs:hasSilence()) then

		if (IsInCombat()) and (script_grind.skipHardPull) and (GetNumPartyMembers() == 0) then
			if (script_checkAdds:checkAdds()) then
				script_om:FORCEOM();
				return true;
			end
		end

		-- in group with a mage? run backwards!
		if (GetNumPartyMembers() >= 1) then
			if (targetObj:HasDebuff("Frost Nova")) or (targetObj:HasDebuff("Frostbite")) then
				-- Run backwards if we are too close to the target
				if (targetObj:GetDistance() <= 7) then 
					if (script_warlock:runBackwards(targetObj,8)) then 
						return 4; 
					end 
				end
			end
		end

		-- Cant Attack dead targets
		if (targetObj:IsDead() or not targetObj:CanAttack()) then
			ClearTarget();
			return 2;
		end
		
		-- stand if sitting
		if (not IsStanding()) then
			JumpOrAscendStart();
		end

		-- set target health
		targetHealth = targetObj:GetHealthPercentage();

		if (targetObj:GetDistance() < 35) then
				targetObj:AutoAttack();
		end

		-- use shadowbolt on more than 1 target for increased survivability
		if (IsInCombat()) and (script_grind:enemiesAttackingUs(10) > 1) and (self.useWand) and (not self.useShadowBolt) and (localMana >= 15) then
			self.useWand = false;
			self.useShadowBolt = true;
			self.varUsed = true;
		end
		if (self.varUsed and not IsInCombat() or script_grind:enemiesAttackingUs() < 2) or (localMana < 15 and self.varUsed) then
			self.useWand = true;
			self.useShadowBolt = true;
			self.varUsed = false;
		end	

		-- check line of sight
		if (not targetObj:IsInLineOfSight()) or (targetObj:GetDistance() > 32) then
			return 3;
		end

			-- level 1 - 4
			if (not HasSpell("Corruption")) and (not IsInCombat()) then
				if (not HasSpell("Summon Imp")) and (localMana > 25) and (targetObj:IsInLineOfSight())  and (not IsMoving()) then
						targetObj:FaceTarget();
					if (Cast('Shadow Bolt', targetObj)) then
						targetObj:FaceTarget();
						self.waitTimer = GetTimeEX() + 2350;
					end
				end
				if (HasSpell("Summon Imp")) and (localMana > 25) and (targetObj:IsInLineOfSight()) and (not script_warlock:targetHasImmolate(targetObj)) and (not IsMoving()) then
					if (IsMoving()) then
						StopMoving();
						targetObj:FaceTarget();
						script_warlock:petAttack();
					end
		
					if (not IsMoving()) then
						targetObj:FaceTarget();
					end
					if (not script_warlock:targetHasImmolate(targetObj)) and (not IsMoving()) then
						if (not CastSpellByName("Immolate")) then
							self.waitTimer = GetTimeEX() + 2800;
							script_grind:setWaitTimer(2800);
						return 4;
						end
					return 4;
					end
				end
			end

				-- level 1 - 4
			if (not HasSpell("Summon Imp")) and (localMana > 25) and (not IsInCombat()) then
				CastSpellByName('Shadow Bolt', targetObj);
				return 0;
			end
			if (HasSpell("Summon Imp")) and (not HasSpell("Corruption")) and (not IsInCombat()) and (not IsMoving()) then
				if (not script_warlock:targetHasImmolate(targetObj)) then
					if (IsMoving()) then
						StopMoving();
						return true;
					end
					if (not CastSpellByName("Immolate", targetObj)) then
						script_grind:setWaitTimer(2200);
						self.waitTimer = GetTimeEX() + 2200;
						return 4;
					end
				return 4;
				end
			end


			-- nav move to target causing crashes on follower
		-- move to cancel Drain Life when we get Nightfall buff
		if (GetNumPartyMembers() < 1) then
			if (GetTarget() ~= 0 and self.hasPet) and (HasSpell("Drain Life")) then	
				if (GetTarget():HasDebuff("Drain Life") and localObj:HasBuff("Shadow Trance")) then
				local _x, _y, _z = localObj:GetPosition();
					script_navEX:moveToTarget(localObj, _x + 1, _y, _z); 
				end
			end
		end

	

	

		-- START OF COMBAT PHASE

		-- Opener - not in combat pulling target
		if (not IsInCombat()) then
			self.message = "Pulling " .. targetObj:GetUnitName() .. "...";
			
			-- Opener check range of ALL SPELLS
				
			if (not targetObj:IsSpellInRange("Shadow Bolt")) or (not targetObj:IsInLineOfSight()) then
				return 3;
			end

			-- if pet goes too far then recall
			if (GetPet() ~= 0 and self.hasPet and GetPet():GetHealthPercentage() > 1) and (self.useVoid or self.useImp or self.useSuccubus or self.useFelhunter) and (GetPet():GetDistance() > 40) then
				PetFollow();
			end

			-- Dismount
			if (IsMounted()) then
				DisMount(); 
			end

			-- check pet
			if(GetPet() ~= 0) then 
				self.hasPet = true; 
			elseif (GetPet() == 0 or (GetPet() ~= 0 and GetPet():GetHealthPercentage() <= 1)) then
					self.hasPet = false;
			end

			-- spells to pull

			-- Amplify Curse on CD
			if (HasSpell("Amplify Curse")) and (not IsSpellOnCD("Amplify Curse")) and (GetLocalPlayer():GetUnitsTarget() ~= 0) then
				CastSpellByName("Amplify Curse");
				script_warlock:petAttack();
			end

			if (HasSpell("Siphon Life")) and (self.enableSiphonLife) and (GetLocalPlayer():GetUnitsTarget() ~= 0) then
					targetObj:FaceTarget();
					script_warlock:petAttack();
					self.message = "Stacking DoT's";
				if (Cast("Siphon Life", targetObj)) then
					script_warlock:petAttack();
					self.waitTimer = GetTimeEX() + 1800; 
					script_grind:setWaitTimer(650);
				end
			end

			--if (HasSpell("Curse of Agony")) and (self.enableCurseOfAgony) and (GetLocalPlayer():GetUnitsTarget() ~= 0) and (not self.useCurseOfWeakness) and (not self.useCurseOfTongues) then
			--	targetObj:FaceTarget();
			--	script_warlock:petAttack();
			--	self.message = "Stacking DoT's";
			--	if (Cast('Curse of Agony', targetObj)) then 
			--		script_warlock:petAttack();
			--		self.waitTimer = GetTimeEX() + 1800;
			--		script_grind:setWaitTimer(1500);
			--	end
			--end

			-- don't you laugh at it :( it works
			if (HasSpell("Corruption")) and (not IsInCombat()) and (not IsMoving()) and (self.enableCorruption) and (not script_warlock:targetHasCorruption(targetObj)) and (targetObj:IsInLineOfSight()) and (not IsCasting()) and (not IsChanneling()) then
					if (IsMoving()) then
						StopMoving();
						return true;
					end
					self.waitTimer = GetTimeEX() + 750;
					script_grind:setWaitTimer(750);
					self.tickRate = 1750;
					script_rotation.tickRate = 1950;
					script_rotation.waitTimer = GetTimeEX() + 1950;
				if (not IsMoving()) and (not script_warlock:targetHasCorruption(targetObj)) then
					script_warlock.petAttack();
					targetObj:FaceTarget();
					if not (IsCasting()) and (not IsChanneling()) then
						if (script_warlock:castCorruption(targetObj)) then
							script_warlock.petAttack();
							targetObj:FaceTarget();
							self.waitTimer = GetTimeEX() + 3500 - self.corruptionCastTime;
							script_grind:setWaitTimer(3500 - self.corruptionCastTime);
							return 4;
						else
							return 4;
						end
					return 4;
					end
				end				
			end

			if (HasSpell("Shadow Bolt")) and (GetLocalPlayer():GetUnitsTarget() ~= 0) and (targetObj:GetDistance() <= 28) then
				script_warlock:petAttack();
				self.message = "Pulling Target";
				targetObj:FaceTarget();
				if (IsMoving()) then
					StopMoving();
					return true;
				end
				if (CastSpellByName("Shadow Bolt", targetObj)) then
					self.waitTimer = GetTimeEX() + 2550;
					script_grind:setWaitTimer(2550);
					return 0;
				end
			end

			if (not targetObj:IsInLineOfSight()) then -- check line of sight
				self.message = "Moving into Line of Sight of target";
				return 3;
			end

			
			-- IN COMBAT

			-- Combat
		else	

			self.message = "Killing " .. targetObj:GetUnitName() .. "...";

			if (GetPet() ~= 0) then
		local petHasTarget = GetPet():GetUnitsTarget();
	end
		local playerHasTarget = GetLocalPlayer():GetUnitsTarget();

-- Check: Do nothing if we are channeling, casting
	if (IsChanneling() or IsCasting() or self.waitTimer > GetTimeEX()) then
		if (IsChanneling()) or (IsCasting()) then
		self.waitTimer = GetTimeEX() + 500
		end
		return 4;
	end

-- Check: Do we have the right target (in UI) ??
				if (GetTarget() ~= 0 and GetTarget() ~= nil) then
					if (GetTarget():GetGUID() ~= targetObj:GetGUID()) then
						ClearTarget();
						self.waitTimer = GetTimeEX() + 1500;
						script_grind:setWaitTimer(1500);
						targetObj = 0;
						return 0;
					end
				end


	-- force bot to attack pets target
	if (GetNumPartyMembers() == 0) and (self.waitAfterCombat) and (IsInCombat()) and (GetPet() ~= 0 and GetPet():GetHealthPercentage() > 1) and (playerHasTarget == 0) and (self.hasPet) then
		if (petHasTarget ~= 0) then
			if (GetPet():GetDistance() > 10) then
				AssistUnit("pet");
				PetFollow();
			end
		elseif (petHasTarget == 0) then
			AssistUnit("pet");
			self.message = "Stuck in combat! WAITING!";
			return 4;
		end
	end

			if (self.feelingLucky) then
				if (script_grind:enemiesAttackingUs() < self.howLucky)
					--and (localMana >= 50)
					and (localHealth >= 65)
					and (localMana > 20)
				then
					if (not script_warlock:targetHasCorruption(targetObj) and not targetObj:HasDebuff("Corrpution")) then
						script_warlockDOTS:corruption(targetObj);
						ClearTarget();
					end
					if (HasSpell("Curse of Agony")) and (not script_warlock:targetHasCurseOfAgony(targetObj) and not targetObj:HasDebuff("Curse of Agony")) then
						script_warlockDOTS:curseOfAgony(targetObj);
						ClearTarget();
					end
					if (not script_warlock:targetHasImmolate(targetObj) and not targetObj:HasDebuff("Immolate")) then
						script_warlockDOTS:immolate(targetObj);
						ClearTarget();
					end
				return;
				end
			end

			-- causes crashing after combat phase?
			-- follow target if single target fear is active and moves out of spell ranged
			if (self.followFeared) and (self.alwaysFear) and (targetObj:HasDebuff("Fear")) and (not targetObj:IsSpellInRange("Shoot")) then
				return 3;
			end

			

			-- gather soul shards
			if (not script_warlockEX2:hasSoulShard()) then
				if (targetHealth <= 20) and (HasSpell("Drain Soul")) and (targetObj:GetDistance() <= 26) and (IsInCombat()) then
					if (not script_grind.adjustTickRate) then
						script_grind.tickRate = 135;
					end
					CastSpellByName('Drain Soul', targetObj);
					self.message = "Gathering Soulshards";
					return;
				end
			end

			if (IsInCombat()) and (HasSpell("Fel Domination")) and (not IsSpellOnCD("Fel Domination")) and (GetPet() == 0 or (GetPet() ~= 0 and GetPet():GetHealthPercentage() < 1)) and (localMana > 25) and (self.useVoid or self.useImp or self.useSuccubus or self.useFelhunter) then
				CastSpellByName("Fel Domination");
				self.waitTimer = GetTimeEX() + 1500;
				return 0;
			end
		
			if (GetPet() == 0 or (GetPet() ~= 0 and GetPet():GetHealthPercentage() <= 1)) and (HasSpell("Summon Warlock")) then
				if (IsMoving()) then
					StopMoving();
					return true;
				end
				if (not script_warlockEX2:isPetActive()) and (not IsCasting()) and (not IsChanneling()) and (not localObj:HasBuff("Blood Pact")) then
					if (script_warlockEX2:summonPet()) then
						self.waitTimer = GetTimeEX() + 15000;
						script_grind:setWaitTimer(15000);
					return 4;
					end
				return 4;
				end

				if (not script_grind.adjustTickRate) and (IsInCombat()) then
				script_grind.tickRate = 100;
				end
			end

			-- recall pet if too far > 30
			if (GetPet() ~= 0 and GetPet():GetHealthPercentage() > 1) and (self.useVoid or self.useImp or self.useSuccubus or self.useFelhunter) and (GetPet():GetDistance() > 25) then
				self.message = "Recalling Pet - too far!";
				PetFollow();
			end

			-- Set the pet to attack
			if (GetPet() ~= 0 and GetPet():GetHealthPercentage() > 1) and (self.useVoid or self.useImp or self.useSuccubus or self.useFelhunter) and (targetHealth < 99 or script_warlock:targetHasCurseOfAgony(targetObj) or 
				script_warlock:targetHasCorruption(targetObj)) or (script_grind:isTargetingMe(targetObj)) and (not targetObj:HasDebuff("Fear")) then
				script_warlock:petAttack();
			end

			-- pet assist me if i am being targeted by more than 1 npc
		--	if (script_warlockEX2:isPetActive()) and (GetPet() ~= 0 and GetPet() ~= nil) then
		--		script_warlock:petAssistMe();
		--	end

			-- check pet
			if(GetPet() ~= 0) then 
				self.hasPet = true; 
			
			elseif (GetPet() == 0 or (GetPet() ~= 0 and GetPet():GetHealthPercentage() <= 1)) then
				self.hasPet = false;
			end

			-- Dismount
			if(IsMounted()) then 
				DisMount();
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

			-- death coil target targeting you
			if (self.useDeathCoil) and (HasSpell("Death Coil")) and (not IsSpellOnCD("Death Coil")) and (script_grind:isTargetingMe(targetObj)) then
				if (CastSpellByName("Death Coil", targetObj)) then
					self.waitTimer = GetTimeEC() + 1500;
					return 0;
				end
			end

			-- death coil pet low health
			if (GetPet() ~=0 and GetPet():GetHealthPercentage() > 1) and (HasSpell("Death Coil")) and (not IsSpellOnCD("Death Coil")) and (GetPet():GetHealthPercentage() <= 35) then
				if (CastSpellByName("Death Coil", targetObj)) then
					self.waitTimer = GetTimeEC() + 1500;
					return 0;
				end
			end

			-- voidwalker taunt
			if (GetPet() ~= 0 and GetPet():GetHealthPercentage() > 1) and (self.useVoid) and (not IsSpellOnCD("Suffering")) and (script_grind:enemiesAttackingUs(5) >= 2) and (self.hasSufferingSpell) then
				if (CastSpellByName("Suffering")) then
					self.waitTimer = GetTimeEX() + 250;
				end
			end

			-- check pet
			if(GetPet() ~= 0) then 
				self.hasPet = true; 
			elseif (GetPet() == 0) or (GetPet():GetHealthPercentage() < 1) then
				self.hasPet = false;
			end

			-- resummon when sacrifice is active
			if (self.useVoid) and (self.sacrificeVoid) and (localObj:HasBuff("Sacrifice")) and (not self.hasPet) and (localMana > 35) then
				if (not self.hasPet) then
					if (CastSpellByName("Summon Voidwalker")) then
						self.hasPet = true;
						return 0;
					end
				end
			end

			-- Dark Pact instead of lifetap in combat
			if (HasSpell("Dark Pact")) and (localMana < 40) and (GetPet() ~= 0 and self.hasPet and GetPet():GetHealthPercentage() > 1) and (self.useImp or self.useVoid or self.useSuccubus or self.useFelhunter) and (not IsLooting()) then
				if (GetPet():GetManaPercentage() > 20) and (not IsSpellOnCD("Dark Pact")) then
					if (CastSpellByName("Dark Pact", localObj)) then
						self.message = "Casting Dark Pact instead of drinking!";
						return true;
					end
				end
			end

			-- Check: If we get Nightfall buff then cast Shadow Bolt
			if (localObj:HasBuff("Shadow Trance")) then
				if (Cast('Shadow Bolt', targetObj)) then
					return 0;
				end
			end

			if (HasSpell("Fear")) and (localMana >= 10) and (localHealth <= 30) and (script_grind:isTargetingMe(targetObj)) and (not targetObj:HasDebuff("Fear")) and (not targetObj:GetCreatureType() == "Undead") then
				CastSpellByName("Fear", targetObj);
				self.waitTimer = GetTimeEX() + 1500;
				return 0;
			end

			-- Fear single Target
			if (self.alwaysFear) and (HasSpell("Fear")) and (not targetObj:HasDebuff("Fear")) and (targetObj:GetHealthPercentage() > 40) and (targetObj:GetCreatureType() ~= "Undead") then
				if (targetObj:GetCreatureType() ~= "Undead") and (not targetObj:HasDebuff("Fear")) then
					CastSpellByName("Fear", targetObj);
					if (not script_grind.adjustTickRate) and (IsInCombat()) then
					script_grind.tickRate = 135;
					end
					self.waitTimer = GetTimeEX() + 1900;
					return;
				end
			end

			-- Check if add already feared
			if (not script_warlock:isAddFeared() and not (self.fearTimer < GetTimeEX())) then
				self.addFeared = false;
			end

			-- Check: Fear add
			if (targetObj ~= nil) and (self.fearAdds) and (script_grind:enemiesAttackingUs(10) > 1) and (HasSpell('Fear')) and (not self.addFeared) and (self.fearTimer < GetTimeEX()) then
				self.message = "Fearing add...";
				script_warlock:fearAdd(targetObj:GetGUID());
				if (not script_grind.adjustTickRate) and (IsInCombat()) then
					script_grind.tickRate = 250;
				end
			end

			-- Check: Sort target selection if add is feared
			if (self.addFeared) then
				if(script_grind:enemiesAttackingUs(10) >= 1 and targetObj:HasDebuff('Fear')) then
					if (not script_grind.adjustTickRate) and (IsInCombat()) then
						script_grind.tickRate = 250;
					end
					ClearTarget();
					targetObj = script_warlock:getTargetNotFeared();
					targetObj:AutoAttack();
				end
			end

			-- Howling Terror Fear
			if (HasSpell("Howling Terror")) and (not IsSpellOnCD("Howling Terror")) and (script_grind:enemiesAttackingUs(10) >= 3) then
				if (localHealth > 25) then
					CastSpellByName("Howling Terror");
					self.waitTimer = GetTimeEX() + 1500;
					return 0;
				end
			end
			
			-- Check: If we don't have a soul shard, try to make one
			if (targetHealth < self.drainSoulHealthPreset) and (targetHealth > 3) and (HasSpell("Drain Soul")) and (not script_warlockEX2:hasSoulShard()) then
				if (Cast('Drain Soul', targetObj)) then
					return 0;
				end
			end

				-- nav move to target causing crashes on follower
			-- Check: Heal the pet if it's below 50% and we are above 50%
			if (GetNumPartyMembers() < 1) then
				if (GetPet() ~= 0) and (self.useVoid or self.useImp or self.useSuccubus or self.useFelhunter) and (GetPet():GetHealthPercentage() > 1 and GetPet():GetHealthPercentage() <= self.healPetHealth) and (HasSpell("Health Funnel")) and (localHealth > 60) and (not script_grind:isTargetingMe(script_grind.enemyObj)) and (script_warlock:targetHasCurseOfAgony(targetObj)) and (script_warlock:targetHasCorruption(targetObj))  then
					if (GetPet():GetDistance() >= 20 or not GetPet():IsInLineOfSight()) and (self.hasPet) then
						self.message = "Healing pet!";
						local _xXX, _yYY, _zZZ = GetPet():GetPosition();
						script_navEX:moveToTarget(localObj, _xXX, _yYY, _zZZ); 
						self.waitTimer = GetTimeEX() + 600;
						return 0;
					else
						StopMoving();
					end
					CastSpellByName("Health Funnel"); 
					return 0;
				end
			end

			-- if pet goes too far then recall
			if (GetPet() ~= 0 and GetPet():GetHealthPercentage() > 1) and (self.useVoid or self.useImp or self.useSuccubus or self.useFelhunter) and (GetPet():GetDistance() > 40) then
				PetFollow();
			end
		


			-- Wand if low mana
			if (localMana <= 5) and (localObj:HasRangedWeapon()) and (not self.enableGatherShards) and (GetLocalPlayer():GetUnitsTarget() ~= 0) then
				if (not IsAutoCasting("Shoot")) and (not IsMoving()) then
					targetObj:FaceTarget();
					targetObj:CastSpell("Shoot");
					self.waitTimer = GetTimeEX() + 250; 
					return true;
				end
			end
			
			-- Check: Keep Siphon Life up (30 s duration)
			if (self.enableSiphonLife) then
				if (not targetObj:HasDebuff("Siphon Life") and targetHealth > 20) then
					if (Cast('Siphon Life', targetObj)) then
						targetObj:FaceTarget();
						self.waitTimer = GetTimeEX() + 1600;
						return 0;
					end
				end
			end

			-- life tap in combat
			if HasSpell("Life Tap") and not IsSpellOnCD("Life Tap") and localHealth > 35 and localMana < 15 then
				if (CastSpellByName("Life Tap")) then
					self.waitTimer = GetTimeEX() + 1600;
					self.message = "Using Life Tap!";
					return;
				end
			end

			-- Drain Mana on low mana
			if (HasSpell("Drain Mana")) and (self.useDrainMana) and (targetObj:GetCreatureType() ~= "Mechanic") and (targetObj:GetManaPercentage() >= 25) and (localMana <= 65) then
				self.message = "Casting Drain Mana";
				if (targetObj:GetDistance() < 20) then
					if (IsMoving()) then StopMoving(); 
						return true; 
					end
					if (Cast('Drain Mana', targetObj)) then 
						return true; 
					end
				else
					script_navEX:moveToTarget(localObj, targetObj:GetPosition()); 
					self.waitTimer = GetTimeEX() + 600;
				end
			end

			-- check pet
			if(GetPet() ~= 0) then 
				self.hasPet = true; 
			elseif (GetPet() == 0 or (GetPet() ~= 0 and GetPet():GetHealthPercentage() <= 1)) then
				self.hasPet = false;
			end

				-- nav move to target causing crashes on follower
			-- Check: Heal the pet if it's below 50% and we are above 50%
			if (GetNumPartyMembers() < 1) and (HasSpell("Health Funnel")) and (localHealth > 60) and (script_warlock:targetHasCurseOfAgony(targetObj))
				and (script_warlock:targetHasCorruption(targetObj)) then
				if (GetPet() ~= 0 and GetPet():GetHealthPercentage() > 1)
				and (self.useVoid or self.useImp or self.useSuccubus or self.useFelhunter)
				and (GetPet():GetHealthPercentage() <= self.healPetHealth)
				and (not script_grind:isTargetingMe(script_grind.enemyObj))
				then
					self.message = "Healing pet with Health Funnel";
					if (GetPet():GetDistance() >= 20 or not GetPet():IsInLineOfSight()) then
						script_navEX:moveToTarget(localObj, GetPet():GetPosition()); 
						self.waitTimer = GetTimeEX() + 600;
					else
						StopMoving();
					end
					CastSpellByName("Health Funnel"); 
					return 0;
				end
			end

			-- keep curse of weakness up
			if (not IsMoving()) and (self.useCurseOfWeakness) and (HasSpell("Curse of Weakness")) and (not targetObj:HasDebuff("Curse of Weakness")) and (not targetObj:HasDebuff("Curse of Toungues")) and (not script_warlock:targetHasCurseOfAgony(targetObj)) and (localMana > 25) then
				if (CastSpellByName("Curse of Weakness", targetObj)) then
					self.waitTimer = GetTimeEX() + 1600;
					return 0;
				end
			end 

			-- keep curse of tongues up
			if (not IsMoving()) and (self.useCurseOfTongues) and (HasSpell("Curse of Tongues")) and (not targetObj:HasDebuff("Curse of Tongues")) and (localMana > 25) and (not script_warlock:targetHasCurseOfAgony(targetObj)) and (not targetObj:HasDebuff("Curse of Weakness")) then
				if (CastSpellByName("Curse of Tongues", targetObj)) then
					self.waitTimer = GetTimeEX() + 1600;
					return 0;
				end
			end 
		

			-- Check: Keep the Curse of Agony up (24 s duration)
			if (self.enableCurseOfAgony) and (not IsMoving()) and (HasSpell("Curse of Agony")) then
				if (not script_warlock:targetHasCurseOfAgony(targetObj) and not targetObj:HasDebuff("Cruse of Agony") and targetHealth > 20) and (not targetObj:HasDebuff("Curse of Weakness")) and (not targetObj:HasDebuff("Curse of Tongues")) then
					if (Cast('Curse of Agony', targetObj)) then
						targetObj:FaceTarget();
						self.waitTimer = GetTimeEX() + 1600;
						script_grind:setWaitTimer(1600);
						return 0;
					end
				end
			end


			-- Check: Keep the Corruption DoT up (15 s duration)
			if (not IsMoving()) and (self.enableCorruption) and (not script_warlock:targetHasCorruption(targetObj)) and (targetHealth >= 20) and (targetObj:IsInLineOfSight()) and (not IsCasting()) and (not IsChanneling()) and (HasSpell("Corruption")) then
					if (IsMoving()) then
						StopMoving();
						return true;
					end
					self.waitTimer = GetTimeEX() + 750;
					script_grind:setWaitTimer(750);
					self.tickRate = 1750;
					script_rotation.tickRate = 1950;
					script_rotation.waitTimer = GetTimeEX() + 1250;
				if (not IsMoving()) and (not script_warlock:targetHasCorruption(targetObj)) then
					if not (IsCasting()) and (not IsChanneling()) then
						if (script_warlock:castCorruption(targetObj)) then
							targetObj:FaceTarget();
							self.waitTimer = GetTimeEX() + 3500 - self.corruptionCastTime;
							script_grind:setWaitTimer(3500 - self.corruptionCastTime);
							return 4;
						else
							return 4;
						end
					return 4;
					end
				end				
			end
	
			-- Check: Keep the Immolate DoT up (15 s duration)
			if (not IsMoving()) and (self.enableImmolate) and (not script_warlock:targetHasImmolate(targetObj)) and (localMana > 25) and (targetHealth > 20) and (targetObj:IsInLineOfSight()) and (not IsMoving()) and (not IsCasting()) and (not IsChanneling()) and (HasSpell("Immolate")) then
				if not (IsCasting()) and (not IsChanneling()) and (not script_warlock:targetHasImmolate(targetObj)) and (not IsMoving()) then
					if (IsMoving()) then
						StopMoving();
						return true;
					end
					self.waitTimer = GetTimeEX() + 750;
					script_grind:setWaitTimer(750);
					if (IsCasting()) or (IsChanneling()) then
						return;
					end
					if (script_warlock:castImmolate(targetObj)) then
						targetObj:FaceTarget();
						self.waitTimer = GetTimeEX() + 4500;
						script_grind:setWaitTimer(4500);
						return 4;
					else
						return 4;
					end
				end
			end

			-- Fear single Target
			if (self.alwaysFear) and (HasSpell("Fear")) and (not targetObj:HasDebuff("Fear")) and (targetObj:GetHealthPercentage() > 40) and (targetObj:GetCreatureType() ~= "Undead") then
				CastSpellByName("Fear", targetObj);
					self.waitTimer = GetTimeEX() + 1900;
					if (not script_grind.adjustTickRate) and (IsInCombat()) then
					script_grind.tickRate = 135;
					end
					return;
			end

			-- Drain Life on low health
			if (HasSpell("Drain Life")) and (targetObj:GetCreatureType() ~= "Mechanic") and (localHealth <= self.drainLifeHealth) and (localMana > 5) and (not IsChanneling()) and (not self.useDrainMana) and (GetPet() ~= 0) then
				self.message = "Casting Drain Life";
				if (targetObj:GetDistance() < 20) then
					if (IsMoving()) then StopMoving(); 
						return true; 
					end
					if (Cast('Drain Life', targetObj)) then 
						return true; 
					end
				else
					script_navEX:moveToTarget(localObj, targetObj:GetPosition()); 
					self.waitTimer = GetTimeEX() + 2000;
				end
			end

			if (self.useShadowBolt) and (not self.useWand) and (not IsMoving()) then
				CastSpellByName('Shadow Bolt', targetObj);
				targetObj:FaceTarget();
				self.waitTimer = GetTimeEX() + 2000;
				return 0;
			end

			if (self.useWand) and (targetHealth >= self.useWandHealth and localMana >= self.useWandMana) then

				if (CastSpellByName("Shadow Bolt", targetObj)) then
					targetObj:FaceTarget();
					self.waitTimer = GetTimeEX() + 2000;
					return 0;
				end
			end

			-- use wand sliders
			if (self.useWand) and (localObj:HasRangedWeapon()) and (targetHealth < self.useWandHealth or localMana < self.useWandMana) then
				if (not IsAutoCasting("Shoot")) and (not IsMoving()) then
					script_warlock:petAttack();
					targetObj:FaceTarget();
					CastSpellByName("Shoot");
					self.waitTimer = GetTimeEX() + 250; 
					return true;
				end
			end
		end
	end
end

function script_warlock:rest()

	if(not self.isSetup) then
		script_warlock:setup();
	end

	local localObj = GetLocalPlayer();

	local localMana = localObj:GetManaPercentage();

	local localHealth = localObj:GetHealthPercentage();

	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(350, 900);

		if (IsMoving()) or (not IsInCombat()) and (not localObj:IsCasting()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) or (localObj:IsCasting()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving()) or (localObj:IsCasting()) then
			script_grind.tickRate = tickRandom;
		end
	end

	if (GetPet() ~= 0 and GetPet():GetHealthPercentage() > 1) and (HasItem("Soul Shard")) and (not IsInCombat()) then
		if (script_warlockEX:checkHealthstones()) then
			self.waitTimer = GetTimeEX() + 1750;
			script_grind:setWaitTimer(1750);
		end
	end

	if (GetPet() ~= 0 and GetPet():GetHealthPercentage() > 1) then
		if (not IsInCombat()) and (GetPet():GetUnitsTarget() == 0) then
		end
	end

	-- check pet
	if(GetPet() ~= 0) then 
		self.hasPet = true; 
	elseif (GetPet() == 0 or (GetPet() ~= 0 and GetPet():GetHealthPercentage() <= 1)) then
		self.hasPet = false;
	end

if (GetPet() ~= 0) then
		local petHasTarget = GetPet():GetUnitsTarget();
	end
		local playerHasTarget = GetLocalPlayer():GetUnitsTarget();

	-- force bot to attack pets target
	if (GetNumPartyMembers() == 0) and (self.waitAfterCombat) and (IsInCombat()) and (GetPet() ~= 0 and GetPet():GetHealthPercentage() > 1) and (playerHasTarget == 0) and (self.hasPet) then
		if (petHasTarget ~= 0) then
			if (GetPet():GetDistance() > 10) then
				AssistUnit("pet");
				PetFollow();
			end
		elseif (petHasTarget == 0) then
			AssistUnit("pet");
			self.message = "Stuck in combat! WAITING!";
			return 4;
		end
	end

	-- Dark Pact instead of drink
	if (HasSpell("Dark Pact")) and (IsStanding()) and (localMana < 75) and (GetPet() ~= 0 or self.hasPet) and (self.useImp or self.useVoid or self.useSuccubus or self.useFelhunter) then
		if (not IsSpellOnCD("Dark Pact")) and (GetPet():GetManaPercentage() > 20) and (IsStanding()) then
			if (CastAndWalk("Dark Pact", localObj)) then
				self.message = "Casting Dark Pact instead of drinking!";
				return;
			end
		end
	end

	-- Stop moving before we can rest
	if(localMana < self.drinkMana or localHealth < self.eatHealth) and (not IsSwimming()) then
		self.waitTimer = GetTimeEX() + 2000;
		if (IsMoving()) then
			StopMoving();
			return true;
		end	
	end

	-- Cast: Life Tap if conditions are right, see the function
	if (localMana < localHealth) and (HasSpell("Life Tap")) and (localHealth > self.lifeTapHealth) and (localMana < self.lifeTapMana) then
		if (not IsInCombat()) and (not IsEating()) and (not IsDrinking()) and (not IsLooting()) and (IsStanding()) then
			if (not IsSpellOnCD("Life Tap")) then
				CastSpellByName("Life Tap");
				self.waitTimer = GetTimeEX() + 1650;
			end
		end
	end			
		
	-- Eat and Drink
	if (not IsDrinking() and localMana < self.drinkMana) and (not IsSwimming()) then
		self.message = "Need to drink...";
		self.waitTimer = GetTimeEX() + 2000;
		if (IsMoving()) then
			StopMoving();
			self.waitTimer = GetTimeEX() + 2000;
			return true;
		end

		if (script_helper:drinkWater()) then 
			self.message = "Drinking..."; 
			self.waitTimer = GetTimeEX() + 2000;
			return true; 
		else 
			self.message = "No drinks! (or drink not included in script_helper)";
			return true; 
		end
	end
	if (not IsEating() and localHealth < self.eatHealth) and (not IsSwimming()) then
		self.waitTimer = GetTimeEX() + 2000;
		self.message = "Need to eat...";	
		if (IsMoving()) then
			StopMoving();
			return true;
		end
		
		if (script_helper:eat()) then 
			self.message = "Eating..."; 
			self.waitTimer = GetTimeEX() + 2000;
			return true; 
		else 
			self.message = "No food! (or food not included in script_helper)";
			return true; 
		end	
	end

	if (localMana < 98 and IsDrinking()) or (localHealth < 98 and IsEating()) then
		self.message = "Resting to full hp/mana...";
		self.waitTimer = GetTimeEX() + 2000;
		return true;
	end

	if (GetPet() ~= 0) and (self.useVoid) and (GetPet():GetHealthPercentage() < 70 and GetPet():GetHealthPercentage() > 1) and (self.hasConsumeShadowsSpell) and (GetPet():GetManaPercentage() >= 45) and (not IsSpellOnCD("Consume Shadows")) then
		CastSpellByName("Consume Shadows");
		self.waitTimer = GetTimeEX() + 2500;
		self.message = "Using Voidwalker spell Consume Shadows";
		return true;
	end

	if (GetPet() == 0 or (GetPet() ~= 0 and GetPet():GetHealthPercentage() <= 1)) then
		self.hasPet = false;
	elseif (GetPet() ~= 0) then
		self.hasPet = true;
	end
	
	if (HasSpell("Summon Imp")) and (GetPet == 0 or GetPet == nil) and (not script_warlockEX2:isPetActive()) and (self.useImp or self.useVoid or self.useSuccubus or self.useFelhunter) then	
		if (IsMoving()) then
			StopMoving();
		end
		if (not script_warlockEX2:isPetActive()) and (not IsCasting()) and (not IsChanneling()) and (not localObj:HasBuff("Blood Pact")) then
			if (script_warlockEX2:summonPet()) then
				self.waitTimer = GetTimeEX() + 15000;
				script_grind:setWaitTimer(15000);
				return 4;
			end
		return 4;
		end
	end

	-- Do buffs if we got some mana 
	if (localMana > 30) and (IsStanding()) then
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
	if (not IsInCombat()) and (GetPet() ~= 0 and GetPet():GetHealthPercentage() > 1) and (self.useVoid or self.useImp or self.useSuccubus or self.useFelhunter) and (HasSpell("Health Funnel")) then
		if (GetPet():GetHealthPercentage() < 50) and (localHealth > 60) then
			if (GetPet():GetDistance() > 8) then
				PetFollow();
				self.waitTimer = GetTimeEX() + 500; 
				return true;
			end
			if (GetPet():GetDistance() < 20 and localMana > 10) then
				if (GetPet() ~= 0 and GetPet():GetHealthPercentage() < 70 and GetPet():GetHealthPercentage() > 0) then
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

function script_warlock:mount()

	if(not IsMounted() and not IsSwimming() and not IsIndoors() 
		and not IsLooting() and not IsCasting() and not IsChanneling() 
			and not IsDrinking() and not IsEating()) then
		
		if(IsMoving()) then
			return true;
		end
		
		return UseItem(self.mountName);
	end
	
	return false;
end

function script_warlock:window()

	if (self.isChecked) then
	
		--Close existing Window
		EndWindow();

		if(NewWindow("Class Combat Options", 200, 200)) then
			script_warlock:menuEX();
		end
	end
end