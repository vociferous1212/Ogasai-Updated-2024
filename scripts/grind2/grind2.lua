grind2 = {

	grind2IncludeFiles = include("scripts\\grind2\\includeFiles.lua"),

	-- grind2 setup
	timer = GetTimeEX(),				-- script timer
	obtainNewTargetTimer = GetTimeEX(),	-- timer before bot gains a new target
	faceTargetTimer = GetTimeEX(),		-- timer to adjust face target time
	autoAttackTimer = GetTimeEX(),		-- timer for auto attack


	scriptSpeed = 150,					-- tick rate / script speed
	pause = true,						-- bot pause/unpause
	isSetup = false,					-- setup each reload

	restMana = 0,						-- mana to rest
	restHealth = 0,						-- health to rest
	shouldWeRest = false,				-- do we need to rest - mana/health conditions

	autoTalent = false,					-- auto set talent points

	grinderMessage = "",				-- debug messages from scripts
	showMessages = true,

	findTargetDistance = 150,			-- distance to find a new target to pull
	lastTargetTargetedGUID = nil,		-- last target targeted by GUID
	enemyTarget = nil,					-- current enemy target to attack

	combatScriptRange = 30,				-- combat range of scripts
	combatScriptReturn = "",
	showMessages = true,


	}

function grind2:message()

	-- color
	local r, g, b = 0, 0, 0;
	-- position
	local y, x, width = 120, 25, 370;
	local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition());
	if (onScreen) then

		DrawText(self.grinderMessage, x + 600, y - 10, 255, 255, 255);

		-- combat messages
		--DrawText(script_druid.message, x + 600, y - 25, 255, 255, 255);
	end

end


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

function grind2:setup()

	if not self.isSetup then

		-- set all timers to current time at each reload
		grind2.timer = GetTimeEX();
		grind2.obtainNewTargetTimer = GetTimeEX();

		-- setup draw on screen folder
		-- nothing here!

		-- setup helper folder
		grind2Bandage:setup();
		grind2Food:setup();
		grind2Mounts:setup();
		grind2OpenGates:setup();
		grind2Potions:setup();
		grind2Water:setup();


		-- setup menu folder
		grind2Menu:setup()


		-- setup talents folder
		grind2SelectTalents:setup()




		if GetMyClass() == "WARRIOR" or GetMyClass() == "ROGUE" then
			grind2.restMana = 0;
		end

		if GetLocalPlayer():GetLevel() < 6 then
			grind2SafePull.skipSafePull = true;
		end


		
	end


	self.isSetup = true;
end


--[[
	
		RUN GRINDER

]]

function grind2:run()

	if not self.isSetup then

		grind2:setup();
	end

-- show grinder messages
	if self.showMessages then
		grind2:message()
	end

-- TEMPORARY
tempSetRestVars:setRestVars()

-- set variables
	local currentTime = GetTimeEX();
	
	local player = GetLocalPlayer();

-- show the grinder window
	grind2:window()

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
				self.faceTargetTimer = currentTime + 200;
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
	if not IsAnyTargetTargetingPlayer() then

		if grind2DoLoot:run() then

			-- wait time between each action - each time doLoot script is ran
			grind2:setTimer(500);

			return;
		end
	end

-- run rest functions
	if not IsInCombat() then
		if grind2Rest:run() then

			self.grinderMessage = "Resting...";

			grind2:setTimer(750);

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
			grind2:setTimer(800);
		end
	end

-- assign a target
	if not IsCasting() and not IsChanneling() and not IsEating() and not IsDrinking() and not IsLooting() and currentTime > self.obtainNewTargetTimer then 

		self.enemyTarget = grind2AssignATarget:run();

		-- assigning a target message
		if self.enemyTarget == nil or self.enemyTarget == 0 then
			self.grinderMessage = "Assigning a target";
		end

		self.obtainNewTargetTimer = currentTime + 750;
	end

-- do some combat if we have a target
	if self.enemyTarget ~= 0 and self.enemyTarget ~= nil then

		-- target obtained message
		if not IsInCombat() then
			self.grinderMessage = "Target acquired | Moving to target - "..self.enemyTarget:GetUnitName().. " | "..math.floor(self.enemyTarget:GetDistance()).. " (yd)";
		end

		-- TEMPORARY
		self.combatScriptRange = script_grind.combatScriptRange;


		-- get target position
		local xx, yy, zz = self.enemyTarget:GetPosition();
		local localObj = GetLocalPlayer();
		local x, y, z = player:GetPosition();

		-- if target is not dead and we can attack it
		if self.enemyTarget:CanAttack() and not self.enemyTarget:IsDead() then

			-- auto attack / target the target
			if not IsAutoCasting("Attack") and not IsStealth() and currentTime > self.autoAttackTimer then
				self.enemyTarget:AutoAttack();
				self.autoAttackTimer = currentTime + 1500;
			end
			if IsStealth() then
				self.enemyTarget:unitInteract();
			end

			-- move to target
			--if x ~= nil and xx ~= nil then
			--	if self.enemyTarget:GetDistance() > self.combatScriptRange or not self.enemyTarget:IsInLineOfSight() then
			--		grind2MoveToTarget:run(localObj, xx, yy, zz);
			--	end
			--end

			-- TEMPORARY
			if script_grind.combatError == 3 or self.combatScriptReturn == "MOVE TO TARGET" then
				grind2MoveToTarget:run(localObj, xx, yy, zz);
				self.waitTimer = GetTimeEX() + 100;
			end

			-- last target targeted
			if self.enemyTarget ~= nil and self.enemyTarget ~= 0 then 
				self.lastTargetTargetedGUID = self.enemyTarget:GetGUID();
			end

			-- TEMPORARY
			if IsInCombat() then
				script_combatHelper:run()
			end

			-- TEMPORARY
			script_grind.combatError = RunCombatScript(self.enemyTarget:GetGUID());

			-- run currently loaded combat script
			--RunCombatScript(self.enemyTarget:GetGUID());

			if self.enemyTarget:GetDistance() <= self.combatScriptRange then

				self.grinderMessage = "Running combat script | "..self.enemyTarget:GetUnitName().. " | "..math.floor(self.enemyTarget:GetDistance()).. " (yd)";
			end

		end
	end

	-- end of run function
end
