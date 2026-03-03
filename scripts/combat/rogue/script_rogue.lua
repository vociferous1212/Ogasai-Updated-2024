script_rogue = {

	message = 'Rogue Combat Script',

	rogueMenu = include("scripts\\combat\\rogue\\script_rogueEX.lua"),
	rogueMenu2 = include("scripts\\combat\\rogue\\script_rogueEX2.lua"),
	rogueMenu3 = include("scripts\\combat\\rogue\\script_rogueEX3.lua"),
	rogueRestFunction = include("scripts\\combat\\rogue\\script_rogueRest.lua"),
	rogueSetupFunction = include("scripts\\combat\\rogue\\script_rogueSetup.lua"),
	rogueCheckPoisonFunction = include("scripts\\combat\\rogue\\script_rogueCheckPoisons.lua"),
	rogueRotationRunFunction = include("scripts\\combat\\rogue\\script_rogueRotation.lua"),

	mainhandPoison = "Instant Poison",
	offhandPoison = "Instant Poison",
	cpGenerator = 'Sinister Strike',	-- combo point generator
	throwName = "Heavy Throwing Dagger",	-- throwing weapon name
	stealthOpener = "Sinister Strike",
	eatHealth = 60,
	potionHealth = 10,
	cpGeneratorCost = 45,	-- combo point generator cost
	meleeDistance = 3,	-- range to attack target
	stealthRange = 100,	-- range to target to initiate stealth
	waitTimer = 0,
	vanishHealth = 8,
	evasionHealth = 65,
	adrenRushComboHP = 40,	-- waste cooldowns on x HP
	adrenRushCombo = true,	-- use waste cooldowns on low HP - sometimes its better to preserve cooldowns and die, especially if corpse is close
	throwOpener = false,	-- initiate with throw
	isSetup = false,
	useStealth = false,
	usePoison = false,	-- use poisons on weapons
	useSliceAndDice = true,
	stopIfMHBroken = true,	-- stop if mainhand is broken
	enableRotation = false,	-- enable use of rotation script
	enableGrind = true,	-- enable use of grind script
	useKidneyShot = true,
	enableFaceTarget = true,	-- enable auto facing target in rotation mode
	enableBladeFlurry = true,
	enableAdrenRush = true,
	rotationTwo = false,		-- separate rotation script for elites and dungeons
	useBandage = true,
	hasBandages = false,
	riposteActionBarSlot = 8,
	exposeArmorStacks = 1,	-- how many stacks of expose armor on target
	useExposeArmor = false,
	useRupture = false,
	ruptureStacks = 2,	-- how many combo points until rupture is used
	pickpocketUsed = false,	-- pickpocket variable to check if we have completed an action
	usePickPocket = true,
	openerUsed = 0,		-- how many opener attempts used before using a different attack - max 3?
	pickpocketMoney = 0,	-- pickpocket money obtained
	ppMoney = GetMoney(),	-- compare pickpocket money to GetMyMoney()
	ppVarUsed = false,	-- pickpocket variable to check if we have completed an action
	useThrow = false,	-- use throwing weapons
	stealthWasEnabled = false,	-- was stealth enabled to reset GetMoney() if we click to enable stealth while botting
	riposteTimer = 0,	-- some servers are causing riposte to spam on beasts and such...
}

function script_rogue:setup()

	-- run the separate rogue setup script
	script_rogueSetup:setup();

	self.isSetup = true;
end

function script_rogue:draw()
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

