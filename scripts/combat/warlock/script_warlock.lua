script_warlock = {
	message = 'Warlock Combat Script',
	warlockMenu = include("scripts\\combat\\warlock\\script_warlockEX.lua"),
	warlockExtra2 = include("scripts\\combat\\warlock\\script_warlockEX2.lua"),
	warlockDOTSLoaded = include("scripts\\combat\\warlock\\script_warlockDOTS.lua"),
	warlockFunctions = include("scripts\\combat\\warlock\\script_warlockFunctions.lua"),
	drinkMana = 40,
	eatHealth = 55,
	potionHealth = 10,
	potionMana = 20,
	healthStone = {},
	numStone = 0,
	stoneHealth = 30,
	isSetup = false,
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
	varUsed = false,	-- turn on and off shadowbolt and wand during combat
	waitAfterCombat = false,
	corruptionCastTime = 0,
	warlockDOTS = false,
	warlockDOTSCount = 2,
	hasSoulStone = false,
	consumeShadowsTimer = 0,
	soulstoneTimer = 0,
	useSoulstone = true,
}

function script_warlock:setup()

	self.waitTimer = GetTimeEX();
	self.cooldownTimer = GetTimeEX();
	script_warlockDOTS.corruptionTimer = GetTimeEX();
	script_warlockDOTS.immolateTimer = GetTimeEX();
	script_warlockDOTS.curseOfAgonyTimer = GetTimeEX();
	self.consumeShadowsTimer = GetTimeEX();
	self.soulstoneTimer = GetTimeEX();


	local localObj = GetLocalPlayer();
	local localLevel = localObj:GetLevel();

	if (localLevel == 10) then
		self.corruptionCastTime = 400;
	elseif (localLevel == 11) then
		self.corruptionCastTime = 800;
	elseif (localLevel == 12) then
		self.corruptioncastTime = 1200;
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
		elseif (HasSpell("Summon Voidwalker")) then
			self.useImp = false;
			self.useVoid = true;
			self.useSuccubus = false;
			self.useFelhunter = false;
		elseif (not HasSpell("Summon Imp")) then
			self.useImp = false;
			self.useVoid = false;
			self.useSuccubus = false;
			self.useFelhunter = false;
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
	if (localLevel >= 10) and (localObj:HasRangedWeapon()) then
		self.useWandHealth = 100;
		self.useShadowbolt = false;
	end

	script_warlockDOTS.waitTimer = GetTimeEX();
	
	self.isSetup = true;
end

