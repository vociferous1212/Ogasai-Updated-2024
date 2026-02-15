grind2PreChecks = {

	autoTalent = false,

	jumpTimer = 0,

	rodTimerForFun = 0

}

function grind2PreChecks:run()

	local currentTime = GetTimeEX();

-- Check: Spend talent points
	if not IsInCombat() and not Player():IsDead() and grind2.autoTalent then

		if script_talent:learnTalents() then

			grind2.grinderMessage = "Checking/learning talent: " .. script_talent:getNextTalentName();

			grind2:setTimer(350);

			return true;
		end
	end

-- clear dead targets reset enemy target variable
	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
		if grind2.enemyTarget:IsDead() then
			-- + 1 to target killed
			grind2.numberOfKills = grind2.numberOfKills + 1;
			-- save coordinates to run out of combat and nav
			grind2SaveCoordinates:saveTargetsLocation(grind2.enemyTarget);
			-- reset grind enemy target
			grind2.enemyTarget = nil;
			-- reset grind last target
			grind2.lastTargetTargeted = nil;
			-- reset original grinder target - using old combat scripts
			script_grind.enemyObj = nil;
			-- send message
			grind2.grinderMessage = "Clearing dead/tapped target";
			-- reset new target timer
			grind2.obtainNewTargetTimer = currentTime;
			-- set timer
			grind2:setTimer(grind2AdjustTimersMenu.waitAfterTargetKilledTimer);
		return true;
		end
	end

-- furbolg form! - try it once every 3 and 1/2 mins
	if grind2Menu.useFurbolgForm and HasItem("Dartol's Rod of Transformation") and not IsInCombat() and not IsCasting() and not IsChanneling() and IsStanding() and not Player():HasBuff("Furbolg Form") then
		if GetTimeEX() > self.rodTimerForFun then
			UseItem("Dartol's Rod of Transformation");
			self.rodTimerForFun = GetTimeEX() + 210000;
		end
	end



-- check inventory stuffs
	if not IsInCombat() and not IsMoving() then

	-- check bags for new bags to equip if we are below level 10 - started a new character
		if not IsInCombat() and PlayerLevel() < 10 then
			if grind2EquipBags:checkForBagsToEquip() then
				return true;
			end
		end

	-- delete inventory items - 45 seconds
		if script_deleteItems.deleteItems and currentTime > script_deleteItems.deleteItemTimer then
			script_deleteItems:checkDeleteItems();
			script_deleteItems.deleteItemTimer = currentTime + 45000;
		end

	-- use inventory items
		if not grind2.bagsAreFull and not AreBagsFull() and not IsLooting() and not IsCasting() and not IsChanneling() then
			if script_useItemsInInventory:useItems() then
				grind2:setTimer(2000);
			end
		end
	end



-- do loot if we can
	if grind2.lootTargets and not grind2.bagsAreFull and not AreBagsFull() and not IsEating() and not IsDrinking() then
		
		-- fallback to loot targets - do loot
		if IsLooting() and currentTime > grind2DoLoot.timer then
			if StaticPopup1:IsVisible() then
				StaticPopup1Button1:Click()
			end

			LootTarget();
			grind2DoLoot.lootTimer = currentTime + grind2AdjustTimersMenu.doLootTimer;
			grind2:setTimer(grind2AdjustTimersMenu.doLootTimer);
		end

		-- do loot
		if not IsAnyTargetTargetingPlayer() or not IsInCombat() then
	
			if grind2DoLoot:run() then

				grind2DoLoot.lootTimer = currentTime + grind2AdjustTimersMenu.doLootTimer;

				grind2.grinderMessage = "Moving to loot target";

				-- reset blacklist target timer for loot phase
				grind2RunCombatState.blacklistTargetTimer = currentTime * 2;
				
				if IsLooting() then
					grind2:setTimer(grind2AdjustTimersMenu.doLootTimer);
				end

				return true;
			end
		end
	end

	
-- run gatherer
	if grind2.gather and not IsAnyTargetTargetingPlayer() and not IsInCombat() and not grind2.bagsAreFull and not AreBagsFull() and not IsLooting() and not Player():IsDead() then
		if script_gatherRun:gather() then
			script_gatherRun:gather();
			grind2.grinderMessage = "Gathering...";
			if IsLooting() and not IsMoving() then
				grind2:setTimer(500);
			end
			return true;
		end
	end

