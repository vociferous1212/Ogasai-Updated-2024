script_follow = {
	enemyObj = nil,
	lootObj = nil,
	timer = GetTimeEX(),
	tickRate = 500,
	waitTimer = GetTimeEX(),
	pullDistance = 150,
	findLootDistance = 60,
	lootDistance = 2.5,
	skipLooting = false,
	lootCheck = {},
	ressDistance = 25,
	combatError = 0,
	dpsHP = 95,
	myTime = GetTimeEX(),
	nextToNodeDist = 3.2,
	isSetup = false, 
	rawUnits = false,
	acceptTimer = GetTimeEX(),
	followLeaderDistance = 18,
	assistInCombat = false,
	isChecked = true,
	pause = true,
	drawUnits = false,
	drawAggro = false,
	message = "Starting the follower...",
	drawNav = true, objectAttackingUs = 0,
	spellRange = script_grind.combatScriptRange,
	unstuck = true,
	followTimer = GetTimeEX(),
	randomFollow = true,
	limitAttackDist = false,
	isStuck = false,
	adjustTickRate = false,
	isInCombat = false,
	
	
	
	helperLoaded = include("scripts\\script_helper.lua"), drawDataLoaded = include("scripts\\script_drawData.lua"),
	drawStatusLoaded = include("scripts\\script_drawStatus.lua"), checkDebuffsLoaded = include("scripts\\script_checkDebuffs.lua"),
	unstuckLoaded = include("scripts\\script_unstuck.lua"), grindFunctions = include("scripts\\script_grind.lua"), vendorsLoaded = include("scripts\\script_vendor.lua"),
	vendormenu = include("scripts\\menu\\script_vendorMenu.lua"), nav1 = include("scripts\\nav\\script_nav.lua"), mav2 = include("scripts\\nav\\script_navEX.lua"),
	startChecksLoaded = include("scripts\\follow\\script_followStartChecks.lua"),

	-- follow folder
	healsLoaded = include("scripts\\follow\\script_followHealsAndBuffs.lua"),
	doCombatLoaded = include("scripts\\follow\\script_followDoCombat.lua"),
	menuLoaded = include("scripts\\follow\\script_followMenu.lua"),
	followMoveLoaded = include("scripts\\follow\\script_followMove.lua"),
	doVendorStuff = include("scripts\\follow\\script_followDoVendor.lua"),
	followHealsAndBuffsRunIncluded = include("scripts\\follow\\script_followRunHealsAndBuffsChecks.lua"),

	
	-- functions folder
	followDrawStatusIncluded = include("scripts\\follow\\script_followFunctions\\script_followDrawStatus.lua"),
	followGetDistanceDiffIncluded = include("scripts\\follow\\script_followFunctions\\script_followGetDistanceDiff.lua"),
	followGetPartyLeaderObjectIncluded    = include("scripts\\follow\\script_followFunctions\\script_followGetPartyLeaderObject.lua"),
	followSetupIncluded = include("scripts\\follow\\script_followFunctions\\script_followSetup.lua"),
	followWaitTimerIncluded = include("scripts\\follow\\script_followFunctions\\script_followSetWaitTimer.lua"),
	followNumEnemiesAttackingLeaderIncluded = include("scripts\\follow\\script_followFunctions\\script_followNumEnemiesAttackingLeader.lua"),
	followNumEnemiesAttackingUsIncluded = include("scripts\\follow\\script_followFunctions\\script_followNumEnemiesAttackingUs.lua"),
	followIsTargetAttackingMemberLoaded =  include("scripts\\follow\\script_followFunctions\\script_followIsTargetAttackingMember.lua"),
	followIsTargetingLeaderLoaded =  include("scripts\\follow\\script_followFunctions\\script_followIsTargetingLeader.lua"),

	followGetTargetAttackingUsLoaded = include("scripts\\follow\\script_followFunctions\\script_followGetTargetAttackingUs.lua"),
	followGetTargetLoaded = include("scripts\\follow\\script_followFunctions\\script_followGetTarget.lua"),
	followEnemyIsValidLoaded = include("scripts\\follow\\script_followFunctions\\script_followEnemyIsValid.lua"),
	followAssignTargetLoaded = include("scripts\\follow\\script_followFunctions\\script_followAssignTarget.lua"),
	followIsTargetingMeLoaded = include("scripts\\follow\\script_followFunctions\\script_followIsTargetingMe.lua"),
	followIsTargetingPetLoaded = include("scripts\\follow\\script_followFunctions\\script_followIsTargetingPet.lua"),
	followPlayersTargetingUsLoaded = include("scripts\\follow\\script_followFunctions\\script_followPlayersTargetingUs.lua"),
	followerDoLootLoaded = include("scripts\\follow\\script_followFunctions\\script_followDoLoot.lua"),
	followAcceptGroupLoaded = include("scripts\\follow\\script_followFunctions\\script_followAcceptGroupInvite.lua"),
	followRandomFollowLeaderDistanceLoaded = include("scripts\\follow\\script_followFunctions\\script_followRandomFollowLeaderDistance.lua"),
	followPlayerIsDeadLoaded = include("scripts\\follow\\script_followFunctions\\script_followPlayerIsDead.lua"),

}

