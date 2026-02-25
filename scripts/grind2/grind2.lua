grind2 = {

	grind2IncludeFiles = include("scripts\\grind2\\includeFiles.lua"),

	timer = GetTimeEX(),						-- script timer
	obtainNewTargetTimer = GetTimeEX(),			-- obtain new target timer
	faceTargetTimer = GetTimeEX(),				-- face target timer
	scriptSpeed = 100,							-- script tick rate in milisceconds
	pause = true,								-- pause or unpause bot
	isSetup = false,							-- check intial setup
	restMana = 0,								-- mana to rest and drink
	restHealth = 0,								-- health to rest and eat
	potionHealth = 0,							-- health to use healing potion
	potionMana = 0,								-- health to use mana potion
	grinderMessage = "",						-- messages
	findTargetDistance = 250,					-- distance to find new target
	lastTargetTargetedGUID = nil,				-- GUID of the last target targeted
	lastTargetTargeted = nil,					-- UNIT last target targeted
	enemyTarget = nil,							-- grinder current enemy target
	numberOfKills = 0,							-- number of kills per reload
	startingMoney = GetMoney(),					-- starting money
	currentMoney = GetMoney(),					-- current money
	totalGainedMoney = 0,						-- total gained money
	combatScriptRange = 30,						-- range to attack
	combatScriptReturn = "",					-- return message from combat script - unused
	gather = true,								-- use gatherer or not
	bagsAreFull = false,						-- are bags full or not
	lootTargets = true,							-- loot dead targets or not
	useVendor = true,							-- use vendor or not
	currentLevel = PlayerLevel(),				-- current level
	refillDrinkAndFoodAtVendor = false,			-- refill food and drink at vendor or not
	avoidTargets = true,						-- avoid targets moving around nav ( it is quite buggy)
	showingWindow = false,						-- show draw data when main menu is not collapsed
	useParanoia = true,							-- use paranoia or not
	useMount = false,							-- use mount or not
	autoSelectTalents = false,					-- auto select talents or not
	useFirstAid = false,						-- use first aid or not
	avoidTargetTimer = 0,						-- timer to run avoid target script to stop navigation from crashing
	usingGrinder2 = false,

	}

-- show grinder window
function grind2:window()

	-- end debug window
	EndWindow();

	-- new grinder window
	if NewWindow("Settings", 400, 400) then

		-- run the grind menu script
		grind2Menu:run();

		-- if we are not showing top bar then
		if not self.showingWindow then

			-- show top bar
			ShowBar();
		end

		-- window IS showing
		self.showingWindow = true;

	else
		
		-- else if we close the window then
		if self.showingWindow then

			-- hide the top bar
			HideBar();
		end

		-- window IS NOT showing / window is collapsed
		self.showingWindow = false;

	end
end

-- draw grinder data on screen
-- aggro circles, unit data, etc
function grind2:draw()

	-- grinder window IS NOT collapsed
	if self.showingWindow then

		-- run draw data on screen script
		grind2Draw:run();
	end
end

-- set script timer
function grind2:setTimer(ms)

	-- timer + tick rate
	grind2.timer = GetTimeEX() + grind2.scriptSpeed + ms;
end

