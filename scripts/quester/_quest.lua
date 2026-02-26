_quest = {
	message = "Quester",
	usingQuester = false,
	pause = true,
	isSetup = false,
	waitTimer = GetTimeEX(),
	tickRate = .5,
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
	currentMapID = 0,
	killStuffOnRoute = true,
	curQuestGiver = nil,
	curQuestName = nil,
	distToGiver = 0,
	distToGrind = 0,
	unstuckTimer = 0,
	lootTimer = GetTimeEX(),
	faceTargetTimer = GetTimeEX(),
	deletememessage = false,

	includeAllFilesIncluded = include("scripts\\quester\\_questIncludeFiles.lua"),
}

function _quest:draw()
end

function _quest:window()
	_questWindow:window();
end

function _quest:setTimer(miliSeconds)
	self.waitTimer = GetTimeEX() + miliSeconds;
end

function _quest:setup()
	if not _questSetup.isSetup then
		_questSetup:run()
	end
end

-- run the quester
function _quest:run()

local localObj = GetLocalPlayer();

	_quest:window();

	script_drawStatusEX:drawSetup(); 

	if (script_radar.showRadar) then
		script_radar:draw()
	end

	if (script_grind.useExpChecker) then
		script_expChecker:menu();
	end

	if (script_grind.drawChests) then
		script_gather:drawChestNodes();
	end

	if (script_gatherEX.drawFishingPools) then
		script_gatherEX:drawFishNodes();
	end


--[[


--]]

if self.enemyTarget ~= 0 and self.enemyTarget ~= nil then
	if IsInCombat() and not script_grind:isTargetingMe(self.enemyTarget) and self.enemyTarget:GetHealthPercentage() >= 99 and not IsCasting() and not IsChanneling() then
		self.enemyTarget = nil;
		ClearTarget();
	end
end

-- assign target is not working while in combat???
	if self.enemyTarget == nil or self.enemyTarget == 0 and IsInCombat() then
		if PlayerHasTarget() then
			if not GetTarget():IsDead() and GetTarget():CanAttack() then
				self.enemyTarget = GetTarget();
			end
		end
	end

	-- move away from additional targets in combat
		if IsInCombat() and self.enemyTarget ~= 0 and self.enemyTarget ~= nil then
			if self.enemyTarget:GetHealthPercentage() >= 25 and not script_checkDebuffs:hasDisabledMovement() then
				if script_checkAdds:checkAdds() then
					script_om:FORCEOM();
				return;
				end
			end
		end

		-- flee combat if PlayerHealth() and PlayerMana() are low, or being attacking by too many targets
		-- mainly for hardcore
	if not self.pause and IsInCombat() and grind2FleeCombat.fleeCombat then 
		if grind2SaveCoordinates.numberOfLocations >= 3 and PlayerLevel() >= 6 and not Player():IsDead() then
			if (grind2FleeCombat.healthToFlee >= PlayerHealth() and grind2FleeCombat.manaToFlee >= PlayerMana()) or (NumberTargetsAttackingPlayer() >= 2 and grind2FleeCombat.fleeWithAdds) then
				grind2FleeCombat:run();
				self.message = "Fleeing combat";
				self.enemyTarget = nil;
				if PlayerHasTarget() then
					ClearTarget();
				end
				if IsCasting() then
					SpellStopCasting();
				end
				return;
			end
		end
	else
		-- last saved location is 1st go to location
		grind2SaveCoordinates.currentGoToLocation = grind2SaveCoordinates.numberOfLocations - 1;
	end

-- setup bot / do start checks
	if _questEX:doStartChecks() then
		return;
	end


--[[


--]]

