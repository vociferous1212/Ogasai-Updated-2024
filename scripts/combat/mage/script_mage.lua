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
	useWandMana = 7,	-- use wand below this mana %
	useWandHealth = 10,	-- use wand below this target health %
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
	startedNewCharacter = true,	-- changed to false in setup if we have frostbolt
	blinkTimer = 0,
	frostboltMana = 20,	-- cost of frostbolt mana - mainly used for low levels...
}

function script_mage:window()

	-- setup stuff
	if (script_mage.isChecked) then
	
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
	
 	if targetObj ~= 0 and targetObj ~= nil
	and (not script_checkDebuffs:hasDisabledMovement()) and not IsCasting() and not IsChanneling() and not IsCasting()
	then

 		local xT, yT, zT = targetObj:GetPosition();
 		local xP, yP, zP = localObj:GetPosition();
 		local distance = targetObj:GetDistance();
 		local xV, yV, zV = xP - xT, yP - yT, zP - zT;	
 		local vectorLength = math.sqrt(xV^2 + yV^2 + zV^2);
 		local xUV, yUV, zUV = (1/vectorLength)*xV, (1/vectorLength)*yV, (1/vectorLength)*zV;
 		local moveX, moveY, moveZ = xT + xUV*30, yT + yUV*30, zT + zUV;		
 		if (distance < range) then

			--if not script_mage.useBlink or (script_mage.useBlink and HasSpell("Blink") and IsSpellOnCD("Blink")) then

				script_navEXCombat:moveToTarget(localObj, moveX, moveY, moveZ);

				-- move fall-back
				if not IsMoving() then
					Move(moveX, moveY, moveZ)
					script_nav:resetNavigate();
				end

			-- check for adds 
			if script_checkAdds:checkAdds() then
				return 4;
			end
			self.waitTimer = GetTimeEX() + 500;
		return 4;
		end
	end
	return false;
end

function script_mage:addWater(name) -- water setup
	script_mage.water[script_mage.numWater] = name;
	script_mage.numWater = script_mage.numWater + 1;
end

function script_mage:addFood(name)	-- food setup
	script_mage.food[script_mage.numfood] = name;
	script_mage.numfood = script_mage.numfood + 1;
end

function script_mage:addManaGem(name)	-- mana gem setup
	script_mage.manaGem[script_mage.numGem] = name;
	script_mage.numGem = script_mage.numGem + 1;
end

function script_mage:setup()
	
	if not script_mage.isSetup then
		script_mageSetup:setup()
	end

end

function script_mage:draw()
	local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition());
	if (onScreen) then
		if (script_grind.adjustText) and (script_grind.drawEnabled) then
			tX = tX + script_grind.adjustX;
			tY = tY + script_grind.adjustY;
		end

	DrawText(script_mage.message, tX+30, tY+100, 255, 250, 205);

	else
		if (script_grind.adjustText) and (script_grind.drawEnabled) then
			tX = tX + script_grind.adjustX;
			tY = tY + script_grind.adjustY;
		end

	DrawText(script_mage.message, 25, 185, 255, 250, 205);
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
	if (not script_mage.isSetup) then
		script_mage:setup();
	end
	
-- set low level stuff
	if (not HasSpell("Frostbolt")) then
		script_mage.frostMage = false;
		script_mage.fireMage = true;
	end

-- we have fireball at level 1-3 that has a 35 yard range cast. if we do not reload bot, and obtain frostbolt, we need to change the distance
	if script_mage.startedNewCharacter then
		if HasSpell("Frostbolt") and script_mage.fireMage then
			script_mage.spellRange = 29;
			script_mage.fireMage = false;
			script_mage.frostMage = true;
			script_mage.startedNewCharacter = false;
		end
	end

-- handle low level mana cost of spells...
	if GetLocalPlayer():GetLevel() >= 4 then
		script_mage.frostboltMana = 10
	elseif GetLocalPlayer():GetLevel() >= 6 then
		script_mage.frostboltMana = 8
	elseif GetLocalPlayer():GetLevel() >= 10 then
		script_mage.frostboltMana = 6;
	elseif GetLocalPlayer():GetLevel() >= 20 then
		script_mage.frostboltMana = 4;
	end