function script_warlock:draw()
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
	if (script_grindEX:areWeSwimming()) then
		self.useUnendingBreath = true;
	end
	
	local localObj = GetLocalPlayer();
	local localMana = localObj:GetManaPercentage();
	local localHealth = localObj:GetHealthPercentage();
	local localLevel = localObj:GetLevel();
	local playerHasTarget = GetLocalPlayer():GetUnitsTarget();

	for i=0, 10 do
		-- Check: If the pet is void and has spell Consume Shadows
		if (HasPet()) and (self.useVoid) then
			name, __, __, __, __, __, __ = GetPetActionInfo(i);
			if (name == "Consume Shadows") then 
				self.hasConsumeShadowsSpell = true;
			end
		end
		
		-- Check: If the pet is void and has spell suffering
		if (HasPet()) and (self.useVoid) then
			name, __, __, __, __, __, __ = GetPetActionInfo(i);
			if (name == "Suffering") then 
				self.hasSufferingSpell = true;
			end
		end
	
		-- Check: If the pet is void and has spell sacrifice
		if (HasPet()) and (self.useVoid) then
			name, __, __, __, __, __, __ = GetPetActionInfo(i);
			if (name == "Sacrifice") then 
				self.hasSacrificeSpell = true;
			end
		end
	end

	-- don't attack dead targets
	if (localObj:IsDead()) then
		return 0;
	end

	-- wait for pet health low level
	if (HasPet()) and (GetPet():GetHealthPercentage() > 1 and GetPet():GetHealthPercentage() < 75) and (not IsInCombat()) and (not HasSpell("Health Funnel")) then
		self.message = "Waiting for pet health > 75";
		return 4;
	end

	-- stuck in combat
	if (self.waitAfterCombat) and (HasPet()) then
		if (IsInCombat()) and (not PlayerHasTarget()) and (not PetHasTarget()) and (GetNumPartyMembers() < 1) and (script_vendor.status == 0) then
			self.message = "Waiting... Server says we are InCombat()";
			self.lootObj = script_nav:getLootTarget(self.findLootDistance);
			if (self.lootObj ~= 0 and self.lootObj ~= nil) then
				ex, ey, ez = self.lootObj:GetPosition();
				Move(ex, ey, ez);
			end
		elseif (IsInCombat()) and (not PlayerHasTarget()) and (PetHasTarget()) and (GetNumPartyMembers() < 1) and (script_vendor.status == 0) then
			AssistUnit("Pet");
			return 4;
		end
	end

	-- force bot to attack pets target
	if (GetNumPartyMembers() == 0) and (self.waitAfterCombat) and (IsInCombat()) and (HasPet()) and (playerHasTarget == 0) and (PetHasTarget()) then
		if (GetPet():GetDistance() > 10) then
			AssistUnit("pet");
			PetFollow();
		end
	elseif (HasPet()) and (not PetHasTarget()) and (IsInCombat()) then
		--AssistUnit("pet");
		self.message = "Stuck in combat! WAITING! 1";
		return 4;
	end

	-- dismiss imp if we have it for some reason and we don't want it
	if (not IsInCombat()) and (HasPet()) and (self.useVoid or self.useSuccubus or self.useFelhunter) and (not self.useImp) and (HasItem("Soul Shard")) then
		if (localObj:HasBuff("Blood Pact")) then
			PetDismiss();
		end
	end

	-- Assign the target 
	targetObj = GetGUIDObject(targetGUID);

	-- set target health
	targetHealth = targetObj:GetHealthPercentage();

	if (not IsInCombat()) and (IsMoving()) then
		self.message = "Pulling " .. targetObj:GetUnitName() .. "...";
	end

	-- clear target
	if(targetObj == 0 or targetObj == nil or targetObj:IsDead()) then
		ClearTarget();
		return 2;
	end

	-- Check: if we target player pets/totems
	if (PlayerHasTarget()) and (HasPet()) then
		if (GetTarget():GetGUID() ~= GetLocalPlayer():GetGUID()) and (GetTarget():GetGUID() ~= GetPet():GetGUID()) then
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

	-- resummon pet
	if (self.useVoid or self.useImp or self.useSuccubus or self.useFelhunter) and (not HasPet()) and (HasSpell("Summon Imp")) 
		and ( (localMana >= 45) or (localObj:HasBuff("Fel Domination") and localMana >= 30) ) then
		if (IsMoving()) then
			StopMoving();
			return true;
		end
		if (not HasPet()) and (not IsCasting()) and (not IsChanneling()) then
			if (script_warlockEX2:summonPet()) then
				self.waitTimer = GetTimeEX() + 15000;
				script_grind:setWaitTimer(15000);
				return 4;
			end
			return 4;
		end
	end

	-- sacrifice voidwalker low health
	if (HasPet()) and (self.useVoid) and (self.hasSacrificeSpell) and (self.sacrificeVoid) and (localHealth <= self.sacrificeVoidHealth or GetPet():GetHealthPercentage() <= self.sacrificeVoidHealth) then
		if (not script_grind.adjustTickRate) then
			script_grind.tickRate = 100;
		end
		CastSpellByName("Sacrifice");
		self.waitTimer = GetTimeEX() + 1500;
		return 0;
	end

	-- resummon when sacrifice is active
	if (not HasPet()) and (self.useVoid) and (self.sacrificeVoid) and (localObj:HasBuff("Sacrifice")) and (localMana >= 35) then
		if (not script_grind.adjustTickRate) then
			script_grind.tickRate = 100;
		end
		if (CastSpellByName("Summon Voidwalker")) then
			self.waitTimer = GetTimeEX() + 12000;
			script_grind:setWaitTimer(1200);
			return true;
		end
	end

	if (HasPet()) and (IsInCombat()) and (not targetObj:IsInLineOfSight() or not GetPet():IsInLineOfSight()) then
		PetFollow();
		return 3;
	end

	-- force bot to attack pets target
	if (GetNumPartyMembers() == 0) and (self.waitAfterCombat) and (IsInCombat()) and (HasPet()) and (not PlayerHasTarget()) and (not PetHasTarget()) then
		if (GetPet():GetDistance() > 10) then
			AssistUnit("pet");
			PetFollow();
		end
	elseif (HasPet()) and (not PetHasTarget()) and (IsInCombat()) then
		--AssistUnit("pet");
		self.message = "Stuck in combat! WAITING! 2";
		return 4;
	end

	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(350, 700);

		if (IsMoving()) or (not IsInCombat()) and (not localObj:IsCasting()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) or (localObj:IsCasting()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving()) or (localObj:IsCasting()) then
			script_grind.tickRate = tickRandom;
		end
	end

	-- move away from adds / check adds
		if (not IsCasting()) and (not IsChanneling()) and (IsInCombat()) and (script_grind.skipHardPull) and (GetNumPartyMembers() == 0) then
			if (script_checkAdds:checkAdds()) then
				script_om:FORCEOM();
				if (HasPet()) then
					PetFollow();
				end
			return true;
			end
		end
	-- check for silence and use wand
	if (PlayerHasTarget()) and (not localObj:IsStunned()) and (script_checkDebuffs:hasSilence()) and (localObj:HasRangedWeapon()) and (IsInCombat()) then
		if (not IsAutoCasting("Shoot")) then
			script_warlockFunctions:petAttack();
			if (GetLocalPlayer():GetUnitsTarget():GetDistance() < 30) then
				GetLocalPlayer():GetUnitsTarget():FaceTarget();
			end
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

		-- in group with a mage? run backwards on frost nova!
		if (GetNumPartyMembers() >= 1) then
			if (targetObj:HasDebuff("Frost Nova")) or (targetObj:HasDebuff("Frostbite")) then
				-- Run backwards if we are too close to the target
				if (targetObj:GetDistance() <= 7) then 
					if (script_warlockFunctions:runBackwards(targetObj,8)) then 
						return 4; 
					end 
				end
			end
		end

		-- Cant Attack dead targets
		if (targetObj:IsDead()) or (not targetObj:CanAttack()) then
			ClearTarget();
			return 2;
		end
		
		-- stand if sitting
		if (not IsStanding()) then
			JumpOrAscendStart();
		end

