_quest = {

	-- if we have a quest and are out of level range in DB it doesn't find a grind spot? something...

	message = "Quester", usingQuester = false, pause = true, isSetup = false, waitTimer = 0, tickRate = 1, currentQuest = nil, enemyTarget = nil, targetKilledNum = 0, targetKilledNum2 = 0, targetKilledNum3 = 0, gatheredNum = 0, gatheredNum2 = 0, isQuestComplete = false, needRest = false, grindSpotReached = false, curGrindX = 0, curGrindY = 0, curGrindz = 0, curQuestX = 0, curQuestY = 0, curQuestZ = 0, weHaveQuest = fasle, autoComplete = true, currentDesc = nil, returningQuest = false, xp = 0, currentType = nil, usingItem = nil, gossipOption = nil, distToGrindFromHotspot = 350;

	includeAllFilesIncluded = include("scripts\\quester\\_questIncludeFiles.lua"),

}

-- for some reason the .dll requires it to be named draw() without an error...
function _quest:draw() end

-- draw the window
function _quest:window()
	_questWindow:window();
end

function _quest:setTimer(miliSeconds)
	self.waitTimer = GetTimeEX() + miliSeconds;
end

--run setup
function _quest:setup()

	if not _questIncludeFiles.isSetup then
		_questIncludeFiles:setup()
	end
	script_grind:setup(); script_talent:setup(); script_gather:setup(); script_grind.getSpells = true; 	script_vendor:setup(); vendorDB:setup(); vendorDB:loadDBVendors();
	if (not _questDB.isSetup) then
		_questDB:setup();
	end
	_questDBGather.waitTimer = GetTimeEX(); script_helper:setup(); self.usingQuester = true; if GetNumQuestLogEntries() == 0 or GetNumQuestLogEntries() == nil then self.autoComplete = false; self.weHaveQuest = false; self.isQuestComplete = false; end

	self.xp = UnitXP("Player"); _questDBReturnQuest.waitTimer = GetTimeEX(); _questDoCombat.waitTimer = GetTimeEX(); _questDoCombat.blacklistTimer = GetTimeEX(); _questDoCombat.targetingTimer = GetTimeEX(); self.waitTimer = GetTimeEX(); self.isSetup = true; end

