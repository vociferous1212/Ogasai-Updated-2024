_quest = {

	-- if we have a quest and are out of level range in DB it doesn't find a grind spot? something...

	message = "Quester", usingQuester = false, pause = true, isSetup = false, waitTimer = 0, tickRate = 1, currentQuest = nil, enemyTarget = nil, targetKilledNum = 0, targetKilledNum2 = 0, targetKilledNum3 = 0, gatheredNum = 0, gatheredNum2 = 0, isQuestComplete = false, needRest = false, grindSpotReached = false, curGrindX = 0, curGrindY = 0, curGrindz = 0, curQuestX = 0, curQuestY = 0, curQuestZ = 0, weHaveQuest = fasle, autoComplete = true, currentDesc = nil, returningQuest = false, xp = 0, currentType = nil, usingItem = nil, gossipOption = nil, distToGrindFromHotspot = 350, currentMapID = 0,

	includeAllFilesIncluded = include("scripts\\quester\\_questIncludeFiles.lua"),

}
function _quest:draw() end
function _quest:window() _questWindow:window(); end
function _quest:setTimer(miliSeconds) self.waitTimer = GetTimeEX() + miliSeconds; end
function _quest:setup()
	if not _questIncludeFiles.isSetup then _questIncludeFiles:setup() end
	script_grind:setup(); script_talent:setup(); script_gather:setup(); if GetLocalPlayer():GetLevel() < 10 then script_grind.getSpells = true; end script_vendor:setup(); vendorDB:setup(); vendorDB:loadDBVendors(); if (not _questDB.isSetup) then _questDB:setup(); end
	_questDBGather.waitTimer = GetTimeEX(); script_helper:setup(); self.usingQuester = true; if GetNumQuestLogEntries() == 0 or GetNumQuestLogEntries() == nil then self.autoComplete = false; self.weHaveQuest = false; self.isQuestComplete = false; end
	_questEX.jumpTimer = GetTimeEX(); _questEX.breathTimer = GetTimeEX(); _questEX2.checkBagTimer = GetTimeEX(); _questEX.standingInFireTimer = GetTimeEX();
	self.xp = UnitXP("Player"); _questDBReturnQuest.waitTimer = GetTimeEX(); _questDoCombat.waitTimer = GetTimeEX(); _questDoCombat.blacklistTimer = GetTimeEX(); _questDoCombat.targetingTimer = GetTimeEX(); self.waitTimer = GetTimeEX(); self.isSetup = true; end

