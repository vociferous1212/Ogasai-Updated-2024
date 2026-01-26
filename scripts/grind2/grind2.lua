grind2 = {

	grind2IncludeFiles = include("scripts\\grind2\\includeFiles.lua"),
	grinderIncludeFiles2 = include("scripts\\grind2\\includeFiles2.lua"),
	timer = GetTimeEX(),
	obtainNewTargetTimer = GetTimeEX(),
	faceTargetTimer = GetTimeEX(),
	scriptSpeed = 100,
	pause = true,
	isSetup = false,
	restMana = 0,
	restHealth = 0,
	shouldWeRest = false,
	grinderMessage = "",
	findTargetDistance = 250,
	lastTargetTargetedGUID = nil,
	lastTargetTargeted = nil,
	enemyTarget = nil,
	numberOfKills = 0,
	startingMoney = GetMoney(),
	currentMoney = GetMoney(),
	totalGainedMoney = 0,
	combatScriptRange = 30,
	combatScriptReturn = "",
	gather = true,
	bagsAreFull = false,
	lootTargets = true,
	useVendor = true,
	currentLevel = GetLocalPlayer():GetLevel(),
	useVendor = true,
	refillDrinkAndFoodAtVendor = false

	}

function grind2:window()

	EndWindow();

	if NewWindow("Grinder2", 400, 400) then

		grind2Menu:run();
	end
end

function grind2:draw()

	grind2Draw:run();
end

function grind2:setTimer(ms)

	grind2.timer = GetTimeEX() + grind2.scriptSpeed + ms;
end

function grind2:rest()

	grind2RunRestState:run();
end


function grind2:run()

-- setup
	if not grind2Setup.isSetup then
		grind2Setup:run();
	end

-- show the grinder window
	grind2:window()

-- TEMPORARY
	tempSetRestVars:setRestVars()

-- set variables
	local currentTime = GetTimeEX();
	local player = GetLocalPlayer();
	local playerHealth = player:GetHealthPercentage();
	local playerMana = player:GetManaPercentage();
	local targetHealth = 0;
	local targetMana = 0;
	if self.enemyTarget ~= 0 and self.enemyTarget ~= nil then
		targetHealth = self.enemyTarget:GetHealthPercentage();
		targetMana = self.enemyTarget:GetManaPercentage();
	end

-- check unstuck script
	grind2CheckUnstuck:run();

-- avoid elites...
	if not player:IsDead() and script_vendor.status == 0 and not IsMounted() and not grind2.pause then 
		if (script_aggro:avoidElite()) then
			grind2.grinderMessage = "Elite within range... running away...";
			return; 
		end
	end

-- flee combat if we are about to die - skip all timers
	if grind2FleeCombat.fleeCombat and grind2SaveCoordinates.numberOfLocations >= 3 and player:GetLevel() >= 6 then
		if not grind2.pause and IsInCombat() and (grind2FleeCombat.healthToFlee >= playerHealth or (NumberTargetsAttackingPlayer() >= 2 and grind2FleeCombat.fleeWithAdds) ) then
			grind2FleeCombat:run();
			self.grinderMessage = "Fleeing combat";
			grind2.enemyTarget = nil;
			if PlayerHasTarget() then ClearTarget(); end
			return;
		else
			grind2SaveCoordinates.currentGoToLocation = grind2SaveCoordinates.numberOfLocations - 1;
		end
	end

	-- face enemy target at all times
	if not grind2.pause then
		if self.enemyTarget ~= 0 and self.enemyTarget ~= nil and PlayerHasTarget() and not IsMoving() and not IsLooting() and player:GetCasting() ~= 6487 then
			if self.enemyTarget:GetDistance() <= self.combatScriptRange + 1 and self.enemyTarget:IsInLineOfSight() and currentTime > self.faceTargetTimer then
				self.enemyTarget:FaceTarget();
				self.faceTargetTimer = currentTime + grind2AdjustTimersMenu.faceTargetTimer;
			end
		end
	end