-- return for any reason
	if _questDB.curListQuest == nil then
	--	coremenu:reload();
		if not self.deletememessage then
			DEFAULT_CHAT_FRAME:AddMessage("No quest found to run");
			self.deletememessage = true;
		end
		return;
	end
	if (self.pause) then
		self.usingQuester = false;
		script_grind.pause = true;
		_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
		script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);

	return;
	end



	self.usingQuester = true;

	if GetRealmName() == "Ashen Vanilla" then
		script_grind.combatScriptRange = script_grind.combatScriptRange + 1;
	end

	local r, g, b = 0, 0, 0;
	local y, x, width = 120, 25, 370;
	local tX, tY, onScreen = WorldToScreen(GetLocalPlayer():GetPosition());
	
	DrawText("Current Quest - _questDB", x+800, y+485, r+255, g+0, b+0);
	DrawText("".._questDB.curListQuest, x+800, y+500, r+255, g+0, b+0);

	if IsLooting() and GetTimeEX() > self.lootTimer then
		LootTarget();
		self.lootTimer = GetTimeEX() + 500;
	end

-- run vendor
	if script_grind.pause and (not IsInCombat()) and (_questEX.bagsFull or script_vendor.status > 0) and (not GetLocalPlayer():IsDead()) then
		local vendorStatus = script_vendor:getStatus();
		if (vendorStatus > 0) then
			_questHandleVendor:vendor();
			_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
			script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
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

-- face enemy target at all times
	if self.enemyTarget ~= 0 and self.enemyTarget ~= nil and PlayerHasTarget() and IsStanding() and not IsMoving() and not IsLooting() and Player():GetCasting() ~= 6487 then
		if self.enemyTarget:GetDistance() <= script_grind.combatScriptRange + 1 or ( (IsCasting() or (IsChanneling() and IsInCombat())) and ((PlayerHasTarget() and GetTarget():GetGUID() == self.enemyTarget:GetGUID()) or IsInCombat()) )  then
			if self.enemyTarget:IsInLineOfSight() and GetTimeEX() > self.faceTargetTimer then
				if not self.enemyTarget:FaceTarget() then
					self.faceTargetTimer = GetTimeEX() + 1000;
				end
			end
		end
	end


-- return for timer
	if ((self.waitTimer + self.tickRate * 1000) > GetTimeEX()) or self.pause then 
		return;
	end

-- reset jump timer
	if not IsMoving() then
		_questEX.jumpTimer = 6000;
	end

-- check unstuck
	if not self.pause and GetTimeEX() > self.unstuckTimer then
		if script_unstuck:checkUnstuck() then
			self.unstuckTimer = GetTimeEX() + 150;
		end
	end

-- check unstuck
	if (IsMoving()) and (not self.pause) and GetTimeEX() > self.unstuckTimer then
		if (not script_unstuck:pathClearAuto(2)) then
			self.unstuckTimer = GetTimeEX() + 250;
			script_unstuck:unstuck();
		end
	end

-- setup
	if (not self.isSetup) then
		_quest:setup();
	end

-- if skip looting then turn lootobj nil
		if not script_grind.skipLooting and not _questEX.bagsFull and not IsLooting() then
			script_grind.lootObj = script_nav:getLootTarget(script_grind.findLootDistance);
			if script_grind.lootObj == nil and HasSpell("Skinning") and script_grind.skinning and HasItem("Skinning Knife") then
				script_grind.lootObj = script_grind:getSkinTarget(script_grind.findLootDistance);
			end
		end

--[[


--]]

-- do questex checks
		if _questEX:doChecks() then
			if script_grind.lootObj ~= nil and not _questEX.bagsFull then
				--if not IsInCombat() and (not script_grind.isAnyTargetTargetingMe()) and (PlayerHasTarget() and not GetTarget():GetGUID() == script_grind.lootObj:GetGUID()) then
				--	ClearTarget();
				--end
			end
		return;
		end
		

--[[


--]]

if IsLooting() then
	_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
end

-- return for loot??
		if script_grind.lootObj ~= nil and IsLooting() then
			return;
		end


