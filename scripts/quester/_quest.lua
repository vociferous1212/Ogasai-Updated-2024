_quest = {

	message = "Quester",
	pause = true,
	isSetup = false,
	currentDebugStatus = "Nothing",
	waitTimer = 0,
	tickRate = 300,
	currentQuest = nil,
	enemyTarget = nil,
	targetKilledNum = 0,
	targetKilledNum2 = 0,
	gartheredNum = 0,
	gatheredNum2 = 0,
	isQuestComplete = false,
	needRest = false,
	grindSpotReached = false,

	grindIncluded = include("scripts\\script_grind.lua"),
	grindMenu = include("scripts\\menu\\script_grindMenu.lua"),
	questerMenuIncluded = include("scripts\\quester\\_questMenu.lua"),
	questerGetItemToGatherIncluded = include("scripts\\quester\\_questGetItemToGather.lua"),
	questerHandleVendorIncluded = include("scripts\\quester\\_questHandleVendor.lua"),
	questerDBIncluded = include("scripts\\db\\_questDB.lua"),
	questerDBTargetsIncluded = include("scripts\\db\\_questDBTargets.lua"),
	questerDBReturnQuestIncluded = include("scripts\\db\\_questDBReturnQuest.lua"),
	questerEXIncluded = include("scripts\\quester\\_questEX.lua"),
	questerCheckQuestCompletionIncluded = include("scripts\\quester\\_questCheckQuestCompletion.lua"),

}

-- for some reason the .dll requires it to be named draw() without an error...
function _quest:draw() end

-- draw the window
function _quest:window()
	EndWindow();
	if(NewWindow("Quester", 320, 300)) then
		_questMenu:menu();
	end
	-- color
	local r, g, b = 0, 0, 0;
	-- position
	local y, x, width = 120, 25, 370;
	local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition());
	if (onScreen) then
		y, x = tY-25, tX+75;
	end
		DrawText("Quester", x, y-4, r+255, g+255, b+0) y = y + 15;
		DrawText("Quester Status:", x, y, r+255, g+255, b+0);
		DrawText(self.message or "error", x + 115, y, 255, 255, 255);
		DrawText("_______________", x, y+3, r+255, g+255, b);
		y = y + 20; DrawText('Combat Script Status:', x, y, r+255, g+255, b+0); y = y + 15;
		if (script_grind.showClassOptions) then RunCombatDraw(); end
		DrawText("_____________________", x, y-12, r+255, g+255, b);
		DrawText('Vendor - ' .. script_vendorMenu:getInfo(), x, y, r+255, g+255, b+0); y = y + 15;
		DrawText('Vendor Status: ', x, y, r+255, g+255, b+0);
		DrawText(script_vendor:getMessage(), x+105, y, 0, 255, 255);
end

function _quest:setTimer(miliSeconds)
	self.waitTimer = GetTimeEX() + miliSeconds;
end

--run setup
function _quest:setup()

	script_vendor:setup();
	vendorDB:setup();
	vendorDB:loadDBVendors();
	_questDB:setup();
	script_helper:setup();


	self.waitTimer = GetTimeEX();

self.isSetup = true;
end

-- run the quester
function _quest:run()

	-- draw the window
	_quest:window();

	if (not IsUsingNavmesh()) then UseNavmesh(true);
		return true;
	end
	if (not LoadNavmesh()) then self.message = "Make sure you have mmaps-files...";
		return true;
	end
	if (GetLoadNavmeshProgress() ~= 1) then
		self.message = "Loading Nav Mesh! Please Wait!";
		self.currentDebugStatus = "Loading Nav";
		return;
	end

	script_grind.nextToNodeDist = 4.05

	-- return if we pause bot
	if (self.pause) then
		return;
	end

	if (self.waitTimer + self.tickRate > GetTimeEX()) then
		return;
	end

	-- run setup function once
	if (not self.isSetup) then
		_quest:setup();
		_questDB:setup();
		self.currentDebugStatus = "Running Setup";
	end

	-- handle vendor stuff through vendor scripts
	if (not IsInCombat()) and _questEX.bagsFull then
		script_vendor:sell();
		local vendorStatus = script_vendor:getStatus();
		if (vendorStatus > 1) then
			_questHandleVendor:vendor();
			return true;
		else
			_questEX.bagsFull = false;
		end
	end

	script_grind.lootObj = script_nav:getLootTarget(50);
	if _questEX:doChecks() then
		return true;
	end

	_questCheckQuestCompletion:checkQuestForCompletion();
	if self.currentQuest ~= nil and self.isQuestComplete then
		if _questDBReturnQuest:returnAQuest() then
			self.message = "Returning quest!";
			return;
		end
	end

	-- set our current quest
	for y=0, _questDB.numQuests -1 do
		for i=0, GetNumQuestLogEntries()  do
			local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(i);
			if title == _questDB.questList[y]['questName'] then
				self.currentQuest = title;
			end
		end
	end

	local curQuestGiver = nil;
	local curQuestName = nil;
	local curQuestX, curQuestY, curQuestZ = 0, 0, 0;
	local curGrindX, curGrindY, curGrindZ = 0, 0, 0;
	local distToGiver = 0;
	local distToGrind = 0;
	local px, py, pz = GetLocalPlayer():GetPosition();

