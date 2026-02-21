script_hunter = {

	message = 'Hunter Combat Script',

	hunterChooseAspectLoaded = include("scripts\\combat\\hunter\\script_hunterChooseAspect.lua"),
	hunterCheckPetFoodLoaded = include("scripts\\combat\\hunter\\script_hunterCheckPetFood.lua"),
	hunterDoPetChecksLoaded = include("scripts\\combat\\hunter\\script_hunterDoPetChecks.lua"),
	hunterSetAmmoLoaded = include("scripts\\combat\\hunter\\script_hunterSetAmmo.lua"),
	hunterScareBeastLoaded = include("scripts\\combat\\hunter\\script_hunterScareBeast.lua"),
	hunterGetPetsTargetLoaded = include("scripts\\combat\\hunter\\script_hunterGetPetsTarget.lua"),
	hunterPetAttackTargettLoaded = include("scripts\\combat\\hunter\\script_hunterPetAttackTarget.lua"),
	hunterPreCombatStatetLoaded = include("scripts\\combat\\hunter\\script_hunterPreCombatState.lua"),
	hunterInCombatStatetLoaded = include("scripts\\combat\\hunter\\script_hunterInCombatState.lua"),
	hunterRunRestStatetLoaded = include("scripts\\combat\\hunter\\script_hunterRunRestState.lua"),
	hunterSetuptLoaded = include("scripts\\combat\\hunter\\script_hunterSetup.lua"),

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
	meleeDistance = 5,
	useCheetah = false,
	useMarkMana = 7,
	useMark = true,
	useMultiShot = true,
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
	petAttackTimer = 0,
	petFollowTimer = 0,
	useAimedShot = true,
	mendPetHealth = 50,
	autoAttackTimer = GetTimeEX(),
	useViperSting = true,
	hasImprovedConcussiveShot = false,
	disengageUsed = false,

}	

function script_hunter:rest()

	if IsInCombat() then
		return false;
	end

	if script_hunterRunRestState:run() then
		return true;
	end
return false;
end

function script_hunter:setup()

	script_hunterSetup:setup();

end

function script_hunter:runBackwards(targetObj, range) 

	-- Run backwards if the target is within range
	if (targetObj ~= 0)
	and not script_checkDebuffs:hasDisabledMovement()
	and not IsChanneling() and not IsCasting()

	then

		if not PlayerHasTarget() then
			AssistUnit("pet");
		end

		local xT, yT, zT = targetObj:GetPosition();
		local xP, yP, zP = Player():GetPosition();
		local distance = targetObj:GetDistance();
		local xV, yV, zV = xP - xT, yP - yT, zP - zT;	
		local vectorLength = math.sqrt(xV^2 + yV^2 + zV^2);
		local xUV, yUV, zUV = (1/vectorLength)*xV, (1/vectorLength)*yV, (1/vectorLength)*zV;	
		local moveX, moveY, moveZ = xT + xUV*15, yT + yUV*15, zT + zUV;		
		if (distance < range)  then

				script_navEXCombat:moveToTarget(Player(), moveX, moveY, moveZ)

				-- move fall-back
				if not IsMoving() then
					Move(moveX, moveY, moveZ)
					script_nav:resetNavigate();
				end

				if script_checkAdds:checkAdds() then
				end

				self.waitTimer = GetTimeEX() + 500;
				script_grind:setWaitTimer(100);

			return 4;
			
		end
	end
	return false;
end

function script_hunter:draw()
	local tX, tY, onScreen = WorldToScreen(Player():GetPosition());
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

		-- if we do not have arrows then set bullets
		if not strfind(itemName, "Arrow") then

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

-- set pet variables
	local pet = GetPet();
	local petHP = 0;
	if pet ~= nil and pet ~= 0 then
		petHP = pet:GetHealthPercentage();
		local petMana = GetPet():GetManaPercentage();
		local petFocus = GetPet():GetFocus();
	end