-- .dll requires window(), setup(), draw() and run() functions. RunRest() can be called for rest function...

function script_follow:window()
	if (self.isChecked) then
		EndWindow();
		if(NewWindow("Follower Options", 320, 360)) then
			script_followMenu:menu();
		end
	end
end

function script_follow:setup()

	-- run the setup script.
	script_followSetup:setup();

end

function script_follow:draw()
	script_followDrawStatus:drawStatus();
end

-- RUN THE FOLLOWER SCRIPT
function script_follow:run()

	script_follow:window();

	self.spellRange = script_grind.combatScriptRange;


	if (not self.isSetup) then
			script_follow:setup();
	end

	if (IsUsingNavmesh()) and (script_follow.drawPath) then
		script_drawData:drawPath();
	end

	-- Set next to node distance and nav-mesh smoothness to double that number
	if (IsMounted()) then
		script_nav:setNextToNodeDist(8);
		NavmeshSmooth(14);
	else
		script_nav:setNextToNodeDist(script_follow.nextToNodeDist);
		NavmeshSmooth(script_follow.nextToNodeDist);
	end

	-- Automatic loading of the nav mesh
	if (not IsUsingNavmesh()) then
		UseNavmesh(true);
	return;
	end

	if (not LoadNavmesh()) then
		self.message = "Make sure you have mmaps-files...";
	return;
	end

	if (GetLoadNavmeshProgress() ~= 1) then
		self.message = "Loading the nav mesh... ";
	return;
	end

	if (GetLoadNavmeshProgress() ~= 1) then
	return;
	end
	
	if (self.pause) then
		self.message = "Paused by user...";
	return;
	end

	if self.waitTimer > GetTimeEX() then
	return;
	end

	-- vendoring and corpse walk + random checks
	script_followStartChecks:doStartChecks();
	
	local leader = GetPartyLeaderObject();
	local localObj = GetLocalPlayer();

	-- get a target attacking us and set it as enemy object
	if (localObj:GetUnitsTarget() ~= 0) and localObj:GetUnitsTarget() ~= nil and self.enemyObj == nil then
		self.enemyObj = localObj:GetUnitsTarget();
	end



-- RESTING PHASE			
	-- Rest
	if not IsInCombat()
	and script_followNumEnemiesAttackingUs:numEnemiesAttackingUs() == 0
	and not localObj:HasBuff('Feign Death')
	and script_followNumEnemiesAttackingLeader:numEnemiesAttackingLeader() == 0
	
	then

		if (RunRestScript()) then

			self.message = "Resting...";

			if (IsMoving() and not localObj:IsMovementDisabed()) then
				StopMoving();
			return;
			end

			if (IsMounted()) then
				DisMount();
			return;
			end

			if self.waitTimer - GetTimeEX() < 2500 then
				self.waitTimer = GetTimeEX() + 2500;
			end

			ClearTarget();

		return;
		end
	end

	-- double check our combat phase before looting...
	self.isInCombat = true;

	if (not IsInCombat()) then

		if (not script_followIsTargetAttackingMember:isTargetAttackingMember()) then

			self.isInCombat = false;
		end
	end

