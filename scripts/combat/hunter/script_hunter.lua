script_hunter = {

	message = 'Hunter Combat Script',

	hunterChooseAspectLoaded = include("scripts\\combat\\hunter\\script_hunterChooseAspect.lua"),
	hunterCheckPetFoodLoaded = include("scripts\\combat\\hunter\\script_hunterCheckPetFood.lua"),
	hunterDoPetChecksLoaded = include("scripts\\combat\\hunter\\script_hunterDoPetChecks.lua"),
	hunterSetAmmoLoaded = include("scripts\\combat\\hunter\\script_hunterSetAmmo.lua"),
	hunterScareBeastLoaded = include("scripts\\combat\\hunter\\script_hunterScareBeast.lua"),

	drinkMana = 30,
	eatHealth = 65,
	potionHealth = 10,
	potionMana = 15,
	feedTimer = 0,
	waitTimer = 0,
	hasPet = true,
	bagWithPetFood = 4,
	slotWithPetFood = GetContainerNumSlots(3), -- last slot in the bag
	foodName = 'PET FOOD NAME',
	stopWhenNoPetFood = false,
	quiverBagNr = 5,
	ammoIsArrow = true,
	useVendor = false,
	buyWhenQuiverEmpty = true,
	stopWhenQuiverEmpty = false,
	stopWhenBagsFull = true,
	hsWhenStop = false,
	hsBag = 1, -- HS in backpack (1st bag)
	hsSlot = 1, -- HS in slot 1 of the bag: hsBag
	ammoName = 0,
	isSetup = false,
	isChecked = true,
	useBandage = false,
	hasBandages = false,
	useFeedPet = true,
	meleeDistance = 4,
	useCheetah = false,
	useMarkMana = 7,
	useMark = true,
	useMultiShot = false,
	--useScorpidSting = false,
	waitAfterCombat = false,
	spellRange = 34,
	bagsFull = false,
	useRangedAttacks = true,
	arcaneShotMana = 15,
	serpentStingMana = 15,
	minSpellRange = 13,
	scareAdds = true,	-- scare adds on/off
	addScared = false,	-- is add scared/feared
	scareBeastTimer = 0,
	secondarySetup = false,
	faceTargetTimer = 0,
	petAttackTimer = 0,
	petFollowTimer = 0,

}	


function script_hunter:setup()

	self.feedTimer = GetTimeEX();
	self.waitTimer = GetTimeEX();

-- Save the name of pet food we use
	if (GetContainerItemLink(self.bagWithPetFood-1, self.slotWithPetFood)  ~= nil) then
		local _, _, iLink = string.find(GetContainerItemLink(self.bagWithPetFood-1, self.slotWithPetFood), "(item:%d+)");
		local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
		itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(iLink);
		self.foodName = itemName;
	end

-- don't buy ammo if less than level 4
	if (GetLocalPlayer():GetLevel() < 4) then
		self.buyWhenQuiverEmpty = false;
	end
	
-- set drink / eat settings lower if low level
	if (GetLocalPlayer():GetLevel() < 6) then
		self.drinkMana = 25;
		self.eatHealth = 35;
	end

-- set drink mana lower if higher level
	if GetLocalPlayer():GetLevel() >= 6 then
		self.drinkMana = 15;
	end

-- set eat health higher if higher level
	if GetLocalPlayer():GetLevel() > 15 then
		self.eatHealth = 50;
	end

-- set hunters mark mana lower if lower level
	if (GetLocalPlayer():GetLevel() < 10) then
		self.useMarkMana = 60;
	end
	
-- level 10 + settings
	if GetLocalPlayer():GetLevel() >= 10 then

-- check for spent talent points
		script_grindCheckSpentTalentPoints:checkSpentTalentPoints()

-- preserve some mana for mend pet
		self.arcaneShotMana = 25;
		self.serpentStingMana = 15;
	end

-- if we have aimed shot then set mana lower to use more often
	if HasSpell("Aimed Shot") then
		self.arcaneShotMana = 15;
	end

-- hardcore realm - set mana / health higher
	if GetRealmName() == "Permadeath - EU" then 

		if GetLocalPlayer():GetLevel() < 20 then
			self.eatHealth = 85;
		else
			self.eatHealth = 70;
		end
	end

-- turn on aspect of cheetah if we have it
	if HasSpell("Aspect of the Cheetah") then
		self.useCheetah = true;
	end

	self.isSetup = true;

end

function script_hunter:runBackwards(targetObj, range) 

	-- Run backwards if the target is within range

	local localObj = GetLocalPlayer();

	if (targetObj ~= 0) and IsInCombat()
	and not script_checkDebuffs:hasDisabledMovement()
	and not IsChanneling() and not IsCasting()

	then

		if not PlayerHasTarget() then
			AssistUnit("pet");
		end

		local xT, yT, zT = targetObj:GetPosition();
		local xP, yP, zP = localObj:GetPosition();
		local distance = targetObj:GetDistance();
		local xV, yV, zV = xP - xT, yP - yT, zP - zT;	
		local vectorLength = math.sqrt(xV^2 + yV^2 + zV^2);
		local xUV, yUV, zUV = (1/vectorLength)*xV, (1/vectorLength)*yV, (1/vectorLength)*zV;	
		local moveX, moveY, moveZ = xT + xUV*15, yT + yUV*15, zT + zUV;		
		if (distance < range)  then

			if script_checkAdds:checkAdds() then
				return 4;
			else
				script_navEXCombat:moveToTarget(localObj, moveX, moveY, moveZ)

				-- move fall-back
				if not IsMoving() then
					Move(moveX, moveY, moveZ)
					script_nav:resetNavigate();
				end


				self.waitTimer = GetTimeEX() + 500;
				script_grind:setWaitTimer(100);

			return 4;
			end
		end
	end
	return false;
end

function script_hunter:draw()
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
			5 - targeted player pet/totem
 ]]--

function script_hunter:run(targetGUID)

	-- secondary setup to stop strfind error
	if not self.secondarySetup then
		-- set ammo if not already set
		if self.ammoName == 0 or script_vendor.ammoName == nil or script_vendor.ammoName == 0 then
			script_hunterSetAmmo:setAmmo();
		end
		--DEFAULT_CHAT_FRAME:AddMessage('script_hunter: Ammo name is set to: "' .. self.ammoName .. '" ...');
		if (not strfind(itemName, "Arrow")) then
		--DEFAULT_CHAT_FRAME:AddMessage('script_hunter: Ammo will be bought at "Bullet" vendors...');
			script_vendor.itemIsArrow = false;
			self.ammoIsArrow = false;
			script_vendor.ammoName = itemName;
		else
		--DEFAULT_CHAT_FRAME:AddMessage('script_hunter: Ammo will be bought at "Arrow" vendors...');
			script_vendor.ammoName = itemName;
			self.ammoIsArrow = true;
		end	
		self.secondarySetup = true;
	end