-- rest function
function grind2:rest()
	
	local currentTime = GetTimeEX();

	-- check setup
	if not self.isSetup then

		-- run setup script
		grind2Setup:run();
	end

	if IsInCombat() then
		return false;
	end

	-- return for timer
	if grind2.timer > GetTimeEX() then
	
		return;
	end

	-- always run once
	self.needRest = true;

	-- run rest
	if (RunRestScript()) then

		self.message = "Resting...";

		-- player has no drinks and mana is lower than drink mana, reset variables so we don't blacklist targets and loot while standing and waiting around
		if IsStanding() and not IsInCombat() and not IsDrinking() and not IsEating() and not IsMoving() then
			if (PlayerMana() < grind2.restMana or PlayerHealth() < grind2.restHealth) then
				grind2DoLoot.blacklistLootTimer = currentTime + (grind2AdjustTimersMenu.blacklistLootTime * 1000);
				grind2RunCombatState.blacklistTargetTimer = currentTime * 2;
				grind2RunCombatState.blacklistTargetTimer2 = currentTime * 2;
			end
		end

		if not IsInCombat() and not IsCasting() and not IsChanneling() and not IsLooting() then
			-- drink water
			if not IsDrinking() and PlayerMana() <= grind2.restMana and not IsMoving() and not IsCasting() and not IsChanneling() then

				grind2:setTimer(grind2AdjustTimersMenu.restTimer);

				-- run drink water script
				if not grind2Water:drink() then
						
					grind2:setTimer(grind2AdjustTimersMenu.restTimer);
				end
			end

			-- eat food
			if not IsEating() and PlayerHealth() <= grind2.restHealth and not IsMoving() and not IsCasting() and not IsChanneling() then

				grind2:setTimer(grind2AdjustTimersMenu.restTimer);

				-- run eat food script
				if not grind2Food:eat() then
						
					grind2:setTimer(grind2AdjustTimersMenu.restTimer);
				end
			end
		end

		-- if we are drinking or eating then return
		if (IsDrinking() or IsEating()) and (not IsInCombat()) then

			-- return
			return true;
		end

		-- Stop moving if we are and need to rest
		if not IsInCombat() and IsMoving() and not Player():IsMovementDisabed() then

			-- stop moving and return
			StopMoving();

			return true;
		end

		-- dismount if mounted
		if IsMounted() then

			-- dismount
			DisMount();

			return true;
		end

		-- return if we need to keep resting
		if not IsInCombat() and ( (IsEating() and PlayerHealth() < 95) or (IsDrinking() and PlayerMana() < 95) ) then

			-- return
			return true;
		end
	
		-- if done resting then stand up
		if not IsStanding()

		-- if we are eating and drinking and full PlayerHealth() and PlayerMana()
		and (IsEating() and PlayerHealth() >= 95 and IsDrinking() and PlayerMana() >= 95) 

		-- or we are not drinking and are eating and PlayerHealth() is full
		or (not IsDrinking() and IsEating() and PlayerHealth() >= 95)

		-- or we are not eating and are drinking and PlayerMana() is full
		or (not IsEating() and IsDrinking() and PlayerMana() >= 95) then

			-- if we aren't already stadnding
			if (not IsStanding()) then

				-- stand up / jump
				JumpOrAscendStart();

				-- done with script
				return false;
			end
		end

	-- return, we need to rest
	return true;	
	end

	-- no rest needed
	self.needRest = false;

	return false;
end

function grind2:run()

	self.usingGrinder2 = true;

	-- run the setup if not already setup
	if not grind2Setup.isSetup then

		-- run setup script
		grind2Setup:run();
	end

	-- show grinder window
	grind2:window()

	-- TEMPORARY
	-- set rest variables in script_grind script and combat scripts
	tempSetRestVars:setRestVars()

-- set variables
	local currentTime = GetTimeEX();

-- handle swimming
	-- does not work... jumping in water counts as not swimming anymore
	--grind2HandleSwimming:run()

-- needs moved to checkdebuffs script...
	if Player():HasDebuff("Dominate Mind") or Player():HasDebuff("Mind Control") then
		return;
	end

	-- testing some things...
	--if _quest:run() then
	--	return;
	--end

--[[

--]]

-- do this stuff if not paused regardless of timer - each has their own conditions
	if not grind2.pause then

-- check unstuck
		grind2CheckUnstuck:run();

		if not Player():IsDead() then