-- run the quester
function _quest:run()

	-- show quester window
	_quest:window();

	-- show info on screen
	script_drawStatusEX:drawSetup();

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

	-- do other checks that happen when the bot is paused or unpaused
	if _questEX:doStartChecks() then
		return;
	end
	
	-- return if we pause bot
	if (self.pause) then
		script_grind.pause = true;
		_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
		return;
	end

	-- handle vendor stuff through vendor scripts
	if script_grind.pause and (not IsInCombat()) and (_questEX.bagsFull or script_vendor.status > 0) and (not GetLocalPlayer():IsDead()) then

		local vendorStatus = script_vendor:getStatus();

		if (vendorStatus > 1) then
			_questHandleVendor:vendor();
			return true;
		elseif (vendorStatus == 0) then
			_questEX.bagsFull = false;
		end

		if (vendorStatus == 0) then
			script_vendor:sell();
			return true;
		end

	return true;
	end

	if (self.waitTimer + (self.tickRate * 1000) > GetTimeEX()) and script_grind.pause then return; end

	if IsChanneling() or IsCasting() then return; end
	
	-- run setup function once
	if (not self.isSetup) then _quest:setup(); end

	-- if we are not running the grinder then do this stuff
	if script_grind.pause then

		-- get loot target 
		if not script_grind.skipLooting and not _questEX.bagsFull then script_grind.lootObj = script_nav:getLootTarget(script_grind.findLootDistance); end

		-- do quester script checks
		if _questEX:doChecks() then if script_grind.lootObj ~= nil and not _questEX.bagsFull then if (not script_grind.isAnyTargetTargetingMe()) and (PlayerHasTarget() and not GetTarget():GetGUID() == script_grind.lootObj:GetGUID()) then ClearTarget(); end end return; end
	
		-- do quester script combat routine
		if (script_grind.lootObj == nil and self.enemyTarget ~= nil) or IsInCombat() and not GetLocalPlayer():IsDead() then

			-- run combat routine on a good target
			_questDoCombat:doCombat();

			-- move away from adds if we can
			if GetLocalPlayer():GetLevel() > 5 then
				if script_checkAdds:checkAdds() then
					return;
				end
			end
		return true;
		end
	end

	-- run edge case quest with their own navigation and targeting arguments
	if self.currentType == 99 and not self.isQuestComplete and GetNumQuestLogEntries() > 0 then

		self.message = "Edge case quest... doing specific routine";

		-- run the quest script
		_questEdgeCaseQuest:run()

		return true;

	-- else if the quest is complete then turn it complete and continue
	elseif self.currentType == 99 and self.isQuestComplete and GetNumQuestLogEntries() == 0 then

		-- turn the quest complete and continue
		_questDB:turnQuestCompleted();
		self.currentType = 0;
	end 

	-- if we have completed a quest then turn the quest complete in the DB and turn name to "nnil"
	if _quest.weCompletedQuest and _quest.isQuestComplete and GetNumQuestLogEntries() < 1 then

		-- remove quest from DB so we can continue with script
		if (_questDB:turnQuestCompleted()) then
			self.tickRate = .3;
			-- reset variables
			_quest.weCompletedQuest = false;
			_quest.isQuestComplete = false;
			_quest.currentDesc = nil;
			_questDB.curDesc = nil;
		end
	end
	
	-- if desc doesn't match desc then complete quest or if name ~= name and no desc found
	-- our quest doesn't match DB quest...
	if (script_getSpells.getSpellsStatus == 0) and script_grind.pause then

		-- if we want to auto complete the quests
		if self.autoComplete and

			-- descriptions don't match then
			(
			(GetNumQuestLogEntries() ~= 0 and _questDB.curDesc ~= _quest.currentDesc and self.currentType ~= 99)

			-- or

			--quest names don't match then
			or (GetNumQuestLogEntries() ~= 0 and _questDB.curListQuest ~= self.currentQuest and self.currentType ~= 99)
			) then

				if IsMoving() then
					StopMoving();
					return true;
				end

			-- turn the quest complete in the DB
			if (_questDB:turnOldQuestCompleted()) then
				self.tickRate = .3;
				self.message = "Completing previous quests in list";
				_quest:setTimer(250)
			return;
			end
		end
	end

	-- do check to see if our quest is complete or not
	_questCheckQuestCompletion:checkQuestForCompletion();

	
	self.tickRate = 1;

	-- return a completed quest to quest return target
	if self.currentQuest ~= nil and self.isQuestComplete and (not IsInCombat()) and not IsLooting() then

		-- run return quest script
		if _questDBReturnQuest:returnAQuest() then
			self.message = "Returning quest!";
		return true;
		end
	end
	-- set our current quest
	_questSetQuest:setOurCurrentQuest();
	--get a quest giver to obtain a quest from
	local curQuestGiver = nil;
	local curQuestName = nil;
	local distToGiver = 0;
	local distToGrind = 0;
	local px, py, pz = GetLocalPlayer():GetPosition();
curQuestGiver = _questDB:getQuestGiverName();
curQuestName = _questDB:getQuestName();
self.curQuestX, self.curQuestY, self.curQuestZ = _questDB:getQuestStartPos();
distToGiver = GetDistance3D(px, py, pz, self.curQuestX, self.curQuestY, self.curQuestZ);
distToGrind = GetDistance3D(px, py, pz, self.curGrindX, self.curGrindY, self.curGrindZ);

	if (not self.grindSpotReached) then
		self.curGrindX, self.curGrindY, self.curGrindZ = _questDB:getQuestGrindPos();
	end

	-- remove old quest entries from table / completed quests
	--need to recheck before bot gets into movement phase...
	if GetNumQuestLogEntries() > 0 and _questDB.curDesc ~= _quest.currentDesc then

		-- turn quests as complete in DB
		if _questDB:turnOldQuestCompleted() then

			_quest:setTimer(250);

		return true;
		end
	end

	-- grind spot reached distance
	if (distToGrind <= 80) and not self.grindspotReached then
		self.grindSpotReached = true;
	end
	-- move back to grind spot when distance reached
	if (distToGrind >= self.distToGrindFromHotspot) and self.grindSpotReached then
		self.grindSpotReached = false;
	end