-- set variables
	local localObj = GetLocalPlayer();
	local localMana = localObj:GetManaPercentage();
	local localHealth = localObj:GetHealthPercentage();
	local localLevel = localObj:GetLevel();

	-- set pet variables
	local pet = GetPet();
	local petHP = 0;

	if (pet ~= nil and pet ~= 0) then
		petHP = pet:GetHealthPercentage();
		local petMana = GetPet():GetManaPercentage();
		local petFocus = GetPet():GetFocus();
	end

	-- tell the grinder our set eat/drink settings
	script_grind.eatHealth = self.eatHealth;
	script_grind.drinkMana = self.drinkMana;

-- if we are dead then return
	if (localObj:IsDead()) then
		
	end

-- Assign the target 
	targetObj = GetGUIDObject(targetGUID);

	-- set combat script attack distance
	if PlayerHasTarget() and targetObj ~= nil and targetObj ~= 0 then
		
		-- change our attack distance to melee distance if we don't have a pet or target is targeting me
		if (IsInCombat() and GetTarget():GetDistance() < self.minSpellRange and script_grind:isTargetingMe(targetObj))
		or (IsInCombat() and GetLocalPlayer():GetLevel() > 9 and not HasPet())
		or (not IsInCombat() and GetTarget():GetDistance() < self.minSpellRange and not HasPet())
		
		then
			script_grind.combatScriptRange = self.meleeDistance;
		
			
		else
			script_grind.combatScriptRange = self.spellRange;
		end

	else
		script_grind.combatScriptRange = self.spellRange;
	end

	if HasPet() and targetObj ~= nil and targetObj ~= 0 then
		if not GetPet():IsInLineOfSight() and not targetObj:IsInLineOfSight() then
			if GetTimeEX() > self.petFollowTimer then PetFollow(); self.petFollowTimer = GetTimeEX() + 500; end;
		end
	end


-- if targetig is bugged then clear target
	if(targetObj == 0 or targetObj == nil) then
		ClearTarget();
		return 2;
	end

-- Check: Do we have a pet?
	if (self.hasPet) then
		if (localLevel < 10) then
			self.hasPet = false;
		end
	end
	
-- check for adds around us during combat and move to prevent pulling multiple enemies
	if (IsInCombat()) and (script_grind.skipHardPull) and (GetNumPartyMembers() == 0)
	and (targetObj:GetHealthPercentage() >= 20) and (not script_checkDebuffs:hasDisabledMovement())
	and (not targetObj:IsCasting()) then
		if (script_checkAdds:checkAdds()) then
			script_om:FORCEOM();
		return 4;
		end
	end


-- cast disengage if target is too close
	if self.hasPet and HasPet() and IsInCombat() and HasSpell("Disengage") and not IsSpellOnCD("Disengage") then
		if targetObj ~= nil and targetObj ~= 0 and GetLocalPlayer():GetManaPercentage() >= 8 then
			if (script_grind:isTargetingMe(targetObj) and targetObj:GetDistance() <= self.meleeDistance) or (targetObj:GetDistance() <= self.meleeDistance and not GetPet():IsDead() and self.useRangedAttacks) then
				
				CastSpellByName("Disengage", targetObj);
				self.waitTimer = GetTimeEX() + 250;
			end
		end
	end

	-- was causing bot to die more often with feign death on CD
-- if target is attacking me and we have a pet then feign death
--if targetObj ~= nil and targetObj ~= 0 and HasPet() and GetLocalPlayer():GetManaPercentage() >= 5 then
	--	local x, y, z = GetPet():GetPosition();
		--local xx, yy, zz = targetObj:GetPosition();
		--local dist = GetDistance3D(x, y, z, xx, yy, zz);
	--if not GetPet():IsDead() and script_grind:isTargetingMe(targetObj) and dist <= 3 then
		--	if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
		--if HasSpell("Feign Death") and not IsSpellOnCD("Feign Death") and not GetLocalPlayer():HasBuff("Feign Death") then
		--	if CastSpellByName("Feign Death") then
		--		self.waitTimer = GetTimeEX() + 2500;
		--		script_grind:setWaitTimer(2500);
	--		end
	--	end
	--end
--end
			
-- walk away from target if pet target guid is the same guid as target targeting me
	if targetObj ~= nil
	and targetObj ~= 0
	and GetPet() ~= 0
	and GetPet() ~= nil
	and self.hasPet
	and ((targetObj:GetUnitsTarget() ~= 0
	and targetObj:GetUnitsTarget() ~= nil) or targetObj:IsStunned())
	and not script_grind:isTargetingMe(targetObj)
	and not script_checkDebuffs:hasDisabledMovement()
	--and (targetObj:IsInLineOfSight())
	and not script_rotation.usingRotation
	and not IsChanneling()
	and not IsCasting()
	and script_hunter.useRangedAttacks
			
	then

		-- run backwards
		if targetObj ~= nil and targetObj:IsStunned() or (targetObj:GetUnitsTarget() ~= 0 and targetObj:GetUnitsTarget() ~= nil and targetObj:GetUnitsTarget():GetGUID() == GetPet():GetGUID() or targetObj:IsFleeing())

		then

			if targetObj:GetDistance() <= self.minSpellRange then
				if (script_hunter:runBackwards(targetObj, self.minSpellRange + 1)) then
					
					self.message = "Moving away from target for range attacks...";
					
					if targetObj:IsInLineOfSight() then
							if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
					elseif not targetObj:IsInLineOfSight() then
						if GetTimeEX() > self.petFollowTimer then PetFollow(); self.petFollowTimer = GetTimeEX() + 500; end;
					end		

					self.waitTimer = GetTimeEX() + 500;
				return 4;
				end
			end
		end			
	end

	-- if we have a pet then do pet checks in EX script
	if (self.hasPet and not IsInCombat()) then
		if (script_hunterDoPetChecks:doPetChecks()) then
			
		end
	end
	if not IsMounted() and HasPet() and not IsInCombat() then
		if GetPet():HasBuff("Feed Pet Effect") then
			self.message = "Pet is eating some food...";
			script_grind.autoBlacklistTimer = GetTimeEX() + 15000;
			return;
		end
	end

	
			-- move backwards if target too close for melee attacks
			if targetObj ~= 0 and targetObj ~= nil then
				if (targetObj:GetDistance() <= .4) and not script_rotation.usingRotation then

					if (script_hunter:runBackwards(targetObj, 2)) then
						return 4;
					end
				end
			end