-- run the quester
function _quest:run()
local localObj = GetLocalPlayer();
	_quest:window();
	script_drawStatusEX:drawSetup();
	if (script_grind.showOM) then EndWindow(); GetObjectsAroundMe(); end
	if (script_radar.showRadar) then script_radar:draw() end
	if (script_grind.useExpChecker) and (IsInCombat()) then script_expChecker:menu(); end
	-- draw chests
	if (script_grind.drawChests) then script_gather:drawChestNodes(); end
	-- draw fishing pools
	if (script_gatherEX.drawFishingPools) then script_gatherEX:drawFishNodes(); end
	if _questEX:doStartChecks() then return; end
	if (self.pause) then script_grind.pause = true; _questDoCombat.blacklistTimer = GetTimeEX() + 10000; return; end
	--if not script_grind.pause then script_grind:run(); end
	-- handle vendor stuff through vendor scripts
	if script_grind.pause and (not IsInCombat()) and (_questEX.bagsFull or script_vendor.status > 0) and (not GetLocalPlayer():IsDead()) then local vendorStatus = script_vendor:getStatus(); if (vendorStatus > 0) then _questHandleVendor:vendor(); return true; elseif (vendorStatus == 0) then _questEX.bagsFull = false; end
		if (vendorStatus == 0) then script_vendor:sell(); return true; end return true; end
	if (self.waitTimer + (self.tickRate * 1000) > GetTimeEX()) and script_grind.pause then return; end
	
	if IsChanneling() or IsCasting() or GetLocalPlayer():IsStunned() then if PlayerHasTarget() and not GetLocalPlayer():IsStunned() then GetTarget():FaceTarget(); end _quest:setTimer(500); return; end
	if (not self.isSetup) then _quest:setup(); end
	if script_grind.pause then
		if not script_grind.skipLooting and not _questEX.bagsFull and not IsLooting() then script_grind.lootObj = script_nav:getLootTarget(script_grind.findLootDistance); end
		if _questEX:doChecks() then if script_grind.lootObj ~= nil and not _questEX.bagsFull then if (not script_grind.isAnyTargetTargetingMe()) and (PlayerHasTarget() and not GetTarget():GetGUID() == script_grind.lootObj:GetGUID()) then ClearTarget(); end end return; end if script_grind.lootObj ~= nil and IsLooting() then return true; end
		if (script_grind.lootObj == nil and self.enemyTarget ~= nil) or IsInCombat() and not GetLocalPlayer():IsDead() and (not _quest.isQuestComplete or distToGiver ~= nil and distToGiver <= 20) then
			if IsCasting() or IsChanneling() then return true; end
			if IsInCombat() then self.tickRate = 1.5; elseif not IsInCombat() then self.tickRate = .3; end
			_questEX:doChecks(); _questDoCombat:doCombat(); return true; end end	
	_questDBTargets:killStuffAroundUs();
	-- if we have completed a quest then turn the quest complete in the DB and turn name to "nnil"
	if _quest.weCompletedQuest and _quest.isQuestComplete and GetNumQuestLogEntries() < 1 then

		-- remove quest from DB so we can continue with script
		if (_questDBHandleDB:turnQuestCompleted()) then
			self.tickRate = .3;
			-- reset variables
			_quest.weCompletedQuest = false;
			_quest.isQuestComplete = false;
			_quest.currentDesc = nil;
			_questDB.curDesc = nil;
		end
	end
	
	-- if desc doesn't match desc then complete quest or if name ~= name and no desc found
	if (script_getSpells.getSpellsStatus < 1) and distToGiver ~= nil and script_grind.pause and not IsLooting() then

		-- if we want to auto complete the quests
		if self.autoComplete and
			-- descriptions don't match then
			((GetNumQuestLogEntries() ~= 0 and _questDB.curDesc ~= _quest.currentDesc)
			or (GetNumQuestLogEntries() ~= 0 and _questDB.curListQuest ~= self.currentQuest)) then
				if IsMoving() then StopMoving(); return true; end
			-- turn the quest complete in the DB
			if (_questDBHandleDB:turnOldQuestCompleted()) then
				self.tickRate = .2;
				self.message = "Completing previous quests in list";
				_quest:setTimer(150)
			return;
			end
		end
	end

	_questCheckQuestCompletion:checkQuestForCompletion(); self.tickRate = .3;

	-- return a completed quest to quest return target
	if self.currentQuest ~= nil and self.isQuestComplete and not IsLooting() and not IsCasting() and not IsChanneling() then
		if _questDBReturnQuest:returnAQuest() then
			self.enemyTarget = nil;
			self.message = "Returning quest!";
		return true;
		end
	end
	-- set our current quest
	_questSetQuest:setOurCurrentQuest();


	if self.currentType == 10 and ((not script_getSpells:cityZones() and self.usingItem == 0) or (self.currentMapID ~= GetMapID() and self.usingItem ~= 0)) then script_goToFP:run() return true; end


	--get a quest giver to obtain a quest from
local curQuestGiver = nil; local curQuestName = nil; local distToGiver = 0; local distToGrind = 0; local px, py, pz = GetLocalPlayer():GetPosition(); curQuestGiver = _questDB:getQuestGiverName(); curQuestName = _questDB:getQuestName(); self.curQuestX,  self.curQuestY, self.curQuestZ = _questDB:getQuestStartPos(); distToGiver = GetDistance3D(px, py, pz, self.curQuestX, self.curQuestY, self.curQuestZ); distToGrind = GetDistance3D(px, py, pz, self.curGrindX, self.curGrindY, self.curGrindZ);
	if (not self.grindSpotReached) then self.curGrindX, self.curGrindY, self.curGrindZ = _questDB:getQuestGrindPos(); end

	if GetNumQuestLogEntries() > 0 and _questDB.curDesc ~= _quest.currentDesc then

		if _questDBHandleDB:turnOldQuestCompleted() then self.tickRate = .2; _quest:setTimer(150); return true; end end
	
