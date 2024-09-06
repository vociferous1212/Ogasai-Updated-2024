script_shaman = {
	message = "Shaman Combat Script",
	healsMenuLoaded = include("scripts\\combat\\shaman\\script_shamanEX2.lua"),
	extra2MenuLoaded = include("scripts\\combat\\shaman\\script_shamanMenuEX.lua"),
	extraMenuLoaded = include("scripts\\combat\\shaman\\script_shamanTotems.lua"),

	eatHealth = 50,
	drinkMana = 35,
	healHealth = 55,
	potionHealth = 10,
	potionMana = 20,
	isSetup = false,
	meleeDistance = 3.70,
	waitTimer = 0,
	stopIfMHBroken = true,
	enhanceWeapon = "no weapon enhancement yet",
	useRock = false,
	useFlame = false,
	useWind = false,
	useFrost = false,
	totem = "no totem yet",	-- used for totem1
	totem2 = "no totem yet",	-- used for totem2
	totem3 = "no totem yet",
	totem4 = "no totem yet",
	healingSpell = "Healing Wave",
	isChecked = true,
	useEarthTotem = false,
	useFireTotem = false,
	useWaterTotem = false,
	useAirTotem = false,
	earthShockMana = 35,
	flameShockMana = 60,
	lightningBoltMana = 25,
	pullLightningBolt = false,
	useFrostShock = false,
	useEarthShock = false,
	useFlameShock = false,
	useLightningBolt = false,
	healMana = 20,
	enhanceWeaponTimer = 0,
	healingSpellTimer = 0,
	healingSpellTimer2 = 0,

}

function script_shaman:setup()

	localObj = GetLocalPlayer();
	localLevel = localObj:GetLevel();

	-- Set weapon enhancement
	if (HasSpell("Windfury Weapon")) then
		self.enhanceWeapon = "Windfury Weapon";
		self.useWind = true;
	elseif (HasSpell("Flametongue Weapon")) then
		self.enhanceWeapon = "Flametongue Weapon";
		self.useFlame = true;
	elseif (HasSpell("Rockbiter Weapon")) then
		self.enhanceWeapon = "Rockbiter Weapon";
		self.useRock = true;
	end

	if (localLevel >= 20) then
		self.eatHealth = 40;
	end

	if (HasSpell("Earth Shock")) then
		self.lightningBoltMana = 80;
		self.useEarthShock = true;
	end
	if (not HasSpell("Earth Shock")) then
		self.pullLightningBolt = true;
		self.useLightningBolt = true;
	end
	--if (GetLocalPlayer():GetLevel() >= 6) then
	--	self.pullLightningBolt = true;
	--end
	if (HasSpell("Flame Shock")) then
		self.useFlameShock = true;
	end

	-- Set totem
	if (HasItem("Earth Totem")) then
		self.useEarthTotem = true;
	end
	if (HasItem("Fire Totem")) then
		self.useFireTotem = true;
	end
	if (HasItem("Water Totem")) then
		self.useWaterTotem = true;
	end
	if (HasItem("Air Totem")) then
		self.useAirTotem = true;
	end

	-- stoneskin totem when we do not have strength of earth totem
	if (HasSpell("Stoneskin Totem")) and (not HasSpell("Strength of Earth Totem")) and (HasItem("Earth Totem")) then
		self.totem = "Stoneskin Totem";
		script_shamanTotems.stoneskinTotem = true;
	end

	-- strength of earth totem
	if (HasSpell("Strength of Earth Totem") and HasItem("Earth Totem")) then
		self.totem = "Strength of Earth Totem";
		script_shamanTotems.strengthOfEarthTotem = true;
	end

	-- fire totems
	if (HasSpell("Searing Totem")) and (HasItem("Fire Totem")) then
		self.totem2 = "Searing Totem";
		script_shamanTotems.searingTotem = true;
	end

	-- water totems
	if (HasSpell("Healing Stream Totem")) and (HasItem("Water Totem")) then
		self.totem3 = "Healing Stream Totem";
		script_shamanTotems.healingStreamTotem = true;
	end

	-- air totems
	if (HasSpell("Windfury Totem")) and (HasItem("Air Totem")) then
		self.totem4 = "Windfury Totem";
		script_shamanTotems.windfuryTotem = true;
	end
	if (localLevel < 6) then
		self.drinkMana = 25;
	end
	if (localLevel >= 10) then
		self.drinkMana = 40;
	end

	self.waitTimer = GetTimeEX();
	self.enhanceWeaponTimer = GetTimeEX();
	script_shamanTotems.waitTimer = GetTimeEX();
	self.healingSpellTimer = GetTimeEX();
	self.healingSpellTimer2 = GetTimeEX();

	self.isSetup = true;