-- return and do nothing if we are channeling, casting or wait timer/tick rate, or we are stunned
	if (IsChanneling() or IsCasting() or self.waitTimer > GetTimeEX()) or GetLocalPlayer():IsStunned() then

		if self.faceTargetTimer == 0 or self.faceTargetTimer == nil then self.faceTargetTimer = GetTimeEX(); end

		--if IsInCombat() then
			--if PlayerHasTarget() and GetTimeEX() > self.faceTargetTimer then
			--	GetTarget():FaceTarget();
			--	self.faceTargetTimer = GetTimeEX() + 350;
			--end
		--end

		return 4;
	end

	-- feign death if pet is dead
	if IsInCombat() and GetPet() ~= 0 and GetPet() ~= nil then
		if (GetPet():GetHealthPercentage() <= 1 or GetPet():IsDead()) then
			if (HasSpell("Feign Death")) and (not IsSpellOnCD("Feign Death"))
			and (GetLocalPlayer():GetManaPercentage() >= 3) then
				if CastSpellByName("Feign Death") then
					script_grind.waitTimer = GetTimeEX() + 5000;
					self.waitTimer = GetTimeEX() + 5000;
				end
			end
		end
	end

	-- if pet leaves attack range then call pet
		if (self.hasPet) and (GetPet() ~= 0) and GetPet() ~= nil then
			if GetPet():GetDistance() > self.spellRange then
				self.message = "Pet is too far... calling pet..."
				CallPet();
			end
		end

		
			-- Check if add already polymorphed
			if (not script_hunterScareBeast:isTargetScared() and (GetTimeEX() > self.scareBeastTimer)) then
				self.addScared = false;
			end

			-- Check: Polymorph add
			if not IsSpellOnCD("Scare Beast") and targetObj:IsInLineOfSight() and (targetObj ~= nil and self.scareAdds and script_grind:enemiesAttackingUs() > 1 and HasSpell('Scare Beast') and not self.addScared) and (targetObj:GetDistance() < 25) and not script_hunterScareBeast:isTargetScared() and script_hunterScareBeast:isScareTargetValid() then
				if not script_grind.adjustTickRate then script_grind.tickRate = 250; end
				self.message = "Scaring add...";
				script_hunterScareBeast:scareAdd(targetObjGUID)
				self.scareBeastTimer = GetTimeEX() + 1750;
				script_grind:setWaitTimer(1500);
				return true;
			end 

			-- Check: Sort target selection if add is polymorphed
			if (self.addScared) then
				if(script_grind:enemiesAttackingUs() >= 1 and targetObj:HasDebuff('Scare Beast')) then
					ClearTarget();
					script_grind.tickRate = 250;
					if script_hunterScareBeast:isScareTargetValid() then
						targetObj = script_hunterScareBeast:getTargetNotScared();
						targetObj:AutoAttack();
					end
				end
			end


-- auto attack / auto shot
	if IsAutoCasting("Auto Shot") and not IsMoving() and targetObj:GetDistance() >= self.minSpellRange then
	end

-- force bot to attack pets target
	if (IsInCombat()) and (HasPet()) and (not PlayerHasTarget()) and (GetNumPartyMembers() < 1) and (self.hasPet) and not GetPet():IsDead() then
		if (PetHasTarget()) and not script_grind:isTargetingMe(GetPet():GetUnitsTarget()) then
			--if (GetPet():GetDistance() > self.minSpellRange) then
				AssistUnit("pet");
			--end
		-- don't return if we don't want to wait after combat phase
		elseif self.waitAfterCombat  then
			AssistUnit("pet");
			return 4;
		elseif not self.waitAfterCombat then
			AssistUnit("pet");
		end
		-- fallback because it seems assist unit doesn't work right on some servers'
		if HasPet() and GetPet():GetUnitsTarget() ~= 0 and GetPet():GetUnitsTarget() ~= nil then
			AssistUnit("pet");
		end
	end

-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(300, 500);

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
		script_helper:mountUp();
	end
	if (not IsMounted()) then
		script_hunterChooseAspect:chooseAspect(targetObj);
	end

-- check pet for disabling debuffs before we attack more targets, sleep, stun, etc
	if not IsInCombat() and script_checkDebuffs:petDebuff() then
		self.message = "waiting for pet debuffs";
		self.waitTimer = GetTimeEX() + 1500;
		return true;
	end

	if script_grind.enemyObj ~= nil then if (GetTarget() == nil or GetTarget() == 0) and not HasPet() then targetObj:AutoAttack(); end end

-- we have a valid enemy
	if (targetObj ~= 0 and targetObj ~= nil) then

		self.message = "Killing " .. targetObj:GetUnitName() .. "...";

		-- if pet leaves attack range then call pet
		if (self.hasPet) and (GetPet() ~= 0) and GetPet() ~= nil then
			if GetPet():GetDistance() > self.spellRange then
				self.message = "Pet is too far... calling pet..."
				CallPet();
			end
		end
		
		-- Cant Attack dead targets
		if (targetObj:IsDead() or not targetObj:CanAttack()) then
			self.waitTimer = GetTimeEX() + 1200;
			
		end

		if not PlayerHasTarget() and PetHasTarget() and IsInCombat() and HasPet() then
			if not GetPet():IsDead() then
				AssistUnit("pet");
			end
		end

		targetHealth = targetObj:GetHealthPercentage();

		-- Don't attack if we should rest first
		if (localHealth < self.eatHealth and not script_grind:isTargetingMe(targetObj)
			and targetHealth > 99 and not targetObj:IsStunned()) then
			self.message = "Need rest...";
			return 4;
		end

		-- check line of sight
		if (not targetObj:IsInLineOfSight()) or (targetObj:GetDistance() > self.spellRange) then
			return 3;
		end

		-- face target
		if (targetObj:GetDistance() < self.spellRange) and script_grind:isTargetingMe(targetObj)
		and (targetObj:IsInLineOfSight()) and (not IsMoving()) then
				
		end

		-- Auto Attack
		if (targetObj:GetDistance() < self.spellRange) and targetObj:GetDistance() > self.minSpellRange and (targetObj:IsInLineOfSight())
		and not targetObj:IsDead() and targetObj:CanAttack() then
			if (self.hasPet) then
				if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
			end
			if (not IsAutoCasting("Auto Shot")) and not targetObj:IsDead() and targetObj:IsInLineOfSight() and not IsMoving() then
				if targetObj:GetDistance() >= self.minSpellRange then
					
				end
				if not CastSpellByName("Auto Shot", targetObj) then
					if targetObj:GetDistance() <= self.spellRange then
						self.waitTimer = GetTimeEX() + 500;
					end
				end
			end
		end

		--send pet to attack something attacking me even if not main target - if we have 2 or more attacking us
		-- set a timer to give the pet time to gain aggro on a Target
		if IsInCombat() and HasPet()
		and script_grind:enemiesAttackingUs() > 1 
		and script_grind:isAnyTargetTargetingMe()
		then
				
			-- send pet to attack a target attacking me
			script_hunter:petAttackTargetAttackingMe();

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


