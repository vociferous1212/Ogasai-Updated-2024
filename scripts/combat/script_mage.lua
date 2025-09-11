script_mage = {

	message = 'Mage Combat Script',

	mageMenu = include("scripts\\combat\\mage\\script_mageEX.lua"),
	pullSpellsIncluded = include("scripts\\combat\\mage\\script_magePullSpells.lua"),
	mageRestIncluded = include("scripts\\combat\\mage\\script_mageRest.lua"),
	magePolymorphIncluded = include("scripts\\combat\\mage\\script_magePolymorph.lua"),
	frostNovaCheckIncluded = include("scripts\\combat\\mage\\script_mageCheckFrostNova.lua"),
	mageSetupIncluded = include("scripts\\combat\\mage\\script_mageSetup.lua"),

	drinkMana = 55,	-- drink at this mana %
	eatHealth = 65,	-- eat at this health %
	potionHealth = 10,	-- use potion at this health %
	potionMana = 10,	-- use potioon at this mana %
	water = {},	-- water table setup
	numWater = 0,	-- number of conjured water
	food = {},	-- food table setup
	numfood = 0,	-- number of conjured food
	manaGem = {},	-- mana gem table setup
	numGem = 0,	-- number of conjured mana gems
	isSetup = false,	-- setup check
	polyTimer = 0,		-- polymorph add timer
	cooldownTimer = 0,	-- timer for cooldowns
	addPolymorphed = false,	-- add polymorphed yes/no
	useManaShield = true,	-- use mana shield yes/no
	iceBlockHealth = 35,	-- use ice block at this health %
	iceBlockMana = 25,	-- use ice block above this mana %
	evocationMana = 15,	-- use evocation below this mana %
	evocationHealth = 35,	-- use evocation above this health %
	--manaGemMana = 20,	-- use mana gem below this health %
	polymorphAdds = true,	-- polymorphs adds yes/no
	useFireBlast = true,	-- use fireblast yes/no
	useFrostNova = true,	-- use frost nova yes/no
	useConeOfCold = true,	-- use cone of cold yes/no
	coneOfColdMana = 35,	-- use cone of cold above this mana %
	coneOfColdHealth = 15,	-- use cone of cold above this health %
	useWandMana = 10,	-- use wand below this mana %
	useWandHealth = 20,	-- use wand below this target health %
	manaShieldHealth = 80,	-- use mana shield below this health %
	manaShieldMana = 20,	-- use mana shield above this mana %
	useFrostWard = false,	-- use frost ward yes/no
	useFireWard = false,	-- use fire ward yes/no
	waitTimer = 0,		-- wait timer for spells
	useWand = true,	-- use wand yes/no
	gemTimer = 0,		-- gem cooldown timer
	useBlink = false,	-- use blink yes/no
	isChecked = true,	-- set up
	useDampenMagic = true,	-- use dampen magic yes/no
	fireMage = false,	-- is fire spec yes/no
	frostMage = true,	-- is frost spec yes/no
	scorchStacks = 2,	-- scorch debuff stacks on target
	useScorch = true,	-- use  yes/no
	waitTimer = GetTimeEX(),
	moveAwayRest = true,
	useFrostArmor = true,
	useMageArmor = false,
	spellRange = 29,	-- spell range of main damage spells fireball/frostbolt (extended with talents)
}

function script_mage:window()

	-- setup stuff
	if (self.isChecked) then
	
		--Close existing Window
		EndWindow();

		-- make the new window
		if(NewWindow("Class Combat Options", 200, 200)) then
			script_mageEX:menu();
		end
	end
end

function script_mage:cast(spellName, target) -- not used here as reference from old scripts
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

function script_mage:coneOfCold(spellName) -- cone of cold function needed to work properly
	if (HasSpell(spellName)) then
		if (not IsSpellOnCD(spellName)) then
			if (not IsAutoCasting(spellName)) then
				CastSpellByName(spellName);
			end
		end
	end
	return false;
end