-- tell the grinder our set eat/drink settings
	script_grind.eatHealth = self.eatHealth;
	script_grind.drinkMana = self.drinkMana;

-- if we are dead then return
	if Player():IsDead() or Player():HasBuff("Feign Death") then
		return;
	end

-- Assign the target 
	targetObj = GetGUIDObject(targetGUID);

-- set combat script attack distance
	if PlayerHasTarget() and targetObj ~= nil and targetObj ~= 0 then
		

	-- change our attack distance to melee distance if we don't have a pet or target is targeting me
		-- if already in combat and target is less than ranged attack range and the target is targeting me (and not pet) then
		if (IsInCombat() and GetTarget():GetDistance() < self.minSpellRange and script_grind:isTargetingMe(targetObj) and not targetObj:IsCasting() and not targetObj:IsStunned())
		-- if already in combat and we are supposed to have a pet, but do not
		or (IsInCombat() and Player():GetLevel() > 9 and not (HasPet() or not self.hasPet))
		-- if not in combat but the target is too close to do ranged attacks
		or (not IsInCombat() and GetTarget():GetDistance() < self.minSpellRange and (not HasPet() or not self.hasPet))
		
		then
			-- attack range is melee distance
			script_grind.combatScriptRange = self.meleeDistance;
		
			
		else
			-- else attack range is ranged distance
			script_grind.combatScriptRange = self.spellRange;
		end

	else
		-- else if we have a good target and it's not in melee range then do ranged attacks
		script_grind.combatScriptRange = self.spellRange;
	end

	-- pet follow if neither pet or target are in line of sight
	-- or pet distance is too far
	if (HasPet() and self.hasPet) and targetObj ~= nil and targetObj ~= 0 then
		if (not GetPet():IsInLineOfSight() and not targetObj:IsInLineOfSight()) or GetPet():GetDistance() > self.spellRange then
			if GetTimeEX() > self.petFollowTimer then
				PetFollow();
				self.petFollowTimer = GetTimeEX() + 500;
			end
		end
	end

-- if we don't have the right target then clear target
	if targetObj == 0 or targetObj == nil then
		ClearTarget();
		return;
	end

-- set pet to false if less than level 10
	if self.hasPet then
		if PlayerLevel() < 10 then
			self.hasPet = false;
		end
	end
	
-- check for adds around us during combat and move to prevent pulling multiple enemies
	-- if already in combat and we want to skip hard pulls, and are not in a group, and target health is greater than fleeing health
	if IsInCombat() and script_grind.skipHardPull and GetNumPartyMembers() == 0 and (targetObj:GetHealthPercentage() >= 20) then
		-- if player doesn't have disabled movement and the target is not casting
		if not script_checkDebuffs:hasDisabledMovement() and not targetObj:IsCasting() then
			-- run check adds script
			if script_checkAdds:checkAdds() then
				-- keep rechecking for new add targets
				script_om:FORCEOM();
			end
		end
	end

-- cast disengage if target is too close
	-- player has pet and already in combat and we have disengage, and it's not on cooldown
	if self.hasPet and HasPet() and IsInCombat() and HasSpell("Disengage") and not IsSpellOnCD("Disengage") and targetObj:GetDistance() <= self.meleeDistance then
		-- have a valid target and player mana is enough to use disengage
		if targetObj ~= nil and targetObj ~= 0 and PlayerMana() >= 8 and (self.useRangedAttacks or script_grind:isTargetingMe(targetObj)) then
			-- if the target is targeting player or the target is within melee distance
			if script_grind:isTargetingMe(targetObj) or targetObj:GetDistance() <= self.meleeDistance then
				-- cast engage
				if CastSpellByName("Disengage", targetObj) then
					-- recast auto attack, disengage disables it
					self.disengageUsed = true;
					self.waitTimer = GetTimeEX() + 1500;
				end
			end
		end
	end