-- avoid aggro ranges of targets that are not grinder target - when moving to grinder target, or through nav
-- don't do if we need to loot or under PlayerLevel() 6
-- don't use in combat, combat scripts handle add movements
			if currentTime > self.avoidTargetTimer and not IsIndoors() and not IsCasting() and not IsChanneling() and not IsInCombat() and PlayerLevel() >= 6 and self.avoidTargets and (grind2DoLoot.lootTarget == nil or not grind2.lootTargets or grind2.bagsAreFull or script_vendor.status >= 1) and (script_gather.nodeObj == nil or not grind2.gather) then
				if script_runner:avoidToAggro(4) then
					grind2MoveToTarget:GenerateNewPath();
					local _lx, _ly, _lz = Player():GetPosition();
					local _ix, _iy, _iz = GetPathPositionAtIndex(5, grind2MoveToTarget.lastnavIndex);
					--GeneratePath(_lx, _ly, _lz, script_aggro.tx, script_aggro.ty, script_aggro.tz);
					if Move(_ix, _iy, _iz) then

						if GetDistance3D(_lx, _ly, _lz, _ix, _iy, _iz) >= 2 then
							GeneratePath(_lx, _ly, _lz, _ix, _iy, _iz);
						end
					
						-- reset jump timer.. don't jump into aggro ranges
						grind2PreChecks.jump = false;

						-- reset nav position
						grind2MoveToTarget:resetNav();



					end

					grind2.grinderMessage = "Avoiding targets...";

					grind2MoveToTarget.GenerateANewPath = true;

					self.avoidTargetTimer = currentTime + 1000;

				return;
				end
			end

			
-- avoid elites...
-- if not on way to vendor and already running and not if we are mounted and running
			if script_vendor.status == 0 and not IsMounted() and grind2IsTargetValid.skipElites then 
				if (script_aggro:avoidElite()) then
					grind2:setTimer(1500);
					grind2PreChecks.jumpTimer = currentTime + 7500;
					grind2.grinderMessage = "Elite within range... running away...";
					grind2MoveToTarget.GenerateANewPath = true;
					return; 
				end
			end


-- flee combat if PlayerHealth() and PlayerMana() are low, or being attacking by too many targets
-- mainly for hardcore
			if not grind2.pause and IsInCombat() and grind2FleeCombat.fleeCombat then 
				if grind2SaveCoordinates.numberOfLocations >= 3 and PlayerLevel() >= 6 and not Player():IsDead() then
					if (grind2FleeCombat.healthToFlee >= PlayerHealth() and grind2FleeCombat.manaToFlee >= PlayerMana()) or (NumberTargetsAttackingPlayer() >= 2 and grind2FleeCombat.fleeWithAdds) then
						grind2FleeCombat:run();
						self.grinderMessage = "Fleeing combat";
						grind2.enemyTarget = nil;
						grind2.lastTargetTargeted = nil;
						grind2.lastTargetTargetedGUID = nil;
						script_grind.enemyObj = nil;
						if PlayerHasTarget() then
							ClearTarget();
						end
						if IsCasting() then
							SpellStopCasting();
						end
						return;
					end
				end
			else
				-- last saved location is 1st go to location
				grind2SaveCoordinates.currentGoToLocation = grind2SaveCoordinates.numberOfLocations - 1;
			end

-- face enemy target at all times
			if self.enemyTarget ~= 0 and self.enemyTarget ~= nil and PlayerHasTarget() and IsStanding() and not IsMoving() and not IsLooting() and Player():GetCasting() ~= 6487 then
				if self.enemyTarget:GetDistance() <= self.combatScriptRange + 1 or ( (IsCasting() or (IsChanneling() and IsInCombat())) and (PlayerHasTarget() or IsInCombat()) )  then
					if self.enemyTarget:IsInLineOfSight() and currentTime > self.faceTargetTimer then
						if not self.enemyTarget:FaceTarget() then
							self.faceTargetTimer = currentTime + grind2AdjustTimersMenu.faceTargetTimer;
						end
					end
				end
			end

		end	-- end of if not dead
	end	-- end of if not paused

--[[

--]]

-- player is stunned or confused of feared
	if (Player():IsStunned() or Player():IsConfused() or Player():IsFleeing()) then --and not HasSpell("Will of the Forsaken") then
		return;
	end