function script_rogue:run(targetGUID)

	-- run setup
	if (not self.isSetup) then 
		script_rogue:setup(); 
	end

	-- set variables
	local localObj = GetLocalPlayer();
	local localEnergy = localObj:GetEnergy();
	local localHealth = localObj:GetHealthPercentage();
	local localLevel = localObj:GetLevel();
	script_grind.eatHealth = self.eatHealth;
	script_grind.drinkMana = 0;
	script_grind.combatScriptRange = self.meleeDistance;

	if (localObj:IsDead()) then 
		return 0; 
	end

	-- Check if useStealth was just enabled for the first time and reset money variables
		-- otherwise pickpocket money obtained will show current money obtained
	if (self.useStealth and not self.stealthWasEnabled) then
		self.ppMoney = GetMoney(); -- Reset ppMoney to current money
		self.stealthWasEnabled = true; -- Mark stealth as enabled
		self.ppVarUsed = false; -- Reset pickpocket flag
	elseif (not self.useStealth and self.stealthWasEnabled) then
		self.stealthWasEnabled = false; -- Update flag if stealth is disabled
	end
		
	-- Check: If Mainhand is broken stop bot
	isMainHandBroken = GetInventoryItemBroken("player", 16);
	
	if (self.stopIfMHBroken and isMainHandBroken) then
		self.message = "The main hand weapon is broken...";
		return 6;
	end

	-- Assign the target 
	targetObj = GetGUIDObject(targetGUID);

	if IsInCombat() and not IsMoving() and targetObj:GetDistance() <= self.meleeDistance + 2 then targetObj:FaceTarget(); end


	if (IsLooting()) and GetTimeEX() > self.waitTimer then
		if (not LootTarget()) then
			LootTarget();
			self.waitTimer = GetTimeEX() + 500
			self.message = "Looting target...";
			return true;
		end	
	end

	if (targetObj == 0 or targetObj == nil) then
		return 2;
	end

	-- attempt to check for if target has a ranged weapon - ogasai api doesn't work correctly
	--if (GetTarget() ~= 0 and GetTarget() ~= nil) and (GetTarget():CanAttack()) and (not GetTarget():IsDead()) then
	--	TargetHasRangedWeapon(target);
	--end
	
	-- Run backwards if we are too close to the target
	if (targetObj:GetDistance() <= .8) then 
		if (script_rogue:runBackwards(targetObj, 2)) then 
			self.waitTimer = GetTimeEX() + 500;
			script_grind.tickRate = 80;
			return 4; 
		end 
	end	

	-- Do nothing if we are channeling or casting or wait timer
	if (IsChanneling() or IsCasting() or self.waitTimer > GetTimeEX())
		or ( not HasSpell("Will of the Forsaken") and (localObj:IsFleeing() or localObj:IsConfused() or localObj:IsStunned()) ) then
		return 4;
	end

	-- Apply poisons if we are not in combat
	if (not IsInCombat() and self.usePoison) then
		if (script_rogueCheckPoisons:checkPoisons()) then
			return 4;
		end
	end

	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(256, 311);

		if (IsMoving()) or (not IsInCombat()) or (targetObj:IsFleeing()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) and (not targetObj:IsFleeing()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving())and (not targetObj:IsFleeing()) then
			script_grind.tickRate = tickRandom;
		end
	end


	-- dismount before combat
	if (IsMounted()) then
		DisMount();
	end

	-- if we have selected the grinder option in menu
	if (self.enableGrind) then

	
			-- check for adds around us during combat and move to prevent pulling multiple enemies
			if (IsInCombat())
			and (script_grind.skipHardPull)
			and (GetNumPartyMembers() == 0)
			and (targetObj:GetHealthPercentage() >= 20)
			and (not script_checkDebuffs:hasDisabledMovement())
			and (not targetObj:IsCasting()) then
				if (script_checkAdds:checkAdds()) then
				self.waitTimer = GetTimeEX() + 550;
					script_om:FORCEOM();
				return 4;
				end
			end

		--Valid Enemy
		if (targetObj ~= 0) and (not localObj:IsStunned()) then

			-- primitive throw if target has adds
			if self.useThrow and GetLocalPlayer():HasRangedWeapon() and not script_grind:isTargetBlacklisted(targetObj:GetGUID()) and not IsInCombat() then 
				if targetObj:GetDistance() <= 30 and targetObj:GetDistance() > 13 and targetObj:IsInLineOfSight()  then
					if IsMoving() then
						StopMoving();
						return true;
					end
				targetObj:FaceTarget();
				if not CastSpellByName("Throw", targetObj) then
					if IsMoving() then
						StopMoving();
						return true;
					end
					self.waitTimer = GetTimeEX() + 4000;
					script_grind.waitTimer = GetTimeEX() + 3500;
					return;
				end
				end
			end

			-- if we are looting then loot the target - pickpocket fall back
			if (IsLooting()) then
				if (not LootTarget()) then
					LootTarget();
					self.waitTimer = GetTimeEX() + 350;
					return true;
				end
			end

			-- set the current targets health
			local targetHealth = targetObj:GetHealthPercentage();

			--Use Healing Potion 
			if IsInCombat() and PlayerHasTarget() and targetHealth <= 99 and (localHealth <= self.potionHealth) then 
				if (script_helper:useHealthPotion()) then 
					return 0; 
				end 
			end


			-- initiate auto attack on target
			if (targetObj:GetDistance() <= self.meleeDistance) and (not IsAutoCasting("Attack")) then
				targetObj:AutoAttack();
			end

			-- Cant Attack dead targets
			if (targetObj:IsDead() or not targetObj:CanAttack()) then
				return 0;
			end
		
			if (not IsStanding()) then
				JumpOrAscendStart();
			end
	
			-- Don't attack if we should rest first
			if (localHealth < self.eatHealth and not script_grind:isTargetingMe(targetObj)
				and targetHealth > 99 and not targetObj:IsStunned()) then
				self.message = "Need rest...";
				return 4;
			end



				local loot = script_grind.lootObj
					local function checkLoot()
						if loot == nil or script_grind.skipLooting or AreBagsFull() or script_grind.bagsFull then
						return true;
						end
					return false
					end


