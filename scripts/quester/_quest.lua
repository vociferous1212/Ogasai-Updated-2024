_quest = {

	message = "Quester",

	usingQuester = false,

	pause = true,

	isSetup = false,

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
	weHaveQuest = false, 
	autoComplete = true,
	currentDesc = nil,
	returningQuest = false,
	xp = 0,
	currentType = nil,
	usingItem = nil,
	gossipOption = nil,
	distToGrindFromHotspot = 275,
	currentMapID = 0,
	killStuffOnRoute = true,
	curQuestGiver = nil,
	curQuestName = nil,
	distToGiver = 0,
	distToGrind = 0,
	unstuckTimer = 0,

	lootTimer = GetTimeEX(),
	faceTargetTimer = GetTimeEX(),
	targetingTimer2 = GetTimeEX(),
	setQuestTimer = GetTimeEX(),
	sortQuestTimer = GetTimeEX(),
	turnQuestCompleteTimer = GetTimeEX(),
	getQuestGiverTimer = GetTimeEX(),
	checkBagTimer = GetTimeEX(),
		waitTimer = GetTimeEX(),


	includeAllFilesIncluded = include("scripts\\quester\\_questIncludeFiles.lua"),
}

function _quest:draw()
end

function _quest:window()
	_questWindow:window();

	if grind2DrawDataMenu.drawPath or script_grind.drawPath then
		grind2DrawNavPath:drawPath()
	end

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

	if not runOgasai.usingRunOgasai then
		script_drawStatusEX:drawSetup(); 
	else

	-- run grind 2 draw when running runOgasai script
		grind2Draw:run();
	end

	if (script_radar.showRadar) then
		script_radar:draw()
	end

	--if (script_grind.useExpChecker) then
	--	script_expChecker:menu();
	--end

	if (script_grind.drawChests) then
		script_gather:drawChestNodes();
	end

	if (script_gatherEX.drawFishingPools) then
		script_gatherEX:drawFishNodes();
	end

	if runOgasai.usedFisher then
		if script_fish.weaponMainHand ~= nil then
			UseItem(script_fish.weaponMainHand);
		end
		if script_fish.weaponOffHand ~= nil then
			UseItem(script_fish.weaponOffHand);
		end
		runOgasai.usedFisher = false;
	end

--[[

-- assign target is not working while in combat???
	if self.enemyTarget == nil or self.enemyTarget == 0 and IsInCombat() then
		if PlayerHasTarget() then
			if not GetTarget():IsDead() and GetTarget():CanAttack() and script_grind:isTargetingMe(GetTarget()) then
				self.enemyTarget = GetTarget();
			end
		end
	end
--]]

-- pause bot if we are on a taxi
	if PlayerHasTarget() and _quest.currentType == 10 then
		if GetTarget():GetUnitName() == GetLocalPlayer():GetUnitName() then
			if UnitOnTaxi("player") then
				_quest.pause = true;
			end
		end
	end

-- unpase bot after taxi
	if _quest.currentType == 10 and _quest.pause then
		if PlayerHasTarget() then
			if GetTarget():GetUnitName() == GetLocalPlayer():GetUnitName() then
				if not UnitOnTaxi("Player") then
					_quest.pause = false;
				end
			end
		end
	end


	-- move away from additional targets in combat
		if IsInCombat() and self.enemyTarget ~= 0 and self.enemyTarget ~= nil then
			if self.enemyTarget:GetHealthPercentage() >= 25 and not script_checkDebuffs:hasDisabledMovement() then
				if script_checkAdds:checkAdds() then
				
					script_om:FORCEOM();
				end
			end
		end

		--reset blacklist quest timer
		if IsInCombat() or IsMoving() then
			_questAcceptQuest.noQuestTimer = GetTimeEX() + 15000;
		end
		if not IsInCombat() and not PlayerHasTarget() then
			_questAcceptQuest.noQuestTimer = GetTimeEX() + 15000;
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