-- shadowmeld if we have it after feign death and wait for cooldown
	if IsSpellOnCD("Feign Death") and Player():HasBuff("Feign Death") and HasPet() and not GetPet():IsDead() and IsInCombat() then
		if not IsInCombat() then
			if HasSpell("Shadowmeld") and not IsSpellOnCD("Shadowmeld") then
				CastSpellByName("Shadowmeld");
			end
		end
	return;
	end

-- return for feign death if pet is not dead...
	if Player():HasBuff("Feign Death") or (Player():HasBuff("Shadowmeld") and IsSpellOnCD("Feign Death")) and HasPet() then
		if IsAnyTargetTargetingPet() then
			return;
		end
	end


--[[


--]]
		
-- return if paused or for any reason - return for any reason
	if grind2.timer > currentTime or grind2.pause or ( (IsChanneling() or IsCasting()) and not instantCastSpells:isSpellInstantCast()) then

		-- run combat helper to stop spell casting / check for clutch issues
		if IsInCombat() and not grind2.pause then
			script_combatHelper:run();
		end

		-- auto-loot pick pocket targets
		if IsStealth() and HasSpell("Pick Pocket") and IsLooting() and grind2.doLoot and not grind2.bagsAreFull and not AreBagsFull() then
			LootTarget();
			if StaticPopup1:IsVisible() then
				StaticPopup1Button1:Click();
			end
			grind2DoLoot.timer = currentTime + grind2AdjustTimersMenu.doLootTimer;
			return false;
		end		

		if not IsMoving() then
			grind2MoveToTarget.message = "idle...";
			-- reset jump timer if not moving
			grind2PreChecks.jumpTimer = currentTime + 7500;
		end

		-- reset variables
		if self.pause then
			self.grinderMessage = "";
			self.enemyTarget = nil;
			self.lastTargetTargeted = nil;
			self.lastTargetTargetedGUID = nil;
			script_grind.enemyObj = nil;
			grind2RunCombatState.blacklistTargetTimer = currentTime * 2;
			grind2RunCombatState.blacklistTargetTimer2 = currentTime * 2;
			grind2DoLoot.blacklistLootTimer = currentTime + (grind2AdjustTimersMenu.blacklistLootTime * 1000);
		end

		-- reset loot timer
		if IsInCombat() or IsEating() or IsDrinking() or not IsStanding() or IsCasting() or IsChanneling() then
			grind2DoLoot.blacklistLootTimer = currentTime + (grind2AdjustTimersMenu.blacklistLootTime * 1000);
		end

		-- count your money
		self.currentMoney = GetMoney();
		if self.startingMoney ~= self.currentMoney then
			self.totalGainedMoney = self.currentMoney - self.startingMoney;
		end
		 
	return;
	end

--[[

--]]


-- clear dead targets reset enemy target variable
	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
		if grind2.enemyTarget:IsDead() then
			grind2:clearTarget();
		end
	end

	--[[

--]]


-- ressurect
	if Player():IsDead() then
		if grind2Ressurect:run() then
			return;
		end
	end

--[[

--]]

-- check paranoia
	if self.useParanoia then
		if grind2Paranoia:checkAndDoParanoia() then
			return;
		end
	end

--[[

--]]

-- run rest functions
	if not IsInCombat() and not Player():IsDead() and not IsLooting() and not IsChanneling() and not IsCasting() and PlayerLevel() > 1 then
		if grind2:rest() then
			if IsEating() or IsDrinking() or IsCasting() or IsChanneling() then
				grind2RunCombatState.blacklistTargetTimer = currentTime * 2;
				grind2RunCombatState.blacklistTargetTimer2 = currentTime * 2;
			end
			self.grinderMessage = "Resting...";
			self.enemyTarget = nil;
			if PlayerHasTarget() then
				ClearTarget();
			end
			grind2:setTimer(grind2AdjustTimersMenu.restTimer);
			return;
		end
		if (IsEating() or IsDrinking()) and not IsInCombat() then
			return;
		end
	end

--[[

--]]

	



--[[

--]]