-- set local variables
	local localObj = GetLocalPlayer();

	local localMana = localObj:GetManaPercentage();

	local localHealth = localObj:GetHealthPercentage();

	local localLevel = localObj:GetLevel();

	script_grind.eatHealth = script_mage.eatHealth;
	script_grind.drinkMana = script_mage.drinkMana;

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

-- Check: Move backwards if the target is affected by Frost Nova or Frost Bite
		-- run backwards
	if (GetNumPartyMembers() < 1) and (script_mage.useFrostNova) and not IsCasting() and not IsChanneling() then
		if (targetObj:HasDebuff("Frostbite") or targetObj:HasDebuff("Frost Nova"))
		and (targetHealth > script_mage.useWandHealth or localHealth < 35)
		and (not localObj:HasBuff('Evocation'))
		and (not script_checkDebuffs:hasDisabledMovement()) and (not IsSwimming()) and (targetObj:IsInLineOfSight()) then

			if targetObj:GetDistance() < 12 then
				if (script_mage:runBackwards(targetObj, 12)) then -- Moves if the target is closer than 7 yards

					script_mage.message = "Moving away from target...";

					if (not IsSpellOnCD("Frost Nova")) and (targetObj:GetDistance() < 9)
						and (not targetObj:HasDebuff("Frostbite")) and not targetObj:HasDebuff("Frost Nova")
						and not script_mage.addPolymorphed
					then
						CastSpellByName("Frost Nova");
					end

				return 4;
				end 
			return;
			end
		end	
	end

-- Check: Do nothing if we are channeling, casting or Ice Blocked
	if (IsChanneling()) or (IsCasting()) or (localObj:HasBuff("Ice Block")) or (script_mage.waitTimer + script_grind.tickRate > GetTimeEX())
	or localObj:IsStunned() then

		if IsStanding() and IsInCombat() and PlayerHasTarget() and not IsMoving() and not localObj:IsStunned() then
			if GetTarget():GetDistance() <= script_grind.combatScriptRange and GetTarget():IsInLineOfSight() then
				if not IsMoving() and not IsPathLoaded(5) then
					GetTarget():FaceTarget();
				end
			end
		end
	return 4;
	end

-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(250, 350);

		if (IsMoving()) or (not IsInCombat()) and (not localObj:IsCasting()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) or (localObj:IsCasting()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving()) or (localObj:IsCasting()) then
			script_grind.tickRate = tickRandom;
		end
	end

-- check silence and use wand
	-- this doesn't work properly...
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
					script_mage.waitTimer = GetTimeEX() + 250;
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
			
-- check for adds around us during combat and move to prevent pulling multiple enemies
	if (IsInCombat()) and (script_grind.skipHardPull) and (GetNumPartyMembers() == 0)
	and (targetObj:GetHealthPercentage() >= 20) and (not script_checkDebuffs:hasDisabledMovement())
	and (not targetObj:IsCasting()) then
		if (script_checkAdds:checkAdds()) then
			script_om:FORCEOM();
		return 4;
		end
	end

-- assign target health
		targetHealth = targetObj:GetHealthPercentage();


			-- Check: Do we have the right target (in UI) ??
				if (GetTarget() ~= 0 and GetTarget() ~= nil) then
					if (GetTarget():GetGUID() ~= targetObj:GetGUID()) then
						ClearTarget();
						script_mage.waitTimer = GetTimeEX() + 1500;
						script_grind:setWaitTimer(1500);
						targetObj = 0;
						return 0;
					end
				end

	
		-- Cant Attack dead targets
		if (targetObj:IsDead()) or (not targetObj:CanAttack()) then
			ClearTarget();
			return 2;
		end
		
		-- stand if sitting
		if not IsEating() and not IsDrinking() and (not IsStanding()) then
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
		
		if (targetObj:GetDistance() > script_grind.combatScriptRange -1 or not targetObj:IsInLineOfSight()) and not targetObj:HasDebuff("Frost Nova") and not targetObj:HasDebuff("Frostbite") then
			return 3;
		end
		if targetObj:GetDistance() <= script_grind.combatScriptRange and not IsMoving() and targetObj:GetHealthPercentage() <= 99 then
			targetObj:FaceTarget();
		end

		--	START OF COMBAT PHASE