-- NOT in combat ---  do pull stuff

		-- do pull function if we are far enough away
		if (GetLocalPlayer():GetLevel() < self.minSpellRange) then
			if (targetObj:GetDistance() > self.minSpellRange) and (targetObj:GetDistance() < self.spellRange) and targetObj:IsInLineOfSight() and self.useRangedAttacks then
				if script_hunter:hunterPull(targetObj) then
				targetObj:FaceTarget();
					self.waitTimer = GetTimeEX() + 250;
				end
				if HasPet() then if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end; end
				-- else move to target to melee
			elseif (targetObj:GetDistance() < self.minSpellRange) or not targetObj:IsInLineOfSight() or not self.useRangedAttacks then
				if (targetObj:GetDistance() > self.meleeDistance) then
				if HasPet() then if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end; end
					return 3;
				end
				-- recheck move to melee range
			elseif targetObj:GetDistance() > self.meleeDistance and not self.useRangedAttacks then
				if not IsAutoCasting("Attack") then
					targetObj:AutoAttack();
				end
				if HasPet() then if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end; end
				return 3;
			elseif targetObj:GetDistance() < self.minSpellRange then
				return 3;
			end
		end
						
-- if we are not in combat then do pull ELSE
		if (not IsInCombat()) and (targetObj:GetDistance() < self.spellRange) and (targetObj:GetDistance() > self.minSpellRange) and self.useRangedAttacks
		and (targetObj:IsInLineOfSight()) then
			if script_hunter:hunterPull(targetObj) then 
				self.waitTimer = GetTimeEX() + 250;
			end
			if HasPet() then if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end; end
			script_grind:setWaitTimer(1500);
			if (not IsMoving()) then
				
			end

			return;
			

-- NOW IN COMBAT

		else

-- Check: If pet is dismissed then Call pet 
			if (GetPet() == 0) and (script_hunter.hasPet) and (IsStanding()) and (not IsMounted()) then
				script_hunter.message = "Pet is missing, calling pet...";
				CallPet();
				script_hunter.waitTimer = GetTimeEX() + 1850;
			return true;
			end

			self.message = "Killing " .. targetObj:GetUnitName() .. "...";

			if targetObj:IsDead() then ClearTarget(); end

			-- check line of sight
			if (not targetObj:IsInLineOfSight() or targetObj:GetDistance() > self.spellRange) then
				return 3;
			end

			-- Check: Do we have the right target (in UI) ??
			if (GetTarget() ~= 0 and GetTarget() ~= nil) then
				if (GetTarget():GetGUID() ~= targetObj:GetGUID()) then
					ClearTarget();
					self.waitTimer = GetTimeEX() + 500;
					script_grind:setWaitTimer(500);
					targetObj = 0;
					
				end
			end

			if targetObj ~= 0 and targetObj ~= nil then
			if not self.useRangedAttacks and (targetObj:GetDistance() > self.meleeDistance or not targetObj:IsInLineOfSight()) then
				return 3;
			end
			end

			-- war stomp targets until level 6 then save for interrupts
			if (IsInCombat())
			and targetObj ~= nil
			and targetObj ~= 0
			and (targetObj:GetHealthPercentage() > 10) 
			and (HasSpell("War Stomp"))
			and (not IsSpellOnCD("War Stomp"))
			and (not localObj:IsStunned())
			and (targetObj:GetDistance() <= 8)
			and (not targetObj:IsStunned())
			and (not IsMoving())
			
			then

				CastSpellByName("War Stomp");
			end