-- Opener check range of ALL SPELLS
				
			if (targetObj:GetDistance() > 29) or (not targetObj:IsInLineOfSight()) then
				return 3;
			end

		-- used to keep target acquired
		if (targetObj:GetDistance() < 35) then
			targetObj:AutoAttack();
		end

		-- use shadowbolt on more than 1 target for increased survivability
		if (IsInCombat()) and (script_grind:enemiesAttackingUs(10) > 1) and (self.useWand) and (not self.useShadowBolt) and (localMana >= 15) then
			self.useWand = false;
			self.useShadowBolt = true;
			self.varUsed = true;
		end
		-- turn wand use back on when done
		if (self.varUsed and not IsInCombat() or script_grind:enemiesAttackingUs() < 2) or (localMana < 15 and self.varUsed) then
			self.useWand = true;
			self.useShadowBolt = true;
			self.varUsed = false;
		end	

		-- move to cancel Drain Life when we get Nightfall buff
		if (GetNumPartyMembers() < 1) then
			if (PlayerHasTarget() and HasPet()) and (HasSpell("Drain Life")) then	
				if (GetTarget():HasDebuff("Drain Life") and localObj:HasBuff("Shadow Trance")) then
				local _x, _y, _z = localObj:GetPosition();
					script_navEX:moveToTarget(localObj, _x + 1, _y, _z); 
				end
			end
		end

		if (self.warlockDOTS) and (script_grindEX:howManyEnemiesInRange(29) >= self.warlockDOTSCount) and (script_grind.enemiesAttackingUs() <= self.warlockDOTSCount) and (localMana >= 35) and (localHealth >= 45) then
		
				if (GetTimeEX() > script_warlockDOTS.corruptionTimer) then
					if (script_warlockDOTS:corruption()) then
						return true;
					end
				end
				if (GetTimeEX() > script_warlockDOTS.curseOfAgonyTimer) then
					if (script_warlockDOTS:curseOfAgony()) then
						return true;
					end
				end
				if (GetTimeEX() > script_warlockDOTS.immolateTimer) then
					if (script_warlockDOTS:immolate()) then
						return true;
					end
				end
		end

		if (IsInCombat()) then
			if (script_warlockDOTS:DOTAdds()) then
				self.waitTimer = GetTimeEX()  + 1000;
				return true;
			end
		end