--[[	FEIGN DEATH
	-- was causing bot to die more often with feign death on CD but works otherwise
	--if target is attacking me and we have a pet then feign death
	if targetObj ~= nil and targetObj ~= 0 and HasPet() and PlayerMana() >= 5 then
		local x, y, z = GetPet():GetPosition();
		local xx, yy, zz = targetObj:GetPosition();
		local dist = GetDistance3D(x, y, z, xx, yy, zz);
		-- wait for target to get close before casting feign death
		if not GetPet():IsDead() and script_grind:isTargetingMe(targetObj) and dist <= 3 then
			if GetTimeEX() > self.petAttackTimer and GetTimeEX() >= self.petFollowTimer then
				PetAttack();
				self.petAttackTimer = GetTimeEX() + 1000; self.petFollowTimer = GetTimeEX() + 1000;
			end
			if HasSpell("Feign Death") and not IsSpellOnCD("Feign Death") and not Player():HasBuff("Feign Death") then
				if CastSpellByName("Feign Death") then
					self.waitTimer = GetTimeEX() + 2500;
					script_grind:setWaitTimer(2500);
				end
			end
		end
	end
	
--]]

-- walk away from target if pet target guid is the same guid as target targeting me
	-- have a valid target and we have a pet
	if targetObj ~= nil and targetObj ~= 0 and GetPet() ~= 0 and GetPet() ~= nil and self.hasPet then
		-- target enemy has a target or the target is stunned, and our pet is not dead
		if ((targetObj:GetUnitsTarget() ~= 0 and targetObj:GetUnitsTarget() ~= nil) or targetObj:IsStunned()) and not GetPet():IsDead() then
			-- if the target is not targeting player, movement is not disabled and not using rotation
			if not script_grind:isTargetingMe(targetObj) and not script_checkDebuffs:hasDisabledMovement() and not script_rotation.usingRotation then
				-- if not is casting and not is channeling a spell and player is using ranged attacks
				if not IsChanneling() and not IsCasting() and script_hunter.useRangedAttacks then
					-- have a valid target and it is stunned
					if (targetObj ~= nil and targetObj:IsStunned())
					-- or target enemy has a target and the enemy is targeting pet, or target is fleeing (drops target when fleeing)
					or (targetObj:GetUnitsTarget() ~= 0 and targetObj:GetUnitsTarget() ~= nil and (targetObj:GetUnitsTarget():GetGUID() == GetPet():GetGUID() or targetObj:IsFleeing())) then
						-- if the target too close to do ranged attacks
						if targetObj:GetDistance() <= self.minSpellRange then
							-- run backwards
							if (script_hunter:runBackwards(targetObj, self.minSpellRange + 1)) then
					
								self.message = "Moving away from target for range attacks...";
					
								-- if target is in line of sight then send pet to attack
								if targetObj:IsInLineOfSight() then
									if GetTimeEX() > self.petAttackTimer then
										PetAttack();
									end
								-- target is not in line of sight anymore then pet follow
								elseif not targetObj:IsInLineOfSight() then
									if GetTimeEX() > self.petFollowTimer then
										PetFollow();
										self.petFollowTimer = GetTimeEX() + 500;
									end
								end		
							self.waitTimer = GetTimeEX() + 500;
							return true;
							end
						end
					end			
				end
			end
		end
	end

	-- if we have a pet then do pet checks in EX script
	if (self.hasPet and not IsInCombat()) then
		if (script_hunterDoPetChecks:doPetChecks()) then
			
		end
	end
	if not IsMounted() and (HasPet() and self.hasPet) and not IsInCombat() then
		if GetPet():HasBuff("Feed Pet Effect") then
			self.message = "Pet is eating some food...";
			script_grind.autoBlacklistTimer = GetTimeEX() + 15000;
			local currentTime = GetTimeEX();
			grind2RunCombatState.blacklistTargetTimer = currentTime * 2;
			grind2RunCombatState.blacklistTargetTimer2 = currentTime * 2;
			grind2DoLoot.blacklistLootTimer = currentTime + (grind2AdjustTimersMenu.blacklistLootTime * 1000);
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
	if ( ((IsChanneling() or IsCasting()) and not instantCastSpells:isSpellInstantCast()) or self.waitTimer > GetTimeEX()) or Player():IsStunned() or Player():IsConfused() or Player():IsFleeing() then
		return 4;
	end

	-- feign death if pet is dead
	if IsInCombat() and GetPet() ~= 0 and GetPet() ~= nil then
		if (GetPet():GetHealthPercentage() <= 1 or GetPet():IsDead()) then
			if (HasSpell("Feign Death")) and (not IsSpellOnCD("Feign Death"))
			and (PlayerMana() >= 3) then
				if CastSpellByName("Feign Death") then
					script_grind.waitTimer = GetTimeEX() + 5000;
					grind2:setTimer(5000);
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
					if script_hunterScareBeast:isScareTargetValid() then
						targetObj = script_hunterScareBeast:getTargetNotScared();
						targetObj:AutoAttack();
					end
				end
			end