end

-- Checks and apply enhancement on the melee weapon
function script_shaman:checkEnhancement()
	if (not IsInCombat() and not IsEating() and not IsDrinking()) then
		hasMainHandEnchant, _, _, _, _, _ = GetWeaponEnchantInfo();
		if (hasMainHandEnchant == nil) or (GetTimeEX() > self.enhanceWeaponTimer - 45000) then 
			-- Apply enhancement
			if (HasSpell(self.enhanceWeapon)) then

				-- Check: Stop moving, sitting
				if (not IsStanding()) then 
					StopMoving(); 
					return true;
				end 

				if (CastSpellByName(self.enhanceWeapon)) then
				self.message = "Applying " .. self.enhanceWeapon .. " on weapon...";
				self.waitTimer = GetTimeEX() + 1750;
				script_grind:setWaitTimer(1750);
				end
			else
				return false;
			end
		return true;
		end
	end 
	return false;
end

function script_shaman:spellAttack(spellName, target)
	if (HasSpell(spellName)) then
		if (target:IsSpellInRange(spellName)) then
			if (not IsSpellOnCD(spellName)) then
				if (not IsAutoCasting(spellName)) then
					target:FaceTarget();
					--target:TargetEnemy();
					return target:CastSpell(spellName);
				end
			end
		end
	end
	return false;
end

function script_shaman:enemiesAttackingUs(range) -- returns number of enemies attacking us within range
    local unitsAttackingUs = 0; 
    local currentObj, typeObj = GetFirstObject(); 
    while currentObj ~= 0 do 
    	if typeObj == 3 then
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
function script_shaman:runBackwards(targetObj, range) 
	local localObj = GetLocalPlayer();
 	if targetObj ~= 0 then
 		local xT, yT, zT = targetObj:GetPosition();
 		local xP, yP, zP = localObj:GetPosition();
 		local distance = targetObj:GetDistance();
 		local xV, yV, zV = xP - xT, yP - yT, zP - zT;	
 		local vectorLength = math.sqrt(xV^2 + yV^2 + zV^2);
 		local xUV, yUV, zUV = (1/vectorLength)*xV, (1/vectorLength)*yV, (1/vectorLength)*zV;		
 		local moveX, moveY, moveZ = xT + xUV*5, yT + yUV*5, zT + zUV;		
 		if (distance < range) then 
 			Move(moveX, moveY, moveZ);
			if (IsMoving()) then
				JumpOrAscendStart();
			end
		end
	end
	return false;
end

function script_shaman:draw()
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
			6 - stop bot request from combat script  ]]--


