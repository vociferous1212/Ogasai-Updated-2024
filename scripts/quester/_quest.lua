_quest = {

	-- if we have a quest and are out of level range in DB it doesn't find a grind spot? something...

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
	targetKilledNum3 = 0,
	gatheredNum = 0,
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
	currentType = nil,
	usingItem = nil,
	gossipOption = nil,

	grindIncluded = include("scripts\\script_grind.lua"),
	grindMenu = include("scripts\\menu\\script_grindMenu.lua"),
	questerMenuIncluded = include("scripts\\quester\\_questMenu.lua"),
	questerHandleVendorIncluded = include("scripts\\quester\\_questHandleVendor.lua"),
	questerDBIncluded = include("scripts\\db\\_questDB.lua"),
	questerDBTargetsIncluded = include("scripts\\db\\_questDBTargets.lua"),
	questerDBReturnQuestIncluded = include("scripts\\db\\_questDBReturnQuest.lua"),
	questerDBGatherIncluded = include("scripts\\db\\_questDBGather.lua"),
	questerEXIncluded = include("scripts\\quester\\_questEX.lua"),
	questerCheckQuestCompletionIncluded = include("scripts\\quester\\_questCheckQuestCompletion.lua"),
	questerDoCombatIncluded = include("scripts\\quester\\_questDoCombat.lua"),
	questerRunRestIncluded = include("scripts\\quester\\_questRunRest.lua"),
	questerEdgeCaseQuestIncluded = include("scripts\\quester\\_questEdgeCaseQuest.lua"),



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
	script_grind:setup();
	script_gather:setup();
	script_grind.getSpells = true;
	script_vendor:setup();
	vendorDB:setup();
	vendorDB:loadDBVendors();
	if (not _questDB.isSetup) then
		_questDB:setup();
	end
	_questDBGather.waitTimer = GetTimeEX();
	script_helper:setup();
	self.usingQuester = true;
	if GetNumQuestLogEntries() == 0 or GetNumQuestLogEntries() == nil then
		self.autoComplete = false;
		self.weHaveQuest = false;
		self.isQuestComplete = false;
	end

	self.xp = UnitXP("Player");
	_questDBReturnQuest.waitTimer = GetTimeEX();
	self.waitTimer = GetTimeEX();

self.isSetup = true;
end

-- run the quester
function _quest:run()

	_quest:window();
	script_drawStatusEX:drawSetup()
	-- draw object manager and end debug window
	if (script_grind.showOM) then
		EndWindow();
		GetObjectsAroundMe();
	end
	-- display radar
	if (script_radar.showRadar) then script_radar:draw() end

	-- display exp checker
	if (script_grind.useExpChecker) and (IsInCombat()) then script_expChecker:menu(); end
	
	-- draw chests
	if (script_grind.drawChests) then script_gather:drawChestNodes(); end
	-- draw fishing pools
	if (script_gatherEX.drawFishingPools) then
		script_gatherEX:drawFishNodes();
	end
	if _questEX:doStartChecks() then return; end
	
	-- return if we pause bot
if (self.pause) then script_grind.pause = true; return; end
	-- handle vendor stuff through vendor scripts
	if script_grind.pause and (not IsInCombat()) and (_questEX.bagsFull or script_vendor.status > 0) and (not GetLocalPlayer():IsDead()) then
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

	if (self.waitTimer + self.tickRate > GetTimeEX()) and script_grind.pause then
		return;
	end
	if IsChanneling() or IsCasting() then
		return;
	end
	
	-- run setup function once
	if (not self.isSetup) then
		_quest:setup();
		self.currentDebugStatus = "Running Setup";
	end

	if script_grind.pause then if not script_grind.skipLooting and not _questEX.bagsFull then script_grind.lootObj = script_nav:getLootTarget(50); end

		if _questEX:doChecks() then if script_grind.lootObj ~= nil and not _questEX.bagsFull then if (not script_grind.isAnyTargetTargetingMe()) and (PlayerHasTarget() and not GetTarget():GetGUID() == script_grind.lootObj:GetGUID()) then ClearTarget(); end end return true; end
	
		if (script_grind.lootObj == nil and self.enemyTarget ~= nil) or IsInCombat() then
			_questDoCombat:doCombat();
			if GetLocalPlayer():GetLevel() > 5 then if script_checkAdds:checkAdds() then return true; end end return true; end end

	if self.currentType == 99 and not self.isQuestComplete and GetNumQuestLogEntries() > 0 then
		self.message = "Edge case quest... doing specific routine";
		_questEdgeCaseQuest:run() return true;
	elseif self.currentType == 99 and self.isQuestComplete and GetNumQuestLogEntries() == 0 then _questDB:turnQuestCompleted(); self.currentType = 0; end
		

	if _quest.weCompletedQuest and _quest.isQuestComplete and GetNumQuestLogEntries() < 1 then
		if (_questDB:turnQuestCompleted()) then
		_quest.weCompletedQuest = false;
		_quest.isQuestComplete = false;
		_quest.currentDesc = nil;
		_questDB.curDesc = nil;
		end
	end

	-- if desc doesn't match desc then complete quest
	-- or if name ~= name and no desc found
	if (script_getSpells.getSpellsStatus == 0) then
	if ((GetNumQuestLogEntries() ~= 0 and _questDB.curDesc ~= _quest.currentDesc and self.currentType ~= 99) or (GetNumQuestLogEntries() ~= 0 and _questDB.curListQuest ~= self.currentQuest and self.currentType ~= 99)) and self.autoComplete then
		if IsMoving() then
			StopMoving();
			return true;
		end
		if (_questDB:turnOldQuestCompleted()) then
			self.message = "Completing previous quests in list";
			--_quest:setTimer(500)
		return;
		end
	end
	end

_questCheckQuestCompletion:checkQuestForCompletion(); if self.currentQuest ~= nil and self.isQuestComplete and (not IsInCombat()) then if _questDBReturnQuest:returnAQuest() then self.message = "Returning quest!"; return true; end end

	-- set our current quest
	for y=0, _questDB.numQuests -1 do
		for i=0, GetNumQuestLogEntries()  do
			local questDescription, questObjectives = GetQuestLogQuestText();
			if _questDB.questList[y]['completed'] == "no" then
				if _questDB.questList[y]['questName'] ~= "nnil" then
					for i=0, GetNumQuestLogEntries()  do
						local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(i);

						if title == _questDB.questList[y]['questName'] then
							_quest.currentDesc = questObjectives; _quest.gossipOption = _questDB.questList[i]['gossipOption'];
							self.currentQuest = title;
							self.weHaveQuest = true;
						end
					end
				end	
			end
		end
	end

	--get a quest giver to obtain a quest from
	local curQuestGiver = nil; local curQuestName = nil; local distToGiver = 0; local distToGrind = 0; local px, py, pz = GetLocalPlayer():GetPosition();
		-- SET MARKERS / AUTO PATH NODES WHEN AN ENEMY IS KILLED FOR NEW SELF.GRIND X,Y,Z - COUNT TARGETS AROUND AND CHANGE PATHS ACCORDINGLY?
curQuestGiver = _questDB:getQuestGiverName(); curQuestName = _questDB:getQuestName();
self.curQuestX, self.curQuestY, self.curQuestZ = _questDB:getQuestStartPos();
distToGiver = GetDistance3D(px, py, pz, self.curQuestX, self.curQuestY, self.curQuestZ); distToGrind = GetDistance3D(px, py, pz, self.curGrindX, self.curGrindY, self.curGrindZ)
if (not self.grindSpotReached) then
self.curGrindX, self.curGrindY, self.curGrindZ = _questDB:getQuestGrindPos();
end

	--need to recheck before bot gets into movement phase...
	if GetNumQuestLogEntries() > 0 then if _questDB:turnOldQuestCompleted() then _quest:setTimer(550); return true; end end
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
			_quest:setTimer(2000);
			curQuestGiver = GetTarget(); if (GetTarget() ~= nil) and (GetTarget() ~= 0) then if (GetTarget():UnitInteract()) then _quest:setTimer(2000);
			if (AcceptQuest()) then local questDescription, questObjectives = GetQuestLogQuestText(); self.currentQuest = curQuestName; self.currentDesc = questObjectives;
						else
						SelectGossipAvailableQuest(_quest.gossipOption); SelectAvaialbleQuest(_quest.gossipOption); SelectActiveQuest(_quest.gossipOption); end	 end end end end

	if self.currentType == 3 and not IsInCombat() and (self.curGrindX ~= 0) and not self.isQuestComplete then
		if distToGrind <= 5 then UseItem(self.usingItem) return true;
			elseif distToGrind > 5 then if script_navEX:moveToTarget(GetLocalPlayer(), self.curGrindX, self.curGrindY, self.curGrindZ) then self.message = "Type quest == 3"; if not IsMoving() then Move(self.curQuestX, self.curQuestY, self.curQuestZ) end return true; end return true;
		end	
	end
	-- gather quest object
	if self.currentType == 2 and not IsInCombat() then if _questDBGather:run() then self.message = "Gathering quest item - ".._questDBGather.gatheringTarget:GetUnitName()..""; return true; end end
	-- get a target
	if (self.currentQuest ~= nil and self.curGrindX ~= 0 and self.grindSpotReached) or (IsInCombat()) or (not IsInCombat() and script_grind.lootObj == nil and self.grindSpotReached) then if (self.enemyTarget == nil) and (not self.isQuestComplete) then self.enemyTarget = _questDBTargets:getTarget(); end end
	-- we have a quest so go to grind spot
	if self.curGrindX ~= 0 and (not self.grindSpotReached) and (distToGrind > 50) and (self.currentQuest ~= nil) and not IsInCombat() and (not self.isQuestComplete) then
		self.message = "Moving to grind spot";
		script_navEX:moveToTarget(GetLocalPlayer(), self.curGrindX, self.curGrindY, self.curGrindZ);
			return true;
	
	end
	-- run grinder until we get a quest
	if _questDB.curListQuest == nil then self.message = "No quest or no quest in level range in DB! Going to grind..."; self.message = script_grind.message; script_grind:run(); script_grind.pause = false; return true; elseif not script_grind.pause then script_grind.pause = true; end end

function _quest:runRest() if _questRunRest:runRest() then return true; end end