-- force bot to attack pets target
	if (IsInCombat()) and (HasPet() and self.hasPet) and (not PlayerHasTarget()) and (GetNumPartyMembers() < 1) and (self.hasPet) and not GetPet():IsDead() then
		if (PetHasTarget()) and not script_grind:isTargetingMe(GetPet():GetUnitsTarget()) then
				AssistUnit("pet");
		-- don't return if we don't want to wait after combat phase
		elseif self.waitAfterCombat  then
			AssistUnit("pet");
			return 4;
		elseif not self.waitAfterCombat then
			AssistUnit("pet");
		end
		-- fallback because it seems assist unit doesn't work right on some servers'
		if (HasPet() and self.hasPet) and GetPet():GetUnitsTarget() ~= 0 and GetPet():GetUnitsTarget() ~= nil then
			AssistUnit("pet");
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
		self.waitTimer = GetTimeEX() + 500;
		return true;
	end

	if script_grind.enemyObj ~= nil then
		if (GetTarget() == nil or GetTarget() == 0) and not (HasPet() or not self.hasPet) then
			targetObj:AutoAttack();
		end
	end

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

-- pet assist?
		if not PlayerHasTarget() and PetHasTarget() and IsInCombat() and (HasPet() and self.hasPet) then
			if not GetPet():IsDead() then
				AssistUnit("pet");
			end
		end

		targetHealth = targetObj:GetHealthPercentage();

-- Don't attack if we should rest first
		if (PlayerHealth() < self.eatHealth and not script_grind:isTargetingMe(targetObj)
			and targetHealth > 99 and not targetObj:IsStunned()) then
			self.message = "Need rest...";
			return 4;
		end

-- check line of sight
		if (not targetObj:IsInLineOfSight() or (targetObj:GetDistance() > self.spellRange and self.useRangedAttacks) or (targetObj:GetDistance() > self.meleeDistance and not self.useRangedAttacks)) and (GetTimeEX() >= self.petFollowTimer or not IsInCombat()) then
			return 3;
		end

-- Auto Attack
		if (targetObj:GetDistance() < self.spellRange) and targetObj:GetDistance() > self.minSpellRange and (targetObj:IsInLineOfSight())
		and not targetObj:IsDead() and targetObj:CanAttack() and self.useRangedAttacks then
			if (not IsAutoCasting("Auto Shot")) and not targetObj:IsDead() and targetObj:IsInLineOfSight() and not IsMoving() then
				if targetObj:GetDistance() >= self.minSpellRange then
					
				end
				if not CastSpellByName("Auto Shot", targetObj) then
					if targetObj:GetDistance() <= self.spellRange then
						self.waitTimer = GetTimeEX() + 500;
					end
				end
			end
			if (self.hasPet) and HasPet() and self.hasPet then
				if GetTimeEX() > self.petAttackTimer and GetTimeEX() >= self.petFollowTimer then
					PetAttack();
					self.petAttackTimer = GetTimeEX() + 1000; self.petFollowTimer = GetTimeEX() + 1000;
				end
			end
		end