--[[


--]]


	-- flee combat
	if _quest.currentQuest ~= "Princess Must Die!" and PlayerHasTarget() and IsInCombat() then
		if grind2IsTargetingMe:target(GetTarget()) and PlayerHealth() >= 15 and IsInCombat() and PlayerLevel() >= 6
		and ((GetTarget():GetHealthPercentage() > PlayerHealth() and PlayerHealth() <= 60) or (NumberTargetsAttackingPlayer() > 2)
		and PlayerHealth() <= 75) then
		
			local x, y z = 0, 0, 0;
			--_quest.enemyTarget = nil;
	
			if not _quest.isQuestComplete then
				x, y, z = _quest.curQuestX, _quest.curQuestY, _quest.curQuestZ;
			else
				x, y, z = _questDB:getReturnTargetPos();
			end
			if x ~= 0 then
				if grind2MoveToTarget:run(localObj, x, y, z) then
					_quest.message = "Running out of combat";
					if HasSpell("Earthbind Totem") and not IsSpellOnCD("Earthbind Totem") then
						CastSpellByName("Earthbind Totem");
					end
					return true;
				end
			end
		return;
		end
	end

--[[


--]]




-- setup bot / do start checks
	if _questEX:doStartChecks() then
		return;
	end


--[[


--]]

-- return for any reason
	if _questDB.curListQuest == nil then
	--	coremenu:reload();
		if not self.noQuestsToRun then
			DEFAULT_CHAT_FRAME:AddMessage("No quest found to run");
			if runOgasai.usingRunOgasai then
				DEFAULT_CHAT_FRAME:AddMessage("Running grinder");
			end
			self.noQuestsToRun = true;
		end
		return;
	end
	if (self.pause) then
		self.usingQuester = false;
		script_grind.pause = true;
		_questDoCombat.blacklistTimer = GetTimeEX() * 2;
		script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
	return;
	end



	self.usingQuester = true;

	if GetRealmName() == "Ashen Vanilla" then
		script_grind.combatScriptRange = script_grind.combatScriptRange + 1;
	end

	if IsLooting() and GetTimeEX() > self.lootTimer then
		LootTarget();
		self.lootTimer = GetTimeEX() + 500;
	end

	-- check bags for new bags to equip
	if not IsInCombat() and not IsMoving() and not GetLocalPlayer():IsDead() and GetTimeEX() > self.checkBagTimer and GetBagName(4) == nil then
		--CheckBagsForBetterGear()
		_questEquipItems:checkInventoryForBags()
		self.checkBagTimer = GetTimeEX() + 60000
	end

-- run vendor
	if not self.pause and (not IsInCombat()) and (_questEX.bagsFull or script_vendor.status > 0) and (not GetLocalPlayer():IsDead()) then
		local vendorStatus = script_vendor:getStatus();
		if (vendorStatus > 0) then

			if not IsInCombat() then
				self.enemyTarget = nil;
			end

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

-- avoid elites...
-- if not on way to vendor and already running and not if we are mounted and running
	if script_vendor.status == 0 and not IsMounted() then 
		if (script_aggro:avoidElite(30)) then
			_quest.waitTimer = GetTimeEX() + 1500;
			_quest.message = "Elite within range... running away...";
			grind2MoveToTarget.GenerateANewPath = true;
			return true; 
		end
	end

-- face enemy target at all times
	if self.enemyTarget ~= 0 and self.enemyTarget ~= nil and PlayerHasTarget() and IsStanding() and not IsMoving() and not IsLooting() and Player():GetCasting() ~= 6487 then
		if self.enemyTarget:GetDistance() <= script_grind.combatScriptRange + 2 or ( (IsCasting() or (IsChanneling() and IsInCombat())) and ((PlayerHasTarget() and GetTarget():GetGUID() == self.enemyTarget:GetGUID()) or IsInCombat()) )  then
			if self.enemyTarget:IsInLineOfSight() then
				if GetTimeEX() > self.faceTargetTimer then
					if not self.enemyTarget:FaceTarget() then
						self.faceTargetTimer = GetTimeEX() + 1500;
					end
				end
			end
		end
	end