-- Run backwards if the target is within range
function script_mage:runBackwards(targetObj, range) 
	local localObj = GetLocalPlayer();
	script_grind.tickRate = 75;
 	if targetObj ~= 0 and targetObj ~= nil then
 		local xT, yT, zT = targetObj:GetPosition();
 		local xP, yP, zP = localObj:GetPosition();
 		local distance = targetObj:GetDistance();
 		local xV, yV, zV = xP - xT, yP - yT, zP - zT;	
 		local vectorLength = math.sqrt(xV^2 + yV^2 + zV^2);
 		local xUV, yUV, zUV = (1/vectorLength)*xV, (1/vectorLength)*yV, (1/vectorLength)*zV;
 		local moveX, moveY, moveZ = xT + xUV*10, yT + yUV*10, zT + zUV;		
 		if (distance <= range)
			and (targetObj:IsInLineOfSight())
			and (not script_checkDebuffs:hasDisabledMovement())
		then 		
 			if (Move(moveX, moveY, moveZ)) then
				script_grind:setWaitTimer(750);
				self.waitTimer = GetTimeEX() + 750;
 				return true;
			end
		return 4;
		end
	end

	return false;
end

function script_mage:addWater(name) -- water setup
	self.water[self.numWater] = name;
	self.numWater = self.numWater + 1;
end

function script_mage:addFood(name)	-- food setup
	self.food[self.numfood] = name;
	self.numfood = self.numfood + 1;
end

function script_mage:addManaGem(name)	-- mana gem setup
	self.manaGem[self.numGem] = name;
	self.numGem = self.numGem + 1;
end

function script_mage:setup()
	
	script_mageSetup:setup();

	self.isSetup = true;

end

function script_mage:draw()
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

function script_mage:run(targetGUID)
	
	script_grind.combatScriptRange = script_mage.spellRange;

	-- check setup
	if (not self.isSetup) then
		script_mage:setup();
	end
	
	if (not HasSpell("Frostbolt")) then
		self.frostMage = false;
		self.fireMage = true;
	end

	local localObj = GetLocalPlayer();

	local localMana = localObj:GetManaPercentage();

	local localHealth = localObj:GetHealthPercentage();

	local localLevel = localObj:GetLevel();

	script_grind.eatHealth = self.eatHealth;
	script_grind.drinkMana = self.drinkMana;

	-- check if we are dead
	if (localObj:IsDead()) then
		return 0;
	end
	
	-- Assign the target 
	targetObj =  GetGUIDObject(targetGUID);

	-- clear dead targets
	if (targetObj == 0) or (targetObj == nil) or (targetObj:IsDead()) then
		ClearTarget();
		return 2;
	end

	-- Check: Do nothing if we are channeling, casting or Ice Blocked
	if (IsChanneling()) or (IsCasting()) or (localObj:HasBuff("Ice Block")) or (self.waitTimer > GetTimeEX()) then

		if IsStanding() and IsInCombat() and PlayerHasTarget() and not IsMoving() then
			if GetTarget():GetDistance() <= script_grind.combatScriptRange and GetTarget():IsInLineOfSight() then
				if not IsMoving() then
					GetTarget():FaceTarget();
				end
			end
		end

	return 4;
	end

-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(350, 550);

		if (IsMoving()) or (not IsInCombat()) and (not localObj:IsCasting()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) or (localObj:IsCasting()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving()) or (localObj:IsCasting()) then
			script_grind.tickRate = tickRandom;
		end
	end

-- check silence and use wand
	if (IsInCombat())
		and (localObj:HasRangedWeapon())
		and (not IsCasting())
		and (not IsChanneling())
		and (not localObj:IsStunned())
	then
		if (script_checkDebuffs:hasSilence())
			and (IsSpellOnCD("Frostbolt")
			or IsSpellOnCD("Fireball")) and (not IsMoving())
		then
			if (targetObj ~= 0)
				and (targetObj ~= nil)
			then
				if (not IsAutoCasting("Shoot")) and (PlayerHasTarget()) then
					targetObj:FaceTarget();
					targetObj:CastSpell("Shoot");
					self.waitTimer = GetTimeEX() + 250;
				return true;
				end
			end
		end
	end

	-- dismount before combat
	if (IsMounted()) then
		DisMount();
	end