-- START OF COMBAT PHASE
	-- OPENER

		-- Opener - not in combat pulling target
		if (not IsInCombat()) then
			self.message = "Pulling " .. targetObj:GetUnitName() .. "...";

			-- Dismount
			if (IsMounted()) then
				DisMount(); 
			end

			-- if pet goes too far then recall
			if (HasPet()) and (GetPet():GetDistance() > 30) then
				PetFollow();
			end

			-- level 1 - 4 cast shadow bolt to start
			if (not HasSpell("Corruption")) and (not HasSpell("Immolate")) and (not IsInCombat()) and (localMana > 25) and (targetObj:IsInLineOfSight()) and (not IsMoving()) then
				if (Cast('Shadow Bolt', targetObj)) then
					targetObj:FaceTarget();
					self.waitTimer = GetTimeEX() + 2350;
				end
			end

			-- cast immolate to pull if we have it until we get corruption
			if (HasSpell("Immolate")) and (not HasSpell("Corruption")) and (localMana > 25) and (targetObj:IsInLineOfSight()) and (not script_warlockFunctions:targetHasImmolate(targetObj)) and (not IsMoving()) and (self.enableImmolate) then
				if (IsMoving()) then
					StopMoving();
					script_warlockFunctions:petAttack();
				end
				if (not script_warlockFunctions:targetHasImmolate(targetObj)) and (not IsMoving()) then
					if (not CastSpellByName("Immolate")) then
						self.waitTimer = GetTimeEX() + 2800;
						script_grind:setWaitTimer(2800);
						targetObj:FaceTarget();
					return 4;
					end
				return 4;
				end
			end

			-- spells to pull after level 6

			-- Amplify Curse on CD
			if (HasSpell("Amplify Curse")) and (not IsSpellOnCD("Amplify Curse")) and (PlayerHasTarget()) then
				CastSpellByName("Amplify Curse");
				script_warlockFunctions:petAttack();
			end

			if (HasSpell("Siphon Life")) and (self.enableSiphonLife) and (PlayerHasTarget()) then
					script_warlockFunctions:petAttack();
					self.message = "Stacking DoT's";
				if (Cast("Siphon Life", targetObj)) then
					targetObj:FaceTarget();
					script_warlockFunctions:petAttack();
					self.waitTimer = GetTimeEX() + 1800; 
					script_grind:setWaitTimer(650);
				end
			end

			-- curse of agony to pull
			--if (HasSpell("Curse of Agony")) and (self.enableCurseOfAgony) and (GetLocalPlayer():GetUnitsTarget() ~= 0) and (not self.useCurseOfWeakness) and (not self.useCurseOfTongues) then
			--	targetObj:FaceTarget();
			--	script_warlockFunctions:petAttack();
			--	self.message = "Stacking DoT's";
			--	if (Cast('Curse of Agony', targetObj)) then 
			--		script_warlockFunctions:petAttack();
			--		self.waitTimer = GetTimeEX() + 1800;
			--		script_grind:setWaitTimer(1500);
			--	end
			--end

			-- corruption to pull
			-- don't you laugh at it :( it works
			if (HasSpell("Corruption")) and (not IsInCombat()) and (not IsMoving()) and (self.enableCorruption) and (not script_warlockFunctions:targetHasCorruption(targetObj)) and (targetObj:IsInLineOfSight()) and (not IsCasting()) and (not IsChanneling()) then
					if (IsMoving()) then
						StopMoving();
						return true;
					end
					self.waitTimer = GetTimeEX() + 750;
					script_grind:setWaitTimer(750);
					self.tickRate = 1750;
					script_rotation.tickRate = 1750;
					script_rotation.waitTimer = GetTimeEX() + 1750;
				if (not IsMoving()) and (not script_warlockFunctions:targetHasCorruption(targetObj)) then
					script_warlockFunctions:petAttack();
					if not (IsCasting()) and (not IsChanneling()) then
						if (script_warlockFunctions:castCorruption(targetObj)) then
							script_warlockFunctions:petAttack();
							targetObj:FaceTarget();
							self.waitTimer = GetTimeEX() + 2050 - self.corruptionCastTime;
							script_grind:setWaitTimer(2050 - self.corruptionCastTime);
							return 4;
						else
							return 4;
						end
					return 4;
					end
				end				
			end

			-- shadow bolt to pull if we get a chance before actually entering combat phase
			if (HasSpell("Shadow Bolt")) and (PlayerHasTarget()) and (targetObj:GetDistance() <= 29) then
				script_warlockFunctions:petAttack();
				self.message = "Pulling Target";
				if (IsMoving()) then
					StopMoving();
					return true;
				end
				if (CastSpellByName("Shadow Bolt", targetObj)) then
					targetObj:FaceTarget();
					self.waitTimer = GetTimeEX() + 1650;
					script_grind:setWaitTimer(1650);
					return 0;
				end
			end

			if (not targetObj:IsInLineOfSight()) then -- check line of sight
				self.message = "Moving into Line of Sight of target";
				return 3;
			end

			
			-- IN COMBAT

			-- Combat
		elseif (IsInCombat()) or (PlayerHasTarget()) then	

			self.message = "Killing " .. targetObj:GetUnitName() .. "...";


			-- Check: Do nothing if we are channeling, casting
			if (IsChanneling() or IsCasting() or self.waitTimer > GetTimeEX()) then
				if (IsChanneling()) or (IsCasting()) then
					self.waitTimer = GetTimeEX() + 500
				end
			return 4;
			end



			-- Check: Do we have the right target (in UI) ??
			if (PlayerHasTarget()) then
				if (GetTarget():GetGUID() ~= targetObj:GetGUID()) then
					ClearTarget();
					self.waitTimer = GetTimeEX() + 1500;
					script_grind:setWaitTimer(1500);
					targetObj = 0;
					return 0;
				end
			end

			-- force bot to attack pets target
			if (GetNumPartyMembers() == 0) and (self.waitAfterCombat) and (IsInCombat()) and (HasPet()) and (PlayerHasTarget()) then
				if (PetHasTarget()) then
					if (GetPet():GetDistance() > 10) then
						AssistUnit("pet");
						PetFollow();
					end
				elseif (HasPet()) and (not PetHasTarget()) then
					--AssistUnit("pet");
					self.message = "Stuck in combat! WAITING! 3";
					return 4;
				end
			end

			-- causes crashing after combat phase?
			-- follow target if single target fear is active and moves out of spell ranged
			if (self.followFeared) and (self.alwaysFear) and (targetObj:HasDebuff("Fear")) and (not targetObj:IsSpellInRange("Shoot")) then
				return 3;
			end
			
			-- gather soul shards
			if (not script_warlockEX2:hasSoulShard() and not HasItem("Soul Shard")) then
				if (targetHealth <= 25) and (HasSpell("Drain Soul")) and (targetObj:GetDistance() <= 26) and (IsInCombat()) then
					if (not script_grind.adjustTickRate) then
						script_grind.tickRate = 135;
					end
					targetObj:FaceTarget();
					CastSpellByName('Drain Soul', targetObj);
					self.message = "Gathering Soulshards";
					return;
				end
			end

			-- fel domination and resummon
			if (IsInCombat()) and (HasSpell("Fel Domination")) and (not IsSpellOnCD("Fel Domination")) and (not HasPet()) and (localMana > 25) and (self.useVoid or self.useImp or self.useSuccubus or self.useFelhunter) then
				CastSpellByName("Fel Domination");
				self.waitTimer = GetTimeEX() + 1500;
				return 0;
			end
		
			if (not HasPet()) and (HasSpell("Summon Warlock")) then
				if (IsMoving()) then
					StopMoving();
					return true;
				end
				if (not HasPet()) and (not IsCasting()) and (not IsChanneling()) then
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
			if (HasPet()) and (GetPet():GetDistance() > 30) then
				self.message = "Recalling Pet - too far!";
				PetFollow();
			end

			-- Set the pet to attack
			if (HasPet()) and (targetHealth < 99 or script_warlockFunctions:targetHasCurseOfAgony(targetObj) or 
				script_warlockFunctions:targetHasCorruption(targetObj)) or (script_grind:isTargetingMe(targetObj)) and (not targetObj:HasDebuff("Fear")) then
				script_warlockFunctions:petAttack();
			end

			-- pet assist me if i am being targeted by more than 1 npc
			--if (HasPet()) then
			--	script_warlockFunctions:petAssistMe();
			--end

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
			if (HasPet()) and (HasSpell("Death Coil")) and (not IsSpellOnCD("Death Coil")) and (GetPet():GetHealthPercentage() <= 35) then
				if (CastSpellByName("Death Coil", targetObj)) then
					self.waitTimer = GetTimeEC() + 1500;
					return 0;
				end
			end

			-- voidwalker taunt
			if (HasPet()) and (self.useVoid) and (not IsSpellOnCD("Suffering")) and (script_grind:enemiesAttackingUs(5) >= 2) and (self.hasSufferingSpell) then
				if (CastSpellByName("Suffering")) then
					self.waitTimer = GetTimeEX() + 250;
				end
			end

			-- resummon when sacrifice is active
			if (self.useVoid) and (self.sacrificeVoid) and (localObj:HasBuff("Sacrifice")) and (not HasPet()) and (localMana > 35) then
				if (not HasPet()) then
					if (CastSpellByName("Summon Voidwalker")) then
						return 0;
					end
				end
			end

			-- Dark Pact instead of lifetap in combat
			if (HasSpell("Dark Pact")) and (localMana < 40) and (HasPet()) and (not IsLooting()) then
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

			if (HasSpell("Fear")) and (localMana >= 10) and (localHealth <= 30) and (script_grind:isTargetingMe(targetObj)) and (not targetObj:HasDebuff("Fear")) and (targetObj:GetCreatureType() ~= "Undead") then
				script_warlockFunctions:cast("Fear", targetObj);
				self.waitTimer = GetTimeEX() + 3500;
				return;
			end

			-- Fear single Target
			if (self.alwaysFear) and (HasSpell("Fear")) and (not targetObj:HasDebuff("Fear")) and (targetObj:GetHealthPercentage() > 40) and (targetObj:GetCreatureType() ~= "Undead") then
				if (not script_grind.adjustTickRate) and (IsInCombat()) then
					script_grind.tickRate = 135;
				end
				self.waitTimer = GetTimeEX() + 1900;

				script_warlockFunctions:cast("Fear", targetObj);
			return;
			end

			-- Check if add already feared
			if (not script_warlockFunctions:isAddFeared()) then
				self.addFeared = false;
			end

			-- Check: Fear add
			if (targetObj ~= nil) and (self.fearAdds) and (script_grind:enemiesAttackingUs() > 1) and (HasSpell("Fear")) and (not self.addFeared) then
				self.message = "Fearing add...";
				if (script_warlockFunctions:fearAdd(targetObj:GetGUID())) then
					if (not script_grind.adjustTickRate) and (IsInCombat()) then
						script_grind.tickRate = 250;
					end
				return;
				end
			end

			-- Check: Sort target selection if add is feared
			if (self.addFeared) then
				if(script_grind:enemiesAttackingUs(10) >= 1 and targetObj:HasDebuff('Fear')) then
					if (not script_grind.adjustTickRate) and (IsInCombat()) then
						script_grind.tickRate = 250;
					end
					ClearTarget();
					targetObj = script_warlockFunctions:getTargetNotFeared();
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
			if (targetHealth < self.drainSoulHealthPreset) and (targetHealth > 3) and (HasSpell("Drain Soul")) and (not script_warlockEX2:hasSoulShard() and not HasItem("Soul Shard")) then
				if (Cast('Drain Soul', targetObj)) then
					return 0;
				end
			end

				-- nav move to target causing crashes on follower
			-- Check: Heal the pet if it's below 50% and we are above 50%
			if (GetNumPartyMembers() < 1) then
				if (HasPet()) and (GetPet():GetHealthPercentage() > 1 and GetPet():GetHealthPercentage() <= self.healPetHealth) and (HasSpell("Health Funnel")) and (localHealth > 60) and (not script_grind:isTargetingMe(script_grind.enemyObj)) and (script_warlockFunctions:targetHasCurseOfAgony(targetObj)) and (script_warlockFunctions:targetHasCorruption(targetObj))  then
					if (GetPet():GetDistance() >= 20 or not GetPet():IsInLineOfSight()) and (HasPet()) then
						self.message = "Healing pet!";
						local _xXX, _yYY, _zZZ = GetPet():GetPosition();
						script_navEX:moveToTarget(localObj, _xXX, _yYY, _zZZ); 
						self.waitTimer = GetTimeEX() + 600;
						return 0;
					else
						if (IsMoving()) then
						StopMoving();
						end
					end
					CastSpellByName("Health Funnel"); 
					return 0;
				end
			end

			-- if pet goes too far then recall
			if (HasPet()) and (GetPet():GetDistance() > 40) then
				PetFollow();
			end
		
			-- Wand if low mana
			if (localMana <= 5) and (localObj:HasRangedWeapon()) and (not self.enableGatherShards) and (PlayerHasTarget()) then
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
			if HasSpell("Life Tap") and not IsSpellOnCD("Life Tap") and (localHealth > 35) and (localMana < 15) then
				if (CastSpellByName("Life Tap")) then
					self.waitTimer = GetTimeEX() + 1600;
					self.message = "Using Life Tap!";
					return true;
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

			-- nav move to target causing crashes on follower
			-- Check: Heal the pet if it's below 50% and we are above 50%
			if (GetNumPartyMembers() < 1) and (HasSpell("Health Funnel")) and (localHealth > 60) and (script_warlockFunctions:targetHasCurseOfAgony(targetObj))
				and (script_warlockFunctions:targetHasCorruption(targetObj)) then
				if (HasPet())
				and (self.useVoid or self.useImp or self.useSuccubus or self.useFelhunter)
				and (GetPet():GetHealthPercentage() <= self.healPetHealth)
				and (not script_grind:isTargetingMe(script_grind.enemyObj))
				then
					self.message = "Healing pet with Health Funnel";
					if (GetPet():GetDistance() >= 20 or not GetPet():IsInLineOfSight()) then
						script_navEX:moveToTarget(localObj, GetPet():GetPosition()); 
						self.waitTimer = GetTimeEX() + 600;
					else
						if (IsMoving()) then
							StopMoving();
						end
					end
					CastSpellByName("Health Funnel"); 
					return 0;
				end
			end

			-- keep curse of weakness up
			if (not IsMoving()) and (self.useCurseOfWeakness) and (HasSpell("Curse of Weakness")) and (not targetObj:HasDebuff("Curse of Weakness")) and (not targetObj:HasDebuff("Curse of Toungues")) and (not script_warlockFunctions:targetHasCurseOfAgony(targetObj)) and (localMana > 25) then
				if (CastSpellByName("Curse of Weakness", targetObj)) then
					self.waitTimer = GetTimeEX() + 1600;
					return 0;
				end
			end 

			-- keep curse of tongues up
			if (not IsMoving()) and (self.useCurseOfTongues) and (HasSpell("Curse of Tongues")) and (not targetObj:HasDebuff("Curse of Tongues")) and (localMana > 25) and (not script_warlockFunctions:targetHasCurseOfAgony(targetObj)) and (not targetObj:HasDebuff("Curse of Weakness")) then
				if (CastSpellByName("Curse of Tongues", targetObj)) then
					self.waitTimer = GetTimeEX() + 1600;
					return 0;
				end
			end 

			-- Check: Keep the Curse of Agony up (24 s duration)
			if (self.enableCurseOfAgony) and (not IsMoving()) and (HasSpell("Curse of Agony")) then
				if (not script_warlockFunctions:targetHasCurseOfAgony(targetObj) and not targetObj:HasDebuff("Cruse of Agony") and targetHealth > 20) and (not targetObj:HasDebuff("Curse of Weakness")) and (not targetObj:HasDebuff("Curse of Tongues")) then
					if (Cast('Curse of Agony', targetObj)) then
						targetObj:FaceTarget();
						self.waitTimer = GetTimeEX() + 1600;
						script_grind:setWaitTimer(1600);
						return 0;
					end
				end
			end