-- return for timer
	if ((self.waitTimer + self.tickRate * 1000) > GetTimeEX()) or self.pause
	or ((IsChanneling() or IsCasting()) and not instantCastSpells:isSpellInstantCast())
	or Player():IsStunned() or Player():IsConfused() or Player():IsFleeing() then 
		return;
	end

	if not IsInCombat() then
		if _questMenuEX.questToRunByIndex == -1 then
			if _questDBHandleDB:sortThroughQuestBasedOnCurrentQuestLogQuest() then
				return;
			end
		end
	end

	-- reset blacklist target timer
	if (PlayerHasTarget() and IsInCombat()) or (PlayerHasTarget() and GetTarget():IsDead()) or IsMoving() or self.pause then
		_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
		_questEX.jumpTimer = 6000;
	end

	-- blacklist target
	if not IsMoving() and not IsInCombat() and GetTimeEX() > _questDoCombat.blacklistTimer then
		if _quest.enemyTarget ~= nil and _quest.enemyTarget ~= 0 then
			if not _questQuestTargets:isUnitQuestTarget(_quest.enemyTarget) then
				script_grind:addTargetToHardBlacklist(_quest.enemyTarget:GetGUID())
				DEFAULT_CHAT_FRAME:AddMessage("1- Cannot find a path to target and 10 seconds have passed... Automatically Blacklisting ".._quest.enemyTarget:GetUnitName()..", "..math.floor(_quest.enemyTarget:GetDistance()).." (yd), Time: "..GetTimeStamp().."");
				ClearTarget();
				_quest.enemyTarget = nil;
				_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
			end
		end
	end

	local original_AddMessage = UIErrorsFrame.AddMessage
	
	UIErrorsFrame.AddMessage = function(frame, msg, r, g, b, id)

	if msg == ERR_INV_FULL then
		script_vendor.status = 2;
	end

	-- Always call the original function so errors still appear normally
	return original_AddMessage(frame, msg, r, g, b, id)
	end

	if IsInCombat() then
		script_combatHelper:run()
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

	-- equip item from quest... maybe need to sort by level? lets to under level 10
	if PlayerLevel() <= 10 then
		if _questDBReturnQuest.bestItemName ~= nil then
			if HasItem(_questDBReturnQuest.bestItemName) then
				if UseItem(_questDBReturnQuest.bestItemName) then
					_questDBReturnQuest.bestItemName = nil;
				end
			end
		end
	end

--[[


--]]
	-- clear dead targets tapped killed counter
	if (self.enemyTarget ~= 0 and self.enemyTarget ~= nil and self.enemyTarget:IsDead()) or (PlayerHasTarget() and GetTarget():IsDead()) then
		if self.enemyTarget ~= nil and self.enemyTarget ~= 0 then
			script_grind.monsterKillCount = script_grind.monsterKillCount + 1;
			grind2SaveCoordinates:saveTargetsLocation(self.enemyTarget);
			_quest.waitTimer = GetTimeEX() + 750;
		end
		self.enemyTarget = nil;
		ClearTarget();
	end

	if IsInCombat() then
		self.tickRate = 0;
	elseif not IsInCombat() then
		self.tickRate = .1;
	end

	_questEX:doChecks();

	if not IsInCombat() and not IsAnyTargetTargetingPlayer() and script_grind.lootObj ~= nil then
		return;
	end

	if IsInCombat() or IsMoving() then
		script_grind.lootCheckTime = 10000;
		script_grind.lootCheck['timer'] = 0;
		script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
	end


--[[ 



--]]

	if not IsInCombat() and script_grind.lootObj ~= nil then
		return;
	end

	-- get a target to run combat
		-- only get a target if at the grind spot and quest is complete , or in combat already
	if (_quest.grindSpotReached and not _quest.isQuestComplete) or IsInCombat() then
		if not Player():IsDead() and not _quest.needRest and GetTimeEX() > _questDoCombat.targetingTimer then
			if IsInCombat() or (_quest.currentQuest ~= nil and _quest.curGrindX ~= 0 and _quest.currentType ~= 3 and _quest.currentType ~= 4 and _quest.currentType ~= 5 and _quest.currentType ~= 11) then
				_quest.enemyTarget = _questDBTargets:getTarget();
				_questDoCombat.targetingTimer = GetTimeEX() + 1500;
			end
		end
	end

-- run combat
	if self.enemyTarget ~= nil and self.enemyTarget ~= 0 then

		if not IsAutoCasting("Attack") and not self.enemyTarget:IsDead() then
			self.enemyTarget:AutoAttack();
		end


		

		if IsInCombat() and GetTarget() == 0 or GetTarget() == nil then
			if GetPet() ~= 0 and GetPet() ~= nil then
				if GetPet():GetUnitsTarget() ~= 0 and GetPet():GetUnitsTarget() ~= nil then
					_quest.enemyTarget = GetPet():GetUnitsTarget()
				end
			end
		end

		if self.enemyTarget ~= nil then
			if not self.enemyTarget:IsDead() then
				_questDoCombat:doCombat();
				return true;
			end
		end
	end

	-- get a target just outside of aggro range
	if script_grindReturnTargetNearMyAggroRange:returnTargetNearMyAggroRange() ~= nil and (not IsInCombat() or self.enemyTarget == nil) then
		if GetTimeEX() > self.targetingTimer2 then
			_quest.enemyTarget = script_grindReturnTargetNearMyAggroRange:returnTargetNearMyAggroRange();
			self.targetingTimer2 = GetTimeEX() + 5000;
		end
	return;
	end


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