--[[


--]]
		if (script_grind.lootObj == nil and self.enemyTarget ~= nil) or IsInCombat() and not GetLocalPlayer():IsDead() and (not _quest.isQuestComplete or self.distToGiver ~= nil and self.distToGiver <= 20) then
			if IsCasting() or IsChanneling() then
				return true;
			end

			if self.enemyTarget ~= 0 and self.enemyTarget ~= nil and self.enemyTarget:IsDead() then
				script_grind.monsterKillCount = script_grind.monsterKillCount + 1;
				grind2SaveCoordinates:saveTargetsLocation(self.enemyTarget);
				self.enemyTarget = nil
			end

			if IsInCombat() then
				self.tickRate = 1;
			elseif not IsInCombat() then
				self.tickRate = .3;
			end

			_questEX:doChecks();

			if IsInCombat() or IsMoving() then
				script_grind.lootCheckTime = 10000;
				script_grind.lootCheck['timer'] = 0;
				script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
			end


--[[


--]]
-- run combat
			if self.enemyTarget ~= nil and self.enemyTarget ~= 0 and not IsAutoCasting("Attack") then
				self.enemyTarget:AutoAttack();
			end

			_questDoCombat:doCombat();

		return true;
		end




--[[

-- kill stuff on way to quest objectives
		if GetNumQuestLogEntries() ~= nil and self.killStuffOnRoute and not IsSwimming() then
			_questDBTargets:killStuffAroundUs();
		end

		-- recheck loot
		if IsInCombat() and IsLooting() then
			LootTarget();
		end




--]]

-- quest is complete
	if _quest.weCompletedQuest and _quest.isQuestComplete then
		for i=0, GetNumQuestLogEntries() do
			local questDescription, questObjectives = GetQuestLogQuestText(i);
			if questObjectives ~= _questDB.curDesc or GetNumQuestLogEntries() == 0 then

				if (_questDBHandleDB:turnQuestCompleted()) then
					self.tickRate = .3;
					_quest.weCompletedQuest = false;
					_quest.isQuestComplete = false;
					_quest.currentDesc = nil;
					_questDB.curDesc = nil;
					_questEX2.flipVendor = true;
				end
			end
		end
	end
	

--[[


--]]

-- sort current quest
	_questSortCurrentQuest:run();

--[[


--]]


-- run flight path quests
	if self.currentType == 10 and _quest.currentQuest ~= nil and ((not script_getSpells:cityZones() and self.usingItem == 0) or (self.currentMapID ~= GetMapID() and self.usingItem ~= 0)) then
		script_goToFP:run();
		return true;
	end


--[[


--]]


-- check for quest completion
	_questCheckQuestCompletion:checkQuestForCompletion();
	self.tickRate = .3;

--[[


--]]


	-- return a completed quest to quest return target
	if self.currentQuest ~= nil and self.isQuestComplete and not IsLooting() and not IsCasting() and not IsChanneling() and script_grind.lootObj == nil and not IsInCombat() then
		if (AreBagsFull()) then
			_questEX.bagsFull = true
			script_vendor.status = 1;
		end
		if not AreBagsFull() then
			if _questDBReturnQuest:returnAQuest() then
				self.enemyTarget = nil;
				self.message = "Returning quest!";
				_questAcceptQuest.noQuestTimer = GetTimeEX() + 7000;
			return true;
			end
		end
	end

--[[


--]]

-- sort current quest
	_questSetQuest:setOurCurrentQuest();


--[[


--]]


-- get quest giver
	_questGetQuestGiver:run()


--[[


--]]

	if (not self.grindSpotReached) then
		self.curGrindX, self.curGrindY, self.curGrindZ = _questDB:getQuestGrindPos();
	end

	if _questDB.curDesc ~= _quest.currentDesc then

		if _questDBHandleDB:turnOldQuestCompleted() then
			self.tickRate = 0;
			return true;
		end
	end
	
	if script_grind.lootObj == nil and script_grind.gather and not _quest.isQuestComplete and not IsInCombat() and not _questEX.bagsFull and not GetLocalPlayer():IsDead() then
		if script_gatherRun:gather() then
			_quest.message =  'Gathering ' .. script_gather:currentGatherName() .. ' ' ..script_gather.messageToGrinder.."";
		return true;
		end
	end

	if (self.distToGrind <= 40) and not self.grindspotReached then
		self.grindSpotReached = true;
	end
	-- move back to grind spot when distance reached
	if (self.distToGrind >= self.distToGrindFromHotspot) and self.grindSpotReached then
		self.grindSpotReached = false;
	end