-- force auto shot if in combat
			if (IsInCombat()) 
			and targetObj ~= 0
			and targetObj ~= nil
			and self.useRangedAttacks
			and not IsMoving()
			
			then
				if not IsMoving() then
						
					end

				if (not IsAutoCasting("Auto Shot"))
				and (targetObj:GetDistance() > self.minSpellRange)
				and (targetObj:GetDistance() < self.spellRange)
				and (targetObj:IsInLineOfSight())
				and not targetObj:IsDead()
				and targetObj:CanAttack()
				
				then

					if not CastSpellByName("Auto Shot", targetObj) then
						if targetObj:GetDistance() <= self.spellRange then
							self.waitTimer = GetTimeEX() + 500;
						end
						if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
					end
				end
			end
	
			-- Check: Use Healing Potion 
			if (localHealth <= self.potionHealth) then 
				if (script_helper:useHealthPotion()) then 
					 
				end 
			end
	
			-- Check: Use Mana Potion 
			if (localMana <= self.potionMana) then 
				if (script_helper:useManaPotion()) then 
					 
				end 
			end
	
			-- Check: Use Rapid Fire if we have adds
			if (script_grind:enemiesAttackingUs() > 1)
			and (HasSpell("Rapid Fire"))
			and (not IsSpellOnCD('Rapid Fire')) 
			and (localMana > 10)
			and self.useRangedAttacks
			
			then

				CastSpellByName('Rapid Fire');
				self.waitTimer = GetTimeEX() + 1500;
				
			end

			if targetObj ~= nil and targetObj ~= 0 then
				if targetObj:GetDistance() > self.spellRange or not targetObj:IsInLineOfSight() then
					return 3;
				end
			end
	
			-- Check: If pet is stunned, feared etc use Bestial Wrath
			if (self.hasPet) and (HasPet()) and HasSpell("Bestial Wrath") and not IsSpellOnCD("Bestial Wrath") and localMana >= 6 then
				if (targetHealth >= 55 and targetHealth <= 98) or petHP <= 50 or pet:IsStunned() or pet:IsConfused() or pet:IsFleeing() then 

					CastSpellByName("Bestial Wrath");
					self.waitTimer = GetTimeEX() + 1500;
				return true; 
				end
			end

			-- pet intimidation
			if HasSpell("Intimidation") and not IsSpellOnCD("Intimidation") and HasPet() and localMana >= 25 and (targetHealth >= 55 or targetObj:IsCasting()) then
				CastSpellByName("Intimidation");
				self.waitTimer = GetTimeEX() + 1500;
			end

			-- mend pet
			if (HasSpell("Mend Pet")) and (GetPet() ~= 0) then
				-- Check: Mend the pet if it has lower than 70% HP and out of combat
				if (script_hunter.hasPet) and (petHP < 50) and (petHP > 0) then	

					-- pet is too far away to mend
					if (GetPet():GetDistance() > 20) then
						if GetTimeEX() > self.petFollowTimer then PetFollow(); self.petFollowTimer = GetTimeEX() + 500; end;
						return true;

					-- pet is close enough to mend
					elseif (GetPet():GetDistance() < 20) and (localMana >= 15) then
						if (script_hunter.hasPet) and (petHP < 60) and (petHP > 0) then
							script_hunter.message = "Pet has lower than 50% HP, mending pet...";	
							if (IsMoving()) or (not IsStanding()) then
								StopMoving();
								return true;
							end
							CastSpellByName('Mend Pet');
							script_hunter.waitTimer = GetTimeEX() + 550; 
							script_grind:setWaitTimer(5000);
							grind2:setTimer(5000);
							return true;
						end
					end
				end
			end

			--Racial
			if (not IsMoving()) and targetObj ~= nil and targetObj ~= 0 then
				if (targetObj:GetDistance() <= 6) then
					CheckRacialSpells();
					self.waitTimer = GetTimeEX() + 200;
				end
			end

			-- mend pet
			if (HasSpell("Mend Pet")) and (GetPet() ~= 0) then
				-- Check: Mend the pet if it has lower than 70% HP and out of combat
				if (script_hunter.hasPet) and (petHP < 50) and (petHP > 0) then	
					if (GetPet():GetDistance() > 20) then
					if GetTimeEX() > self.petFollowTimer then PetFollow(); self.petFollowTimer = GetTimeEX() + 500; end; self.waitTimer = GetTimeEX() + 1000;
						return true;
					
					elseif (GetPet():GetDistance() < 20) and (localMana >= 15) then
						if (script_hunter.hasPet) and (petHP < 60) and (petHP > 0) then
							script_hunter.message = "Pet has lower than 50% HP, mending pet...";	
							CastSpellByName('Mend Pet');
							script_hunter.waitTimer = GetTimeEX() + 1850; 
							return true;
						end
					end
				end
			end	

			-- follower walk away from any target that is not attacking me and I am attacking it
			if (GetNumPartyMembers() > 0) and not script_rotation.usingRotation and self.useRangedAttacks and targetObj ~= 0 and targetObj ~= nil then
				if (targetObj:IsInLineOfSight())
				and (targetObj:GetUnitsTarget() ~= 0
				and targetObj:GetUnitsTarget():GetGUID() ~= localObj:GetGUID()) or targetObj:IsStunned() then

						if (script_hunter:runBackwards(targetObj, self.minSpellRange)) then
							if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
							self.message = "Moving away from target for range attacks...";
						return 4;
						end

				end
			end

-- target is far enough to use ranged attacks

			if targetObj ~= nil and targetObj ~= 0 then
			if (targetObj:GetDistance() > self.minSpellRange) and (targetObj:GetDistance() < self.spellRange) and self.useRangedAttacks then

				-- use Hunter's Mark first
				if (self.useMark) then
					if (HasSpell("Hunter's Mark")) and (not targetObj:HasDebuff("Hunter's Mark"))
					and (targetObj:IsInLineOfSight()) and (targetHealth >= 50) and (localMana >= self.useMarkMana) then

						CastSpellByName("Hunter's Mark");
						self.waitTimer = GetTimeEX() + 1650;
						if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
						if (not IsMoving()) then
							
						end

						
					end
				end
		
				-- use concussive shot
				if (not IsSpellOnCD("Concussive Shot")) then
					if (HasSpell("Concussive Shot")) and (localMana > self.arcaneShotMana)
					and (script_grind:isTargetingMe(targetObj) or targetObj:IsFleeing()) then
						CastSpellByName("Concussive Shot");
						self.waitTimer = GetTimeEX() + 1500;
						if (not IsMoving()) then
							
						end

						
					end	
				end

				-- use serpent sting
				if not IsSpellOnCD("Serpent Sting") and (not targetObj:HasDebuff("Serpent Sting")) and (not self.useScorpidSting) then
					if (HasSpell("Serpent Sting")) and (targetObj:IsInLineOfSight()) and (localMana > self.serpentStingMana)
					and targetObj:GetCreatureType() ~= "Elemental" and targetObj:GetCreatureType() ~= "Demon"
					and targetObj:GetCreatureType() ~= "Mechanical"
					and targetHealth >= 25
					then
						if (not IsMoving()) then
							
						end

						if not CastSpellByName("Serpent Sting") then
							self.waitTimer = GetTimeEX() + 1500;
						end
						
					end
				end

				-- use arcane shot
				if (not IsSpellOnCD("Arcane Shot")) and localMana >= self.arcaneShotMana and not HasSpell("Aimed Shot") then
					if (HasSpell("Arcane Shot")) and (targetObj:IsInLineOfSight()) then
						CastSpellByName("Arcane Shot");
						if (not IsMoving()) then
							
						end
						self.waitTimer = GetTimeEX() + 1500;
					end
				end

				-- aimed Shot
				if not IsMoving() and HasSpell("Aimed Shot") and not IsSpellOnCD("Aimed Shot") and localMana >= self.arcaneShotMana and targetHealth >= 15 then
					if CastSpellByName("Aimed Shot") then
						self.waitTimer = GetTimeEX() + 3000;
					end
				end


				-- multi shot
				if (self.useMultiShot) then
					if (HasSpell("Multi-Shot")) and (not IsSpellOnCD("Multi-Shot")) and (localMana >= 25) then
						CastSpellByName("Multi-Shot");
						self.waitTimer = GetTimeEX() + 1500;
						
					end
				end
	
				-- mend pet
				if (HasSpell("Mend Pet")) and (GetPet() ~= 0) then
					-- Check: Mend the pet if it has lower than 70% HP and out of combat
					if (script_hunter.hasPet) and (petHP < 50) and (petHP > 0) then	
						if (GetPet():GetDistance() > 20) then
							if GetTimeEX() > self.petFollowTimer then PetFollow(); self.petFollowTimer = GetTimeEX() + 500; end;
							return true;
						
						elseif (GetPet():GetDistance() < 20) and (localMana >= 15) then
							if (script_hunter.hasPet) and (petHP < 60) and (petHP > 0) then
								script_hunter.message = "Pet has lower than 50% HP, mending pet...";	
								CastSpellByName('Mend Pet');
								script_hunter.waitTimer = GetTimeEX() + 1850; 
								return true;
							end
						end
					end
				end
			end
			end
