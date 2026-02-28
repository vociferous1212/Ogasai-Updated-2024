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

	isSetup = false,
	pullDistance = 150,
	showClassOptions = true,
	aggroRangeTank = 50,
	adjustTickRate = false,
	lootTargets = false,
	useRestFeature = false,
	autoFaceTarget = false,
	moveToTarget = false,
	faceTargetTimer = 0,
	drawEnabled = false,
	drawAggro = true,

	drawGather = false,

	drawUnits = true,
	drawChests = true,

	aggroRangeTank = 50,

}

function script_rotation:draw()

	script_rotation:window();

	if (script_radar.showRadar) then
		script_radar:draw()
	end

	if (self.drawAggro) then 
		script_aggro:drawAggroCircles(self.aggroRangeTank); 
	end

	if (self.drawGather) then 
		script_gather:drawGatherNodes(); 
	end

	if (self.drawUnits) then 
		script_drawData:drawUnitsDataOnScreen(); 
	end

	if (not self.drawEnabled) then 
		return; 
	end

	if (script_rotation.drawChests) then
		script_gather:drawChestNodes();
	end

	-- color
	local r, g, b = 255, 55, 55;

	-- position
	local y, x, width = 120, 25, 370;
	local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition());
	if (onScreen) then
		y, x = tY-25, tX+75;
	end

	-- info
	if (not script_rotation.pause) then
		DrawText('Script Idle: ' .. math.max(0, math.floor(script_rotation.waitTimer-GetTimeEX())) .. ' ms.', x+255, y, 255, 255, 255); y = y + 20;
		DrawText(script_rotation.message or "error", x+255, y, 100, 255, 255);
		DrawText('Status: ', x+255, y+30, r, g, b);
	end
end

function script_rotation:setup()

	script_helper:setup();
	script_gather:setup();
	script_grind:setup();
	script_grind.findLootDistance = 35;
	script_grind.lootDistance = 4;
	script_druid.meleeDistance = 5;
	script_warrior.meleeDistance = 5;
	script_shaman.meleeDistance = 5;
	script_rogue.meleeDistance = 5;
	script_paladin.meleeDistance = 5;
	script_hunter.meleeDistance = 5;
	script_druid.healthToShift = 60;
	script_paladin.holyLightHealth = 65;

	script_shaman:setup();
	script_druid:setup();
	script_mage:setup();
	script_warlock:setup();
	script_priest:setup();
	script_paladin:setup();
	script_warrior:setup();
	script_rogue:setup();	

	self.isSetup = true;
end

function script_rotation:window()

	EndWindow();

	if NewWindow("Rotation", 320, 300) then

		script_rotationMenu:menu();
	end

	if self.useExpChecker then

		script_expChecker:menu();
	end

end

function script_rotation:run()

	localObj = GetLocalPlayer();

-- using rotation
	if script_rotationMenu.pause then

		self.usingRotation = false;
	else
		self.usingRotation = true;
	end

-- setup
	if (not self.isSetup) then 

		script_rotation:setup(); 
	end

-- draw text if target is not in line of sight
	if script_rotation:isEnemyValid() and PlayerHasTarget() and not script_rotationMenu.pause then

		if not self.enemyObj:IsInLineOfSight() then

			local tX, tY, onScreen = WorldToScreen(Player():GetPosition());

			DrawText("Target Not In Line Of Sight", tX- 65, tY-120, 0, 255, 0);
		end
	end

-- quick enchanting and disenchanting
	--if (self.waitTimer > GetTimeEX()) then return; end
	--if IsLooting() then LootTarget(); self.waitTimer = GetTimeEX() + 500; end ReplaceEnchant();

-- return if paused or for any reason
	if self.waitTimer > GetTimeEX()
	or script_rotationMenu.pause 
	or Player():IsStunned() or Player():IsConfused() or Player():IsFleeing() or Player():IsDead()
	or ( (IsCasting() or IsChanneling()) and not instantCastSpells:isSpellInstantCast() ) then

		self.message = "Paused by user..."; 

		return; 
	end

-- face target
	if IsInCombat() and GetTimeEX() > self.faceTargetTimer and self.autoFaceTarget and not IsMoving() then

		if PlayerHasTarget() and script_rotation:isEnemyValid() then

			if not self.enemyObj:IsDead() and self.enemyObj:CanAttack() then

				if not self.enemyObj:FaceTarget() then

					self.faceTargetTimer = GetTimeEX() + 2000;
				end
			end
		end
	end

	self.waitTimer = GetTimeEX() + self.tickRate;

-- do some loot
	if ((not IsInCombat() or not IsAnyTargetTargetingPlayer() or not PlayerHasTarget()) or IsLooting()) and self.lootTargets then

		if not script_grind:shouldWeRest() or not self.useRestFeature then

			if script_rotation:doSomeLoot() then

				self.waitTimer = GetTimeEX() + 150;

				return true;
			end
		end
	end

-- Rest
	if self.useRestFeature then

		if (script_rotation:runRest()) then

			return true;
		end
	end

-- player has a target
	if PlayerHasTarget() and not IsLooting() then

		local target = GetTarget();

		if target:CanAttack() and not target:IsDead() and not target:IsCritter() then

			self.enemyObj = target;

			if not IsAutoCasting("Attack") and not IsStealth() then

				self.enemyObj:AutoAttack();
			end

		elseif (IsLooting()) then

			self.enemyObj = nil;

		elseif GetTarget():IsDead() or (script_rotation:isEnemyValid() and not GetTarget():CanAttack()) then

			ClearTarget();

			self.enemyObj = nil;

			return;
		end
	else
		self.enemyObj = nil;
	end
	
-- set enemy object
	if script_rotation:isEnemyValid() and PlayerHasTarget() then

		if GetTarget():CanAttack() and not GetTarget():IsDead() then

			self.enemyObj = GetTarget();
		end
	end

	if script_rotation:isEnemyValid() and self.enemyObj:CanAttack() then

		-- Auto dismount if in range
		if (IsMounted()) then 
				
			self.message = "Auto dismount if in range...";

			if (self.enemyObj:GetDistance() <= self.disMountRange) then

				DisMount(); 

				return; 
			end
		end

-- initiate combat
		if self.enemyObj:GetDistance() <= 45 then

			-- Attack the target
			self.message = "Running the combat script on target...";

			RunCombatScript(self.enemyObj:GetGUID());

		end

-- move to target
		if self.moveToTarget and PlayerHasTarget() and not IsCasting() and not IsChanneling() then

			if self.enemyObj:GetDistance() > script_grind.combatScriptRange or not self.enemyObj:IsInLineOfSight() then

				local x, y, z = self.enemyObj:GetPosition();

				if grind2MoveToTarget:run(Player(), x, y, z) then
					return false;
				end
			end
		end

	end

-- show message
	if not PlayerHasTarget() then

		self.message = "Waiting for a target...";
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
				return;
			end
return;
end

-- don't know why this wouldn't work as a local function
function script_rotation:isEnemyValid()

		local enemy = nil;

		if self.enemyObj ~= nil and self.enemyObj ~= 0 then

			return true;
		end

return false;
end