--[[


--]]

-- accept a quest
	_questAcceptQuest:run()

--[[


--]]

-- retrieve a quest
	-- chase a moving target
	if _quest.distToGiver <= 5 then
		if GetTarget() == 0 or GetTarget() == nil then
			TargetByName(_quest.curQuestGiver);
		end
	end

	-- get the moving targets position
	if GetTarget() ~= nil and GetTarget() ~= 0 then
		if GetTarget():GetUnitName() == _quest.curQuestGiver then
			_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ = GetTarget():GetPosition();
			_quest.distToGiver = GetTarget():GetDistance();
		end
	end

	-- move to quest giver
	if (_quest.curQuestX ~= 0) and (_quest.distToGiver > 4) and (_quest.currentQuest == nil) and ((script_grind.lootObj == nil and not script_grindEX.bagsFull) or (script_grind.lootObj ~= nil and script_grind.skipLooting) or (script_grind.lootObj ~= nil and _questEX.bagsFull) or (script_grind.lootObj == nil and not script_grind.skipLooting) or script_grind.lootObj == nil) and not IsCasting() and not IsChanneling() then

		if not IsMoving() then
			Move(_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ);
			return true;
		end

		script_navEX:moveToTarget(GetLocalPlayer(), _quest.curQuestX, _quest.curQuestY, _quest.curQuestZ);
		_quest.message = "Retrieving a quest, "..math.floor(_quest.distToGiver).." (yd)";
		return true;
	end


--[[


--]]


-- move to grind spot
	if _quest.currentType ~= 1 and _quest.currentType ~= 2 and not IsInCombat() and not _quest.isQuestComplete and not IsLooting() then
		if _questDoOtherQuestTypes() then
			return true;
		end
	end	

	if _quest.currentType == 2 and not IsInCombat() and script_grind.lootObj == nil then
		if _questDBGather:run() then
			_quest.message = "Gathering quest item - ".._questDBGather.gatheringTarget:GetUnitName()..", "..math.floor(_questDBGather.gatheringTarget:GetDistance()).." (yd)";
			return true;
		end
	end

	if not GetLocalPlayer():IsDead() and not _quest.needRest and GetTimeEX() > _questDoCombat.targetingTimer and (_quest.currentQuest ~= nil and _quest.curGrindX ~= 0 and _quest.grindSpotReached and _quest.currentType ~= 3 and _quest.currentType ~= 4 and _quest.currentType ~= 5 and _quest.currentType ~= 11) or (IsInCombat()) or (not IsInCombat() and script_grind.lootObj == nil and _quest.grindSpotReached and _quest.currentType ~= 3 and _quest.currentType ~= 4 and _quest.currentType ~= 5 and _quest.currentType ~= 11) then
		if (_quest.enemyTarget == nil) and (not _quest.isQuestComplete) then
			_quest.enemyTarget = _questDBTargets:getTarget();
		end
	end

	-- we have a quest so go to grind spot
	if _quest.curGrindX ~= 0 and _quest.currentQuest ~= nil and not IsInCombat() and not _quest.isQuestComplete and not IsLooting() and (script_grind.lootObj == nil or script_grind.skipLooting) and not IsCasting() and not IsChanneling() then
		if (_quest.distToGrind > 40 and _quest.currentType ~= 3 and _quest.currentType ~= 4 and not _quest.grindSpotReached) or (_quest.currentType == 3 or _quest.currentType == 4 or _quest.curentType == 5 or _quest.currentType == 11 and _quest.distToGrind > 5) then
			if _quest.currentType ~= 3 and _quest.currentType ~= 4 and _quest.currentType ~= 5 and not _quest.isQuestComplete and _quest.enemyTarget == nil then
			end

			_quest.message = "Moving to grind spot";
			_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
			script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
			script_navEX:moveToTarget(GetLocalPlayer(), _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);
		end
	end

 end



function _quest:runRest()

	if _questRunRest:runRest() then
		return true;
	end

end