-- random jump
	if IsMoving() and not IsInCombat() then

		local random = math.random(-100, 100);
		local randomTimer = math.random(2000, 6500);

		-- added random to slow it down
		-- if randomTimer + old jump timer > current time then jump
		if random >= 99 then
			if GetTimeEX() > self.jumpTimer + randomTimer then

				JumpOrAscendStart();

				-- reset jump timer
				self.jumpTimer = GetTimeEX();
			end
		end
	end

-- reaffirm enemy target - we have a good target
	if grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil and not IsStealth() and not grind2.enemyTarget:IsDead() and grind2IsTargetingMe:target(grind2.enemyTarget) then
		if not PlayerHasTarget() then
			grind2.enemyTarget:AutoAttack();
		end
	end

-- Update pull levels if we leveled up
	if (grind2.currentLevel < PlayerLevel()) then
		grind2IsTargetValid.minLevel = PlayerLevel() - 4;
		grind2IsTargetValid.maxLevel = PlayerLevel() + 2;
		grind2.currentLevel = PlayerLevel();
	end

-- check if bags are full
	grind2AreBagsFull:checkIfBagsAreFull()

	if not grind2.useVendor then
		script_vendor.status = 0;
	end

-- if bags are full then do vendor
	if grind2.useVendor and not IsInCombat() and not IsCasting() and not IsChanneling() then

		-- add a mount timer.. keeps trying to mount / cast when it needs to do other things.. too quick
		-- mount
		if not IsInCombat() and script_vendor.status >= 1 then
			if HasSpell("Aspect of the Cheetah") and not IsSpellOnCD("Aspect of the Cheetah") and PlayerMana() >= 20
			and not Player():HasBuff("Aspect of the Cheetah") then
				if CastSpellByName("Aspect of the Cheetah") then
					return true;
				end
			end
			if not HasForm() and HasSpell("Cat Form") and not Player():HasBuff("Cat Form") and not IsSpellOnCD("Cat Form") and PlayerMana() >= 50 then
				if CastSpellByName("Cat Form") then
					return true;
				end
			end
		end

		-- sell
		if (AreBagsFull() or grind2.bagsAreFull or script_vendor.status >= 1) then
				
			-- sell to vendor
			if script_vendor:sell() then

			grind2.grinderMessage = "Running the vendor routine: sell..."; 

			if not IsMoving() and PlayerHasTarget() and not GetTarget():CanAttack() then grind2:setTimer(75); end

			return true;
			end
		end

		-- repair
		if script_vendor.status == 2 then
			script_vendor:repair();
			return true;
		end

		-- buy ammo hunter
		if script_vendor.status == 3 then
			script_vendor:buyAmmo(script_hunter.quiverBagNr-1, script_hunter.ammoName, script_hunter.ammoIsArrow);
			return true;
		end
	
		-- refill drink/food
		if grind2.refillDrinkAndFoodAtVendor then
		-- nothing here yet
		end
	end


-- load hotspot if using auto shotspots
	if grind2HotSpot.useHotSpots then

		grind2HotSpot:updateHotSpot();
		script_nav:loadHotspotDB(id)
	end

-- hotspot reached or not reached - return to hotspot - or when there are no valid targets nearby
	if not IsInCombat() and grind2HotSpot.distanceToHotSpot <= grind2HotSpot:distanceToHotspot() or (grind2HotSpot.hotSpotReached and not grind2IsAnyValidTargetInRange:run()) then
		
		grind2HotSpot.hotSpotReached = false;
	else

		grind2HotSpot.hotSpotReached = true;
	end

-- move to hotspot
	if not grind2HotSpot.hotSpotReached and not IsInCombat() and not IsCasting() and not IsChanneling() and not IsLooting() and IsStanding() then
	
		-- cheetah hunter
		if HasSpell("Aspect of the Cheetah") and not IsSpellOnCD("Aspect of the Cheetah") and not Player():HasBuff("Aspect of the Cheetah") and IsMoving() then
			CastSpellByName("Aspect of the Cheetah");
		end
		-- cat form druid
		if not HasForm() and HasSpell("Cat Form") and not Player():HasBuff("Cat Form") and not IsSpellOnCD("Cat Form") and PlayerMana() >= 50 and IsMoving() then
			CastSpellByName("Cat Form");
		end

		-- mount
		--

		if grind2SaveCoordinates.numberOfLocations >= 3 then

			grind2SaveCoordinates:moveToSavedLocation();

			return true;

		elseif not grind2HotSpot.hotspotReached or grind2SaveCoordinates.numberOfLocations < 3 then

			grind2HotSpot:moveToHotspot();

			return true;
		end

	end

return false;
end