-- run grind2 pre checks before entering combat
-- auto talents / clear targets / loot / ressurect / 
	if grind2PreChecks:run() then
		return;
	end

	if not grind2PreChecks.jump then
		grind2PreChecks.jump = true;
	end


	if Player():IsDead() then
		return;
	end

-- return to loot - make sure to collect it
	if grind2DoLoot.lootTarget ~= nil and grind2.lootTargets then

		-- if we should loot, and can loot, and can hold the items
		if not grind2IsLootSafeToLoot:isAnyTargetNearLoot(grind2DoLoot.lootTarget) and not AreBagsFull() and not grind2.bagsAreFull then
			
			-- not if we are in combat, or we are in combat and our target hasn't been attacked yet
			if (not IsInCombat() or (IsInCombat() and PlayerHasTarget() and GetTarget():GetHealthPercentage() >= 99))
			
			-- or even if in combat but not if something is targeting me - and not if I have a target, or my target hasn't been attacked yet
			or (not IsAnyTargetTargetingPlayer() and (not PlayerHasTarget() or (PlayerHasTarget() and GetTarget():GetHealthPercentage() >= 99)))
			
			-- or we have a target and it's dead - we have loot target
			or (PlayerHasTarget() and GetTarget():IsDead())

			then
			
				return;
			end
		end
	end

--[[

--]]

-- assign a target
		if not IsEating() and not IsDrinking() and not IsLooting() and GetTimeEX() > self.obtainNewTargetTimer then
			if grind2HotSpot.hotSpotReached or IsInCombat() then 

				-- assign the target
				self.enemyTarget = grind2AssignATarget:run();

				if self.enemyTarget ~= nil and self.enemyTarget ~= 0 then
					self.enemyTarget:AutoAttack();
				end

				if self.enemyTarget == nil or self.enemyTarget == 0 then
					self.grinderMessage = "Assigning a target";
				end

				-- set grind script obtain target timer by adding current time + ratea adjusted in menu
				self.obtainNewTargetTimer = GetTimeEX() + grind2AdjustTimersMenu.obtainNewTargetTimer;
			end
		end

--[[

--]]

-- do some combat if we have a target
	if self.enemyTarget ~= 0 and self.enemyTarget ~= nil then

		-- run combat pre-checks
		-- double check enemyTarget, blacklisted, distance to grind zone, etc

		-- needs moved to combat helper
		if Player():HasDebuff("Crystalline Slumber") or (not IsInCombat() and HasPet() and GetPet():HasDebuff("Crystalline Slumber") ) then return; end

		-- move away from additional targets in combat
		if IsInCombat() and grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil then
			if grind2.enemyTarget:GetHealthPercentage() >= 25 and not script_checkDebuffs:hasDisabledMovement() then
				if script_checkAdds:checkAdds() then
					script_om:FORCEOM();
				return;
				end
			end
		end

		-- clear any target that is not enemy target when we are not in combat
		if not IsInCombat() and grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil then

			if PlayerHasTarget() and not IsCasting() and not IsChanneling() then

				if GetTarget():GetGUID() ~= grind2.enemyTarget:GetGUID() then

					ClearTarget();
				end
			end
		end

		-- if we are in combat and don't have a target attacking us then get target atacking us
		if IsInCombat() and grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil then
			
			if not PlayerHasTarget() and IsInCombat() and not IsCasting() and not IsChanneling() then

				if grind2IsTargetingMe:target(grind2.enemyTarget) or grind2IsTargetingPet:target(grind2.enemyTarget) then

					grind2.enemyTarget = grind2GetTargetAttackingMe:run();
				end
			end
		end

		-- clear blacklisted targets if they are not attacking me
		if PlayerHasTarget() and grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil then

			if (not grind2IsTargetingMe:target(grind2.enemyTarget) and not grind2IsTargetingPet:target(grind2.enemyTarget) and not grind2.enemyTarget:IsCasting()) and grind2Blacklisting:isTargetBlacklisted(grind2.enemyTarget:GetGUID()) then
			
				grind2.enemyTarget = nil;

				ClearTarget();

				return;
			end
		end

		-- double check loot
		if IsInCombat() and IsLooting() and currentTime > grind2DoLoot.timer then
			LootTarget();
			grind2:setTimer(grind2AdjustTimersMenu.doLootTimer);
			grind2DoLoot.timer = currentTime + grind2AdjustTimersMenu.doLootTimer;
		end

		-- return combat script message and run the combat script
		if self.enemyTarget ~= 0 and self.enemyTarget ~= nil then

			if self.enemyTarget:GetDistance() <= self.combatScriptRange then
				self.grinderMessage = "Running combat script | "..self.enemyTarget:GetUnitName().. " | "..math.floor(self.enemyTarget:GetDistance()).. " (yd)";
			end

			if not IsInCombat() then
				self.grinderMessage = "Target acquired | Moving to target | "..self.enemyTarget:GetUnitName().. " | "..math.floor(self.enemyTarget:GetDistance()).. " (yd)";
			end
	
			-- TEMPORARY set old combat script ranges
			self.combatScriptRange = script_grind.combatScriptRange;
	
			-- run the combat scripts
			grind2RunCombatState:run();

			-- don't run timer if player is moving...
			-- only if we have a valid enemy target
			if self.enemyTarget ~= nil and self.enemyTarget ~= 0 then
				-- not if we are moving... but make sure we have a target first and are actually in combat
				if (IsInCombat() and PlayerHasTarget() and not IsMoving())
				-- not if we need to move...
				or (self.enemyTarget:GetDistance() < self.combatScriptRange and self.enemyTarget:IsInLineOfSight()) then
					grind2.timer = GetTimeEX() + grind2AdjustTimersMenu.combatScriptTimer;
				end
			end
		end
	end

