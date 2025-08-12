_quest = {
	message = "Quester",
	usingQuester = false,
	pause = true,
	isSetup = false,
	waitTimer = 0,
	tickRate = 1,
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
	distToGrindFromHotspot = 200,
	currentMapID = 0, killStuffOnRoute = true,
	curQuestGiver = nil,
	curQuestName = nil,
	distToGiver = 0,
	distToGrind = 0,
	includeAllFilesIncluded = include("scripts\\quester\\_questIncludeFiles.lua"),
}

function _quest:draw() end

function _quest:window() _questWindow:window(); end

function _quest:setTimer(miliSeconds) self.waitTimer = GetTimeEX() + miliSeconds; end

function _quest:setup() if not _questSetup.isSetup then _questSetup:run() end end

-- run the quester
function _quest:run()

local localObj = GetLocalPlayer();

	_quest:window();

	script_drawStatusEX:drawSetup();

	if (script_grind.showOM) then EndWindow(); GetObjectsAroundMe(); end

	if (script_radar.showRadar) then script_radar:draw() end

	if (script_grind.useExpChecker) and (IsInCombat()) then script_expChecker:menu(); end

	if (script_grind.drawChests) then script_gather:drawChestNodes(); end

	if (script_gatherEX.drawFishingPools) then script_gatherEX:drawFishNodes(); end

	if _questEX:doStartChecks() then return; end

	if (self.pause) then script_grind.pause = true; _questDoCombat.blacklistTimer = GetTimeEX() + 10000; return; end

	if script_grind.pause and (not IsInCombat()) and (_questEX.bagsFull or script_vendor.status > 0) and (not GetLocalPlayer():IsDead()) then
		local vendorStatus = script_vendor:getStatus();
		if (vendorStatus > 0) then
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
	
	if IsChanneling() or IsCasting() or GetLocalPlayer():IsStunned() then
		if PlayerHasTarget() and not GetLocalPlayer():IsStunned() then 
			GetTarget():FaceTarget();
		end
		_quest:setTimer(500);
	return;
	end

	if (not self.isSetup) then _quest:setup(); end

	if script_grind.pause then

		if not script_grind.skipLooting and not _questEX.bagsFull and not IsLooting() then
			script_grind.lootObj = script_nav:getLootTarget(script_grind.findLootDistance);
		end

		if _questEX:doChecks() then
			if script_grind.lootObj ~= nil and not _questEX.bagsFull then
				if not IsInCombat() and (not script_grind.isAnyTargetTargetingMe()) and (PlayerHasTarget() and not GetTarget():GetGUID() == script_grind.lootObj:GetGUID()) then
					ClearTarget();
				end
			end
		return;
		end
		
		if script_grind.lootObj ~= nil and IsLooting() then
			return true;
		end

		if (script_grind.lootObj == nil and self.enemyTarget ~= nil) or IsInCombat() and not GetLocalPlayer():IsDead() and (not _quest.isQuestComplete or self.distToGiver ~= nil and self.distToGiver <= 20) then
			if IsCasting() or IsChanneling() then
				return true;
			end

			if self.enemyTarget ~= 0 and self.enemyTarget ~= nil and self.enemyTarget:IsDead() then
				script_grind.monsterKillCount = script_grind.monsterKillCount + 1;
				self.enemyTarget = nil
			end

			if IsInCombat() then
				self.tickRate = 1.5;
			elseif not IsInCombat() then
				self.tickRate = .3;
			end

			_questEX:doChecks();
			_questDoCombat:doCombat();
		return true;
		end
	end

			-- kill stuff on way to quest objectives
			if GetNumQuestLogEntries() ~= nil and self.killStuffOnRoute and not IsSwimming() then _questDBTargets:killStuffAroundUs(); end
	if IsInCombat() and IsLooting() then LootTarget(); end

	if _quest.weCompletedQuest and _quest.isQuestComplete and GetNumQuestLogEntries() < 1 then
		if (_questDBHandleDB:turnQuestCompleted()) then
			self.tickRate = .3;
			-- reset variables
			_quest.weCompletedQuest = false;
			_quest.isQuestComplete = false;
			_quest.currentDesc = nil;
			_questDB.curDesc = nil;
			_questEX2.flipVendor = true;
		end
	end
	
	_questSortCurrentQuest:run();

if self.currentType == 10 and _quest.currentQuest ~= nil and ((not script_getSpells:cityZones() and self.usingItem == 0) or (self.currentMapID ~= GetMapID() and self.usingItem ~= 0)) then script_goToFP:run() return true; end

	_questCheckQuestCompletion:checkQuestForCompletion(); self.tickRate = .3;

	-- return a completed quest to quest return target
	if self.currentQuest ~= nil and self.isQuestComplete and not IsLooting() and not IsCasting() and not IsChanneling() and script_grind.lootObj == nil then
		if _questDBReturnQuest:returnAQuest() then
			self.enemyTarget = nil;
			self.message = "Returning quest!";
		return true;
		end
	end
	-- set our current quest
	_questSetQuest:setOurCurrentQuest();

	_questGetQuestGiver:run()

if (not self.grindSpotReached) then self.curGrindX, self.curGrindY, self.curGrindZ = _questDB:getQuestGrindPos(); end

	if GetNumQuestLogEntries() > 0 and _questDB.curDesc ~= _quest.currentDesc then

		if _questDBHandleDB:turnOldQuestCompleted() then self.tickRate = .2; _quest:setTimer(150); return true; end end
	
if script_grind.gather and not _quest.isQuestComplete and not IsInCombat() and not _questEX.bagsFull and not GetLocalPlayer():IsDead() then if script_gatherRun:gather() then _quest.message =  'Gathering ' .. script_gather:currentGatherName() .. ' ' ..script_gather.messageToGrinder..""; return true; end end

	-- grind spot reached distance
	if (self.distToGrind <= 40) and not self.grindspotReached then
		self.grindSpotReached = true;
	end
	-- move back to grind spot when distance reached
	if (self.distToGrind >= self.distToGrindFromHotspot) and self.grindSpotReached then
		self.grindSpotReached = false;
	end

	_questAcceptQuest:run()

	_questRetrieveQuest:run()

	_questMoveToGrindSpot:run()
 end
function _quest:runRest() if _questRunRest:runRest() then return true; end end