--Valid Enemy
	if (targetObj ~= 0) and (targetObj ~= nil) and (not localObj:IsStunned()) and (not localObj:IsMovementDisabed()) then

	-- assign target health
		targetHealth = targetObj:GetHealthPercentage();

	-- Don't attack if we should rest first
	-- bot sometimes gets a new target before running rest
		if (localHealth <= self.eatHealth or localMana <= self.drinkMana) and not script_grind:isTargetingMe(targetObj) and targetHealth > 99 and not targetObj:IsStunned() and not script_magePolymorph:isAddPolymorphed() and not script_grind:isAnyTargetTargetingMe() then
			targetObj = nil;
			self.message = "Need rest...";
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

	-- check adds
		if (IsInCombat()) and (script_grind.skipHardPull) and (GetNumPartyMembers() == 0) and (not PlayerHasTarget()) then
			if (script_checkAdds:checkAdds()) then
				script_om:FORCEOM();
				return true;
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

		-- set target health variable
		targetHealth = targetObj:GetHealthPercentage();

-- Auto Attack
		if (targetObj:GetDistance() < 40) and (not IsMoving()) then
			targetObj:AutoAttack();
		-- stops spamming auto attacking while moving to target
		elseif (targetObj:GetDistance() < 5) then
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
		
-- move to target
		if (targetObj:GetDistance() > script_grind.combatScriptRange or not targetObj:IsInLineOfSight()) and not targetObj:HasDebuff("Frost Nova") and not targetObj:HasDebuff("Frostbite") then
			return 3;
		end

-- face target
		if targetObj:GetDistance() <= script_grind.combatScriptRange and not IsMoving() and targetObj:GetHealthPercentage() <= 99 then
			targetObj:FaceTarget();
		end

		--	START OF COMBAT PHASE

-- frost ward
		if IsStanding() and (self.useFrostWard) and (HasSpell("Frost Ward")) and (not localObj:HasBuff("Frost Ward")) then
			if (localMana > 25) and (not localObj:HasBuff("Fire Ward")) then
				if (not CastSpellByName("Frost Ward", localObj)) then
					self.waitTimer = GetTimeEX() + 1700;
					script_grind:setWaitTimer(1700);
					return true;
				end
			end
		end
	
-- fire ward
		if IsStanding() and (self.useFireWard) and (HasSpell("Fire Ward")) and (not localObj:HasBuff("Fire Ward")) then
			if (localMana > 50) and (not localObj:HasBuff("Frost Ward")) then
				if (not CastSpellByName("Fire Ward", localObj)) then
					self.waitTimer = GetTimeEX() + 1700;
					script_grind:setWaitTimer(1700);
					return true;
				end
			end
		end

	
-- Opener - not in combat pulling target
		if (not IsInCombat()) then

		-- display message in ogasai message box
			self.message = "Pulling " .. targetObj:GetUnitName() .. "...";

			if PlayerHasTarget() and (HasSpell("Ice Barrier")) and (not IsSpellOnCD("Ice Barrier")) and (not localObj:HasBuff("Ice Barrier")) then
				CastSpellByName('Ice Barrier');
				self.waitTimer = GetTimeEX() + 1000;
			end


		-- frost mage selected
			if (self.frostMage) and (targetObj:GetDistance() <= script_mage.spellRange) and (targetObj:IsInLineOfSight()) then
				if (script_magePullSpells.frostMagePull(targetObj)) then
					script_grind:setWaitTimer(2600);
					self.waitTimer = GetTimeEX() + 2600;
					if (PlayerHasTarget()) then
						targetObj:FaceTarget();
					end
				end

		-- fire mage selected use these spells instead
			elseif (self.fireMage) and (targetObj:GetDistance() <= script_mage.spellRange) and targetObj:IsInLineOfSight() then
				if (script_magePullSpells.fireMagePull(targetObj)) then
					script_grind:setWaitTimer(2600);
					self.waitTimer = GetTimeEX() + 2600;
					if (PlayerHasTarget()) then
						targetObj:FaceTarget();
					end
				end
			end
			