--[[


--]]


-- move to hotspot
	if not grind2HotSpot.hotSpotReached and not IsInCombat() and not IsCasting() and not IsChanneling() and not IsLooting() and IsStanding() then
	
		-- cheetah hunter
		if script_hunter.useCheetah and HasSpell("Aspect of the Cheetah") and not IsSpellOnCD("Aspect of the Cheetah") and not Player():HasBuff("Aspect of the Cheetah") and IsMoving() then
			if CastSpellByName("Aspect of the Cheetah") then
			end
		end
		-- cat form druid
		if not HasForm() and HasSpell("Cat Form") and not Player():HasBuff("Cat Form") and not IsSpellOnCD("Cat Form") and PlayerMana() >= 50 and IsMoving() then
			if CastSpellByName("Cat Form") then
			end
		end

		-- mount
		--

		if grind2SaveCoordinates.numberOfLocations >= 3 then

			grind2SaveCoordinates:moveToSavedLocation();

			return true;

		elseif not grind2HotSpot.hotspotReached or grind2SaveCoordinates.numberOfLocations < 3 then

			grind2HotSpot:moveToHotspot();

			return true;
		end
	end


-- end of grind run function
return true;
end




--[[


--]]



function grind2:clearTarget()

	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
		if grind2.enemyTarget ~= totemsList:isTargetTotem(grind2.enemyTarget) then
			-- + 1 to target killed
			grind2.numberOfKills = grind2.numberOfKills + 1;
		end
	end

	-- save coordinates to run out of combat and nav
	grind2SaveCoordinates:saveTargetsLocation(grind2.enemyTarget);

	-- reset grind enemy target
	grind2.enemyTarget = nil;

	-- reset grind last target
	grind2.lastTargetTargeted = nil;

	-- reset original grinder target - using old combat scripts
	script_grind.enemyObj = nil;

	-- send message
	grind2.grinderMessage = "Clearing dead/tapped target";

	-- reset new target timer
	grind2.obtainNewTargetTimer = GetTimeEX() + grind2AdjustTimersMenu.waitAfterTargetKilledTimer;

	-- set timer
	grind2:setTimer(grind2AdjustTimersMenu.waitAfterTargetKilledTimer);

end