curQuestGiver = _questDB:getQuestGiverName(); curQuestName = _questDB:getQuestName(); curQuestX, curQuestY, curQuestZ = _questDB:getQuestStartPos(); curGrindX, curGrindY, curGrindZ = _questDB:getQuestGrindPos(); distToGiver = GetDistance3D(px, py, pz, curQuestX, curQuestY, curQuestZ); distToGrind = GetDistance3D(px, py, pz, curGrindX, curGrindY, curGrindZ)

	if (distToGrind <= 50) and not self.grindspotReached then
		self.grindSpotReached = true;
	end

	-- run combat on good targets
	if (self.enemyTarget ~= nil and self.enemyTarget ~= 0) or (IsInCombat()) then
		-- get a target if we have none
		if (PlayerHasTarget()) then
			self.enemyTarget = GetTarget();
		end
		if IsInCombat() and (self.enemyTarget ~= nil or self.enemyTarget == nil) then
			if (self.enemyTarget ~= nil) then
				if (script_grind:getTargetAttackingUs() ~= self.enemyTarget:GetGUID()) then
					ClearTarget();
					self.enemyTarget = script_grind:getTargetAttackingUs();
				end
			elseif (self.enemyTarget == nil) then
				self.enemyTarget = script_grind:getTargetAttackingUs();
			end
		end
		-- if target is a quest target then count +1
		if _quest.currentQuest ~= 0 and self.enemyTarget ~= nil then
			for i=0, _questDB.numQuests -1 do
				if _quest.currentQuest == _questDB.questList[i]['questName'] then
					if self.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName'] or self.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName2'] then
						if self.enemyTarget:IsDead() and not _questDBTargets:isTargetAddedToKilledTable(self.enemyTarget:GetGUID()) then
							if self.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName'] then
								_questDBTargets:addTargetToKilledTable(self.enemyTarget:GetGUID());
								self.targetKilledNum = self.targetKilledNum + 1;
							end
							if self.enemyTarget:GetUnitName() == _questDB.questList[i]['targetName2'] then
								_questDBTargets:addTargetToKilledTable(self.enemyTarget:GetGUID());
								self.targetKilledNum2 = self.targetKilledNum2 + 1;
							end
						end
					end
				end
			end
		end
		-- if target is dead then clear enemytarget var
		if (self.enemyTarget ~= nil and self.enemyTarget ~= 0) and (self.enemyTarget:IsDead()) then
			local x, y, z = self.enemyTarget:GetPosition();
			if (self.enemyTarget:GetDistance() > 4) then
				Move(x, y, z);
				return true;
			else
				self.enemyTarget = nil;
			end
		end
		
		-- do something
		if self.enemyTarget ~= nil and self.enemyTarget ~= 0 then
			if not self.enemyTarget:IsDead() and self.enemyTarget:CanAttack() then
				self.message = "Running Combat";
				RunCombatScript(self.enemyTarget:GetGUID());
				self.currentDebugStatus = "Running combat script";
				-- move to target
				if (self.enemyTarget ~= nil and self.enemyTarget:GetDistance() > script_grind.combatScriptRange) or (not self.enemyTarget:IsInLineOfSight()) then
					local x, y, z = self.enemyTarget:GetPosition();
					if (script_navEX:moveToTarget(GetLocalPlayer(), x, y, z)) then
						self.currentDebugStatus = "Moving to target";
					end
				end
			end
		end
	
	end

	-- move to quest giver to get quest
	if (distToGiver > 4) and (self.currentQuest == nil) then
		script_navEX:moveToTarget(GetLocalPlayer(), curQuestX, curQuestY, curQuestZ);
self.message = "Retrieving a quest, "..math.floor(distToGiver).." (yd)";
		return true;
	end
	
	-- interact with quest givers
	if (distToGiver <= 4) and (self.currentQuest == nil) then
		if curQuestGiver ~= nil then
			TargetByName(curQuestGiver);
			self.waitTimer = GetTimeEX() + 2000;
			curQuestGiver = GetTarget();
			if (GetTarget() ~= nil) and (GetTarget() ~= 0) then
				if (GetTarget():UnitInteract()) then
					self.waitTimer = GetTimeEX() + 2000;
						SelectGossipAvailableQuest(1);
						if (AcceptQuest()) then
							self.currentQuest = curQuestName;
						end					
				end
			end
		end
	end
	
	-- get a target
	if (self.currentQuest ~= nil) and (curGrindX ~= 0) and (self.grindSpotReached) then
		if (self.enemyTarget == nil) and (not self.isQuestComplete) then
			self.enemyTarget = _questDB:getTarget();
		end
	end

	-- we have a quest so go to grind spot
	if curGrindX ~= 0 and (not self.grindSpotReached) and (distToGrind > 50) and (self.currentQuest ~= nil) and (self.enemyTarget == nil) and (not self.isQuestComplete) then
		self.message = "Moving to grind spot";
		script_navEX:moveToTarget(GetLocalPlayer(), curGrindX, curGrindY, curGrindZ);
		return true;
	end
end

function _quest:runRest()
		if (IsInCombat()) or (IsLooting()) then return false; end
	local localObj = GetLocalPlayer(); local localHealth = localObj:GetHealthPercentage(); local localMana = localObj:GetManaPercentage();
		self.needRest = true;

	-- run the rest script for grind/combat
	if(RunRestScript()) then
		self.message = "Resting...";
		_quest.waitTimer = GetTimeEX() + 2000;
		if (IsMoving()) and (not localObj:IsMovementDisabed()) then StopMoving(); return true; end

		if (not IsInCombat()) and (not petHasTarget) then if (IsEating() and localHealth < 95) or (IsDrinking() and localMana < 95) then return true; end end
		if (IsEating() and localHealth >= 95 and IsDrinking() and localMana >= 95) 
		or (not IsDrinking() and IsEating() and localHealth >= 95)
		or (not IsEating() and IsDrinking() and localMana >= 95)
		then
			if (not IsStanding()) then
				JumpOrAscendStart();
				return false;
			end
		end
	return true;	
	end
self.needRest = false;
return false;
end