-- pickpocket
				if (targetObj:GetDistance() <= 4) and checkLoot() then
					if (self.useStealth and HasSpell("Pick Pocket") and IsStealth()) and (targetObj:GetCreatureType()== "Humanoid" or targetObj:GetCreatureType() == "Undead") and (self.usePickPocket) and (not self.pickpocketUsed) and (not IsLooting()) then
						if (GetTarget() == 0) then
							TargetNearestEnemy();
						end
						if (IsMoving()) and (targetObj:GetDistance() < 5) then
							StopMoving();
						return true;
						end
						if IsAutoCasting("Attack") then CastSpellByName("Attack"); end
						self.tickRate = 0;
						self.pickpocketUsed = true;
						CastSpellByName("Pick Pocket", targetObj);
						self.ppMoney = GetMoney();
						self.ppVarUsed = false;
						LootTarget();
						--self.waitTimer = GetTimeEX() + 750;
						--script_grind:setWaitTimer(750);
						if (IsLooting()) and (targetObj:GetDistance() <= 5) then
							if (not LootTarget()) then
								LootTarget();
								self.waitTimer = GetTimeEX() + 350;
								return true;
							end
						elseif (IsLooting()) and (targetObj:GetDistance() > 5) then
							return 3;
						end
					if (not LootTarget()) then
						LootTarget();
						self.waitTimer = GetTimeEX() + 350;
						return true;
					end
					return true;
					end
				elseif (IsLooting()) and (targetObj:GetDistance() < 5) then
					if (not LootTarget()) then
						LootTarget();
					return true;
					end
				elseif (self.pickpocketUsed) and (targetObj:GetDistance() > 5) then
					return 3;
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
		
			--stuck in combat
			if (not PlayerHasTarget()) and (IsInCombat()) and (script_grind.enemiesAttackingUs() == 0 and (not targetObj:HasDebuff("Gouge"))) and (GetNumPartyMembers() < 1) then
				self.message = "Stuck in combat... Waiting...";
				return 4;
			end
		
			-- Opener
			if (not IsInCombat()) then
				self.targetObjGUID = targetObj:GetGUID();
				self.message = "Pulling " .. targetObj:GetUnitName() .. "...";

				-- Auto Attack
				if (targetObj:GetDistance() < 40) and (not IsMoving()) and (not IsAutoCasting("Attack")) then
					targetObj:AutoAttack();
				-- stops spamming auto attacking while moving to target
				elseif (targetObj:GetDistance() <= 8) and (not IsAutoCasting("Attack")) and (not IsStealth()) then
					targetObj:AutoAttack();
				end

				-- Stealth in range if enabled
				if (self.useStealth and targetObj:GetDistance() <= self.stealthRange) and (not script_checkDebuffs:hasPoison()) and (not script_checkDebuffs:hasMagic()) and (script_grind.lootObj == nil) and checkLoot() then
					if (not IsStealth()) then
						CastStealth();
					end
					-- Use sprint (when stealthed for pull)
					if (HasSpell("Sprint")) and (not IsSpellOnCD("Sprint")) and (IsStealth()) and (targetObj:GetDistance() >= 15) and not grind2.fleeCombat then
						CastSpellByName("Sprint");
					end
				end	

				if (not LootTarget()) then
					LootTarget();
				end

				-- Open with stealth opener
				if (targetObj:GetDistance() <= 4 and (self.useStealth or IsStealth()) and HasSpell(self.stealthOpener) and IsStealth()) and (self.openerUsed < 3) and (not IsLooting()) then
					if IsAutoCasting("Attack") then CastSpellByName("Attack"); end
					LootTarget();
					if (script_rogue:spellAttack(self.stealthOpener, targetObj)) then
						LootTarget();
						self.waitTimer = GetTimeEX() + 1550;
						script_grind:setWaitTimer(1550);
						self.openerUsed = self.openerUsed + 1;
						return 0;
					end
					LootTarget();
				end

				-- Check if we are in melee range
				if (targetObj:GetDistance() > self.meleeDistance or not targetObj:IsInLineOfSight()) and (not IsLooting()) then
					return 3;
				end

				-- Use CP generator attack 
				if (localEnergy >= self.cpGeneratorCost) and (HasSpell(self.cpGenerator)) and (targetObj:GetDistance() <= 4) and (self.openerUsed >= 3) and (not IsLooting()) then
					LootTarget();
					script_rogue:spellAttack(self.cpGenerator, targetObj);
					self.openerUsed = 0;
					self.waitTimer = GetTimeEX() + 350;
					return 0;
				end

				-- no stealth  enabled and we need to intiate combat phase
				if (localEnergy >= self.cpGeneratorCost) and (HasSpell(self.cpGenerator)) and (targetObj:GetDistance() <= 4) and (not self.useStealth) then
					script_rogue:spellAttack(self.cpGenerator, targetObj);
					return 0;
				end
				
				

				-- now in Combat
			else	

				self.message = "Killing " .. targetObj:GetUnitName() .. "...";

				local localCP = GetComboPoints("player", "target");

				-- recheck pickpocketing
				if (IsLooting()) then
					LootTarget();
					return true;
				end
				LootTarget();
				self.pickpocketUsed = false;
				self.openerUsed = 0;
				if (self.ppMoney ~= GetMoney()) and (not self.ppVarUsed) and (IsInCombat()) then
					self.pickpocketMoney = self.pickpocketMoney + (GetMoney() - self.ppMoney);
					self.ppVarUsed = true;
				end

				-- Dismount
				if (IsMounted()) then
					DisMount();
				end

				-- Check if we are in melee range
				if (targetObj:GetDistance() > self.meleeDistance or not targetObj:IsInLineOfSight()) then
					return 3;
				end

				if (HasSpell('Kidney Shot')) and (localCP >= 1) and (targetObj:IsCasting()) and (not IsSpellOnCD('Kidney Shot')) and (localEnergy >= 25) and not IsDisarmed() and IsSpellOnCD("Kick") and (IsSpellOnCD("Gouge") or localEnergy < 45) then
					if (Cast('Kidney Shot', targetObj)) then
						return 0;
					end
				end

				-- Check: Use Riposte whenever we can
				if GetTimeEX() > self.riposteTimer and targetObj:GetCreatureType() ~= "Beast" and targetObj:GetCreatureType() ~= "Elemental" and (HasSpell("Riposte")) and (script_rogue:canRiposte() and not IsSpellOnCD("Riposte")) and (localEnergy >= 10) then 
					CastSpellByName("Riposte", targetObj)
					self.waitTimer = GetTimeEX() + 1500;
					self.riposteTimer = GetTimeEX() + 4500;
					return 0;					
				end	
				
				if (GetNumPartyMembers() >= 1) and (HasSpell("Feint")) and (script_grind:isTargetingMe(targetObj)) and (not IsSpellOnCD("Feint")) and (localEnergy >= 20) then
					CastSpellByName("Feint", targetObj);
					return 0;
				end

				-- run back if has vanish
				if (localObj:HasBuff("Vanish")) then
					script_navEX:moveToTarget(localObj, script_nav.savedLocations[script_nav.currentGoToLocation]['x'], script_nav.savedLocations[script_nav.currentGoToLocation]['y'], script_nav.savedLocations[script_nav.currentGoToLocation]['z']); 
					return;
				end

				-- Check: Use Vanish 
				if (HasSpell('Vanish')) and (HasItem('Flash Powder')) and (localHealth < self.vanishHealth) and (not IsSpellOnCD('Vanish')) then 
					if (CastSpellByName('Vanish')) then
						self.waitTimer = GetTimeEX() + 10000;
						ClearTarget();
						self.enemyObj = 0;
					end
				end

				if (HasSpell("Ghostly Strike")) and (not IsSpellOnCD("Ghostly Strike")) and (localEnergy >= 40) then
					CastSpellByName("Ghostly Strike", targetObj);
					return 0;
				end

				-- Check: Kick if the target is casting
				if (HasSpell("Kick")) and (targetObj:IsCasting()) and (not IsSpellOnCD("Kick")) and (localEnergy >= 25) then
					if (CastSpellByName("Kick", targetObj)) then
						self.waitTimer = GetTimeEX() + 900;
						return 0;
					end
				end

				-- Gouge if target casting
				if (HasSpell("Gouge") and (not HasSpell("Kick") or IsSpellOnCD("Kick"))) and (not IsSpellOnCD("Gouge")) and (localEnergy >= 45) and (targetObj:IsCasting()) then
					if (CastSpellByName("Gouge", targetObj)) then
						CastSpellByName("Attack", targetObj);
						self.waitTimer = GetTimeEX() + 250;
						return 0;
					end
				end

				if (not IsAutoCasting("Attack")) and (targetObj:HasDebuff("Gouge")) then
					CastSpellByName("Attack", targetObj);
				end

				-- Gouge then bandage
				if (self.useBandages) and (not localObj:HasDebuff("Recently Bandaged")) then
					if (HasSpell("Gouge")) and (not IsSpellOnCD("Gouge")) and (localEnergy >= 45) and (localHealth < 35) and (script_grind:enemiesAttackingUs() < 2) and not script_checkDebuffs:hasMagic() and not script_checkDebuffs:hasPoison() then
						CastSpellByName("Gouge", targetObj);
						return 0;
					end

					if (targetObj:HasDebuff("Gouge")) and (not localObj:HasDebuff("Recently Bandaged")) then
					script_helper:useBandage();
						return;
					end
				end

				-- Set available skills variables
				hasEvasion = HasSpell('Evasion');
			
				-- Talent specific skills variables
				hasFlurry = HasSpell('Blade Flurry');  
				hasAdrenalineRush = HasSpell('Adrenaline Rush'); 

				-- Check: Use Riposte whenever we can
				if GetTimeEX() > self.riposteTimer and targetObj:GetCreatureType() ~= "Beast" and targetObj:GetCreatureType() ~= "Elemental" and (HasSpell("Riposte")) and (script_rogue:canRiposte() and not IsSpellOnCD("Riposte")) and (localEnergy >= 10) then 
					CastSpellByName("Riposte", targetObj);
					self.waitTimer = GetTimeEX() + 1500;
					self.riposteTimer = GetTimeEX() + 4500;
					return 0;
				end
			
				-- Check: Use Evasion if low HP or more than one enemy attack us
				if ((localHealth < self.evasionHealth and localHealth < targetHealth) or (script_helper:enemiesAttackingUs(5) >= 2 and localHealth < self.evasionHealth)) and (not IsSpellOnCD("Evasion")) then 
					if (HasSpell('Evasion') and not IsSpellOnCD('Evasion')) then
						CastSpellByName('Evasion');
						return 0;
					end
				end 
			
				-- Check: Blade Flurry when 2 or more targets within 10 yards
				if (hasFlurry and script_helper:enemiesAttackingUs(10) >= 2 and not IsSpellOnCD('Blade Flurry')) then 
					if (targetObj:GetDistance() < 5 and targetHealth > 15 and localHealth > 20) then
						CastSpellByName('Blade Flurry');
						return 0;
					end
				end 

				 --Blade Flurry then use Adrenaline Rush on Low HP
				if (HasSpell('Adrenaline Rush') and not IsSpellOnCD('Adrenaline Rush') and localHealth < self.adrenRushComboHP and (self.adrenRushCombo)) and (targetHealth >= 50 or localHealth <= 15) then 
					if (targetObj:GetDistance() < 6) then 
						CastSpellByName('Adrenaline Rush');
						return 0;
					end 
				end
 
				-- Check: Adrenaline Rush if more than 2 enemies attacks us or we fight an elite enemy
				if targetHealth >= 25 and (hasAdrenalineRush and (script_helper:enemiesAttackingUs(10) >= 3 or targetObj:GetClassification() == 1 or targetObj:GetClassification() == 2)) then 
					if (targetObj:GetDistance() < 6) and (not IsSpellOnCD("Adrenaline Rush")) then 
						CastSpellByName('Adrenaline Rush');
						return 0;
					end 
				end 
			
				-- Check: Blade Flury if more than 2 enemies attacks us or we fight an elite enemy
				if (hasBladeFlurry and (script_helper:enemiesAttackingUs(10) >= 2 or targetObj:GetClassification() == 1 or targetObj:GetClassification() == 2)) then 
					if (targetObj:GetDistance() < 6) and (not IsSpellOnCD("Blade Flurry")) then 
						CastSpellByName('Blade Flurry');
						return 0;
					end 
				end 

				-- Eviscerate with 5 CPs
				if (localCP > 4) and (localEnergy >= 35) then
					CastSpellByName("Eviscerate", targetObj);
					return 0; -- return until we use Eviscerate
				end

				-- Keep Slice and Dice up
				if (self.useSliceAndDice) and not IsSpellOnCD("Slice and Dice") and (not localObj:HasBuff('Slice and Dice')) and (targetHealth > 50) and (localCP > 0) and (localEnergy >= 25) then
					if (CastSpellByName("Slice and Dice", targetObj)) then
						self.waitTimer = GetTimeEX() + 1100;
						return 0;
					end	
				end

				-- expose armor
				if (self.useExposeArmor) and (HasSpell("Expose Armor")) and (not IsSpellOnCD("Expose Armor")) and (not targetObj:HasDebuff("Expose Armor")) and (not targetObj:HasDebuff("Sunder Armor")) and (targetHealth >= 40) then
					if (localCP >= self.exposeArmorStacks) and (localEnergy >= 25) then
						if (CastSpellByName("Expose Armor")) then
							self.waitTimer = GetTimeEX() + 1050;
							return 0;
						end
					end
				end

				-- rupture
				if (self.useRupture) and (HasSpell("Rupture")) and (not IsSpellOnCD("Rupture")) and (not targetObj:HasDebuff("Rupture")) then
					if (localCP >= self.ruptureStacks) and (localEnergy >= 25) then
						if (CastSpellByName("Rupture")) then
							self.waitTimer = GetTimeEX() + 1050;
							return 0;
						end
					end
				end

				-- Use CP generator attack 
				if (targetHealth > (10*localCP)) and (localCP < 5) then
					if (localEnergy >= self.cpGeneratorCost) and (HasSpell(self.cpGenerator)) then
						if not IsMoving() then targetObj:FaceTarget(); end
						if (script_rogue:spellAttack(self.cpGenerator, targetObj)) then
							if not IsMoving() then 
							targetObj:FaceTarget(); end
							self.waitTimer = GetTimeEX() + 500;
							return 0;
						end
					end
				end
			
				-- Dynamic health check when using Eviscerate between 1 and 4 CP
				if (targetHealth <= (10*localCP)) and (localEnergy >= 35) then
					CastSpellByName("Eviscerate", targetObj);
					self.waitTimer = GetTimeEX() + 500;
					return 0; -- return until we use Eviscerate
				end

				-- Use CP generator attack 
				if (localEnergy >= self.cpGeneratorCost) and (HasSpell(self.cpGenerator)) then
					if (script_rogue:spellAttack(self.cpGenerator, targetObj)) then
						self.waitTimer = GetTimeEX() + 500;
						return 0;
					end
				end

				-- Check if we are in melee range
				if (targetObj:GetDistance() > self.meleeDistance or not targetObj:IsInLineOfSight()) then
					return 3;
				end
			
			end
		end
	end -- end of if self.enablegrind

	-- Rotation enabled

	--Valid Enemy

	if (self.enableRotation) then

		-- run rotation script
		script_rogueRotation:run(targetGUID)
		
	end


	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(256, 311);

		if (IsMoving()) or (not IsInCombat()) or (targetObj:IsFleeing()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) and (not targetObj:IsFleeing()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving())and (not targetObj:IsFleeing()) then
			script_grind.tickRate = tickRandom;
		end
	end