if script_grind.gather and not _quest.isQuestComplete and not IsInCombat() and not _questEX.bagsFull and not GetLocalPlayer():IsDead() then if script_gatherRun:gather() then _quest.message =  'Gathering ' .. script_gather:currentGatherName() .. ' ' ..script_gather.messageToGrinder..""; return true; end end

	-- grind spot reached distance
	if (distToGrind <= 80) and not self.grindspotReached then
		self.grindSpotReached = true;
	end
	-- move back to grind spot when distance reached
	if (distToGrind >= self.distToGrindFromHotspot) and self.grindSpotReached then
		self.grindSpotReached = false;
	end
if PlayerHasTarget() and GetTarget():GetUnitName() == curQuestGiver then distToGiver = GetTarget():GetDistance(); end
	if (distToGiver <= 4) and (self.currentQuest == nil) then
		if curQuestGiver ~= nil then TargetByName(curQuestGiver); _quest:setTimer(2000); curQuestGiver = GetTarget(); if (GetTarget() ~= nil) and (GetTarget() ~= 0) then if (GetTarget():UnitInteract()) then _quest:setTimer(2000); if GetTarget() == nil then StopMoving(); return; end
					if (AcceptQuest()) then
						local questDescription, questObjectives = GetQuestLogQuestText(1);
						self.currentQuest = curQuestName;
						self.currentDesc = questObjectives;
						_questDB.curDesc = questObjectives;
					else
						SelectGossipAvailableQuest(_quest.gossipOption);
						SelectAvailableQuest(_quest.gossipOption);
					end end end end return; end
	-- move to quest giver to get quest
	if (self.curQuestX ~= 0) and (distToGiver > 4) and (self.currentQuest == nil) and ((script_grind.lootObj == nil and not script_grindEX.bagsFull) or (script_grind.lootObj ~= nil and script_grind.skipLooting) or (script_grind.lootObj ~= nil and _questEX.bagsFull) or (script_grind.lootObj == nil and not script_grind.skipLooting) or script_grind.lootObj ~= nil) then
		script_navEX:moveToTarget(GetLocalPlayer(), self.curQuestX, self.curQuestY, self.curQuestZ); self.message = "Retrieving a quest, "..math.floor(distToGiver).." (yd)"; if not IsMoving() then Move(self.curQuestX, self.curQuestY, self.curQuestZ); end return true; end
	if self.currentType ~= 1 and self.currentType ~= 2 and not IsInCombat() and (self.curGrindX ~= 0) and not self.isQuestComplete and not IsLooting() then
		if _questDoOtherQuestTypes() then return true; end end	
	-- gather quest object
	if self.currentType == 2 and not IsInCombat() then if _questDBGather:run() then self.message = "Gathering quest item - ".._questDBGather.gatheringTarget:GetUnitName()..", "..math.floor(_questDBGather.gatheringTarget:GetDistance()).." (yd)"; return true; end end
	-- get a target
	if not GetLocalPlayer():IsDead() and  not self.needRest and GetTimeEX() > _questDoCombat.targetingTimer and (self.currentQuest ~= nil and self.curGrindX ~= 0 and self.grindSpotReached and self.currentType ~= 3 and self.currentType ~= 4 and self.currentType ~= 5 and self.currentType ~= 11)
		or (IsInCombat())
		or (not IsInCombat() and script_grind.lootObj == nil and self.grindSpotReached and self.currentType ~= 3 and self.currentType ~= 4 and self.currentType ~= 5 and self.currentType ~= 11) then
	if (self.enemyTarget == nil) and (not self.isQuestComplete) then self.enemyTarget = _questDBTargets:getTarget(); end end
	-- we have a quest so go to grind spot
	if self.curGrindX ~= 0 and self.currentQuest ~= nil and not IsInCombat() and not self.isQuestComplete and not IsLooting() and (script_grind.lootObj == nil or script_grind.skipLooting) then
		if (distToGrind > 80 and self.currentType ~= 3 and self.currentType ~= 4 and not self.grindSpotReached) or (self.currentType == 3 or self.currentType == 4 or self.curentType == 5 and distToGrind > 5) then
			if self.currentType ~= 3 and self.currentType ~= 4 and self.currentType ~= 5 and not self.isQuestComplete and self.enemyTarget == nil then
			end
			self.message = "Moving to grind spot";
			script_navEX:moveToTarget(GetLocalPlayer(), self.curGrindX, self.curGrindY, self.curGrindZ);
			if not IsMoving() then Move(self.curGrindX, self.curGrindY, self.curGrindZ); end return true; end end end
function _quest:runRest() if _questRunRest:runRest() then return true; end end