-- Combat

		else	



			-- display message in ogasai message box
			self.message = "Killing " .. targetObj:GetUnitName() .. "...";
			
			-- Dismount
			if (IsMounted()) then
				DisMount();
			end

			-- check racial spells
			CheckRacialSpells();

			-- blink on movement stop debuffs
			if (HasSpell("Blink")) and (not IsSpellOnCD("Blink")) then
				if (script_checkDebuffs:hasDisabledMovement()) then
					local a = targetObj:GetAngle();
					FaceAngle(a);
					if (CastSpellByName("Blink")) then
						targetObj:FaceTarget();
						self.waitTimer = GetTimeEX() + 500;
						return 0;
					end
				end
			end

			-- blink frost nova on CD
			if (self.useBlink) then
				if (HasSpell("Blink")) and (not IsSpellOnCD("Blink")) and (IsSpellOnCD("Frost Nova") or IsSpellOnCD("Cone of Cold")) and (targetObj:GetDistance() < 9) and (targetHealth > self.useWandHealth + 10) then
					if (not targetObj:HasDebuff("Frostbite")) and (not targetObj:HasDebuff("Frost Nova")) and (not targetObj:HasDebuff("Blast Wave")) and (targetHealth > 10) then
						local a = targetObj:GetAngle();
						FaceAngle(a);
						if (CastSpellByName("Blink")) then
							targetObj:FaceTarget();
							self.waitTimer = GetTimeEX() + 500;
						end
					end
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

			-- Check: Keep Ice Barrier up if possible
			if (HasSpell("Ice Barrier")) and (not IsSpellOnCD("Ice Barrier")) and (not localObj:HasBuff("Ice Barrier")) then
				CastSpellByName('Ice Barrier');
				return 0;

				-- Check: If we have Cold Snap use it to clear the Ice Barrier CD
			elseif (HasSpell("Ice Barrier")) and (IsSpellOnCD("Ice Barrier")) and (HasSpell("Cold Snap")) and (not IsSpellOnCD("Cold Snap")) and
				(not localObj:HasBuff("Ice Barrier")) then
				CastSpellByName('Cold Snap');
				return 0;
			end

			if IsInCombat() and script_grind:enemiesAttackingUs(10) >= 2 then script_mageCheckFrostNova:checkFrostNova(); self.waitTimer = GetTimeEX() + 500; end

		-- use cold snap to reset frost nova if we don't have ice barrier
		-- make sure we waste both cone of cold and frost nova cooldown
			if (targetObj:IsInLineOfSight()) and (not HasSpell("Ice Barrier")) and (HasSpell("Cold Snap")) and (not IsSpellOnCD("Cold Snap")) and (IsSpellOnCD("Frost Nova")) and (not targetObj:HasDebuff("Frost Nova")) and (not targetObj:HasDebuff("Frostbite")) and (targetObj:GetDistance() <= 10) and ( (localMana >= 15 and targetHealth >= 20) or (localHealth <= 30 and localMana >= 10) ) and (not HasSpell("Cone of Cold") or (HasSpell("Cone of Cold") and IsSpellOnCD("Cone of Cold"))) then
				CastSpellByName("Cold Snap");
				self.waitTimer = GetTimeEX() + 1000;
			end

		-- Run backwards if we are too close to the target
			if (targetObj:GetDistance() <= .5) then 
				if (script_mage:runBackwards(targetObj,5)) then 
					return 4; 
				end 
			end
			
		-- Check: Move backwards if the target is affected by Frost Nova or Frost Bite
			if (GetNumPartyMembers() < 1) and (self.useFrostNova) then
				if (targetObj:HasDebuff("Frostbite") or targetObj:HasDebuff("Frost Nova")) and (targetHealth > self.useWandHealth or localHealth < 35) and (not localObj:HasBuff('Evocation')) and (not script_checkDebuffs:hasDisabledMovement()) and (not IsSwimming()) and (targetObj:IsInLineOfSight()) then
					script_grind.tickRate = 0;
					self.tickRate = 250;

					if (script_mage:runBackwards(targetObj, 8)) then -- Moves if the target is closer than 7 yards

						self.message = "Moving away from target...";
						if (not IsSpellOnCD("Frost Nova")) and (targetObj:GetDistance() < 9) and (not targetObj:HasDebuff("Frostbite")) and not targetObj:HasDebuff("Frost Nova") then
							CastSpellByName("Frost Nova");
							return;
						end
					return 4;
					end 
				end	
			end

		--Cone of Cold
		-- bot should use frost nova first if available - half the mana costs
		-- don't waste the mana if frost nova isn't on CD unless 2 or more targets attacking us
			if (self.useConeOfCold) and (HasSpell("Cone of Cold")) and (localMana >= self.coneOfColdMana) and (targetHealth >= self.coneOfColdHealth) and (IsSpellOnCD("Frost Nova") or script_grind:enemiesAttackingUs(10) >= 2) then
				if (not self.addPolymorphed) and (targetObj:GetDistance() < 9) and (not targetObj:HasDebuff("Frostbite")) and (not targetObj:HasDebuff("Frost Nova")) then
						targetObj:FaceTarget();
					if (script_mage:coneOfCold("Cone of Cold")) then
						targetObj:FaceTarget();
						self.waitTimer = GetTimeEX() + 1500;
						return 0;
					end
				end
			end

		-- Fire blast
		-- we only really want to use it as a last resort once we have better spells... costs a lot of mana
			if (self.useFireBlast) and (targetObj:GetDistance() <= 20) and (HasSpell("Fire Blast")) and (not IsSpellOnCD("Fire Blast")) and (localMana > 6) and (not IsMoving()) and targetHealth > 5 then
				if (not targetObj:HasDebuff("Frost Nova")) and (not targetObj:HasDebuff("Frostbite")) or (targetHealth < 20 and localHealth < 25) then
					if targetHealth <= 20 and (not HasSpell("Cone of Cold") and IsSpellOnCD("Frost Nova")) or (HasSpell("Cone of Cold") and IsSpellOnCD("Cone of Cold") and IsSpellOnCD("Frost Nova")) then
	
						if (not IsSpellOnCD("Fire Blast")) then
							CastSpellByName("Fire Blast", targetObj);
							self.waitTimer = GetTimeEX() + 1750;
							script_grind:setWaitTimer(1750);
							return 0;
						end
					end
				end
			end

			-- frost nova if target is running away
			if (HasSpell("Frost Nova")) and (not IsSpellOnCD("Frost Nova")) and (targetObj:IsFleeing()) and (targetHealth > 3) then
				if (localMana > 5) and (targetObj:GetDistance() < 9) and (not targetObj:HasDebuff("Frostbite")) and not targetObj:HasDebuff("Frost Nova") then
					if (CastSpellByName("Frost Nova")) then
						return;
					end
				end
			end

			-- frost nova fireMage redundancy
			if (self.fireMage and self.useFrostNova) then
				if (HasSpell("Frost Nova")) and (not IsSpellOnCD("Frost Nova")) then
					if (localMana > 5) and (targetObj:GetDistance() < 9) and (not targetObj:HasDebuff("Frost Nova")) and (not targetObj:HasDebuff("Frostbite")) then
						if (CastSpellByName("Frost Nova")) then
							return;
						end
					end
				end
			end

			-- Use Mana Gem when low on mana
			if (localMana <= self.potionMana and GetTimeEX() > self.gemTimer) and targetObj:GetHealthPercentage() >= 15 then
				for i=0,self.numGem do
					if(HasItem(self.manaGem[i])) then
						UseItem(self.manaGem[i]);
						self.gemTimer = GetTimeEX() + 120000;
						return 0;
					end
				end
			end

			-- Use Evocation if we have low Mana but still a lot of HP left
			if (localMana < self.evocationMana and localHealth > self.evocationHealth and HasSpell("Evocation") and not IsSpellOnCD("Evocation")) and (targetHealth > 35) then		
				self.message = "Using Evocation...";
				CastSpellByName("Evocation"); 
				return 0;
			end

			-- counterspell if target is casting
			if (HasSpell("Counterspell")) and (not IsSpellOnCD("Counterspell")) and (localMana > 15) and (targetObj:IsCasting()) then
				if (CastSpellByName("Counterspell", targetObj)) then
					self.waitTimer = GetTimeEX() + 1500;
					return 0;
				end
			end

			-- Use Mana Shield if we have more than 35 percent mana and no active Ice Barrier
			-- forced to use it if we have 20 percent or less health regardless if checked or not
			if (self.useManaShield or localHealth <= 20) and (not localObj:HasBuff("Ice Barrier")) and (HasSpell("Mana Shield")) and (localMana >= self.manaShieldMana) and (localHealth <= self.manaShieldHealth) and (not localObj:HasBuff("Mana Shield")) and (IsInCombat()) and (targetHealth >= 10 or script_grind:enemiesAttackingUs() >= 2 or localHealth <= 20) and targetObj:GetDistance() <= 12 then
				if (not targetObj:HasDebuff("Frost Nova") and not targetObj:HasDebuff("Frostbite")) then
					CastSpellByName("Mana Shield");
					self.waitTimer = GetTimeEX() + 1650;
					script_grind:setWaitTimer(1650);
					return 0;
				end
			end

			-- Check if add already polymorphed
			if (not script_magePolymorph:isAddPolymorphed() and (GetTimeEX() > self.polyTimer)) then
				self.addPolymorphed = false;
			end

			-- Check: Polymorph add
			if (targetObj ~= nil and self.polymorphAdds and script_grind:enemiesAttackingUs() > 1 and HasSpell('Polymorph') and not self.addPolymorphed) and (targetObj:GetDistance() < 25) and not script_magePolymorph:isAddPolymorphed() and script_magePolymorph:isPolymorphTargetValid() then
				script_grind.tickRate = 250;
				self.message = "Polymorphing add...";
				script_magePolymorph:polymorphAdd(targetObj:GetGUID());
				self.waitTimer = GetTimeEX() + 1750;
				script_grind:setWaitTimer(1500);
				return true;
			end 

			-- Check: Sort target selection if add is polymorphed
			if (self.addPolymorphed) then
				if(script_grind:enemiesAttackingUs() >= 1 and targetObj:HasDebuff('Polymorph')) then
					ClearTarget();
					script_grind.tickRate = 250;
					if script_magePolymorph:isPolymorphTargetValid() then
						targetObj = script_magePolymorph:getTargetNotPolymorphed();
						targetObj:AutoAttack();
					end
				end
			end

			if (IsInCombat()) and (script_grind.skipHardPull) and (GetNumPartyMembers() == 0) then
				if (script_checkAdds:checkAdds()) then
					self.message = "moving away from adds...";
					script_om:FORCEOM();
					return true;
				end
			end

		-- Check: Frostnova when the target is close, but not when we polymorhped one enemy or the target is affected by Frostbite
			if (not self.addPolymorphed) and (targetObj:GetDistance() < 9 and not targetObj:HasDebuff("Frostbite") and HasSpell("Frost Nova") and not IsSpellOnCD("Frost Nova")) and self.useFrostNova and targetHealth >= 10 then
				script_grind.tickRate = 100;
				self.message = "Frost nova the target(s)...";
				CastSpellByName("Frost Nova");
			end			

		-- ice block
			if (self.frostMage) then
				if (HasSpell("Ice Block")) and (not IsSpellOnCD("Ice Block")) then
					if (localHealth < self.iceBlockHealth) and (localMana < self.iceBlockMana) then
						self.message = "Using Ice Block...";
						CastSpellByName('Ice Block');
						return 0;
					end
				end
			end

		-- arcane explosion in group 
			if (GetNumPartyMembers() > 1) or (GetLocalPlayer():GetLevel() - targetObj:GetLevel() >= 4) or (targetObj:GetUnitName() == "Flesh Eating Worm") then
				if (HasSpell("Arcane Explosion")) and (targetObj:GetDistance() < 6) and (localMana > 25) and (script_grind:enemiesAttackingUs(10) >= 2) then
					if (CastSpellByName("Arcane Explosion")) then
						return 0;
					end
				end
			end

		-- blast wave
			if (self.fireMage) and (HasSpell("Blast Wave")) then
				if (localMana > 30) and (targetObj:GetDistance() < 10) and (not IsSpellOnCD("Blast Wave")) and (targetHealth > 10 or localHealth < 35) and (not IsSwimming()) and (targetObj:IsInLineOfSight()) then
					if (script_mage:runBackwards(targetObj, 8)) then -- Moves if the target is closer than 7 yards
						script_grind.tickRate = 0;
						self.message = "Moving away from target...";
						if (not IsSpellOnCD("Blast Wave")) then
							CastSpellByName("Blast Wave");
							return 0;
						end
					return 4; 
					end 
				end	
			end

		-- check adds
			if (script_grind.skipHardPull) and (GetNumPartyMembers() == 0) then
				if (script_checkAdds:checkAdds()) then
					return true;
				end
			end
			
		-- run backwards
			if (targetHealth > 10 or localHealth < 35) and (targetObj:HasDebuff("Frostbite") or targetObj:HasDebuff("Frost Nova")) and (not localObj:HasBuff('Evocation')) and (not script_checkDebuffs:hasDisabledMovement()) and (not IsSwimming()) and (targetObj:IsInLineOfSight()) then
				if (script_mage:runBackwards(targetObj, 8)) then -- Moves if the target is closer than 7 yards
					script_grind.tickRate = 0;
					self.message = "Moving away from target...";
				return 4;
				end
			end

		-- scorch
			if (self.fireMage) and (self.useScorch) and (HasSpell("Scorch")) and (GetLocalPlayer():GetLevel() >= 27) and (localMana > self.useWandMana and targetHealth > self.useWandHealth) then
				if (targetObj:GetDebuffStacks("Fire Vulnerability") < self.scorchStacks) then
					if (localMana > self.useWandMana) and (targetHealth > self.useWandHealth) then
						if (CastSpellByName("Scorch", targetObj)) then
							self.waitTimer = GetTimeEX() + 1800;
							return 0;
						end
					end
				end
			end
			
		-- pyroblast if target has frost nova?
			if (self.fireMage) and (not targetObj:HasDebuff("Pyroblast")) and (not IsSpellOnCD("Pyroblast")) and (IsSpellOnCD("Frost Nova")) then
				if (HasSpell("Pyroblast")) and (targetObj:HasDebuff("Frost Nova")) then
					if (CastSpellByName("Pyroblast", targetObj)) then
						self.waitTimer = GetTimeEX() + 5000;
						return 0;
					end
				end
			end


