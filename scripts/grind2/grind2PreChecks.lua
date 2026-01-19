grind2PreChecks = {

	autoTalent = false,

}

function grind2PreChecks:run()

	local player = GetLocalPlayer();

	local currentTime = GetTimeEX();

-- Check: Spend talent points
	if not IsInCombat() and not player:IsDead() and grind2.autoTalent then

		if script_talent:learnTalents() then

			grind2.grinderMessage = "Checking/learning talent: " .. script_talent:getNextTalentName();

			grind2:setTimer(150);

			return true;
		end
	end

-- ressurect
if GetLocalPlayer():IsDead() then DEFAULT_CHAT_FRAME:AddMessage("No death script added yet. Cannot run to corpse."); StopBot(); return true; end

-- clear dead targets reset enemy target variable
	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
		if grind2.enemyTarget:IsDead() then
			grind2.numberOfKills = grind2.numberOfKills + 1;
			grind2SaveCoordinates:saveTargetsLocation(grind2.enemyTarget);
			grind2.enemyTarget = nil;
			grind2.lastTargetTargeted = nil;
			grind2.grinderMessage = "Clearing dead/tapped target";
			grind2:setTimer(grind2AdjustTimersMenu.waitAfterTargetKilledTimer);
		return true;
		end
	end

-- do loot if we can
	if grind2.lootTargets and not grind2.bagsAreFull and not AreBagsFull() then
		
		-- fallback to loot targets - do loot
		if IsLooting() and currentTime > grind2DoLoot.lootTimer then
			LootTarget();
			if StaticPopup1:IsVisible() then
				StaticPopup1Button1:Click()
			end
			grind2DoLoot.lootTimer = currentTime + 950;
		end

		-- do loot
		if not IsAnyTargetTargetingPlayer() then
	
			if grind2DoLoot:run() then

				grind2DoLoot.lootTimer = currentTime + 950;

				-- reset blacklist target timer for loot phase
				grind2RunCombatState.blacklistTargetTimer = currentTime * 2;
				
				-- wait time between each action - each time doLoot script is ran
				grind2:setTimer(grind2AdjustTimersMenu.doLootTimer);
				
				return true;
			end
		end
	end

-- run any other check before gaining hotspot
	if grind2PreChecks2:run() then return true; end
	if grind2PreChecks3:run() then return true; end


	-- load hotspot if using auto shotspots
	if grind2HotSpot.useHotSpots then

		grind2HotSpot:updateHotSpot();
		script_nav:loadHotspotDB(id)
	end

	-- hotspot reached or not reached - return to hotspot - or when there are no valid targets nearby
	if grind2HotSpot.distanceToHotSpot <= grind2HotSpot:distanceToHotspot() or (grind2HotSpot.hotSpotReached and not grind2IsAnyValidTargetInRange:run()) then
		
		grind2HotSpot.hotSpotReached = false;
	else

		grind2HotSpot.hotSpotReached = true;
	end

	-- move to hotspot
	if not grind2HotSpot.hotSpotReached and not IsInCombat() and not IsCasting() and not IsChanneling() and not IsLooting() and IsStanding() then
	
		grind2HotSpot:moveToHotspot();

		return true;
	end

return false;
end