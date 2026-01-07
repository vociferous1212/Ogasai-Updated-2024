grind2 = {

	grind2IncludeFiles = include("scripts\\grind2\\includeFiles.lua"),

	-- grind2 setup
	timer = GetTimeEX(),				-- script timer
	obtainNewTargetTimer = GetTimeEX(),	-- timer before bot gains a new target
	faceTargetTimer = GetTimeEX(),		-- timer to adjust face target time

	scriptSpeed = 150,					-- tick rate / script speed
	pause = true,						-- bot pause/unpause
	isSetup = false,					-- setup each reload

	restMana = 0,						-- mana to rest
	restHealth = 0,						-- health to rest
	shouldWeRest = false,				-- do we need to rest - mana/health conditions

	autoTalent = false,					-- auto set talent points

	grinderMessage = "",				-- debug messages from scripts

	findTargetDistance = 150,			-- distance to find a new target to pull
	lastTargetTargetedGUID = nil,		-- last target targeted by GUID
	enemyTarget = nil,					-- current enemy target to attack

	combatScriptRange = 30,				-- combat range of scripts
	combatScriptReturn = "",


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

function grind2:setScriptSpeed(ms)

	grind2.scriptSpeed = GetTimeEX() + ms;
end

function grind2:setTimer(ms)

	grind2.timer = GetTimeEX() + grind2.scriptSpeed + ms;
end

function grind2:rest()

	grind2Rest:run();
end




function grind2:run()

-- setup
	if not grind2Setup.isSetup then

		grind2Setup:run();
	end

-- show the grinder window
	grind2:window()

-- show grinder messages
	if grind2DisplayOptions.drawMessages then

		grind2Messages:run()
	end

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

-- return if paused or for any reason
	if self.timer > currentTime or self.pause or IsCasting() or IsChanneling() then

		-- show message for loot target
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
		end

		-- face enemy target at all times
		if not self.pause and self.enemyTarget ~= 0 and self.enemyTarget ~= nil and PlayerHasTarget() then
			if self.enemyTarget:GetDistance() - 1 <= self.combatScriptRange
			and self.enemyTarget:IsInLineOfSight() and currentTime > self.faceTargetTimer then
				self.enemyTarget:FaceTarget();
				self.faceTargetTimer = currentTime + grind2AdjustTimers.faceTargetTimer;
			end
		end
		
		return;
	end

-- Check: Spend talent points
	if not IsInCombat() and not player:IsDead() and self.autoTalent then

		if script_talent:learnTalents() then

			self.grinderMessage = "Checking/learning talent: " .. script_talent:getNextTalentName();

			grind2:setTimer(150);

			return;
		end
	end

-- do loot
	if not IsAnyTargetTargetingPlayer() and grind2DoLoot:run() then

		-- wait time between each action - each time doLoot script is ran
		grind2:setTimer(grind2AdjustTimers.doLootTimer);

		return;
	end

-- run rest functions
	if not IsInCombat() then
		if grind2Rest:run() then

			self.grinderMessage = "Resting...";

			grind2:setTimer(grind2AdjustTimers.restTimer);

			return;
		end
	end

--[[ 

		COMBAT PHASE

]]

-- clear dead targets reset enemy target variable
	if self.enemyTarget ~= nil and self.enemyTarget ~= 0 then
		if self.enemyTarget:IsDead() then
			self.enemyTarget = nil;
			self.grinderMessage = "Clearing dead/tapped target";
			grind2:setTimer(grind2AdjustTimers.waitAfterTargetKilledTimer);
		end
	end

-- assign a target
	if not IsCasting() and not IsChanneling() and not IsEating() and not IsDrinking() and not IsLooting() and currentTime > self.obtainNewTargetTimer then 

		self.enemyTarget = grind2AssignATarget:run();

		-- assigning a target message
		if self.enemyTarget == nil or self.enemyTarget == 0 then
			self.grinderMessage = "Assigning a target";
		end

		self.obtainNewTargetTimer = currentTime + grind2AdjustTimers.obtainNewTargetTimer;
	end

-- do some combat if we have a target
	if self.enemyTarget ~= 0 and self.enemyTarget ~= nil then

		-- target obtained message
		if not IsInCombat() then
			self.grinderMessage = "Target acquired | Moving to target | "..self.enemyTarget:GetUnitName().. " | "..math.floor(self.enemyTarget:GetDistance()).. " (yd)";
		end

		-- TEMPORARY
		self.combatScriptRange = script_grind.combatScriptRange;

			if IsInCombat() and IsLooting() then

				LootTarget();
			end


			grind2RunCombatState:run();
		
			if self.enemyTarget:GetDistance() <= self.combatScriptRange then

				self.grinderMessage = "Running combat script | "..self.enemyTarget:GetUnitName().. " | "..math.floor(self.enemyTarget:GetDistance()).. " (yd)";
			end

	
	end



-- end of run function
end
