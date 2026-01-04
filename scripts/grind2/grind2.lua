grind2 = {

	-- TEMPORARY
	grinderIncluded = include("scripts\\script_grind.lua"),
	combatHelperIncluded = include("scripts\\script_combatHelper.lua"),

	-- combat scripts can be moved to menu file
	druidMenu = include("scripts\\combat\\druid\\script_druidEX.lua"),
	mageMenu = include("scripts\\combat\\mage\\script_mage.lua"),

	-- main grind2 folder required for bot to run - dll...
	grinder2Draw = include("scripts\\grind2\\grind2Draw.lua"),
	grinder2Rest = include("scripts\\grind2\\grind2Rest.lua"),

	-- loot folder
	grinder2CanSkinTarget = include("scripts\\grind2\\grind2Loot\\grind2CanSkinTarget.lua"),
	grinder2DoLoot = include("scripts\\grind2\\grind2Loot\\grind2DoLoot.lua"),
	grinder2FindLoot = include("scripts\\grind2\\grind2Loot\\grind2FindLoot.lua"),
	grinder2FindSkinTarget = include("scripts\\grind2\\grind2Loot\\grind2FindSkinTarget.lua"),

	-- targets folder
	grinder2AssignATarget = include("scripts\\grind2\\grind2Targets\\grind2AssignATarget.lua"),
	grinder2Blacklisting = include("scripts\\grind2\\grind2Targets\\grind2Blacklisting.lua"),
	grinder2IsTargetingGroup = include("scripts\\grind2\\grind2Targets\\grind2IsTargetingGroup.lua"),
	grinder2IsTargetingMe = include("scripts\\grind2\\grind2Targets\\grind2IsTargetingMe.lua"),
	grinder2IsTargetingPet = include("scripts\\grind2\\grind2Targets\\grind2IsTargetingPet.lua"),
	grinder2IsTargetValid = include("scripts\\grind2\\grind2Targets\\grind2IsTargetValid.lua"),
	grinder2SafePull = include("scripts\\grind2\\grind2Targets\\grind2SafePull.lua"),

	-- helper folder
	grinder2Bandage =	include("scripts\\grind2\\grind2Helper\\grind2Bandage.lua"),
	grinder2Food =		include("scripts\\grind2\\grind2Helper\\grind2Food.lua"),
	grinder2Mounts =	include("scripts\\grind2\\grind2Helper\\grind2Mounts.lua"),
	grinder2OpenGates = include("scripts\\grind2\\grind2Helper\\grind2OpenGates.lua"),
	grinder2Potions =	include("scripts\\grind2\\grind2Helper\\grind2Potions.lua"),
	grinder2Water =		include("scripts\\grind2\\grind2Helper\\grind2Water.lua"),

	-- draw on screen folder drawOnScreen
	grinder2DrawAggroCircles =	include("scripts\\grind2\\grind2DrawOnScreen\\grind2DrawAggroCircles.lua"),
	grinder2SelectDrawTargets = include("scripts\\grind2\\grind2DrawOnScreen\\grind2SelectDrawTargets.lua"),
	grinder2DrawUnitData =		include("scripts\\grind2\\grind2DrawOnScreen\\grind2DrawUnitData.lua"),
	grinder2DrawScreenData =	include("scripts\\grind2\\grind2DrawOnScreen\\grind2DrawScreenData.lua"),

	-- menu folder
	grinder2Menu =				include("scripts\\grind2\\grind2Menu\\grind2Menu.lua"),
	grinder2DisplayOptions =	include("scripts\\grind2\\grind2Menu\\grind2DisplayOptions.lua"),
	grinder2ShowCombatMenu =	include("scripts\\grind2\\grind2Menu\\grind2ShowCombatMenu.lua"),
	grinder2TargetMenu =		include("scripts\\grind2\\grind2Menu\\grind2TargetMenu.lua"),
	grinder2NavMenu =			include("scripts\\grind2\\grind2Menu\\grind2NavMenu.lua"),

	-- nav folder
	grinder2Nav =				include("scripts\\grind2\\grind2Nav\\grind2Nav.lua"),
	grinder2MoveToTarget =		include("scripts\\grind2\\grind2Nav\\grind2MoveToTarget.lua"),

	-- talents folder
	--grinder2SelectTalents =				include("scripts\\grind2\\grind2Talents\\grind2SelectTalents.lua"),
	--grinder2CheckSpentTalentPoints =	include("scripts\\grind2\\grind2Talents\\grind2CheckSpentTalentPoints.lua"),
	


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

	grinderMessage = "",				-- messages from scripts

	findTargetDistance = 150,			-- distance to find a new target to pull
	combatScriptRange = 30,				-- combat range of scripts
	lastTargetTargetedGUID = nil,		-- last target targeted by GUID
	enemyTarget = nil,					-- current enemy target to attack



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

-- TEMPORARY
grind2:setRestVars();

-- set variables
	local currentTime = GetTimeEX();
	
	local player = GetLocalPlayer();

-- show the grinder window
	grind2:window()

-- return if paused or for any reason
	if self.timer > currentTime or self.pause or IsCasting() or IsChanneling() then

	

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

			self.message = "Checking/learning talent: " .. script_talent:getNextTalentName();

			grind2:setTimer(150);

			return;
		end
	end

-- do loot
	if not IsAnyTargetTargetingPlayer() then

		if grind2DoLoot:run() then

			grind2:setTimer(500);

			return;
		end
	end

-- run combat script rest functions
	if not IsInCombat() then
		if grind2Rest:run() then

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
			grind2:setTimer(800);
		end
	end

-- assign a target
	if not IsCasting() and not IsChanneling() and not IsEating() and not IsDrinking() and not IsLooting() and currentTime > self.obtainNewTargetTimer then 

		self.enemyTarget = grind2AssignATarget:run();

		self.obtainNewTargetTimer = currentTime + 750;
	end

-- do some combat if we have a target
	if self.enemyTarget ~= 0 and self.enemyTarget ~= nil then

		-- TEMPORARY
		self.combatScriptRange = script_grind.combatScriptRange;


		-- get target position
		local xx, yy, zz = self.enemyTarget:GetPosition();
		local localObj = GetLocalPlayer();
		local x, y, z = player:GetPosition();

		-- if target is not dead and we can attack it
		if self.enemyTarget:CanAttack() and not self.enemyTarget:IsDead() then

			-- auto attack / target the target
			if not IsAutoCasting("Attack") and not IsStealth() then
				self.enemyTarget:AutoAttack();
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
			if script_grind.combatError == 3 then
				grind2MoveToTarget:run(localObj, xx, yy, zz);
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


		end
	end

-- end of run function
end

-- temp function to set mana and health
function grind2:setRestVars()

	if GetMyClass() == "DRUID" then
		grind2.restMana = script_druid.drinkMana;
		grind2.restHealth = script_druid.eatHealth;
	elseif GetMyClass() == "HUNTER" then
		grind2.restMana = script_hunter.drinkMana;
		grind2.restHealth = script_hunter.eatHealth;
	elseif GetMyClass() == "MAGE" then
		grind2.restMana = script_mage.drinkMana;
		grind2.restHealth = script_mage.eatHealth;
	elseif GetMyClass() == "PALADIN" then
		grind2.restMana = script_paladin.drinkMana;
		grind2.restHealth = script_paladin.eatHealth;
	elseif GetMyClass() == "SHAMAN" then
		grind2.restMana = script_shaman.drinkMana;
		grind2.restHealth = script_shaman.eatHealth;
	elseif GetMyClass() == "WARLOCK" then
		grind2.restMana = script_warlock.drinkMana;
		grind2.restHealth = script_warlock.eatHealth;
	elseif GetMyClass() == "WARRIOR" then
		grind2.restHealth = script_warrior.eatHealth;
	elseif GetMyClass() == "ROGUE" then
		grind2.restHealth = script_rogue.eatHealth;
	elseif GetMyClass() == "PRIEST" then
		grind2.restMana = script_priest.drinkMana;
		grind2.restHealth = script_priest.eatHealth;
	end
end