-- return if paused or for any reason
	if self.timer > currentTime or grind2.pause or IsCasting() or IsChanneling() then

		-- TEMPORARY - old combat helper to make combat scripts run somewhat decent
		if IsInCombat() and not grind2.pause then
			script_combatHelper:run()
		end

		-- auto-loot pick pocket targets
		if IsStealth() and HasSpell("Pick Pocket") and IsLooting() and currentTime > grind2DoLoot.lootTimer and grind2.doLoot and not grind2.bagsAreFull and not AreBagsFull() then
			LootTarget();
			if StaticPopup1:IsVisible() then
				StaticPopup1Button1:Click();
			end
			grind2DoLoot.lootTimer = currentTime + grind2AdjustTimersMenu.doLootTimer;
			return false;
		end		

		-- show message for navigation
		if not IsMoving() then grind2MoveToTarget.message = "idle..."; end

		-- reset variables
		if self.pause then
			self.grinderMessage = "";
			self.enemyTarget = nil;
			grind2RunCombatState.blacklistTargetTimer = currentTime * 2;
			grind2DoLoot.blacklistLootTimer = GetTimeEX() + (grind2AdjustTimersMenu.blacklistLootTime * 1000);

		end

		if IsInCombat() or IsEating() or IsDrinking() or not IsStanding() then
			grind2DoLoot.blacklistLootTimer = GetTimeEX() + (grind2AdjustTimersMenu.blacklistLootTime * 1000);
		end

		-- reset new target timer if casting
		if IsCasting() or IsChanneling() then
			self.obtainNewTargetTimer = currentTime + grind2AdjustTimersMenu.obtainNewTargetTimer;
		end

		-- count your money
		self.currentMoney = GetMoney();
		if self.startingMoney ~= self.currentMoney then
			self.totalGainedMoney = self.currentMoney - self.startingMoney;
		end
		 
	return;
	end

-- check paranoia
	grind2Paranoia:checkAndDoParanoia();

-- run grind2 pre checks before entering combat
-- auto talents / clear targets / loot / ressurect / 
	if grind2PreChecks:run() then
		return;
	end

-- run rest functions
	if not IsInCombat() and not player:IsDead() then
		if grind2RunRestState:run() then
			if IsEating() or IsDrinking() or IsCasting() or IsChanneling() then
				grind2RunCombatState.blacklistTargetTimer = GetTimeEX() * 2;
			end
			self.grinderMessage = "Resting...";
			self.enemyTarget = nil;
			if PlayerHasTarget() then ClearTarget(); end
			grind2:setTimer(grind2AdjustTimersMenu.restTimer);
			return;
		end
	end

-- run gatherer
	if self.gather and not IsAnyTargetTargetingPlayer() and not IsInCombat() and not grind2.bagsAreFull and not AreBagsFull() then

		-- run gatherer
		if script_gatherRun:gather() then
			script_gatherRun:gather();
			self.grinderMessage = "Gathering...";
			if IsLooting() and not IsMoving() then
				grind2:setTimer(500);
			end
			return;
		end
	end

-- assign a target
	if not IsCasting() and not IsChanneling() and not IsEating() and not IsDrinking() and not IsLooting() and currentTime > self.obtainNewTargetTimer and (grind2HotSpot.hotSpotReached or IsInCombat()) then 

		-- assign the target
		self.enemyTarget = grind2AssignATarget:run();

		if self.enemyTarget ~= nil and self.enemyTarget ~= 0 then
			self.enemyTarget:AutoAttack();
		end

		-- assigning a target message
		if self.enemyTarget == nil or self.enemyTarget == 0 then
			self.grinderMessage = "Assigning a target";
		end

		-- set grind script obtain target timer by adding current time + ratea adjusted in menu
		self.obtainNewTargetTimer = currentTime + grind2AdjustTimersMenu.obtainNewTargetTimer;
	end

-- do some combat if we have a target
	if self.enemyTarget ~= 0 and self.enemyTarget ~= nil then

		-- run combat pre-checks
		-- double check enemyTarget, blacklisted, distance to grind zone, etc
		grind2PreCombatChecks:run();

		-- double check loot
		if IsInCombat() and IsLooting() then
			LootTarget();
			grind2:setTimer(grind2AdjustTimersMenu.doLootTimer);
			return false;
		end

		-- return combat script message and run the combat script
		if self.enemyTarget ~= 0 and self.enemyTarget ~= nil then

			-- show combat messages - can be moved with rest of messages to messages script
			if self.enemyTarget:GetDistance() <= self.combatScriptRange then
				self.grinderMessage = "Running combat script | "..self.enemyTarget:GetUnitName().. " | "..math.floor(self.enemyTarget:GetDistance()).. " (yd)";
			end

			-- target obtained message
			if not IsInCombat() then
				self.grinderMessage = "Target acquired | Moving to target | "..self.enemyTarget:GetUnitName().. " | "..math.floor(self.enemyTarget:GetDistance()).. " (yd)";
			end
	
			-- TEMPORARY set old combat script ranges
			self.combatScriptRange = script_grind.combatScriptRange;
	
			-- run the combat scripts
			grind2RunCombatState:run();
		end
	end
return;
end