--send pet to attack something attacking me even if not main target - if we have 2 or more attacking us
		-- set a timer to give the pet time to gain aggro on a Target
		if IsInCombat() and (HasPet() and self.hasPet)
		and script_grind:enemiesAttackingUs() > 1 
		and script_grind:isAnyTargetTargetingMe()
		then
				
			-- send pet to attack a target attacking me
			script_hunterPetAttackTarget:run();

		end	
	

-- NOT in combat ---  do pull stuff

		-- target stuck out of line of sight but close enough?
		if targetObj:GetDistance() <= self.meleeDistance and not targetObj:IsInLineOfSight() and (HasPet() and self.hasPet) then
			PetAttack();
		end

-- do pull function if we are far enough away
		if (Player():GetLevel() < self.minSpellRange) then
			if (targetObj:GetDistance() > self.minSpellRange) and (targetObj:GetDistance() < self.spellRange) and targetObj:IsInLineOfSight() and self.useRangedAttacks then
				if script_hunterPreCombatState:run(targetObj) then
					self.waitTimer = GetTimeEX() + 250;
				end
				if HasPet() and self.hasPet then
					if GetTimeEX() > self.petAttackTimer and GetTimeEX() >= self.petFollowTimer then
						PetAttack();
						self.petAttackTimer = GetTimeEX() + 1000; self.petFollowTimer = GetTimeEX() + 1000;
						end
					end
				-- else move to target to melee
			elseif (targetObj:GetDistance() < self.minSpellRange) or not targetObj:IsInLineOfSight() or not self.useRangedAttacks then
				if (targetObj:GetDistance() > self.meleeDistance) and (PlayerLevel() >= 10 or HasPet()) then
					if HasPet() and self.hasPet then
						if GetTimeEX() > self.petAttackTimer and GetTimeEX() >= self.petFollowTimer then
							PetAttack();
							self.petAttackTimer = GetTimeEX() + 1000; self.petFollowTimer = GetTimeEX() + 1000;
						end
					end
					return 3;
				elseif (PlayerLevel() < 10 or not HasPet()) and not IsInCombat() then
					if script_hunter:runBackwards(targetObj, self.minSpellRange + 10) then
						script_hunter.waitTimer = GetTimeEX() + 2500;
						return 4;
					end
				end
				-- recheck move to melee range
			elseif targetObj:GetDistance() > self.meleeDistance and not self.useRangedAttacks and IsInCombat() then
				if not IsAutoCasting("Attack") then
					targetObj:AutoAttack();
				end
				if HasPet() and self.hasPet then
					if GetTimeEX() > self.petAttackTimer and GetTimeEX() >= self.petFollowTimer then
						PetAttack();
						self.petAttackTimer = GetTimeEX() + 1000;
						self.petFollowTimer = GetTimeEX() + 1000;
					end
				end
				return 3;
			end
		end
						
-- if we are not in combat then do pull ELSE
		if (not IsInCombat()) and (targetObj:GetDistance() < self.spellRange) and (targetObj:GetDistance() > self.minSpellRange) and self.useRangedAttacks
		and (targetObj:IsInLineOfSight()) then
			if script_hunterPreCombatState:run(targetObj) then 
				self.waitTimer = GetTimeEX() + 250;
			end
			if HasPet() and self.hasPet then
				if GetTimeEX() > self.petAttackTimer and GetTimeEX() >= self.petFollowTimer then
					PetAttack();
					self.petAttackTimer = GetTimeEX() + 1000; self.petFollowTimer = GetTimeEX() + 1000;
					end
				end
			script_grind:setWaitTimer(1500);
		
		return;
			

-- NOW IN COMBAT

		else

		script_hunterInCombatState:run(targetObj);
		end
	end
end