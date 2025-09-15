script_follow = {enemyObj = nil, lootObj = nil, timer = GetTimeEX(), tickRate = 500, waitTimer = GetTimeEX(), pullDistance = 150, findLootDistance = 60, lootDistance = 2.5, skipLooting = false, lootCheck = {}, ressDistance = 25, combatError = 0, dpsHP = 95, myTime = GetTimeEX(), nextToNodeDist = 3.2, isSetup = false, drawUnits = false, acceptTimer = GetTimeEX(), followLeaderDistance = 18, assistInCombat = false, isChecked = true, pause = true, message = "Starting the follower...", drawNav = true, objectAttackingUs = 0, meleeDistance = 3.5, unstuck = true, followTimer = GetTimeEX(), randomFollow = true, limitAttackDist = false, isStuck = false, adjustTickRate = false, isInCombat = false, helperLoaded = include("scripts\\script_helper.lua"), drawDataLoaded = include("scripts\\script_drawData.lua"), drawStatusLoaded = include("scripts\\script_drawStatus.lua"), checkDebuffsLoaded = include("scripts\\script_checkDebuffs.lua"), unstuckLoaded = include("scripts\\script_unstuck.lua"), grindFunctions = include("scripts\\script_grind.lua"), vendorsLoaded = include("scripts\\script_vendor.lua"), vendormenu = include("scripts\\menu\\script_vendorMenu.lua"), nav1 = include("scripts\\nav\\script_nav.lua"), mav2 = include("scripts\\nav\\script_navEX.lua"), startChecksLoaded = include("scripts\\follow\\script_followStartChecks.lua"),

-- follow folder
healsLoaded = include("scripts\\follow\\script_followHealsAndBuffs.lua"), moveToMemberLoaded = include("scripts\\follow\\script_followMove.lua"), doCombatLoaded = include("scripts\\follow\\script_followDoCombat.lua"), menuLoaded = include("scripts\\follow\\script_followMenu.lua"), extraFunctions = include("scripts\\follow\\script_followEX.lua"), moveToTargetLoaded = include("scripts\\follow\\script_followMoveToTarget.lua"), moveToLootLoaded = include("scripts\\follow\\script_followMoveToLoot.lua"), moveToEnemyLoaded = include("scripts\\follow\\script_followMoveToEnemy.lua"), doVendorStuff = include("scripts\\follow\\script_followDoVendor.lua")}

function script_follow:window()
	if (self.isChecked) then
		EndWindow();
		if(NewWindow("Follower Options", 320, 360)) then
			script_followMenu:menu();
		end
	end
end

function script_follow:setup()
	self.lootCheck['timer'] = 0;
	self.lootCheck['target'] = 0;
	script_helper:setup();
	script_followEX2:setup();
	script_gather:setup();
	script_priestFollowerHeals.timer = GetTimeEX();
	self.isSetup = true; ClearTarget();
end

function script_follow:draw()
	script_followEX:drawStatus();
end

function script_follow:setWaitTimer(ms)
	self.waitTimer = GetTimeEX() + (ms);
end

function GetPartyLeaderObject()
	local leaderObj = 0;

	if GetNumPartyMembers() > 0 then

		leaderObj = GetPartyMember(GetPartyLeaderIndex());

		if leaderObj ~= nil and leaderObj ~= 0 then
	
		return leaderObj;
		end
	end
	return 0;
end

-- RUN THE FOLLOWER SCRIPT
function script_follow:run()
	script_follow:window();

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

	-- get a target attacking us and set it as enemy object
	if (localObj:GetUnitsTarget() ~= 0) and localObj:GetUnitsTarget() ~= nil then
		self.enemyObj = localObj:GetUnitsTarget();
	end
	
-- RESTING PHASE			
	-- Rest
	if (not IsInCombat() and script_followEX2:enemiesAttackingUs() == 0 and not localObj:HasBuff('Feign Death')) then
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
		if (not script_followEX2:isTargetAttackingMember()) then
			self.isInCombat = false;
		end
	end

