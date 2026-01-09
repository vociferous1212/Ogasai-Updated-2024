grind2 = {

	grind2IncludeFiles = include("scripts\\grind2\\includeFiles.lua"),

	timer = GetTimeEX(), -- script timer
	obtainNewTargetTimer = GetTimeEX(), -- timer before bot gains a new target
	faceTargetTimer = GetTimeEX(), -- timer to adjust face target time

	scriptSpeed = 100, -- tick rate / script speed
	pause = true, -- bot pause/unpause
	isSetup = false, -- setup each reload

	restMana = 0, -- mana to rest
	restHealth = 0, -- health to rest
	shouldWeRest = false, -- do we need to rest - mana/health conditions

	grinderMessage = "", -- debug messages from scripts

	findTargetDistance = 250, -- distance to find a new target to pull
	lastTargetTargetedGUID = nil, -- last target targeted by GUID
	enemyTarget = nil, -- current enemy target to attack

	numberOfKills = 0,
	startingMoney = GetMoney(),
	obtainedMoney = 0,

	combatScriptRange = 30, -- combat range of scripts
	combatScriptReturn = "",
	gather = true



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

	local pet = GetPet();

	local petHealth = 0;

	local petFocus = 0;

	if pet ~= 0 and pet ~= nil then
	
		petHealth = pet:GetHealthPercentage();

		petFocus = pet:GetFocusPercentage();
	end

-- check unstuck script
	grind2CheckUnstuck:run()

-- return if paused or for any reason
	if self.timer > currentTime or self.pause or IsCasting() or IsChanneling() then

		-- auto-loot pick pocket targets
		if IsStealth() and HasSpell("Pick Pocket") and IsLooting() and currentTime > grind2DoLoot.lootTimer then
			LootTarget();
			if StaticPopup1:IsVisible() then
				StaticPopup1Button1:Click();
			end
			grind2DoLoot.lootTimer = currentTime + 750;
		end

		-- show message for loot target - placed here due to timer
		if not IsAnyTargetTargetingPlayer() and not IsInCombat() then
			if grind2DoLoot.lootTarget ~= nil and grind2DoLoot.lootTarget ~= 0 then
				self.grinderMessage = "Moving to loot target - "..grind2DoLoot.lootTarget:GetUnitName().." | "..math.floor(grind2DoLoot.lootTarget:GetDistance()).." (yd)";
			end
		end

		-- reset variables
		if self.pause then
			self.grinderMessage = "";
			self.enemyTarget = nil;
			self.lastTargetTargetedGUID = nil;
			grind2RunCombatState.blacklistTargetTimer = currentTime * 2;
		end

		-- face enemy target at all times
		if not self.pause and self.enemyTarget ~= 0 and self.enemyTarget ~= nil and PlayerHasTarget() and not IsMoving() then
			if self.enemyTarget:GetDistance() - 1 <= self.combatScriptRange and self.enemyTarget:IsInLineOfSight() and currentTime > self.faceTargetTimer then
				self.enemyTarget:FaceTarget();
				self.faceTargetTimer = currentTime + grind2AdjustTimersMenu.faceTargetTimer;
			end
		end
		
	return;
	end

-- run grind2 pre checks before entering combat
-- auto talents / clear targets / loot / 
	if grind2PreChecks:run() then

		return;
	end

-- run gatherer
	if self.gather and not IsAnyTargetTargetingPlayer() then

		-- run gatherer
		if script_gatherRun:gather() then

			grind2:setTimer(2500);

			return;
		end
	end

-- run rest functions
	if not IsInCombat() then

		if grind2RunRestState:run() then

			if IsEating() or IsDrinking() or IsCasting() or IsChanneling() then
				grind2RunCombatState.blacklistTargetTimer = GetTimeEX() * 2;
			end

			self.grinderMessage = "Resting...";

			-- timer between actions / leaving and entering rest state
			grind2:setTimer(grind2AdjustTimersMenu.restTimer);

			return;
		end
	end


-- assign a target
	if not IsCasting() and not IsChanneling() and not IsEating() and not IsDrinking() and not IsLooting() and currentTime > self.obtainNewTargetTimer then 

		self.enemyTarget = grind2AssignATarget:run();

		-- assigning a target message
		if self.enemyTarget == nil or self.enemyTarget == 0 then
			self.grinderMessage = "Assigning a target";
		end

		self.obtainNewTargetTimer = currentTime + grind2AdjustTimersMenu.obtainNewTargetTimer;
	end

-- reaffirm enemy target - we have a good target
	if grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil then

		if not PlayerHasTarget() then

			grind2.enemyTarget:AutoAttack();
		end
	end


-- do some combat if we have a target
	if self.enemyTarget ~= 0 and self.enemyTarget ~= nil then

		-- run combat pre-checks
		grind2PreCombatChecks:run()

		-- double check loot
		if IsInCombat() and IsLooting() then LootTarget(); end

		-- return combat script message
		if self.enemyTarget ~= 0 and self.enemyTarget ~= nil then

			if self.enemyTarget:GetDistance() <= self.combatScriptRange then
				
				self.grinderMessage = "Running combat script | "..self.enemyTarget:GetUnitName().. " | "..math.floor(self.enemyTarget:GetDistance()).. " (yd)";
			end

			-- target obtained message
			if not IsInCombat() then

				self.grinderMessage = "Target acquired | Moving to target | "..self.enemyTarget:GetUnitName().. " | "..math.floor(self.enemyTarget:GetDistance()).. " (yd)";
			end
	

			-- TEMPORARY
			self.combatScriptRange = script_grind.combatScriptRange;

			-- run the combat scripts
			grind2RunCombatState:run();
		end
	end
end