function script_shaman:healsAndBuffs()
	
	local localObj = GetLocalPlayer();
	local localMana = localObj:GetManaPercentage();
	local localHealth = localObj:GetHealthPercentage();

	if (self.waitTimer > GetTimeEX()) then
		return;
	end

	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(350, 650);

		if (IsMoving()) or (not IsInCombat()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end

	if (not IsStanding()) then
		JumpOrAscendStart();
	end

if (IsCasting()) or (IsChanneling()) then
		return;
	end


	if (IsSwimming()) and (localObj:HasBuff("Water Breathing")) and (HasItem("Shiny Fish Scales")) 
		and (not localObj:HasBuff("Water Breathing")) then
		if (CastSpellByName("Water Breathing", localObj)) then
			self.waitTimer = GetTimeEX() + 1750;
			script_grind:setWaitTimer(1750);
			return false;
		end
	end

	-- remove ghost wolf before combat
	if (localObj:HasBuff("Ghost Wolf")) then
		CastSpellByName("Ghost Wolf");
			return false;

	end

	if (PlayerHasTarget()) and (not IsAutoCasting("Attack")) and (IsInCombat()) then
		GetLocalPlayer():GetUnitsTarget():AutoAttack();
	end

	if (IsCasting()) or (IsChanneling()) then
		return;
	end

	-- Check: Healing
	if (not IsCasting()) and (not IsChanneling()) and (localMana >= self.healMana) and (not IsMoving()) then
		if (localHealth < self.healHealth) and (not IsSpellOnCD(self.healingSpell)) then
			if (IsMoving()) then
				StopMoving();
			end
			script_shaman:castHealingSpell();
			self.waitTimer = GetTimeEX() + 3000;
			script_grind:setWaitTimer(3000);
		return 4;
		end
	end

	-- check cure poison
	if (HasSpell("Cure Poison")) and (script_checkDebuffs:hasPoison()) and (IsStanding()) then
		if (not IsSpellOnCD("Cure Poison")) and (localMana >= 25) then
			if (CastSpellByName("Cure Poison", localObj)) then
				self.waitTimer = GetTimeEX() + 1650;
				script_grind:setWaitTimer(1650);
				return true;
			end
		end
	end

	-- check cure disease
	if (HasSpell("Cure Disease")) and (script_checkDebuffs:hasDisease()) and (IsStanding()) then
		if (not IsSpellOnCD("Cure Disease")) and (localMana >= 25) then
			if (CastSpellByName("Cure Disease", localObj)) then
				self.waitTimer = GetTimeEX() + 1650;
				script_grind:setWaitTimer(1650);
				return true;
			end
		end
	end

	-- purge enemy of magic
	if (HasSpell("Purge")) and (script_checkDebuffs:enemyBuff()) and (PlayerHasTarget()) then
		if (localMana >= 20) then
			if (CastSpellByName("Purge", targetObj)) then
				self.waitTimer = GetTimeEX() + 1500;
				return true;
			end
		end
	end

	-- Check: Lightning Shield
	if (IsStanding()) and (HasSpell("Lightning Shield")) and (localMana >= 35)
	and (not localObj:HasBuff("Lightning Shield")) and (IsStanding()) then
		if (not Cast("Lightning Shield", localObj)) then
			self.waitTimer = GetTimeEX() + 1500;
			return true;
		end
	end

	if (IsStanding()) then
		if (script_shaman:checkEnhancement()) then
			self.enhanceWeaponTimer = GetTimeEX() + 300000;
			return true;
		end
	end	

	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(750, 1250);

		if (IsMoving()) or (not IsInCombat()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end
return false;
end

function script_shaman:run(targetGUID)
	
	if(not self.isSetup) then
		script_shaman:setup();
	end

	
	local localObj = GetLocalPlayer();
	local localMana = localObj:GetManaPercentage();
	local localHealth = localObj:GetHealthPercentage();
	local localLevel = localObj:GetLevel();	
	script_grind.eatHealth = self.eatHealth;
	script_grind.drinkMana = self.drinkMana;


	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(350, 750);

		if (IsMoving()) or (not IsInCombat()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end

	if (localObj:IsDead()) then
		return 0; 
	end

	-- Check: If Mainhand is broken stop bot
	isMainHandBroken = GetInventoryItemBroken("player", 16);
	
	if (self.stopIfMHBroken and isMainHandBroken) then
		self.message = "The main hand weapon is broken...";
		return 6;
	end

	if (not IsCasting()) and (not IsChanneling()) then
		if (script_shaman:healsAndBuffs()) then
			return 4;
		end
	end

	-- Assign the target 
	targetObj = GetGUIDObject(targetGUID);
	
	if(targetObj == 0 or targetObj == nil) then
		return 2;
	end
	if (GetTarget() ~= 0 and GetTarget() ~= nil) and (GetTarget():CanAttack()) and (not GetTarget():IsDead()) then
		TargetHasRangedWeapon(target);
	end
	-- Check: Do nothing if we are channeling or casting or wait timer
	if (IsChanneling() or IsCasting() or (self.waitTimer > GetTimeEX())) then
		return 4;
	end

	-- dismount before combat
	if (IsMounted()) then
		DisMount();
	end
	
	-- remove ghost wolf before combat
	if (localObj:HasBuff("Ghost Wolf")) then
		CastSpellByName("Ghost Wolf");
	end	

	--Valid Enemy
	if (targetObj ~= 0) and (not localObj:IsStunned()) and (not script_checkDebuffs:hasDisabledMovement()) then
	
	script_grind.combatScriptRange = self.meleeDistance;

		if (IsInCombat()) and (script_grind.skipHardPull) and (GetNumPartyMembers() == 0) and (targetObj:GetHealthPercentage() >= 20) and (not script_checkDebuffs:hasDisabledMovement()) then
			if (script_checkAdds:checkAdds()) then
				script_om:FORCEOM();
				return true;
			end
		end

		-- Cant Attack dead targets
		if (targetObj:IsDead() or not targetObj:CanAttack()) then
			return 0;
		end
		
		if (not IsStanding()) then
			JumpOrAscendStart();
		end
	
		targetHealth = targetObj:GetHealthPercentage();

		-- Check: if we target player pets/totems
		if (GetTarget() ~= 0) then
			if (GetTarget():GetGUID() ~= GetLocalPlayer():GetGUID())
			and (GetTarget():GetUnitName() ~= self.totem)
			and (GetTarget():GetUnitName() ~= self.totem2)
			and (GetTarget():GetUnitName() ~= self.totem3)
			and (GetTarget():GetUnitName() ~= self.totem4) 

			then
				if (UnitPlayerControlled("target")) then 
					script_grind:addTargetToBlacklist(targetObj:GetGUID());
					return 5; 
				end
			end
		end 
		
		-- Opener
		if (not IsInCombat()) then
			self.targetObjGUID = targetObj:GetGUID();
			self.message = "Pulling " .. targetObj:GetUnitName() .. "...";

			-- Dismount
			if (IsMounted() and targetObj:GetDistance() < 25) then DisMount(); return 0; end

			if (self.pullLightningBolt) then
				-- Check: Not in range
				if (not targetObj:IsSpellInRange("Lightning Bolt"))
				or (not targetObj:IsInLineOfSight()) then
					return 3;
				elseif (targetObj:IsInLineOfSight())
					and (targetObj:IsSpellInRange("Lightning Bolt")) then
					targetObj:AutoAttack();
					-- Pull with: Lighting Bolt
					if (IsMoving()) then
						StopMoving();
						return true;
					end
					if (CastSpellByName("Lightning Bolt", targetObj)) then
						self.waitTimer = GetTimeEX() + 2500;
						script_grind:setWaitTimer(2500);
						targetObj:FaceTarget();
						return 4;
					end
				end
			elseif not IsCasting() and not IsChanneling() then
				if (targetObj:GetDistance() <= self.meleeDistance) then
					targetObj:AutoAttack();
					return 3;
				end
			end


				
			-- Auto Attack
			if (targetObj:GetDistance() <= 35) and (not IsAutoCasting("Attack"))
				and (localMana >= self.drinkMana) and (localHealth >= self.healHealth) then
				if (targetObj:IsInLineOfSight()) and (not IsAutoCasting("Attack")) then
					targetObj:AutoAttack();
				else
					return 3;
				end
			end

	
			if (targetObj:GetDistance() > self.meleeDistance) then
				return 3;
			end

			-- run backwards can't see target but close enough to attack
			if (IsInCombat()) and (targetObj:GetDistance() <= self.meleeDistance) and (not targetObj:IsInLineOfSight()) then
				if (targetObj:GetDistance() <= .3) then 
					if (script_shaman:runBackwards(targetObj,2)) then 
						return 4; 
					end 
				end
			end

			-- DO NOT TOUCH CASTING FIRE TOTEMS
			if (self.useFireTotem) and (targetObj:GetDistance() <= 18 or ( self.pullLightningBolt and targetObj:GetDistance() <= 12) ) then
				if (not script_shamanTotems:isFireTotemAlive()) then
					if (HasSpell(self.totem2)) and (not IsSpellOnCD(self.totem2)) and (localMana >= 15) and (targetHealth >= 10) then
						CastSpellByName(self.totem2);
						targetObj:FaceTarget();
						self.waitTimer = GetTimeEX() + 1750;
						return true;
					end
				end
			end

			-- pull flame shock
			if (self.useFlameShock) then
				if (not self.pullLightningBolt) and (HasSpell("Flame Shock"))
					and (localMana >= self.drinkMana) and (not IsSpellOnCD("Flame Shock"))
					and (targetObj:GetDistance() <= 20) then
					if (not CastSpellByName("Flame Shock", targetObj)) then
						self.waitTimer = GetTimeEX() + 1500;
						return true;
					end
				end
			end
		
			if (not IsAutoCasting("Attack")) and (not IsMoving()) then
				targetObj:AutoAttack();
			end
			
			if (localMana >= 20) and (targetObj:GetDistance() <= 20) and (not script_grind.skipHardPull or script_grind.skipHardPull and not script_checkAdds:checkAdds()) then
				if (script_shamanTotems:useTotem()) then
					return;
				end
			end

			-- stop moving if we get close enough to target and not in combat yet
			if (not IsInCombat()) and (targetObj:GetDistance() <= self.meleeDistance + .5)
				and (targetHealth >= 80) then
				if (IsMoving()) then
					StopMoving();
					targetObj:FaceTarget();
					self.waitTimer = GetTimeEX() + 1000;
				end
			end


	-- now in combat

	-- Combat
		else	

		

	-- NOW IN COMBAT
	
			self.message = "Killing " .. targetObj:GetUnitName() .. "...";

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

if (IsInCombat()) and (script_grind.skipHardPull) and (GetNumPartyMembers() == 0)  and (targetObj:GetHealthPercentage() >= 20) and (not script_checkDebuffs:hasDisabledMovement()) then
			if (script_checkAdds:checkAdds()) then
				script_om:FORCEOM();
				return true;
			end
		end


			-- Check if we are in melee range
			if (targetObj:GetDistance() > self.meleeDistance or not targetObj:IsInLineOfSight()) then
				return 3;
			end
				
			-- stop moving if we get close enough to target
			if (targetObj:GetDistance() <= self.meleeDistance + .5) and (targetHealth >= 80) then
				if (IsMoving()) then
					StopMoving();
				end
			end

			if (localMana >= 20) and (targetObj:GetDistance() <= 20) and (not script_grind.skipHardPull or script_grind.skipHardPull and not script_checkAdds:checkAdds()) then
				if (script_shamanTotems:useTotem()) then
					return;
				end
			end


			-- Dismount
			if (IsMounted()) then DisMount(); end

			-- stop moving if we get close enough to target and not in combat yet
			if (not IsInCombat()) and (targetObj:GetDistance() <= self.meleeDistance +.5)
				and (targetHealth >= 80) then
				if (IsMoving()) then
					StopMoving();
					targetObj:FaceTarget();
					self.waitTimer = GetTimeEX() + 1000;
				end
			end

			-- DO NOT TOUCH CASTING FIRE TOTEMS
			if (self.useFireTotem) and (HasSpell(self.totem2)) and (not IsSpellOnCD(self.totem2)) and (localMana >= 15) and (targetHealth >= 10) then
				if (not script_shamanTotems:isFireTotemAlive()) then
					CastSpellByName(self.totem2);
					targetObj:FaceTarget();
					script_grind.tickRate = 150;
					return true;
				end
			end

-- earthbind totem if target is running away
			if (targetObj:GetHealthPercentage() <= 30 or targetObj:IsFleeing()) and (localMana >= 20) and (targetObj:GetCreatureType() == "Humanoid") and (HasSpell("Earthbind Totem")) and (not script_shamanTotems:isEarthbindTotemAlive()) and (HasItem("Earth Totem")) and (not IsSpellOnCD("Earthbind Totem")) then
				CastSpellByName("Earthbind Totem");
				return true;
			end

			-- stoneclaw totem if we have more than 1 target
			if (script_grind.enemiesAttackingUs() > 1) and (localMana >= 20) and (HasSpell("Stoneclaw Totem")) and (not script_shamanTotems:isStoneclawTotemAlive()) and (HasItem("Earth Totem")) and (not IsSpellOnCD("Stoneclaw Totem")) then
				CastSpellByName("Stoneclaw Totem");
				return 0;
			end

			-- Run backwards if we are too close to the target
			if (targetObj:GetDistance() < .3) then 
				if (script_shaman:runBackwards(targetObj,2)) then 
					return 4; 
				end 
			end

			-- Check if we are in melee range
			if (targetObj:GetDistance() > self.meleeDistance or not targetObj:IsInLineOfSight()) then
				return 3;
			end

			if (not IsAutoCasting("Attack")) and (targetObj:GetDistance() <= self.meleeDistance) then 
				targetObj:AutoAttack();
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
	
			-- frost shock target is low health and possible fleeing
			if (targetObj:GetCreatureType() == 'Humanoid') and (targetHealth <= 25)
				and (localMana >= 20) and (HasSpell("Frost Shock"))
				and (not IsSpellOnCD("Frost Shock"))
				and (not targetObj:HasDebuff("Frost Shock")) then
				if (CastSpellByName("Frost Shock")) then
					self.waitTimer = GetTimeEX() + 1650;
					return true;
				end
			end

			--earth shock rank 1 if target is casting
			if (targetObj:IsCasting()) and (HasSpell("Earth Shock")) then
				if (not IsSpellOnCD("Earth Shock")) and (localMana >= 7) then
					CastSpellByName("Earth Shock(Rank 1)");
					return true;
				end
			end
			-- Earth Shock
			if (HasSpell("Earth Shock")) and (self.useEarthShock or targetHealth <= 15) then
				if (targetObj:IsCasting())
				or (not HasSpell("Flame Shock") and targetHealth >= 30)
				or (targetObj:IsFleeing() and not HasSpell("Frost Shock"))
				then
					if (targetObj:GetDistance() <= 20) and
						( (localMana >= self.earthShockMana)
						or (targetObj:IsCasting() and localMana >= 15) 
						or (localHealth <= 30 and localMana >= 15 and targethealth >= 25) ) 						then
						if (not IsSpellOnCD("Earth Shock")) then
							if (CastSpellByName("Earth Shock", targetObj)) then
								self.waitTimer = GetTimeEX() + 1750;
								targetObj:FaceTarget();
								JumpOrAscendStart();
								return true;
							end
						end
					end	
				end
			end

			if (not IsCasting()) and (not IsChanneling()) then
		if (script_shaman:healsAndBuffs()) then
			return 4;
		end
	end

			-- flame shock
			if (self.useFlameShock) then
				if (HasSpell("Flame Shock")) and (not IsSpellOnCD("Flame Shock"))
				and (not IsSpellOnCD("Earth Shock")) and (localMana >= self.flameShockMana)
				and (not targetObj:HasDebuff("Flame Shock")) and (targetHealth >= 25) then
					if (CastSpellByName("Flame Shock")) then
						self.waitTimer = GetTimeEX() + 1750;
						targetObj:FaceTarget();
						JumpOrAscendStart();
						return true;
					end
				end
			end

			-- earth shock after flame shock
			if (self.useEarthShock) then
				if (HasSpell("Flame Shock")) and (HasSpell("Earth Shock"))
				and (targetObj:HasDebuff("Flame Shock") or targetHealth <= 50)
				and (localMana >= self.earthShockMana) then
					if (not IsSpellOnCD("Flame Shock"))
						and (not IsSpellOnCD("Earth Shock")) then	
						if (CastSpellByName("Earth Shock", targetObj)) then
							self.waitTimer = GetTimeEX() + 1750;
							targetObj:FaceTarget();
							JumpOrAscendStart();
							return true;
						end
					end
				end
			end
	
			-- frost shock if selected
			if (self.useFrostShock)	or (targetObj:IsFleeing())then
				if (HasSpell("Frost Shock")) and (not IsSpellOnCD("Frost Shock")) then
					if ( (localMana >= 15 and targetObj:IsFleeing()) or (localMana >= 35) )
					and (targetHealth >= 30)
						and (not targetObj:HasDebuff("Frost Shock")) then
						if (CastSpellByName("Frost Shock")) then
							self.waitTimer = GetTimeEX() + 1750;
							return true;
						end
					end
				end
			end

			if (localMana >= 20) and (targetObj:GetDistance() <= 20) and (not script_grind.skipHardPull or script_grind.skipHardPull and not script_checkAdds:checkAdds()) then
				if (script_shamanTotems:useTotem()) then
					return;
				end
			end


			-- cast lightning bolt in combat
			if (self.useLightningBolt) then
				if (localMana >= self.lightningBoltMana) and (targetHealth >= 20)
					and (not IsMoving()) then
					if (CastSpellByName("Lightning Bolt", targetObj)) then
						targetObj:FaceTarget();
						fself.waitTimer = GetTimeEX() + 1850;
						return 0;
					end
				end
			end

			if (not IsCasting()) and (not IsChanneling()) then
		if (script_shaman:healsAndBuffs()) then
			return 4;
		end
	end

			-- Check: If we are in melee range, do melee attacks
			if (targetObj:GetDistance() <= self.meleeDistance and targetObj:IsInLineOfSight()) then

				if (not IsAutoCasting("Attack")) then
					targetObj:AutoAttack();
				end

				if (not IsCasting()) and (not IsChanneling()) then
		if (script_shaman:healsAndBuffs()) then
			return 4;
		end
	end

				-- stop moving if we get close enough to target
				if (IsInCombat()) and (targetObj:GetDistance() <= self.meleeDistance+.5)
					and (targetHealth >= 80) then
					if (IsMoving()) then
						StopMoving();
					end
				end

				-- War Stomp Tauren Racial
				if (HasSpell("War Stomp")) and (not IsSpellOnCD("War Stomp")) then 							if (targetObj:IsCasting()) or (script_grind:enemiesAttackingUs() >= 2)
					or (localHealth <= self.healHealth) then
						if (CastSpellByName("War Stomp")) then
							self.waitTimer = GetTimeEX() + 500;
							return 0;
						end
					end
				end
				
				if (localMana >= 20) and (targetObj:GetDistance() <= 20) and (not script_grind.skipHardPull or script_grind.skipHardPull and not script_checkAdds:checkAdds()) then
				if (script_shamanTotems:useTotem()) then
					return;
				end
			end


				-- Stormstrike
				if (HasSpell("Stormstrike") and not IsSpellOnCD("Stormstrike")) then
					if (CastSpellByName("Stormstrike", targetObj)) then
						return true;
					end
				end
			end

		end
	end

	if (not script_grind.adjustTickRate) then

		local tickRandom = random(350, 450);

		if (IsMoving()) or (not IsInCombat()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end

end

function script_shaman:rest()
	if(not self.isSetup) then
		script_shaman:setup();
	end

	local localObj = GetLocalPlayer();
	local localLevel = localObj:GetLevel();
	local localHealth = localObj:GetHealthPercentage();
	local localMana = localObj:GetManaPercentage();
	local isGhostWolf = localObj:HasBuff("Ghost Wolf");

	if (not script_grind.adjustTickRate) then

		local tickRandom = random(1850, 2550);

		if (IsMoving()) or (IsInCombat()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end

	-- Stop moving before we can rest
	if(localHealth < self.eatHealth or localMana < self.drinkMana) then
		script_grind.needRest = true;
		if (IsMoving()) then
			StopMoving();
			return true;
		end
	end
	-- check healing wave...
	if (not IsInCombat()) and (IsStanding()) then
		if (not IsCasting()) and (not IsChanneling()) and (HasSpell("Healing Wave")) then
			if (localHealth < 45) and (not isGhostWolf) then
				if (localMana >= self.healMana) then 
					script_shaman:castHealingSpell(GetLocalPlayer());
						self.waitTimer = GetTimeEX() + 2200;
						script_grind:setWaitTimer(2200);
						return true;
					
				end
			end
		end
	end
	-- Check: Healing - lesser healing wave
	if (not IsInCombat()) and (IsStanding()) then
		if (not IsCasting()) and (not IsChanneling()) and (HasSpell("Lesser Healing Wave")) then
			if (localHealth < self.eatHealth) and (not isGhostWolf) then
				if (localMana >= self.healMana) then 
					script_shaman:castLesserHealingWave(localObj);
					self.waitTimer = GetTimeEX() + 2200;
					script_grind:setWaitTimer(2200);
				end
			end
		end
	end

	-- Drink something
	if (not IsDrinking() and localMana < self.drinkMana) and (not IsMoving()) and (not IsInCombat()) then
		self.waitTimer = GetTimeEX() + 2000;
		script_grind:setWaitTimer(2000);
		self.message = "Need to drink...";
		if (IsMoving()) then
			StopMoving();
			return true;
		end

		if (not IsDrinking()) and (IsStanding()) and (not HasForm()) then
			script_grind:setWaitTimer(2000);
			if (script_helper:drinkWater()) then 
				script_grind:setWaitTimer(2000);
				self.message = "Drinking..."; 
				return true; 
			else 
				self.message = "No drinks! (or drink not included in script_helper)";
				return true; 
			end
		end
	end

	-- Eat something
	if (not IsEating() and localHealth < self.eatHealth) and (not IsMoving()) and (not IsInCombat()) then
		self.waitTimer = GetTimeEX() + 2000;
		script_grind:setWaitTimer(2000);
		self.message = "Need to eat...";
		if (IsInCombat()) then
			return true;
		end
			
		if (IsMoving()) then
			StopMoving();
			return true;
		end

		if (not IsEating()) and (IsStanding()) and (not HasForm()) then
			script_grind:setWaitTimer(2000);
			if (script_helper:eat()) then 
				script_grind:setWaitTimer(2000);
				self.message = "Eating..."; 
				return true; 
			else 
				self.message = "No food! (or food not included in script_helper)";
				return true; 
			end
		end		
	end	

	-- Continue resting
	if(localHealth < 98 and IsEating() or localMana < 98 and IsDrinking()) then
		self.message = "Resting up to full HP/Mana...";
		return true;
	end
		
	-- Stand up if we are rested
	if (localHealth > 98 and (IsEating() or not IsStanding()) 
	    and localMana > 98 and (IsDrinking() or not IsStanding())) then
		StopMoving();
		return false;
	end

	if (not script_grind.adjustTickRate) then

		local tickRandom = random(1750, 2350);

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
function script_shaman:mount()	return false; end
function script_shaman:window()

	if (self.isChecked) then
	
		--Close existing Window
		EndWindow();

		if(NewWindow("Class Combat Options", 200, 200)) then
			script_shamanEX:menu();
		end
	end
end

function script_shaman:castHealingSpell(localObj)
	if (self.healingSpellTimer > GetTimeEX()) then
		return false;
	end
	if (HasSpell(script_shaman.healingSpell)) then
		if (not IsSpellOnCD(script_shaman.healingSpell)) then
			if (not IsMoving()) and (IsStanding()) then
				if (not IsCasting()) and (not IsChanneling()) then
					self.healingSpellTimer = GetTimeEX() + 5500;
					self.waitTimer = GetTimeEX() + 3500;
					if (CastSpellByName(self.healingSpell, localObj)) then
						return 4;
					end
				end
			end
		end
	end
return false;
end
function script_shaman:castLesserHealingWave(localObj)
	if (self.healingSpellTimer2 > GetTimeEX()) then
		return false;
	end
	if (HasSpell("Lesser Healing Wave")) then
		if (not IsSpellOnCD("Lesser Healing Wave")) then
			if (not IsMoving()) and (IsStanding()) then
				if (not IsCasting()) and (not IsChanneling()) then
					self.healingSpellTimer2 = GetTimeEX() + 2500;
					self.waitTimer = GetTimeEX() + 2500;
					if (CastSpellByName("Lesser Healing Wave", localObj)) then
						return 4;
					end
				end
			end
		end
	end
return false;
end