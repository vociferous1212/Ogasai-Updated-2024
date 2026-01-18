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

	if grind2PreChecks2:run() then return true; end
	if grind2PreChecks3:run() then return true; end

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

-- check if bags are full
	grind2AreBagsFull:checkIfBagsAreFull()

-- if bags are full then do vendor
	if (AreBagsFull() or grind2.bagsAreFull or script_vendor.status == 2) and not IsInCombat() and grind2.useVendor then
				
			-- sell to vendor
			script_vendor:sell();

			-- return if we still need to sell
			if script_vendor.status == 2 then return true; end

			grind2.grinderMessage = "Running the vendor routine: sell..."; 

		return true;
	end

-- do loot if we can
	if grind2.lootTargets and not grind2.bagsAreFull and not AreBagsFull() then

		-- set blacklist loot timer
		
		grind2DoLoot.blacklistLootTime = currentTime + grind2AdjustTimersMenu.blacklistLootTime;

		-- fallback to loot targets - do loot
		if IsLooting() and currentTime > grind2DoLoot.lootTimer then
			LootTarget();
			if StaticPopup1:IsVisible() then
				StaticPopup1Button1:Click()
			end
			grind2DoLoot.lootTimer = currentTime + 750;
		end

		-- do loot
		if not IsAnyTargetTargetingPlayer() then
	
			if grind2DoLoot:run() then

				grind2DoLoot.lootTimer = currentTime + 750;

				-- reset blacklist target timer for loot phase
				grind2RunCombatState.blacklistTargetTimer = currentTime * 2;
				
				-- wait time between each action - each time doLoot script is ran
				grind2:setTimer(grind2AdjustTimersMenu.doLootTimer);
				
				return true;
			end
		end
	end

	if grind2HotSpot.useHotSpots then
			-- load hotspot 
	grind2HotSpot:updateHotSpot();
	script_nav:loadHotspotDB(id)
	
	if grind2HotSpot.distanceToHotSpot <= grind2HotSpot:distanceToHotspot() then
		
		grind2HotSpot.hotSpotReached = false;
	else
		grind2HotSpot.hotSpotReached = true;
	end


	-- move to hotspot
	if not grind2HotSpot.hotSpotReached and not IsInCombat() then

		if PlayerHasTarget() then ClearTarget(); end
	
		grind2HotSpot:moveToHotspot();

	return true;
	end
	end

return false;
end