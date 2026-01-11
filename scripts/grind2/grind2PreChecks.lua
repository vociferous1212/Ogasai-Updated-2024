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

	if grind2PreChecks2:run() then return true; end
	if grind2PreChecks3:run() then return true; end

-- clear dead targets reset enemy target variable
	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
		if grind2.enemyTarget:IsDead() then
			grind2.numberOfKills = grind2.numberOfKills + 1;
			grind2.enemyTarget = nil;
			grind2.lastTargetTargeted = nil;
			grind2.grinderMessage = "Clearing dead/tapped target";
			grind2:setTimer(grind2AdjustTimersMenu.waitAfterTargetKilledTimer);
		return true;
		end
	end

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

return false;
end