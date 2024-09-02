_quest = {

	message = "Quester",
	usingQuester = false,
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
	curGrindX = 0,
	curGrindY = 0,
	curGrindz = 0,
	curQuestX = 0,
	curQuestY = 0,
	curQuestZ = 0,
	weHaveQuest = fasle,
	autoComplete = true,
	currentDesc = nil,
	returningQuest = false,
	xp = 0,

	grindIncluded = include("scripts\\script_grind.lua"),
	grindMenu = include("scripts\\menu\\script_grindMenu.lua"),
	questerMenuIncluded = include("scripts\\quester\\_questMenu.lua"),
	questerGetItemToGatherIncluded = include("scripts\\quester\\_questGetItemToGather.lua"),
	questerHandleVendorIncluded = include("scripts\\quester\\_questHandleVendor.lua"),
	questerDBIncluded = include("scripts\\db\\_questDB.lua"),
	questerDBTargetsIncluded = include("scripts\\db\\_questDBTargets.lua"),
	questerDBReturnQuestIncluded = include("scripts\\db\\_questDBReturnQuest.lua"),
	questerDBGatherIncluded = include("scripts\\db\\_questDBGather.lua"),
	questerEXIncluded = include("scripts\\quester\\_questEX.lua"),
	questerCheckQuestCompletionIncluded = include("scripts\\quester\\_questCheckQuestCompletion.lua"),
	questerDoCombatIncluded = include("scripts\\quester\\_questDoCombat.lua"),

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
	if (not _questDB.isSetup) then
		_questDB:setup();
	end
	script_helper:setup();
	self.usingQuester = true;
	if GetNumQuestLogEntries() == 0 or GetNumQuestLogEntries() == nil then
		self.autoComplete = false;
	end

	self.xp = UnitXP("Player");
	_questDBReturnQuest.waitTimer = GetTimeEX();
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

	if _questDB.curListQuest == nil then
		self.message = "No quest or no quest in level range in DB! Going to grind...";
		script_grind:run();
		script_grind.pause = false;
		_quest.pause = true;
		--local x, y, z = GetLocalPlayer():GetPosition();
		--if GetDistance3D(x, y, z, 10735.243164063, 925.56115722656, 1333.4985351563) > 50 then
		--	if script_navEX:moveToTarget(GetLocalPlayer(), 10735.243164063, 925.56115722656, 1333.4985351563) then
		--		return true;
		--	end
		--end
		-- get a target
		--if (self.enemyTarget == nil) then
		--	self.enemyTarget = _questDBTargets:getTarget()
		--elseif (self.enemyTaget ~= nil) then
		--	_questDoCombat:doCombat();
		--end
		return;
	end

	-- return if we pause bot
	if (self.pause) then
		return;
	end

	-- handle vendor stuff through vendor scripts
	if (not IsInCombat()) and (_questEX.bagsFull or script_vendor.status > 0) then
		local vendorStatus = script_vendor:getStatus();
		if (vendorStatus > 1) then
			_questHandleVendor:vendor();
			return true;
		else
			_questEX.bagsFull = false;
		end
		if (vendorStatus == 0) then
			script_vendor:sell();
			return true;
		end
	return true;
	end

	if (self.waitTimer + self.tickRate > GetTimeEX()) then
		return;
	end

	-- run setup function once
	if (not self.isSetup) then
		_quest:setup();
		self.currentDebugStatus = "Running Setup";
	end

	script_grind.lootObj = script_nav:getLootTarget(50);
	if _questEX:doChecks() then
		if script_grind.lootObj ~= nil then
			if (not script_grind.isAnyTargetTargetingMe()) and (PlayerHasTarget() and not GetTarget():GetGUID() == script_grind.lootObj:GetGUID()) then
				ClearTarget();
			end
		end
	return true;
	end
	-- if desc doesn't match desc then complete quest
	-- or if name ~= name and no desc found
	if ((GetNumQuestLogEntries() ~= 0 and _questDB.curDesc ~= _quest.currentDesc) or (GetNumQuestLogEntries() ~= 0 and _questDB.curListQuest ~= self.currentQuest)) and self.autoComplete then
		if (_questDB:turnQuestCompleted()) then
		self.waitTimer = GetTimeEX() + 500;
		end
	end

	if (not IsInCombat()) then
		self.xp = UnitXP("Player");
	end

	_questCheckQuestCompletion:checkQuestForCompletion();
	if self.currentQuest ~= nil and self.isQuestComplete and (not IsInCombat()) then
		if _questDBReturnQuest:returnAQuest() then
			self.message = "Returning quest!";
			return true;
		end
	end

	if (not IsInCombat()) then
		self.xp = UnitXP("Player");
	end

	-- set our current quest
	for y=0, _questDB.numQuests -1 do
		for i=0, GetNumQuestLogEntries()  do
			local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(i);
			if _questDB.questList[y]['completed'] == "no" then
				if _questDB.questList[y]['questName'] ~= "nnil" then
					if title == _questDB.questList[y]['questName'] then
						_quest.currentDesc = GetObjectiveText(1);
						self.currentQuest = title;
						self.weHaveQuest = true;
					end
				end	
			end
		end
	end

	--get a quest giver to obtain a quest from
	local curQuestGiver = nil;
	local curQuestName = nil;
	local distToGiver = 0;
	local distToGrind = 0;
	local px, py, pz = GetLocalPlayer():GetPosition();

		-- SET MARKERS / AUTO PATH NODES WHEN AN ENEMY IS KILLED FOR NEW SELF.GRIND X,Y,Z
		-- COUNT TARGETS AROUND AND CHANGE PATHS ACCORDINGLY?

curQuestGiver = _questDB:getQuestGiverName();
curQuestName = _questDB:getQuestName();
self.curQuestX, self.curQuestY, self.curQuestZ = _questDB:getQuestStartPos();
distToGiver = GetDistance3D(px, py, pz, self.curQuestX, self.curQuestY, self.curQuestZ); distToGrind = GetDistance3D(px, py, pz, self.curGrindX, self.curGrindY, self.curGrindZ)

if (not self.grindSpotReached) then
self.curGrindX, self.curGrindY, self.curGrindZ = _questDB:getQuestGrindPos();
end

	if (distToGrind <= 50) and not self.grindspotReached then
		self.grindSpotReached = true;
	end
	if (distToGrind >= 250) and self.grindSpotReached then
		self.grindSpotReached = false;
	end

	-- move to quest giver to get quest
	if (self.curQuestX ~= 0) and (distToGiver > 4) and (self.currentQuest == nil) then
		script_navEX:moveToTarget(GetLocalPlayer(), self.curQuestX, self.curQuestY, self.curQuestZ);
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
	
-- gather quest object
--if dist to hotspot reached then
--if _questDBGather:getObject() ~= 0 then
--_questDBGather:gatherObject()
--end
	-- get a target
	if (self.currentQuest ~= nil and self.curGrindX ~= 0 and self.grindSpotReached) or (IsInCombat()) or (not IsInCombat() and script_grind.lootObj == nil and self.grindSpotReached) then
		if (self.enemyTarget == nil) and (not self.isQuestComplete) then
			self.enemyTarget = _questDBTargets:getTarget();
		end
	end
	if (script_grind.lootObj == nil and self.enemyTarget ~= nil) or IsInCombat() then
		_questDoCombat:doCombat();
		return true;
	end
	-- we have a quest so go to grind spot
	if self.curGrindX ~= 0 and (not self.grindSpotReached) and (distToGrind > 50) and (self.currentQuest ~= nil) and (self.enemyTarget == nil) and (not self.isQuestComplete) then
		self.message = "Moving to grind spot";
		script_navEX:moveToTarget(GetLocalPlayer(), self.curGrindX, self.curGrindY, self.curGrindZ);
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