-- frost ward
		if IsStanding() and (script_mage.useFrostWard) and (HasSpell("Frost Ward")) and (not localObj:HasBuff("Frost Ward")) then
			if (localMana > 25) and (not localObj:HasBuff("Fire Ward")) then
				if (not CastSpellByName("Frost Ward", localObj)) then
					script_mage.waitTimer = GetTimeEX() + 1700;
					--script_grind:setWaitTimer(1700);
					return true;
				end
			end
		end
	
		-- fire ward
		if IsStanding() and (script_mage.useFireWard) and (HasSpell("Fire Ward")) and (not localObj:HasBuff("Fire Ward")) then
			if (localMana > 50) and (not localObj:HasBuff("Frost Ward")) then
				if (not CastSpellByName("Fire Ward", localObj)) then
					script_mage.waitTimer = GetTimeEX() + 1700;
					--script_grind:setWaitTimer(1700);
					return true;
				end
			end
		end

	
		-- Opener - not in combat pulling target
		if (not IsInCombat()) then

			-- display message in ogasai message box
			script_mage.message = "Pulling " .. targetObj:GetUnitName() .. "...";

			-- ice barrier - don't use it if we are low enough on mana that it causues rest function to run
			if localMana >= script_mage.drinkMana + 10 and PlayerHasTarget() and (HasSpell("Ice Barrier")) and (not IsSpellOnCD("Ice Barrier")) and (not localObj:HasBuff("Ice Barrier")) then
				CastSpellByName('Ice Barrier');
				script_mage.waitTimer = GetTimeEX() + 1000;
			end


			-- frost mage selected
			if (script_mage.frostMage) and (targetObj:GetDistance() <= script_mage.spellRange) and (targetObj:IsInLineOfSight()) and not IsMoving() then
				if (script_magePullSpells.frostMagePull(targetObj)) then

				-- set some timers to make the bot wait before pulling a target that may have walked closer during casting - pulls 2 at once
					-- spell casting time is greater the greater the frostbolt rank
					if GetLocalPlayer():GetLevel() < 28 then
						script_grind:setWaitTimer(2200);
						script_mage.waitTimer = GetTimeEX() + 2200;
					end

					-- i'm lazy and this works
					if GetLocalPlayer():GetLevel() >= 28 then
						script_grind:setWaitTimer(3000);
						script_mage.waitTimer = GetTimeEX() + 3000;
					end
					if (PlayerHasTarget()) and not IsMoving() then
						targetObj:FaceTarget();
					end
				end

				-- fire mage selected use these spells instead
			elseif (script_mage.fireMage) and (targetObj:GetDistance() <= script_mage.spellRange) and targetObj:IsInLineOfSight() and not IsMoving() then
				if (script_magePullSpells.fireMagePull(targetObj)) then
					script_grind:setWaitTimer(2600);
					script_mage.waitTimer = GetTimeEX() + 2600;
					if (PlayerHasTarget()) and not IsMoving() then
						targetObj:FaceTarget();
					end
				end
			end
			
		-- Combat

		else	



			-- display message in ogasai message box
			script_mage.message = "Killing " .. targetObj:GetUnitName() .. "...";
			
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
						script_mage.waitTimer = GetTimeEX() + 7500;
						return 0;
					end
				end
			end

			-- blink frost nova on CD
			if (script_mage.useBlink) then
				if (HasSpell("Blink")) and (not IsSpellOnCD("Blink")) and (IsSpellOnCD("Frost Nova") or IsSpellOnCD("Cone of Cold")) and (targetObj:GetDistance() < 9) and (targetHealth > script_mage.useWandHealth + 10) then
					if (not targetObj:HasDebuff("Frostbite")) and (not targetObj:HasDebuff("Frost Nova")) and (not targetObj:HasDebuff("Blast Wave")) and (targetHealth > 10) then
						local a = targetObj:GetAngle();
						FaceAngle(a);
						if (CastSpellByName("Blink")) then
							targetObj:FaceTarget();
							script_mage.waitTimer = GetTimeEX() + 750;
						end
					end
				end
			end

			-- Check: Use Healing Potion 
			if (localHealth < script_mage.potionHealth) then 
				if (script_helper:useHealthPotion()) then 
					return 0; 
				end 
			end

			-- Check: Use Mana Potion 
			if (localMana < script_mage.potionMana) and (targetHealth >= 25 or localHealth <= 50) then 
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

			-- if more than 2 enemies are attacking us then check them for frost nova and run backwards
			if IsInCombat() and script_grind:enemiesAttackingUs(10) >= 2 then script_mageCheckFrostNova:checkFrostNova(); script_mage.waitTimer = GetTimeEX() + 500; end

			-- use cold snap to reset frost nova if we don't have ice barrier
			-- make sure we waste both cone of cold and frost nova cooldown
			if (targetObj:IsInLineOfSight()) and (not HasSpell("Ice Barrier"))
			and (HasSpell("Cold Snap")) and (not IsSpellOnCD("Cold Snap")) and (IsSpellOnCD("Frost Nova"))
			and (not targetObj:HasDebuff("Frost Nova")) and (not targetObj:HasDebuff("Frostbite"))
			and (targetObj:GetDistance() <= 10)
			and ( (localMana >= 15 and targetHealth >= 20) or (localHealth <= 30 and localMana >= 10) )
				and (not HasSpell("Cone of Cold") or (HasSpell("Cone of Cold") and IsSpellOnCD("Cone of Cold"))) then

				CastSpellByName("Cold Snap");
				script_mage.waitTimer = GetTimeEX() + 1000;
			end

			-- Run backwards if we are too close to the target
			if (targetObj:GetDistance() <= .5) then 
				if (script_mage:runBackwards(targetObj,5)) then 
					return 4; 
				end 
			end

			--Cone of Cold
			-- bot should use frost nova first if available - half the mana costs
			-- don't waste the mana if frost nova isn't on CD unless 2 or more targets attacking us
			if (script_mage.useConeOfCold) and (HasSpell("Cone of Cold")) and (localMana >= script_mage.coneOfColdMana)
			and (targetHealth >= script_mage.coneOfColdHealth) and (IsSpellOnCD("Frost Nova") or script_grind:enemiesAttackingUs(10) >= 2) then
				if (not script_mage.addPolymorphed) and (targetObj:GetDistance() < 9)
				and (not targetObj:HasDebuff("Frostbite")) and (not targetObj:HasDebuff("Frost Nova"))
				and not script_mage.addPolymorphed
				then
						targetObj:FaceTarget();
					if (script_mage:coneOfCold("Cone of Cold")) then
						targetObj:FaceTarget();
						script_mage.waitTimer = GetTimeEX() + 1500;
						return 0;
					end
				end
			end

