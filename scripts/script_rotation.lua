script_rotation = {
	useMount = false,
	disMountRange = 25,
	waitTimer = GetTimeEX(),
	tickRate = 50,
	combatError = 0,
	message = 'Rotation',
	enemyObj = 0,
	usingRotation = false,
	useExpChecker = true,
	aggroLoaded = include("scripts\\script_aggro.lua"),
	gatherLoaded = include("scripts\\gather\\script_gather.lua"),
	navFunctionsLoaded = include("scripts\\nav\\script_nav.lua"),
	navFunctionsEXLoaded = include("scripts\\nav\\script_navEX.lua"),
	includeNavEXCombat 	= include("scripts\\nav\\script_navEXCombat.lua"),
	helperLoaded = include("scripts\\script_helper.lua"),
	radarLoaded = include("scripts\\script_radar.lua"),
	menuLoaded = include("scripts\\menu\\script_rotationMenu.lua"),
	expExtra = include("scripts\\script_expChecker.lua"),
	rotationEXLoaded = include("scripts\\script_rotationEX.lua"),

	isSetup = false,
	pullDistance = 150,
	showClassOptions = true,
	aggroRangeTank = 50,
	adjustTickRate = false,
	lootTargets = true,
}

function script_rotation:draw()
	script_rotationEX:draw();
end

function script_rotation:setup()
	script_helper:setup();
	script_gather:setup();
	script_grind:setup();
	script_grind.findLootDistance = 35;
	script_grind.lootDistance = 4;
	script_druid.meleeDistance = 5; script_warrior.meleeDistance = 5; script_shaman.meleeDistance = 5; script_rogue.meleeDistance = 5; script_paladin.meleeDistance = 5;
	script_hunter.meleeDistance = 5;
	script_druid.healthToShift = 60;
	script_paladin.holyLightHealth = 65;
	self.isSetup = true;
end

function script_rotation:window()
	EndWindow();
	if(NewWindow("Rotation", 320, 300)) then
		script_rotationMenu:menu();
	end
	if (self.useExpChecker) then
		script_expChecker:menu();
	end
end

function script_rotation:run()

	localObj = GetLocalPlayer();

	if script_rotationMenu.pause then
		self.usingRotation = false;
	else
		self.usingRotation = true;
	end

	if (not self.isSetup) then 
		script_rotation:setup(); 
	end

	-- quick enchanting and disenchanting
	--if (self.waitTimer > GetTimeEX()) then return; end
	--if IsLooting() then LootTarget(); self.waitTimer = GetTimeEX() + 500; end ReplaceEnchant();

	if (script_rotationMenu.pause) then 
		self.message = "Paused by user..."; 
		return; 
	end


	if (IsCasting() or IsChanneling()) then 
		return; 
	end

	if (self.waitTimer > GetTimeEX()) then
		return;
	end

	self.waitTimer = GetTimeEX() + self.tickRate;

	if (not localObj:IsDead()) then

		-- do some loot
		if (not IsInCombat() or IsLooting()) and self.lootTargets and not script_grind:shouldWeRest() then

			if script_rotation:doSomeLoot() then
				self.waitTimer = GetTimeEX() + 500;
				return true;
			end
		end

		if (GetTarget() ~= 0 and GetTarget() ~= nil) and (not IsLooting()) then
			local target = GetTarget();
			if (target:CanAttack()) and not target:IsDead() then
				self.enemyObj = target;
				if not IsAutoCasting("Attack") and not IsStealth() then
					self.enemyObj:AutoAttack();
				end
			elseif (IsLooting()) then
				self.enemyObj = nil;
			elseif GetTarget():IsDead() then
				ClearTarget();
				self.enemyObj = nil;
			end
		end
		
		self.enemyObj = GetTarget();

		if (self.enemyObj ~= 0) and (self.enemyObj:CanAttack()) then

			-- Auto dismount if in range
			if (IsMounted()) then 
				
				self.message = "Auto dismount if in range...";

				if (self.enemyObj:GetDistance() <= self.disMountRange) then
					DisMount(); 
					return; 
				end
			end

			script_grind.enemyObj = self.enemyObj;

			if (self.enemyObj:GetDistance() <= 45) and not self.enemyObj:IsDead() then

				-- Attack the target
				self.message = "Running the combat script on target...";
				RunCombatScript(self.enemyObj:GetGUID());

			end

		else

			if (self.enemyObj ~= 0 and self.enemyObj ~= nil) then

				if (not self.enemyObj:CanAttack()) then
					ClearTarget();
				end	

			end

			-- Rest
			if (script_rotation:runRest()) then
				return true;
			end

			self.message = "Waiting for a target...";
			return;
		end

	return true;
	else

	-- Auto ress?

	end
end


function script_rotation:runRest()

	if not IsInCombat() and not GetLocalPlayer():IsDead() then

		if (RunRestScript()) then

			self.message = "Resting...";

			-- Stop moving
			if (IsMoving() or IsMounted()) then 
				return true; 
			end

			-- Add 2500 ms timer to the rest script rotations (timer could be set already)
			if ((self.waitTimer - GetTimeEX()) < 2500) then 
				self.waitTimer = GetTimeEX() + 2500;
			end

		return true;	
		end
	end

return false;
end

function script_rotation:doSomeLoot()

		-- find loot target
			script_grindFindLootTarget:findLootTarget();
			
			-- find skin target
			if script_grind.lootObj == nil and HasSpell("Skinning") and script_grind.skinning and HasItem("Skinning Knife") then
				script_grind.lootObj = script_grind:getSkinTarget(script_grind.findLootDistance);		
			end
			if IsLooting() then
				if not LootTarget() then
					return false;
				end
			end

			-- do loot
			if script_grind.lootObj ~= nil and not IsEating() and not IsDrinking() and not IsCasting() and not IsChanneling() then
				script_grind.lootCheckTime = 10000;
				script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
				script_grind.lootCheck['timer'] = GetTimeEX() + 10000;
				
				script_grindDoLoot:doLoot(GetLocalPlayer());
				return true;
			end
return false;
end