-- LOOTING PHASE
	if (not self.isInCombat) and (not IsInCombat() or self.enemyObj == nil) and (script_followEX2:enemiesAttackingUs() == 0 and not localObj:HasBuff('Feign Death')) then

		-- Loot if there is anything lootable and we are not in combat and if our bags aren't full
		if (not self.skipLooting and not AreBagsFull()) then 
			self.lootObj = script_nav:getLootTarget(self.findLootDistance);
		else
			self.lootObj = nil;
		end
		if HasSpell("Skinning") then
			if script_grind:getSkinTarget(self.findLootDistance) ~= nil then
				if self.lootObj == nil then self.lootObj = script_grind:getSkinTarget(self.findLootDistance); end end

			if (self.lootObj == 0) then
				self.lootObj = nil;
			end
		end

		local isLoot = not IsInCombat() and (self.lootObj ~= nil);

		if (isLoot and not AreBagsFull()) then
			script_followEX:doLoot(localObj);

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
	if script_grind.gather and (not self.isInCombat) and (not IsInCombat() or self.enemyObj == nil) and (script_followEX2:enemiesAttackingUs() == 0 and not localObj:HasBuff('Feign Death')) then
		if (script_gatherRun:gather()) then
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
		elseif (script_followEX2:enemiesAttackingUs() == 0) then
			self.enemyObj = nil;
		end 
	end

	--  if target is further than party leaders distance (don't walk further than distance slider set to follow leader) then enemy = nil
	local enemy = self.enemyObj

	if (self.limitAttackDist) and (enemy ~= 0) and (enemy ~= nil) and (enemy:GetDistance() > self.followLeaderDistance) then
		self.enemyObj = nil;
	end

	-- rogue stealth before attacking - forced regardless of distance set in combat script
	if HasSpell("Stealth") and script_rogue.useStealth and not IsStealth() and not IsSpellOnCD("Stealth") then
		if GetPartyLeaderObject() ~= nil and GetPartyLeaderObject() ~= 0 then
			if GetPartyLeaderObject():GetUnitsTarget() ~= nil then
				CastStealth();
			end
		end
	end

-- RUN COMBAT SCRIPT ON A GOOD TARGET

	if self.enemyObj ~= nil and self.enemyObj ~= 0 then 

		-- run the do combat script
		if (not self.enemyObj:IsDead()) and (self.enemyObj:CanAttack()) then
			self.combatError = script_followDoCombat:run();
		end
	end


	-- get enemy to attack
	-- do combat
	local distance = self.followLeaderDistance;

	if (GetPartyLeaderObject() ~= 0) and (self.limitAttackDist) and (self.assistInCombat) then
		if (leader:GetUnitsTarget() ~= 0 and not leader:IsDead()) then
					curTarget = GetPartyLeaderObject():GetUnitsTarget();
			if (curTarget:GetHealthPercentage() <= self.dpsHP) then
				tarX, tarY, tarZ = curTarget:GetPosition();
				leaderX, leaderY, leaderZ = leader:GetPosition();
				if (GetDistance3D(leaderX, leaderY, leaderZ, tarX, tarY, tarZ) <= distance) then
					self.enemyObj = GetPartyLeaderObject():GetUnitsTarget();
				end
			elseif (script_followEX2:enemiesAttackingUs() == 0) then
				self.enemyObj = nil;
				ClearTarget();
			end
		end
       	elseif (GetPartyLeaderObject() ~= 0) and (not self.limitAttackDist) and (self.assistInCombat) then
		if (leader:GetUnitsTarget() ~= 0 and not leader:IsDead()) then
				curTarget = GetPartyLeaderObject():GetUnitsTarget();
			if (curTarget:GetHealthPercentage() <= self.dpsHP) then
				self.enemyObj = GetPartyLeaderObject():GetUnitsTarget();
			end
		elseif (script_followEX2:enemiesAttackingUs() == 0) then
			self.enemyObj = nil;
			ClearTarget();
		end
	end
-- OUT OF COMBAT PHASE AND IN COMBAT HEALS - it's an ogasai quirk... don't leave open else statements.. use elseif
		-- heals and buffs 
		if (not localObj:IsDead()) and (self.enemyObj ~= nil and self.enemyObj ~= 0) then
			-- heals and buffs out of combat
			if (script_priestFollowerHeals.enableHeals) or (script_shamanFollowerHeals.enableHeals) or (script_druidFollowerHeals.enableHeals) or (script_paladinFollowerHeals.enableHeals) then
				-- Healer check: heal/buff the party
				for i = 1, GetNumPartyMembers() do
					local member = GetPartyMember(i);
					if (not member:IsDead()) and (not localObj:IsDead()) and (not IsMoving()) and (not IsCasting()) and (not IsChanneling()) then
						if (script_followHealsAndBuffs:healAndBuff()) then
							--self.waitTimer = GetTimeEX() + 1550;
							self.message = "Healing/buffing the party...";
							ClearTarget();
							return true;
						end
					end
				end
			end
		else
			self.enemyObj = nil;
			-- heals and buffs in combat force to run it because of 'else'
			-- Healer check: heal/buff the party
			if (script_priestFollowerHeals.enableHeals) or (script_shamanFollowerHeals.enableHeals) or (script_druidFollowerHeals.enableHeals) or (script_paladinFollowerHeals.enableHeals) then
			for i = 1, GetNumPartyMembers() do
				local member = GetPartyMember(i);
				if (not member:IsDead()) and (not localObj:IsDead()) and (not IsMoving()) then
					if (script_followHealsAndBuffs:healAndBuff()) then
						self.message = "Healing/buffing the party...";
						ClearTarget();
						return true;
					end
				end
			end
		end
-- END COMBAT PHASE FOLLOW PARTY LEADER
-- FOLLOW PARTY LEADER
		local leader = GetPartyLeaderObject();
		-- follow leader
		if (not IsInCombat()) and (leader ~= 0) and (self.lootObj == nil)
		and (not leader:IsDead()) and (not localObj:IsDead())
		then

			if (not IsCasting()) and (not IsChanneling())
			and (not IsDrinking()) and (not IsEating()) and (not IsLooting())
			and (leader:GetDistance() > self.followLeaderDistance-5)
			then

				script_followMove:followLeader();
					self.isStuck = false;
			end	
		end
	end
	if leader ~= nil and (leader ~= 0 and leader:GetDistance() == 0) or (leader == 0) and (not isVendoring) then
		self.message = "leader GetDistance == 0... no path";
	end	
end