-- melee attacks otherwise

			-- Auto Attack
			if targetObj ~= 0 and targetObj ~= nil then
			if (targetObj:GetDistance() < self.minSpellRange) then

				-- face the target if we are a melee hunter
				if targetObj:GetDistance() <= 5 and not IsMoving() and not self.useRangedAttacks then
					
				end
				if targetObj:GetDistance() > self.meleeDistance then
					return 3;
				end

				if not IsAutoCasting("Attack") then
					targetObj:AutoAttack();
				end

				if GetPet() ~= 0 and GetPet() ~= nil and self.hasPet and script_grind:isTargetingMe(targetObj) then
					if targetObj:GetDistance() > self.meleeDistance or not targetObj:IsInLineOfSight() then
						return 3;
					end

					if targetObj:GetDistance() <= self.meleeDistance and not IsMoving() and script_grind:isTargetingMe(targetObj) then
						
						if not IsAutoCasting("Attack") then
							targetObj:AutoAttack();
						end
					end
				end

				-- cast raptor strike
				if (HasSpell("Raptor Strike")) and (not IsSpellOnCD("Raptor Strike")) and (localMana > 10) 
				and (targetObj:GetDistance() <= self.meleeDistance) then
					if (not IsMoving()) then
						
					end
					if (not IsSpellOnCD("Raptor Strike")) then
						if (not IsMoving()) then
							
						end
						CastSpellByName("Raptor Strike")
						if HasPet() then
							if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
						end
						self.waitTimer = GetTimeEX() + 500;
						
					
					end
				end

				-- call pet if it's too far
				--if (self.hasPet) and (GetPet() ~= 0 and GetPet() ~= nil) and GetPet():GetDistance() > self.spellRange then
					--self.message = "Pet is too far... calling pet..."
					--CallPet();
				--end

			
					
				-- check distance
				if (targetObj:GetDistance() > self.meleeDistance) and (GetNumPartyMembers() == 0)
				and (script_grind.isTargetingMe(targetObj)) then
					return 3;
				end

				-- cast wing clip
				if (HasSpell("Wing Clip")) and (not IsSpellOnCD("Wing Clip")) and not targetObj:HasDebuff("Wing Clip") and (localMana > 10) and (targetHealth < 35) then
					CastSpellByName("Wing Clip");
					self.waitTimer = GetTimeEX() + 1500;
				end

				-- cast raptor strike
				if (HasSpell("Raptor Strike")) and (not IsSpellOnCD("Raptor Strike")) and (localMana > 10)
				and (targetObj:GetDistance() <= self.meleeDistance) and (script_grind.isTargetingMe(targetObj)) then
					if (not IsMoving()) then
						
					end
					if (not IsSpellOnCD("Raptor Strike")) then
						if (not IsMoving()) then
							
						end
						CastSpellByName("Raptor Strike")
						
					
					end
				end
	
			end 
			end
		end
	end
end