-- Wand if mana or target health is low
			if (self.useWand and localObj:HasRangedWeapon()) and (localMana <= self.useWandMana or targetHealth <= self.useWandHealth) and (not IsChanneling()) and (not localObj:IsStunned()) and (not IsMoving()) then
				if (targetObj:GetDistance() > 28 or not targetObj:IsInLineOfSight()) and not script_checkAdds:checkAdds() and not targetObj:HasDebuff("Frostbite") and not targetObj:HasDebuff("Frost Nova") then script_mage.waitTimer = GetTimeEX() + 1000;  return 3; end
				self.message = "Using wand...";
				if (not IsAutoCasting("Shoot")) and (PlayerHasTarget()) and not IsMoving() then
					--targetObj:FaceTarget();
					targetObj:CastSpell("Shoot");
					self.waitTimer = GetTimeEX() + 550;
					return true;
				end
			end

			if (self.useFrostMage) and (not HasSpell("Frostbolt")) then
				CastSpellByName("Fireball", targetObj);
			end
			
-- Main damage source if all above conditions cannot be run
		-- frost mage spells
		if (HasSpell("Frostbolt")) and (self.frostMage) and (not IsChanneling()) and (not IsMoving()) then
			if (localMana >= self.useWandMana and targetHealth >= self.useWandHealth) then

			-- Check: Frostnova when the target is close, but not when we polymorhped one enemy or the target is affected by Frostbite
				if (not self.addPolymorphed) and (targetObj:GetDistance() < 9 and not targetObj:HasDebuff("Frostbite") and HasSpell("Frost Nova") and not targetObj:HasDebuff("Frost Nova") and not IsSpellOnCD("Frost Nova")) and self.useFrostNova and localMana >= 10 and targetHealth >= 10 then
					script_grind.tickRate = 0;
					self.message = "Frost nova the target(s)...";
					CastSpellByName("Frost Nova");
				end

			-- check adds
				if (IsInCombat()) and (script_grind.skipHardPull) and (GetNumPartyMembers() == 0) then
					if (script_checkAdds:checkAdds()) then
						self.message = "moving away from adds...";
						script_om:FORCEOM();
						return true;
					end
				end
			
			-- check range
				if (not targetObj:IsInLineOfSight() or targetObj:GetDistance() > script_grind.combatScriptRange) and not (targetObj:HasDebuff("Polymorph")) and not targetObj:HasDebuff("Frostbite") and not targetObj:HasDebuff("Frost Nova") then
					return 3;
				end

			-- cast frostbolt
				if (not IsMoving()) and (not IsSpellOnCD("Frostbolt")) and targetObj:IsInLineOfSight() then
					if (CastSpellByName("Frostbolt", targetObj)) then
						self.waitTimer = GetTimeEX() + 1850;
						script_grind:setWaitTimer(1850);
						return 0;
					end
				end
			end	
		end

		-- fire mage spells
		if (self.fireMage) and (not IsChanneling()) and (not IsMoving()) then

			-- use these spells if not using wand
			if (localMana >= self.useWandMana and targetHealth >= self.useWandHealth) then

			-- Check: Frostnova when the target is close, but not when we polymorhped one enemy or the target is affected by Frostbite
				if (not self.addPolymorphed) and (targetObj:GetDistance() < 9 and not targetObj:HasDebuff("Frostbite") and HasSpell("Frost Nova") and not targetObj:HasDebuff("Frost Nova") and not IsSpellOnCD("Frost Nova")) and self.useFrostNova and localMana >= 10 and targetHealth >= 10 then
					script_grind.tickRate = 100;
					self.message = "Frost nova the target(s)...";
					CastSpellByName("Frost Nova");
				end

			-- cast pyroblast
				if (targetObj:GetDistance() < script_mage.spellRange) then

					if (HasSpell("Pyroblast")) then
						if (CastSpellByName("Pyroblast", targetObj)) then
							return 0;
						end
					end
				
			-- cast fireball
					if (not HasSpell("Pyroblast")) then
						if (CastSpellByName("Fireball", targetObj)) then
							return 0;
						end
					end
				end
			end
		end	
			
		-- this is here to check for low level "frost Mage" not having frostbolt yet
		if (self.frostMage) and (not HasSpell("Frostbolt")) and (not IsMoving()) then				
		
		-- else if not has frostbolt then use fireball as range check
			if (not targetObj:IsInLineOfSight() or targetObj:GetDistance() > script_grind.combatScriptRange) and not targetObj:HasDebuff("Frost Nova") and not targetObj:HasDebuff("Frostbite") then
				return 3;
			end	

	-- cast fireball
			if (CastSpellByName("Fireball", targetObj)) then
				script_grind:setWaitTimer(2500);
				self.waitTimer = GetTimeEX() + 2500;
				return 0;
			end
		end

	-- this is here to check for low level not having a wand yet
		if (self.frostMage) and (not IsMoving()) and (not localObj:HasRangedWeapon()) and (targetHealth <= self.useWandHealth) and (not IsSpellOnCD("Frostbolt")) then				
			if (targetObj:GetDistance() > script_grind.combatScriptRange or not targetObj:IsInLineOfSight()) and not targetObj:HasDebuff("Frost Nova") and not targetObj:HasDebuff("Frostbite") then
					return 3;
			end	
				
	-- cast frostbolt
			if targetObj:IsInLineOfSight() then
				if (CastSpellByName("Frostbolt", targetObj)) then
					script_grind:setWaitTimer(1650);
					self.waitTimer = GetTimeEX() + 1650;
					return 0;
				end
			end
		end		
	end

-- set tick rate for script to run
		if (not script_grind.adjustTickRate) then
			
			local tickRandom = random(350, 550);
				
			if (IsMoving()) or (not IsInCombat()) and (not localObj:IsCasting()) then
				script_grind.tickRate = 155;
			elseif (not IsInCombat()) and (not IsMoving()) or (localObj:IsCasting()) then
				script_grind.tickRate = tickRandom
			elseif (IsInCombat()) and (not IsMoving()) or (localObj:IsCasting()) then
				script_grind.tickRate = tickRandom;
			end
		end
	end
end

function script_mage:rest()

	if (not self.isSetup) then
		script_mage:setup();
	end

	if script_mageRest:rest() then
		return true;
	end

return false;
end