-- LOOTING PHASE
	if not self.isInCombat
	and (not IsInCombat() or self.enemyObj == nil)
	and script_followNumEnemiesAttackingUs:numEnemiesAttackingUs() == 0
	and not localObj:HasBuff('Feign Death')
	
	then

		-- Loot if there is anything lootable and we are not in combat and if our bags aren't full
		if (not self.skipLooting and not AreBagsFull()) then 

			self.lootObj = script_nav:getLootTarget(self.findLootDistance);
		else

			self.lootObj = nil;
		end

		if HasSpell("Skinning") then

			if script_grind:getSkinTarget(self.findLootDistance) ~= nil then
				if self.lootObj == nil then self.lootObj = script_grind:getSkinTarget(self.findLootDistance);
				end
			end

			if (self.lootObj == 0) then
				self.lootObj = nil;
			end

		end

		local isLoot = not IsInCombat() and (self.lootObj ~= nil);

		if (isLoot and not AreBagsFull()) then
			script_followDoLoot:doLoot(localObj);

		return true;

		elseif (AreBagsFull() and not hsWhenFull) then

			self.lootObj = nil;
			self.message = "Warning the bags are full...";
		end	
	end

	-- Clear dead/tapped targets
	if (self.enemyObj ~= 0 and self.enemyObj ~= nil) then
		if (self.enemyObj:IsDead()) then
			self.enemyObj = nil;
			ClearTarget();
		end
	end

	-- gatherer
	if script_grind.gather and (not self.isInCombat)
	and (not IsInCombat() or self.enemyObj == nil) 
	and script_followNumEnemiesAttackingUs:numEnemiesAttackingUs() == 0
	and not localObj:HasBuff('Feign Death')
	and not AreBagsFull()
	
	then

		if (script_gatherRun:gather()) then

			self.message = "Running gatherer";

			if IsLooting() then

				self.waitTimer = GetTimeEX() + 1200;
			end

			return true;
		end
	end

	