end

function script_rogue:rest()

	if(not self.isSetup) then
		script_rogue:setup();
	end

	if script_rogueRest:rest() then
		return true;
	end
return false;
end

function script_rogue:spellAttack(spellName, target)
	if (HasSpell(spellName)) then
		if (target:IsSpellInRange(spellName)) then
			if (not IsSpellOnCD(spellName)) then
				if (not IsAutoCasting(spellName)) then
					--target:FaceTarget();
					--target:TargetEnemy();
					return target:CastSpell(spellName);
				end
			end
		end
	end
	return false;
end

function script_rogue:equipThrow()
	if (not GetLocalPlayer():HasRangedWeapon() and HasItem(self.throwName)) then
		UseItem(self.throwName);
		return true;
	elseif (GetLocalPlayer():HasRangedWeapon()) then
		return true;
	end
	return false;
end

function script_rogue:canRiposte()
	local isUsable, _ = IsUsableAction(self.riposteActionBarSlot); 
	if (isUsable == 1 and not IsSpellOnCD("Riposte")) then 
		return true; 
	end 
	return false;
end

-- Run backwards if the target is within range
function script_rogue:runBackwards(targetObj, range) 
	local localObj = GetLocalPlayer();
	if targetObj ~= 0 then
		local xT, yT, zT = targetObj:GetPosition();
		local xP, yP, zP = localObj:GetPosition();
		local distance = targetObj:GetDistance();
		local xV, yV, zV = xP - xT, yP - yT, zP - zT;	
		local vectorLength = math.sqrt(xV^2 + yV^2 + zV^2);
		local xUV, yUV, zUV = (1/vectorLength)*xV, (1/vectorLength)*yV, (1/vectorLength)*zV;		
		local moveX, moveY, moveZ = xT + xUV*15, yT + yUV*15, zT + zUV;		
		if (distance < range) then 		

			if not grind2.usingGrinder2 then
				script_navEXCombat:moveToTarget(Player(), moveX, moveY, moveZ)
			else
				grind2MoveToTarget:run(Player(), moveX, moveY, moveZ+2);
			end
				
			if script_checkAdds:checkAdds() then
				return 4;
			end

			self.waitTimer = GetTimeEX() + 200;
			script_grind:setWaitTimer(100);

		return 4;
		end
	end
	return false;
end