function script_hunter:rest()

	local pet = GetPet();

	if (not self.isSetup) then
		script_hunter:setup();
	end

	if not IsInCombat() then
		if not PlayerHasTarget() then
			script_grind.combatScriptRange = self.spellRange;
		end
		if PlayerHasTarget() and GetTarget():GetDistance() <= self.minSpellRange then
			script_grind.combatScriptRange = self.meleeDistance;
		end
	end

	-- cancel feign death
	if GetLocalPlayer():HasBuff("Feign Death") then
		if (pet ~= 0 and pet ~= nil and not IsInCombat and pet:IsDead()) or (not IsInCombat() and not IsAnyTargetTargetingPlayer()) then
			local x, y, z = GetLocalPlayer():GetPosition();
			Move(x+1, y+1, z);
		end
	end

	-- if we have any bandages then we can use first aid skill
	if (HasItem("Linen Bandage")) or 
		(HasItem("Heavy Linen Bandage")) or 
		(HasItem("Wool Bandage")) or 
		(HasItem("Heavy Wool Bandage")) or 
		(HasItem("Silk Bandage")) or 
		(HasItem("Heavy Silk Bandage")) or 
		(HasItem("Mageweave Bandage")) or 
		(HasItem("Heavy Mageweave Bandage")) or 
		(HasItem("Runecloth Bandage")) or 
		(HasItem("Heavy Runecloth Bandage")) then

		self.hasBandages = true;
	else
		self.hasBandages = false;
		if (not script_grind.useFirstAid) then
			self.useBandage = false;
		end
	end

	-- craft bandages
	if (not GetLocalPlayer():IsDead()) and (not self.hasBandages) and (script_grind.useFirstAid) and (HasSpell("First Aid")) then
		if script_firstAid:canCraftBandage() then
			if (script_firstAid:craftBandages()) then
				return true;
			end
		end
		if (script_firstAid.bookOpen) then
			script_firstAid.bookOpen = false;
			CloseTradeSkill();
		end
	end


	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(300, 500);

		if (IsMoving()) or (not IsInCombat()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end

	local localObj = GetLocalPlayer();
	local localMana = localObj:GetManaPercentage();
	local localHealth = localObj:GetHealthPercentage();

	-- Stop moving before we can rest
	if(localHealth < self.eatHealth) or (localMana < self.drinkMana) then
		if (IsMoving()) then
			StopMoving();
			return true;
		end
	end

	-- if has bandage then use bandages
	if (self.hasBandages) and (self.useBandage) and (not IsMoving()) then
		if (not script_checkDebuffs:hasPoison()) and (not IsEating()) and (localHealth <= self.eatHealth)
		and (not localObj:HasDebuff("Recently Bandaged")) then
			if (IsMoving()) then
				StopMoving();
			end
			self.waitTimer = GetTimeEX() + 1200;
			if (IsStanding()) and (not IsInCombat()) and (not IsMoving()) and (not localObj:HasDebuff("Recently Bandaged")) then
				script_helper:useBandage()		
				self.waitTimer = GetTimeEX() + 6000;
			end
			
		end
	end

	-- Check: Let the feed pet duration last, don't engage new targets
	if not IsMounted() and (not IsInCombat()) and (self.feedTimer > GetTimeEX()) and (self.useFeedPet) and (not IsInCombat())
	and (self.hasPet) and (GetPet() ~= 0) then 
		self.message = "Feeding the pet, pausing... Make sure food is in correct slot!";
		if (GetPet():GetDistance() > 8) then
			if GetTimeEX() > self.petFollowTimer then PetFollow(); self.petFollowTimer = GetTimeEX() + 500; end;
			self.waitTimer = GetTimeEX() + 1250;
			grind2RunCombatState.blacklistTargetTimer = GetTimeEX() * 2;
			return true;
		end
	end

	-- Eat and Drink
	if not IsMoving() and (not IsDrinking() and localMana < self.drinkMana) then
			self.message = "Need to drink...";
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			if (script_helper:drinkWater()) then 
				self.waitTimer = GetTimeEX() + 1500;
				self.message = "Drinking..."; 
				return true; 
			else 
				self.message = "No drinks! (or drink not included in script_helper)";
				ClearTarget();
				return true; 
			end
		end

	if not IsMoving() and (not IsEating() and localHealth < self.eatHealth) then	
		self.message = "We need to eat...";
		if (IsMoving()) then
			StopMoving();
			return true;
		end
		
		if (script_helper:eat()) then 
			self.message = "Eating..."; 
			return true; 
		else 
			self.message = "No food! (or food not included in script_helper)";
			return true; 
		end
	end
	
	if not IsInCombat() and (localMana < self.drinkMana or localHealth < self.eatHealth) then
		if (IsMoving()) then
			StopMoving();
		end
		return true;
	end

	-- night elve stealth while resting
	if (IsDrinking() or IsEating()) and (HasSpell("Shadowmeld")) and (not IsSpellOnCD("Shadowmeld"))
	and (not localObj:HasBuff("Shadowmeld")) then
		if (CastSpellByName("Shadowmeld")) then
			
		end
	end
	
	-- continue resting if eating or drinking
	if((localMana < 95 and IsDrinking()) or (localHealth < 95 and IsEating())) then
		self.message = "Resting, eating and/or drinking...";
		return true;
	elseif (not IsEating() or (IsEating() and localHealth >= 95)) or (not IsDrinking() or (IsDrinking() and localMana >= 95)) then
		if not IsStanding() then
			JumpOrAscendStart()
		end
	end

	-- Check hunter bags if they are full
	local inventoryFull = true;
	-- Check bags 1-4, except the quiver bag (quiverBagNr)
		for i=1,4 do 
		if (i ~= self.quiverBagNr) then 
			for y=1,GetContainerNumSlots(i-1) do 
				local texture, itemCount, locked, quality, readable = GetContainerItemInfo(i-1,y);
				if (itemCount == 0 or itemCount == nil) then 
					inventoryFull = false; 
				end 
			end 
		end 
	end

	-- Tell the grinder we cant loot
	if (inventoryFull) then
		script_grind.bagsFull = true;
	end

	if (script_grind.useVendor and grind2.useVendor and inventoryFull) then


		-- we must continue with sell script here because the check bag function in the DLL will override bag checks...
		script_vendor:sell();

		script_hunter.bagsFull = true;
	end

	-- Check: If Mainhand is broken stop bot
	local isRangedBroken = GetInventoryItemBroken("player", 18);
	
	if (isRangedBroken and script_grind.useVendor) then
		self.message = "Our weapon is broken, go to reapir...";
		script_vendor:repair();
		return false;
	end

	if (GetNumPartyMembers() == 0)
		and (not script_grind.useVendor)
		and inventoryFull
		and script_grind.stopBotWhenInvFull

	then

		self.message = "Inventory is full...";

		if (IsMoving()) then
			StopMoving();
		end
		
		if (self.hsWhenStop) then
			if (GetContainerItemCooldown(self.hsBag-1, self.hsSlot) == 0) then 
				UseItem('Hearthstone'); 
				self.message = "Inventory is full, using hearthstone...";
				return true; 
			else 
				Logout(); StopBot(); return true; 
			end 	
		end
		return true;
	end

	-- Quiver check : should we go buy ammo?
	if (self.buyWhenQuiverEmpty and self.ammoName ~= 0 and not IsInCombat()) and script_grind.useVendor then
		local ammoNr = 0;
		for y=1,GetContainerNumSlots(self.quiverBagNr-1) do
			local texture, itemCount, locked, quality, readable = GetContainerItemInfo(self.quiverBagNr-1,y);
			if (itemCount ~= nil) then 
				ammoNr = ammoNr + 1; 
			end 
		end

		-- Go buy ammo if we have just 1 stack of ammo left
		if (ammoNr <= 1 and self.ammoName ~= 0) then
			script_vendor:buyAmmo(self.quiverBagNr-1, self.ammoName, self.ammoIsArrow);
			script_grind.message = "Going to vndor to buy ammo...";
			return;
		end 
	end

	-- Quiver check : Stop when out of ammo?
	if (self.stopWhenQuiverEmpty and not IsInCombat()) then
		local quiverEmpty = true;
		for y=1,GetContainerNumSlots(self.quiverBagNr-1) do
			local texture, itemCount, locked, quality, readable = GetContainerItemInfo(self.quiverBagNr-1,y);
			if (itemCount ~= nil) then 
				quiverEmpty = false; 
			end 
		end

		if (quiverEmpty and self.hsWhenStop) then
			if (GetContainerItemCooldown(self.hsBag-1, self.hsSlot) == 0) then 
				UseItem('Hearthstone'); 
				self.message = "Quiver is empty, using hearthstone...";
				return true; 
			else 
				Logout(); StopBot(); return true; 
			end 	
		end
		if (quiverEmpty) then
			Logout(); StopBot(); return true;
		end
	end

	-- Check pet food, change bag and/or slot if the stack ran out
	script_hunterCheckPetFood:checkPetFood();

	-- Pet checks
	if (script_hunterDoPetChecks:doPetChecks()) then return true; end

	if not HasSpell("Mend Pet") and GetPet() ~= nil and GetPet() ~= 0 then
		if GetPet():GetHealthPercentage() <= 55 then
			self.message = "No mend pet spell... waiting for pet health";
			return true;
		end
	end
	if localMana > 95 and IsDrinking() or localHealth > 95 and IsEating() then JumpOrAscendStart(); end
	-- Aspect check
	if (not IsMounted()) then if (script_hunterChooseAspect:chooseAspect(script_grind:getTarget())) then return false; end end

	-- No rest / buff needed
	if (self.needToRest) then
		self.waitTimer = GetTimeEX() + 500;
		self.message = "Need to rest!";
		return;
	end
	return false;
end

function script_hunter:hunterPull(targetObj)

	local localMana = GetLocalPlayer():GetManaPercentage();

	if (not IsStanding()) then 
		JumpOrAscendStart();
	end
	if IsMounted() then script_helper:mountUp() end

	if self.waitTimer > GetTimeEX() or IsCasting() or IsChanneling() then return; end

	if self.hasPet and HasPet() and not IsMoving() and not targetObj:IsDead() and targetObj:CanAttack() then
		if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
	end

	-- use Hunter's Mark
	if not IsSpellOnCD("Hunter's Mark") and (not IsInCombat()) and (self.useMark) and (localMana >= self.useMarkMana) and (not targetObj:HasDebuff("Hunter's Mark")) and (IsStanding()) then
		if (GetLocalPlayer():GetUnitsTarget() ~= 0) and (targetObj:CanAttack()) and (not targetObj:IsDead()) and (HasSpell("Hunter's Mark")) then
			if CastSpellByName("Hunter's Mark") then
				if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
				if (not IsMoving()) then
					targetObj:FaceTarget();
				end
				self.waitTimer = GetTimeEX() + 1500;
			end
		end
	end

	-- aimed Shot
	if HasSpell("Aimed Shot") and not IsSpellOnCD("Aimed Shot") and localMana >= 10 then
		if targetObj:GetDistance() <= self.spellRange and targetObj:IsInLineOfSight() then
			if IsMoving() then StopMoving() return true;
			end
			if CastSpellByName("Aimed Shot") then
				if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
				self.waitTimer = GetTimeEX() + 3000;
			end
		return;
		end
	end

	-- auto shot
	if (not IsAutoCasting("Auto Shot")) and (targetObj:IsInLineOfSight())
	and (IsStanding()) and (targetObj:GetDistance() > self.minSpellRange)
	and not targetObj:IsDead() and not IsMoving() then
		if (not IsMoving()) and targetObj:GetDistance() >= self.minSpellRange and targetObj:GetDistance () <= self.spellRange then
			targetObj:FaceTargeT();
		end

		CastSpellByName("Auto Shot", targetObj);

		if targetObj:GetDistance() <= self.spellRange then
			self.waitTimer = GetTimeEX() + 500;
		end
		if (GetPet() ~= 0) and (self.hasPet) then
			if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
		end
		--self.waitTimer = GetTimeEX() + 1500;
		--script_grind:setWaitTimer(1500);
		--
	end

	-- use concussive shot
	-- only use this to pull if we don't have an active pet'
	if (not IsSpellOnCD("Concussive Shot")) and (IsStanding()) then
		if (HasSpell("Concussive Shot")) and (targetObj:IsInLineOfSight()) and (localMana > self.arcaneShotMana) then
			if CastSpellByName("Concussive Shot") then
				if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
				self.waitTimer = GetTimeEX() + 500;
			end		
		end
	end

	-- use serpent sting
	if not IsSpellOnCD("Serpent Sting") and (not targetObj:HasDebuff("Serpent Sting")) and (not self.useScorpidSting) and (IsStanding()) then
		if (HasSpell("Serpent Sting")) and (targetObj:IsInLineOfSight()) and (localMana > self.serpentStingMana) then
			if not CastSpellByName("Serpent Sting") then
				if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
				self.waitTimer = GetTimeEX() + 500;
			end
		end
	end

	-- use Scorpid Sting
	--if (not targetObj:HasDebuff("Scorpid Sting")) then
	--	if (HasSpell("Scorpid Sting")) and (targetObj:IsInLineOfSight()) and (localMana > 20) and (targetHealth > 30) then
	--		CastSpellByName("Scorpid Sting");
	--		if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;		--		
	--	end
	--end
					
	-- use arcane shot
	if (not IsSpellOnCD("Arcane Shot")) and (IsStanding()) and not HasSpell("Aimed Shot") then
		if (HasSpell("Arcane Shot")) and (targetObj:IsInLineOfSight()) and (localMana > self.arcaneShotMana) then
			if CastSpellByName("Arcane Shot") then
				if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
				self.waitTimer = GetTimeEX() + 500;
			end	
		end
	end

	if (targetObj:GetDistance() <= 10) then

		if not IsAutoCasting("Attack") then
			CastSpellByName("Attack");
		end

	elseif targetObj:GetDistance() > self.meleeDistance then 
		return 3;
	end
end

-- check to see if pet is attacking a target attacking me, and if not then pet attack
function script_hunter:petAttackTargetAttackingMe()

	-- make sure we have a pet
	if GetPet() ~= 0 and GetPet() ~= nil then

		-- iterate first object
		local i, t = GetFirstObject()

		-- valid object
		while i ~= 0 do

			-- if enemy type is valid
			if (t == 3 or typeObj == 4) and i:GetDistance() <= 50 and not i:IsCritter() and not i:IsDead() and i:CanAttack() then

				-- if a target is targeting me then attack one of them
				if script_grind:isTargetingMe(i) or grind2IsTargetingMe:target(i) then

					-- we need to make sure the pet does have a target before we check for its target... target of target
					if not PetHasTarget() then

						-- get a target attacking me
						if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;
					end

					-- pet has a target
					if PetHasTarget() then

						-- check its target to see if it's the same target that is tattacking me'
						if GetPet():GetUnitsTarget():GetGUID() ~= i:GetGUID() then

							-- apparently we need to target it first either way... pet attack doesn't work without a target
							-- make sure we don't keep interacting with it.
							if PlayerHasTarget() then

								-- if my target isn't the target attacking me then
								if GetLocalPlayer():GetUnitsTarget():GetGUID() ~= i:GetGUID() then

									-- target the target
									i:AutoAttack();

									-- send pet to attack target attacking me
									if GetTimeEX() > self.petAttackTimer then PetAttack(); self.petAttackTimer = GetTimeEX() + 1000; end;

									if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
										script_grind.enemyObj = grind2.enemyTarget;
									end
									
									-- interact again with grinder object
									if script_grind.enemyObj ~= nil and script_grind.enemyObj ~= 0 and i:GetGUID() ~= script_grind.enemyObj:GetGUID() then
										if not IsAutoCasting("Attack") then
											script_grind.enemyObj:AutoAttack();
										end
									elseif not PlayerHasTarget() then
										TargetNearestEnemy();
									end
								end
							end
						end
					end
				end
			end

		-- iterate next object
		i, t = GetNextObject(i);
		end
	end

return false;
end

function script_hunter:getPetsTarget()

	local target = nil;

	if HasPet() and PetHasTarget() then

		if not GetPet():IsDead() and IsInCombat() then

			local i, t = GetFirstObject();

			while i ~= 0 do

				if t == 3 or t == 4 then

					if GetPet():GetUnitsTarget():GetGUID() == i:GetGUID() then

						target = i;
					end
				end

			i, t = GetNextObject(i);
			end
		end
	end

return target;
end
