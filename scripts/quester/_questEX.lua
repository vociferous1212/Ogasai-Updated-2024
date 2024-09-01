_questEX = {getSpells = false, bagsFull = false,}

function _questEX:doChecks()

	-- if bags full then set true
	if (AreBagsFull()) then
		self.bagsFull = true;
	end

	-- Check: If our gear is yellow
		for i = 1, 16 do
		local status = GetInventoryAlertStatus('' .. i);
			if (status ~= nil) then 
				if (status >= 3 and script_vendor.repairVendor ~= 0 and not IsInCombat()) then
					script_vendor:repair(); 
					self.newTargetTime = GetTimeEX();
					return true;
				end
			end
		end

	-- Check bags if they are full
		local inventoryFull = true;
		for i = 1, 5 do 
			if (i ~= 0) then 
				for y=1,GetContainerNumSlots(i-1) do 
					local texture, itemCount, locked, quality, readable = GetContainerItemInfo(i-1,y);
					if (itemCount == 0 or itemCount == nil) then 
						inventoryFull = false; 
					end 
				end
			end 
		end 
	
		-- Tell the grinder we cant loot
		if (inventoryFull) then
			self.bagsFull = true;
		end
		if self.bagsFull then
			return false;
		end

	-- loot objects
	if (not IsInCombat()) then
		script_grind.lootObj = script_nav:getLootTarget(50);
		if (script_grind.lootObj ~= nil) then
			_quest.message = "Looting";
			if (script_grind.lootObj:GetDistance() <= 4) then
				if (IsMoving()) then
					StopMoving();
				end
			end
			if (not script_grind:doLoot(GetLocalPlayer())) then
				if not IsLooting() then
					if (not LootTarget()) then
						LootTarget();
					end
				end
				_quest.waitTimer = GetTimeEX() + 1500;
				return true;
			end
		return true;
		end
	end

	if _quest:runRest() then
		return true;
	end

-- reset to allow bot to continue if we don't have the checkbox clicked...
		if (not self.getSpells or GetLocalPlayer():IsDead() or IsGhost()) then
			script_getSpells.getSpellsStatus = 0;
		end
		
		-- go to trainer and get spells
		if (self.getSpells) and (not _quest.pause) and (not IsInCombat()) then
			if (script_getSpells:checkForSpellsNeeded()) then
				_quest.message = "Moving to class trainer for spells";
				if (IsMoving()) and (not _quest.pause) then
					if (not script_unstuck:pathClearAuto(2)) then
						script_unstuck:unstuck();
							return true;
					end
				end
				return;
			else
				script_getSpells.getSpellsStatus = 0;
			end
		end
return false;
end

-- get a target attacking us returns a currentObj:GetGUID()
function _questEX:getTargetAttackingUs() 

	local i, t = GetFirstObject(); 

	-- run object manager
	while i ~= 0 do 
		
		-- NPC type 3
    		if t == 3 then
	
			-- acceptable targets
			if (i:CanAttack() and not i:IsDead()) and (i:IsInLineOfSight()) and (not i:IsCritter()) then

			-- get targets target - target of target
			local localObj = GetLocalPlayer();
			local targetTarget = i:GetUnitsTarget();

				-- target has a target and distance less than 50 (limit object manager by distance)
				if (targetTarget ~= 0 and targetTarget ~= nil) and (i:GetDistance() < 50) then

					-- if target is targeting me then
					if (targetTarget:GetGUID() == localObj:GetGUID()) then
	
						-- return target
						return i;
					end
				end	

            		end 
       		end

	-- get next target
	i, t = GetNextObject(i); 
	end

	-- return nil if no target
	return nil;
end