-- Fire blast
-- we only really want to use it as a last resort once we have better spells... costs a lot of mana
			if (script_mage.useFireBlast) and (targetObj:GetDistance() <= 20) and (HasSpell("Fire Blast")) and (not IsSpellOnCD("Fire Blast")) and (localMana > 6) and (not IsMoving()) and targetHealth > 5 then
				if (not targetObj:HasDebuff("Frost Nova")) and (not targetObj:HasDebuff("Frostbite")) or (targetHealth < 20 and localHealth < 25) then
					if targetHealth <= 20 and (not HasSpell("Cone of Cold") and IsSpellOnCD("Frost Nova")) or (HasSpell("Cone of Cold") and IsSpellOnCD("Cone of Cold") and IsSpellOnCD("Frost Nova")) then
	
						if (not IsSpellOnCD("Fire Blast")) then
							CastSpellByName("Fire Blast", targetObj);
							script_mage.waitTimer = GetTimeEX() + 1550;
							script_grind:setWaitTimer(1550);
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
			if (script_mage.fireMage and script_mage.useFrostNova) then
				if (HasSpell("Frost Nova")) and (not IsSpellOnCD("Frost Nova")) then
					if (localMana > 5) and (targetObj:GetDistance() < 9) and (not targetObj:HasDebuff("Frost Nova")) and (not targetObj:HasDebuff("Frostbite")) then
						if (CastSpellByName("Frost Nova")) then
							return;
						end
					end
				end
			end

			-- Use Mana Gem when low on mana
			if (localMana <= script_mage.potionMana and GetTimeEX() > script_mage.gemTimer) and targetObj:GetHealthPercentage() >= 15 then
				for i=0,script_mage.numGem do
					if(HasItem(script_mage.manaGem[i])) then
						UseItem(script_mage.manaGem[i]);
						script_mage.gemTimer = GetTimeEX() + 120000;
						return 0;
					end
				end
			end

			-- Use Evocation if we have low Mana but still a lot of HP left
			if (localMana < script_mage.evocationMana and localHealth > script_mage.evocationHealth and HasSpell("Evocation") and not IsSpellOnCD("Evocation")) and (targetHealth > 35) then		
				script_mage.message = "Using Evocation...";
				CastSpellByName("Evocation");
				return 0;
			end

			-- counterspell if target is casting
			if (HasSpell("Counterspell")) and (not IsSpellOnCD("Counterspell")) and (localMana > 15) and (targetObj:IsCasting()) then

				-- talents allow a longer range for some spells and not others. move closer if we need to...
				if targetObj:GetDistance() > 29 then
					return 3;

				-- if we are close enough to cast counterspell
				elseif targetObj:GetDistance() <= 30 then

					-- counter their spell
					if (CastSpellByName("Counterspell", targetObj)) then
						script_mage.waitTimer = GetTimeEX() + 1500;
						return 0;
					end
				end
			end

			-- Use Mana Shield if we have more than 35 percent mana and no active Ice Barrier
			-- forced to use it if we have 20 percent or less health regardless if checked or not
			-- and only if target is too close only if frost nova is on CD - it only absorbs physical damage
			if (script_mage.useManaShield or localHealth <= 20) and (not localObj:HasBuff("Ice Barrier")) and (HasSpell("Mana Shield")) and (localMana >= script_mage.manaShieldMana) and (localHealth <= script_mage.manaShieldHealth) and (not localObj:HasBuff("Mana Shield")) and (IsInCombat()) and (targetHealth >= 10 or script_grind:enemiesAttackingUs() >= 2 or localHealth <= 20) and targetObj:GetDistance() <= 12 then
				if (not targetObj:HasDebuff("Frost Nova") and not targetObj:HasDebuff("Frostbite")) and (targetObj:GetDistance() <= 9 or IsSpellOnCD("Frost Nova") or localHealth <= 20) then
					CastSpellByName("Mana Shield");
					script_mage.waitTimer = GetTimeEX() + 1650;
					script_grind:setWaitTimer(1650);
					return 0;
				end
			end

			-- Check if add already polymorphed
			if (not script_magePolymorph:isAddPolymorphed() and (GetTimeEX() > script_mage.polyTimer)) then
				script_mage.addPolymorphed = false;
			end

			-- Check: Polymorph add
			if targetObj:IsInLineOfSight() and (targetObj ~= nil and script_mage.polymorphAdds and script_grind:enemiesAttackingUs() > 1 and HasSpell('Polymorph') and not script_mage.addPolymorphed) and (targetObj:GetDistance() < 25) and not script_magePolymorph:isAddPolymorphed() and script_magePolymorph:isPolymorphTargetValid() then
				if not script_grind.adjustTickRate then script_grind.tickRate = 250; end
				script_mage.message = "Polymorphing add...";
				script_magePolymorph:polymorphAdd(targetObj:GetGUID());
				script_mage.waitTimer = GetTimeEX() + 1750;
				script_grind:setWaitTimer(1500);
				return true;
			end 

			-- Check: Sort target selection if add is polymorphed
			if (script_mage.addPolymorphed) then
				if(script_grind:enemiesAttackingUs() >= 1 and targetObj:HasDebuff('Polymorph')) then
					ClearTarget();
					script_grind.tickRate = 250;
					if script_magePolymorph:isPolymorphTargetValid() then
						targetObj = script_magePolymorph:getTargetNotPolymorphed();
						targetObj:AutoAttack();
					end
				end
			end

			-- Check: Frostnova when the target is close, but not when we polymorhped one enemy or the target is affected by Frostbite
			if (not script_mage.addPolymorphed) and (targetObj:GetDistance() < 9 and not targetObj:HasDebuff("Frostbite") and HasSpell("Frost Nova") and not IsSpellOnCD("Frost Nova")) and script_mage.useFrostNova and targetHealth >= 10 then
				if not script_grind.adjustTickRate then script_grind.tickRate = 100; end
				script_mage.message = "Frost nova the target(s)...";
				CastSpellByName("Frost Nova");
			end			

			-- ice block
			if (script_mage.frostMage) then
				if (HasSpell("Ice Block")) and (not IsSpellOnCD("Ice Block")) then
					if (localHealth < script_mage.iceBlockHealth) and (localMana < script_mage.iceBlockMana) then
						script_mage.message = "Using Ice Block...";
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
			if (script_mage.fireMage) and (HasSpell("Blast Wave")) then
				if (localMana > 30) and (targetObj:GetDistance() < 10) and (not IsSpellOnCD("Blast Wave")) and (targetHealth > 10 or localHealth < 35) and (not IsSwimming()) and (targetObj:IsInLineOfSight()) then
					if (script_mage:runBackwards(targetObj, 12)) then -- Moves if the target is closer than 7 yards
						if not script_grind.adjustTickRate then script_grind.tickRate = 0; end
						script_mage.message = "Moving away from target...";
						if (not IsSpellOnCD("Blast Wave")) then
							CastSpellByName("Blast Wave");
						end
					return 4; 
					end 
				end	
			end

		
			-- scorch
			if (script_mage.fireMage) and (script_mage.useScorch) and (HasSpell("Scorch")) and (GetLocalPlayer():GetLevel() >= 27) and (localMana > script_mage.useWandMana and targetHealth > script_mage.useWandHealth) then
				if (targetObj:GetDebuffStacks("Fire Vulnerability") < script_mage.scorchStacks) then
					if (localMana > script_mage.useWandMana) and (targetHealth > script_mage.useWandHealth) then
						if (CastSpellByName("Scorch", targetObj)) then
							script_mage.waitTimer = GetTimeEX() + 1800;
							return 0;
						end
					end
				end
			end
			
			-- pyroblast if target has frost nova?
			if (script_mage.fireMage) and (not targetObj:HasDebuff("Pyroblast")) and (not IsSpellOnCD("Pyroblast")) and (IsSpellOnCD("Frost Nova")) then
				if (HasSpell("Pyroblast")) and (targetObj:HasDebuff("Frost Nova")) then
					if (CastSpellByName("Pyroblast", targetObj)) then
						script_mage.waitTimer = GetTimeEX() + 5000;
						return 0;
					end
				end
			end


			-- Wand if mana or target health is low
			if (script_mage.useWand)
			and (localObj:HasRangedWeapon())
			and (localMana <= script_mage.useWandMana or targetHealth <= script_mage.useWandHealth or localMana <= script_mage.frostboltMana)
			and (not IsChanneling())
			and (not localObj:IsStunned())
			and (not IsMoving())
			
			then

				script_mage.message = "Using wand...";

				if targetObj:GetDistance() > 29 then
					return 3;

				elseif targetObj:GetDistance() <= 29 then

					if (not IsAutoCasting("Shoot")) and (PlayerHasTarget()) and not IsMoving() then

						targetObj:CastSpell("Shoot");
						script_mage.waitTimer = GetTimeEX() + 550;
					return true;

					end
				end
			end

			-- low level fireball
			if (script_mage.frostMage) and (not HasSpell("Frostbolt")) then
				CastSpellByName("Fireball", targetObj);
			end
			
			-- Main damage source if all above conditions cannot be run
			-- frost mage spells
			if (HasSpell("Frostbolt")) and (script_mage.frostMage) and (not IsChanneling()) and (not IsMoving()) then
				if (localMana >= script_mage.useWandMana and targetHealth >= script_mage.useWandHealth) then

					-- Check: Frostnova when the target is close, but not when we polymorhped one enemy or the target is affected by Frostbite
					if (not script_mage.addPolymorphed) and (targetObj:GetDistance() < 9 and not targetObj:HasDebuff("Frostbite") and HasSpell("Frost Nova") and not targetObj:HasDebuff("Frost Nova") and not IsSpellOnCD("Frost Nova")) and script_mage.useFrostNova and localMana >= 10 and targetHealth >= 10 then
						if not script_grind.adjustTickRate then script_grind.tickRate = 0; end
						script_mage.message = "Frost nova the target(s)...";
						CastSpellByName("Frost Nova");
					end
			
					-- check range
					if (not targetObj:IsInLineOfSight() or targetObj:GetDistance() > script_grind.combatScriptRange -1) and not (targetObj:HasDebuff("Polymorph")) and not targetObj:HasDebuff("Frostbite") and not targetObj:HasDebuff("Frost Nova") then
						return 3;
					end

					if localMana >= script_mage.frostboltMana and (not IsMoving()) and (not IsSpellOnCD("Frostbolt")) and targetObj:IsInLineOfSight() then
						if (CastSpellByName("Frostbolt", targetObj)) then
							targetObj:FaceTarget();
							script_mage.waitTimer = GetTimeEX() + 1850;
							script_grind:setWaitTimer(1850);
							--return 0;
						end
					end
				end	
			end

				-- fire mage spells
			if (script_mage.fireMage) and (not IsChanneling()) and (not IsMoving()) then

				-- use these spells if not using wand
				if (localMana >= script_mage.useWandMana and targetHealth >= script_mage.useWandHealth) then

			-- Check: Frostnova when the target is close, but not when we polymorhped one enemy or the target is affected by Frostbite
					if (not script_mage.addPolymorphed) and (targetObj:GetDistance() < 9 and not targetObj:HasDebuff("Frostbite") and HasSpell("Frost Nova") and not targetObj:HasDebuff("Frost Nova") and not IsSpellOnCD("Frost Nova")) and script_mage.useFrostNova and localMana >= 10 and targetHealth >= 10 then
						if not script_grind.adjustTickRate then script_grind.tickRate = 100; end
						script_mage.message = "Frost nova the target(s)...";
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
			if (script_mage.frostMage) and (not HasSpell("Frostbolt")) and (not IsMoving()) then				
		
				-- else if not has frostbolt then use fireball as range check
				if (not targetObj:IsInLineOfSight() or targetObj:GetDistance() > script_grind.combatScriptRange -1) and not targetObj:HasDebuff("Frost Nova") and not targetObj:HasDebuff("Frostbite") then
					return 3;
				end	
				-- cast fireball
				if targetObj:IsInLineOfSight() and not IsMoving() then
					if (CastSpellByName("Fireball", targetObj)) then
						script_grind:setWaitTimer(2500);
						script_mage.waitTimer = GetTimeEX() + 2500;
						return 0;
					end
				end
			end

			-- this is here to check for low level not having a wand yet
			if (script_mage.frostMage) and (not IsMoving()) and (not localObj:HasRangedWeapon()) and (targetHealth <= script_mage.useWandHealth) and (not IsSpellOnCD("Frostbolt")) then				
		
				if (targetObj:GetDistance() > script_grind.combatScriptRange -1 or not targetObj:IsInLineOfSight()) and not targetObj:HasDebuff("Frost Nova") and not targetObj:HasDebuff("Frostbite") then
					return 3;
				end	
				
				-- cast frostbolt
				if targetObj:IsInLineOfSight() and not IsMoving() then
					if (CastSpellByName("Frostbolt", targetObj)) then
						script_grind:setWaitTimer(1650);
						script_mage.waitTimer = GetTimeEX() + 1650;
						return 0;
					end
				end
			end

				
		end

		-- set tick rate for script to run
		if (not script_grind.adjustTickRate) then

				local tickRandom = random(250, 350);

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

	if (not script_mage.isSetup) then
		script_mageSetup:setup();
	end

	if script_mageRest:rest() then
		return true;
	end

return false;
end