-- Check: Keep the Immolate DoT up (15 s duration)
			if (not IsMoving()) and (self.enableImmolate) and (not script_warlockFunctions:targetHasImmolate(targetObj)) and (localMana > 25) and (targetHealth > 20) and (targetObj:IsInLineOfSight()) and (not IsMoving()) and (not IsCasting()) and (not IsChanneling()) and (HasSpell("Immolate")) then
				if not (IsCasting()) and (not IsChanneling()) and (not script_warlockFunctions:targetHasImmolate(targetObj)) and (not IsMoving()) then
					if (IsMoving()) then
						StopMoving();
						return true;
					end
					self.waitTimer = GetTimeEX() + 750;
					script_grind:setWaitTimer(750);
					if (IsCasting()) or (IsChanneling()) then
						return;
					end
					if (script_warlockFunctions:castImmolate(targetObj)) then
						targetObj:FaceTarget();
						self.waitTimer = GetTimeEX() + 3250;
						script_grind:setWaitTimer(3250);
						return 4;
					else
						return 4;
					end
				end
			end


			-- Check: Keep the Corruption DoT up (15 s duration)
			if (not IsMoving()) and (self.enableCorruption) and (not script_warlockFunctions:targetHasCorruption(targetObj)) and (targetHealth >= 25) and (targetObj:IsInLineOfSight()) and (not IsCasting()) and (not IsChanneling()) and (HasSpell("Corruption")) then
					if (IsMoving()) then
						StopMoving();
						return true;
					end
					self.waitTimer = GetTimeEX() + 750;
					script_grind:setWaitTimer(750);
					self.tickRate = 1550;
					script_rotation.tickRate = 1550;
					script_rotation.waitTimer = GetTimeEX() + 1550;
				if (not IsMoving()) and (not script_warlockFunctions:targetHasCorruption(targetObj)) then
					if not (IsCasting()) and (not IsChanneling()) then
						if (script_warlockFunctions:castCorruption(targetObj)) then
							targetObj:FaceTarget();
							self.waitTimer = GetTimeEX() + 1500 - self.corruptionCastTime;
							script_grind:setWaitTimer(1500 - self.corruptionCastTime);
							return 4;
						else
							return 4;
						end
					return 4;
					end
				end				
			end

			-- Fear single Target
			if (self.alwaysFear) and (HasSpell("Fear")) and (not targetObj:HasDebuff("Fear")) and (targetObj:GetHealthPercentage() > 40) and (targetObj:GetCreatureType() ~= "Undead") then
				if (script_warlockFunctions:cast("Fear", targetObj)) then
					self.waitTimer = GetTimeEX() + 1900;
					if (not script_grind.adjustTickRate) and (IsInCombat()) then
						script_grind.tickRate = 135;
					end
				return;
				end
			end

			-- Drain Life on low health
			if (HasSpell("Drain Life")) and (targetObj:GetCreatureType() ~= "Mechanic") and (localHealth <= self.drainLifeHealth) and (localMana > 5) and (not IsChanneling()) and (not self.useDrainMana) and (HasPet()) then
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
				if (script_warlockFunctions:doesTargetHaveAllDots(targetObj)) then
					if (not IsAutoCasting("Shoot")) and (not IsMoving()) then
						script_warlockFunctions:petAttack();
						targetObj:FaceTarget();
						CastSpellByName("Shoot");
						self.waitTimer = GetTimeEX() + 250; 
						return true;
					end
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

		local tickRandom = random(350, 700);

		if (IsMoving()) or (not IsInCombat()) and (not localObj:IsCasting()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) or (localObj:IsCasting()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving()) or (localObj:IsCasting()) then
			script_grind.tickRate = tickRandom;
		end
	end

	-- create healthstone
	if (HasPet()) and (HasItem("Soul Shard")) and (not IsInCombat()) then
		if (script_warlockEX:checkHealthstones()) then
			self.waitTimer = GetTimeEX() + 1750;
			script_grind:setWaitTimer(1750);
		end
	end

	-- create soulstone
	if (self.useSoulstone) then
		if (script_warlockEX:checkSoulstonesSpells()) then
			if (HasPet()) and (HasItem("Soul Shard")) and (not IsInCombat()) and (not localObj:HasBuff("Soulstone Resurrection")) then
				if (script_warlockEX:checkSoulstones()) then
					if (IsMoving()) then
						StopMoving();
						return true;
					end
					self.waitTimer = GetTimeEX() + 2000;
					script_grind:setWaitTimer(2000);
				end
			end
		-- use soulstone
			if (GetTimeEX() >= self.soulstoneTimer) and (not localObj:HasBuff("Soulstone Resurrection")) then
				local px, py, pz = GetLocalPlayer():GetPosition();
				local _tX, _tY, onScreen = WorldToScreen(px, py, pz);
				DrawText("Trying to use Soulstone in inventory!", _tX- 200, _tY-100, 255, 255, 255);
				if (not localObj:HasBuff("Soulstone Resurrection")) and (not IsMoving()) then
					StopMoving();
					if (script_warlockEX:useSoulstones()) then
					-- 1,800,000 ---   1000miliseconds per second * 60 seconds per minute * 30 minutes per cooldown
					self.soulstoneTimer = GetTimeEX() + 1800000;
					return true;
					end
				return;
				end
			end
		end
	end

	-- force bot to attack pets target
	if (GetNumPartyMembers() == 0) and (self.waitAfterCombat) and (IsInCombat()) and (HasPet()) and (not PlayerHasTarget()) then
		if (not PetHasTarget()) then
			if (GetPet():GetDistance() > 10) then
				AssistUnit("pet");
				PetFollow();
			end
		elseif (HasPet()) and (not PetHasTarget()) and (IsInCombat()) then
			--AssistUnit("pet");
			self.message = "Stuck in combat! WAITING! 4";
			return 4;
		end
	end

	-- Dark Pact instead of drink
	if (HasSpell("Dark Pact")) and (IsStanding()) and (localMana < 75) and (HasPet()) then
		if (not IsSpellOnCD("Dark Pact")) and (GetPet():GetManaPercentage() > 20) and (IsStanding()) then
			if (Cast("Dark Pact", localObj)) then
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
				if (not CastSpellByName("Life Tap", localObj)) then
					self.waitTimer = GetTimeEX() + 1650;
				end
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

	-- force bot to stop when using consume shadows
	if (self.consumeShadowsTimer > GetTimeEX()) then
		if (IsMoving()) then
			StopMoving();
			return true;
		end
	return true;
	end

	-- consume shadows
	if (HasPet()) and (self.useVoid) and (GetPet():GetHealthPercentage() < 55) and (not GetPet():IsDead()) and (self.hasConsumeShadowsSpell) and (not IsSpellOnCD("Consume Shadows")) and (not GetPet():HasBuff("Consume Shadow")) and (GetPet():GetManaPercentage() >= 40) and (GetTimeEX() > self.consumeShadowsTimer) then
		CastSpellByName("Consume Shadows");
		self.waitTimer = GetTimeEX() + 2500;
		self.consumeShadowsTimer = GetTimeEX() + 10000;
		script_grind:setWaitTimer(7000);
		StopMoving();
		self.message = "Using Voidwalker spell Consume Shadows";
		return true;
	end
	
	if (HasSpell("Summon Imp")) and (not HasPet()) and (self.useImp or self.useVoid or self.useSuccubus or self.usefelHunter) then	
		if (IsMoving()) then
			StopMoving();
		end
		if (not HasPet()) and (not IsCasting()) and (not IsChanneling()) and (not localObj:HasBuff("Blood Pact")) then
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
	if (not IsInCombat()) and (HasPet()) and (HasSpell("Health Funnel")) then
		if (GetPet():GetHealthPercentage() < 50) and (localHealth > 60) then
			if (GetPet():GetDistance() > 8) then
				PetFollow();
				self.waitTimer = GetTimeEX() + 500; 
				return true;
			end
			if (GetPet():GetDistance() < 20 and localMana > 10) then
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