--[[
	


--]]

	if script_grind.lootObj ~= nil and IsLooting() and not IsInCombat() then
		return;
	end

	local questIsInQuestLog = false;
	for a = 0, GetNumQuestLogEntries() do
		local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(a);
		if title == _questDB.curListQuest then
		SelectQuestLogEntry(1)
			questIsInQuestLog = true;
		end
	end
		
	if questIsInQuestLog and (not self.grindSpotReached) then
		
		self.curGrindX, self.curGrindY, self.curGrindZ = _questDB:getQuestGrindPos();
	end

	if self.distToGrind <= 40 and self.distToGrind > 0 then
		self.grindSpotReached = true;
	end

	-- move back to grind spot when distance reached
	if (self.distToGrind >= self.distToGrindFromHotspot) and self.grindSpotReached and _quest.currentQuest == _questDB.curQuest then
		self.grindSpotReached = false;
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
	if GetTimeEX() > self.turnQuestCompleteTimer then
	if _quest.weCompletedQuest and _quest.isQuestComplete then
		for i=0, GetNumQuestLogEntries() do
			local questDescription, questObjectives = GetQuestLogQuestText(i);
			if questObjectives ~= _questDB.curDesc or GetNumQuestLogEntries() == 0 then

				if (_questDBHandleDB:turnQuestCompleted()) then
					--self.tickRate = 1;
					_quest.weCompletedQuest = false;
					_quest.isQuestComplete = false;
					_quest.currentDesc = nil;
					_questDB.curDesc = nil;
					_questEX2.flipVendor = true;
					self.turnQuestCompleteTimer = GetTimeEX() + 7000;
				end
			end
		end
	end
	end
	

--[[


--]]

-- sort current quest
	if GetTimeEX() > self.sortQuestTimer then
		if _questSortCurrentQuest:run() then
			self.waitTimer = GetTimeEX() + 500;
			self.sortQuestTimer = GetTimeEX() + 2000;
			return;
		end
	end
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
	if not IsInCombat() then
		_questCheckQuestCompletion:checkQuestForCompletion();
	--	self.tickRate = .5;
	end

--[[


--]]


	-- return a completed quest to quest return target
	if self.currentQuest ~= nil and not IsLooting() and not IsCasting() and not IsChanneling() and script_grind.lootObj == nil and not IsInCombat() then
		if (AreBagsFull()) then
			_questEX.bagsFull = true
			script_vendor.status = 1;
		end
		local questIsInQuestLog = false;
	for a = 0, GetNumQuestLogEntries() do
		local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(a);
		if title == _questDB.curListQuest then
			questIsInQuestLog = true;
		end
	end
		if questIsInQuestLog and not AreBagsFull() and not IsInCombat() and not IsAnyTargetTargetingPlayer() then
			if _questDBReturnQuest:returnAQuest() then
				self.enemyTarget = nil;
				self.message = "Returning quest!";
				_questAcceptQuest.noQuestTimer = GetTimeEX() + 15000;
			return;
			end
		end
	end

--[[


--]]

if GetTimeEX() > self.setQuestTimer then
-- sort current quest
	_questSetQuest:setOurCurrentQuest();
	self.setQuestTimer = GetTimeEX() + 2000;
end

--[[


--]]


-- get quest giver
if not IsInCombat() and GetTimeEX() > self.getQuestGiverTimer then
	_questGetQuestGiver:run()
	self.getQuestGiverTimer = GetTimeEX() + 2000;
end


--[[


--]]

	if not IsInCombat() then

		if _questDBHandleDB:turnOldQuestCompleted() then
			self.tickRate = .1;
			return true;
		end
	end
	
	if script_grind.lootObj == nil and script_grind.gather and not _quest.isQuestComplete and not IsInCombat() and not _questEX.bagsFull and not GetLocalPlayer():IsDead() then
		if script_gatherRun:gather() then
			_quest.message =  'Gathering ' .. script_gather:currentGatherName() .. ' ' ..script_gather.messageToGrinder.."";
		return true;
		end
	end


--[[


--]]