-- COMBAT PHASE

	-- if we have a pet then get its target
	if (GetPet() ~= 0) and (GetPet() ~= nil) then

		if (GetPet():GetUnitsTarget() ~= 0) and GetPet():GetUnitsTarget() ~= nil then

			self.enemyObj = GetPet():GetUnitsTarget();
		end
	end

	-- if we dont want to assist in combat or an npc is attacking us then
	if (GetNumPartyMembers() > 0) and (GetTarget() ~= 0 and GetTarget() ~= nil) then

		local target = GetTarget();

		if (target:CanAttack() and self.assistInCombat) then
			self.enemyObj = target;
		elseif (script_followNumEnemiesAttackingUs:numEnemiesAttackingUs() == 0) then
			self.enemyObj = nil;
		end 

		-- reset target to nil if nothing is attacking us anymore and we don't want to assist in combat
		if not self.assistInCombat and not script_grind:isAnyTargetTargetingMe() then
			self.enemyObj = nil;
			if PlayerHasTarget() then
				if GetTarget():CanAttack() then
					ClearTarget();
				end
			end
		end
	end

	--  if target is further than party leaders distance (don't walk further than distance slider set to follow leader) then enemy = nil
	local enemy = self.enemyObj;
	local targetX, targetY, targetZ = 0, 0, 0;
	local leaderPosX, leaderPosY, leaderPosZ = 0, 0, 0;

	if enemy ~= 0 and enemy ~= nil then
		targetX, targetY, targetZ = self.enemyObj:GetPosition();
		leaderPosX, leaderPosY, leaderPosZ = GetPartyLeaderObject():GetPosition();
		
		if (GetDistance3D(leaderX, leaderY, leaderZ, tarX, tarY, tarZ) > self.followLeaderDistance)
		and (self.limitAttackDist) and (enemy ~= 0) and (enemy ~= nil) then

			self.enemyObj = nil;
			ClearTarget();
		end
	end


	-- rogue stealth before attacking - forced regardless of distance set in combat script
	if HasSpell("Stealth") and script_rogue.useStealth and not IsStealth() and not IsSpellOnCD("Stealth") then

		if GetPartyLeaderObject() ~= nil and GetPartyLeaderObject() ~= 0 then

			if GetPartyLeaderObject():GetUnitsTarget() ~= nil then

				CastStealth();
			end
		end
	end

	-- get party leader distance - don't attack stuff too far away from party leader'
	local distance = self.followLeaderDistance;

-- get a target
	if (GetPartyLeaderObject() ~= 0 and GetPartyLeaderObject() ~= nil) and (self.limitAttackDist) and (self.assistInCombat) then

		if leader:GetUnitsTarget() ~= 0 and leader:GetUnitsTarget() ~= nil and not leader:IsDead() then

			curTarget = GetPartyLeaderObject():GetUnitsTarget();

			if curTarget:GetHealthPercentage() <= self.dpsHP and (script_followIsTargetingLeader:isTargetingLeader(curTarget) or curTarget:IsFleeing()) then

				tarX, tarY, tarZ = curTarget:GetPosition();
				leaderX, leaderY, leaderZ = leader:GetPosition();

				if (GetDistance3D(leaderX, leaderY, leaderZ, tarX, tarY, tarZ) <= distance) and script_followNumEnemiesAttackingUs:numEnemiesAttackingUs() == 0 then

					self.enemyObj = GetPartyLeaderObject():GetUnitsTarget();
				end

				-- get a target attacking us and set it as enemy object
				if (localObj:GetUnitsTarget() ~= 0) and localObj:GetUnitsTarget() ~= nil then

					self.enemyObj = localObj:GetUnitsTarget();
				end

			elseif (script_followNumEnemiesAttackingUs:enemiesAttackingUs() == 0) then

				self.enemyObj = nil;
				ClearTarget();
			end
		end
    elseif (GetPartyLeaderObject() ~= 0 and GetPartyLeaderObject() ~= nil) and (not self.limitAttackDist) and (self.assistInCombat) then

		if (leader:GetUnitsTarget() ~= 0 and not leader:IsDead()) then

			curTarget = GetPartyLeaderObject():GetUnitsTarget();

			if (curTarget:GetHealthPercentage() <= self.dpsHP) and (script_followIsTargetingLeader:isTargetingLeader(curTarget) or curTarget:IsFleeing()) then

				self.enemyObj = GetPartyLeaderObject():GetUnitsTarget();
			end

		elseif (script_followNumEnemiesAttackingUs:numEnemiesAttackingUs() == 0) then

			self.enemyObj = nil;
			ClearTarget();
		end
	end

-- CHECK PARTY FOR HEALS AND BUFFS
-- check heals and buffs
	script_followRunHealsAndBuffsChecks:run();

-- FOLLOW PARTY LEADER


	if (leader ~= 0) and (self.lootObj == nil)
	and (not leader:IsDead()) and (not localObj:IsDead())

	then

		if (not IsCasting()) and (not IsChanneling())
		and (not IsDrinking()) and (not IsEating()) and (not IsLooting())
		and (leader:GetDistance() > self.followLeaderDistance-8)


		then

-- move to party leader
			script_followMove:followLeader();
			self.isStuck = false;
		end
	end

	if leader ~= nil and (leader ~= 0 and leader:GetDistance() == 0) or (leader == 0) and (not isVendoring) then
		self.message = "leader GetDistance == 0... no path";
	end	


-- RUN COMBAT SCRIPT ON A GOOD TARGET

	if self.enemyObj ~= nil and self.enemyObj ~= 0 then 

		if self.enemyObj:GetHealthPercentage() > self.dpsHP and not script_grind:isTargetingMe(self.enemyObj) then

			self.enemyObj = nil;
			ClearTarget();
		end

		-- run the do combat script
		if self.enemyObj ~= nil and self.enemyObj ~= 0 and not IsCasting() and not IsChanneling() then 
			if (not self.enemyObj:IsDead()) and (self.enemyObj:CanAttack()) then

			
				if IsCasting() or IsChanneling() then
					return;
				end
				if leader:GetDistance() < self.followLeaderDistance or not self.limitAttackDist then
					self.combatError = script_followDoCombat:run();
					self.message = "Running Combat";
				end
			end
		end
	end
end