if PlayerHasTarget() and GetTarget():GetUnitName() == curQuestGiver then distToGiver = GetTarget():GetDistance(); end
-- interact with quest givers
	if (distToGiver <= 4) and (self.currentQuest == nil) then
		if curQuestGiver ~= nil then TargetByName(curQuestGiver); _quest:setTimer(2000); curQuestGiver = GetTarget(); if (GetTarget() ~= nil) and (GetTarget() ~= 0) then if (GetTarget():UnitInteract()) then _quest:setTimer(2000);
					if (AcceptQuest()) then
						local questDescription, questObjectives = GetQuestLogQuestText();
						self.currentQuest = curQuestName;
						self.currentDesc = questObjectives;
						_questDB.curDesc = questObjectives;
					else
						SelectGossipAvailableQuest(_quest.gossipOption);
						SelectAvailableQuest(_quest.gossipOption);
					end
				end 
			end 
		end
		return;
	end
	-- move to quest giver to get quest
	if (self.curQuestX ~= 0) and (distToGiver > 4) and (self.currentQuest == nil) then

		-- move to quest return target location
		script_navEX:moveToTarget(GetLocalPlayer(), self.curQuestX, self.curQuestY, self.curQuestZ);

		self.message = "Retrieving a quest, "..math.floor(distToGiver).." (yd)";

		-- bot gets stuck for some reason. navEX problem?
		if not IsMoving() then
			Move(self.curQuestX, self.curQuestY, self.curQuestZ);
		end

	return true;
	end

	if self.currentType == 3 or self.currentType == 4 or self.currentType == 5 and not IsInCombat() and (self.curGrindX ~= 0) and not self.isQuestComplete and not IsLooting() then

		if _questDoOtherQuestTypes() then
			return true;
		end
	end
		
	-- gather quest object
	if self.currentType == 2 and not IsInCombat() then if _questDBGather:run() then self.message = "Gathering quest item - ".._questDBGather.gatheringTarget:GetUnitName()..""; return true; end end

	-- get a target
	if (self.currentQuest ~= nil and self.curGrindX ~= 0 and self.grindSpotReached and self.currentType ~= 3 and self.currentType ~= 4 and self.currentType ~= 5)
		or (IsInCombat())
		or (not IsInCombat() and script_grind.lootObj == nil and self.grindSpotReached and self.currentType ~= 3 and self.currentType ~= 4 and self.currentType ~= 5) then
	if (self.enemyTarget == nil) and (not self.isQuestComplete) then self.enemyTarget = _questDBTargets:getTarget(); end end

	-- we have a quest so go to grind spot
	if self.curGrindX ~= 0 and self.currentQuest ~= nil and not IsInCombat() and not self.isQuestComplete and not IsLooting() and (script_grind.lootObj == nil or script_grind.skipLooting) then
		if (distToGrind > 80 and self.currentType ~= 3 and self.currentType ~= 4 and not self.grindSpotReached) or (self.currentType == 3 or self.currentType == 4 or self.curentType == 5 and distToGrind > 5) then
			if self.currentType ~= 3 and self.currentType ~= 4 and self.currentType ~= 5 and not self.isQuestComplete and self.enemyTarget == nil then
				if distToGiver > 20 then
				_questDBTargets:getTarget();
				else if PlayerHasTarget() and GetTarget():CanAttack() then ClearTarget(); end end
			end
	
			self.message = "Moving to grind spot";
	
			script_navEX:moveToTarget(GetLocalPlayer(), self.curGrindX, self.curGrindY, self.curGrindZ);
			
			if not IsMoving() then
			
				Move(self.curGrindX, self.curGrindY, self.curGrindZ);
	
			end
		return true;
		end
	end

	-- run grinder until we get a quest
	if _questDB.curListQuest == nil then self.message = "No quest or no quest in level range in DB! Going to grind..."; self.message = script_grind.message; script_grind:run(); script_grind.pause = false; return; elseif not script_grind.pause then script_grind.pause = true; end end

function _quest:runRest() if _questRunRest:runRest() then return true; end end