-- accept a quest
	_questAcceptQuest:run()

--[[


--]]

-- retrieve a quest
	-- chase a moving target
	if not IsInCombat() and _quest.distToGiver ~= 0 then

	local questIsInQuestLog = false;
	for a = 0, GetNumQuestLogEntries() do
		local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(a);
		if title == _questDB.curListQuest then
			questIsInQuestLog = true;
		end
	end
		
		-- move to quest giver
		if not questIsInQuestLog and not IsInCombat() and (_quest.curQuestX ~= 0) and (_quest.distToGiver > 4) then
			
			if ((script_grind.lootObj == nil and not script_grindEX.bagsFull) or (script_grind.lootObj ~= nil and script_grind.skipLooting) or (script_grind.lootObj ~= nil and _questEX.bagsFull) or (script_grind.lootObj == nil and not script_grind.skipLooting) or script_grind.lootObj == nil) and not IsCasting() and not IsChanneling() then


				_quest.message = "Retrieving a quest, "..math.floor(_quest.distToGiver).." (yd)";

				if PlayerHasTarget() then
					if GetTarget():GetUnitName() ~= _quest.curQuestGiver then
						ClearTarget();
					end
				end

				if _quest.distToGiver <= 10 then
					if not PlayerHasTarget() then
						TargetByName(_quest.curQuestGiver);
					end
				end

				if PlayerHasTarget() then
					if GetTarget():GetUnitName() == _quest.curQuestGiver and GetTarget():GetDistance() <= 2 then
						if IsMoving() then
							StopMoving();
						end
					end
				end

				if _quest.distToGiver >= 4 then
					grind2MoveToTarget:run(GetLocalPlayer(), _quest.curQuestX, _quest.curQuestY, _quest.curQuestZ);
				end

				if not IsInCombat() and not IsMoving() and not IsPathLoaded(5) and _quest.distToGiver > 4 then
					Move(_quest.curQuestX, _quest.curQuestY, _quest.curQuestZ);
				end
			end
		end
	end

--[[


--]]



-- move to grind spot
	if _quest.currentType ~= nil and _quest.currentType > 2 and not IsInCombat() and not IsLooting() then
		if _questDoOtherQuestTypes() then
			return true;
		end
	end	

-- run quester gather for quest items
	if _quest.currentType == 2 and not IsInCombat() and script_grind.lootObj == nil then
		
		_questDBGatherGetInventory:getItemsInInventory()

		if _questDBGather:run() then
			_quest.message = "Gathering quest item - ".._questDBGather.gatheringTarget:GetUnitName()..", "..math.floor(_questDBGather.gatheringTarget:GetDistance()).." (yd)";
			return true;
		end
	end

	if script_grind.lootObj ~= nil then
		return;
	end
	--if IsInCombat() then if IsMoving() then StopMoving(); return true; end return; end
	-- we have a quest so go to grind spot
	if _quest.questType ~= 0 and not IsAnyTargetTargetingPlayer() and _quest.curGrindX ~= 0 and _quest.currentQuest ~= nil and not IsInCombat() and not IsLooting()
	and (script_grind.lootObj == nil or script_grind.skipLooting or AreBagsFull()) and not IsCasting() and not IsChanneling() then
		if (_quest.distToGrind > 40 and _quest.currentType ~= 3 and _quest.currentType ~= 4 and not _quest.grindSpotReached)
		or (_quest.currentType == 3 or _quest.currentType == 4 or _quest.curentType == 5 or _quest.currentType == 11 and _quest.distToGrind > 5) then
			if _quest.currentType ~= 3 and _quest.currentType ~= 4 and _quest.currentType ~= 5  and _quest.enemyTarget == nil then
			end

			_quest.message = "Moving to grind spot";
			if not _quest.grindSpotReached then
				_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
				script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
			end
			
			
			if not IsInCombat() then
				grind2MoveToTarget:run(GetLocalPlayer(), _quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);
			end
			if not IsMoving() and not IsPathLoaded(5) and not IsInCombat() then
				Move(_quest.curGrindX, _quest.curGrindY, _quest.curGrindZ);
			end
			if PlayerHasTarget() and not IsInCombat() then
				if GetTarget():GetUnitName() == self.curQuestGiver and self.distToGiver >= 10 then
					ClearTarget();
				end
			end
		end
	return false;
	end
	
 end



function _quest:runRest()

	if _questRunRest:runRest() then
		return true;
	end

end



