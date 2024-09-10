_questEX2 = {}

function _questEX2:doChecks()
local localObj = GetLocalPlayer();

	if localObj:HasDebuff("Ressurection Sickness") then
		if IsMoving() then
			StopMoving();
			return true;
		end
		if IsStanding() then
			SitOrStand();
		end
		_quest:setTimer(60000);
	end

	-- delete items 
	if (not IsInCombat()) and (not IsMoving()) and (script_grind.deleteItems) then
		script_deleteItems:checkDeleteItems();
	end

	-- Check: Spend talent points
	if not IsInCombat() and not localObj:IsDead() and script_grind.autoTalent then
		if script_talent:learnTalents() then
			_quest:setTimer(500);
			_quest.message = "Checking/learning talent: " .. script_talent:getNextTalentName();

		return true;
		end
	end

	if not _quest.isQuestComplete and GetTarget() == 0 or GetTarget() == nil then
		if GetPet() ~= 0 and GetPet() ~= nil then
			if GetPet():GetUnitsTarget() ~= 0 and GetPet():GetUnitsTarget() ~= nil then
				_quest.enemyTarget = GetPet():GetUnitsTarget();
			end
		end
	end

	-- buff other players
	if not script_getSpells:cityZones() and not IsInCombat() and GetTimeEX() > script_grind.buffTimer and script_buffOtherPlayers.enableBuffs
		and localObj:GetManaPercentage() >= 40 and script_vendor.status == 0 and IsStanding() then
		if HasSpell("Arcane Intellect") or HasSpell("Mark of the Wild") or HasSpell("Power Word: Fortitude") or HasSpell("Blessing of Might") then
			script_grind.buffTimer = GetTimeEX() + 5500;
			if not HasSpell("Blessing of Might") then
				if script_buffOtherPlayers:doBuffs() then
					_quest.message = "Buffing other players";
					if not IsStanding() then JumpOrAscendStart(); end return true; end elseif HasSpell("Blessing of Might") then
				if script_buffOtherPlayers:doBuffsPaladin() then
					_quest.message = "Buffing other players";
					if IsStanding() then
						JumpOrAscendStart();
					end
				return true;
			end end end end

	if (AreBagsFull()) then
		_questEX.bagsFull = true;
	end

	-- Check: If our gear is yellow
		for i = 1, 16 do

		local numItemsBroken = 0;
		local status = GetInventoryAlertStatus('' .. i);

			numItemsBroken = numItemsBroken + 1;

			if (status ~= nil) and (numItemsBroken > 3 or status >= 4) then 

				if (status >= 3 and script_vendor.repairVendor ~= 0 and not IsInCombat()) then

					script_vendor:repair();

				return true;
				end
			end
		end
		-- Check bags if they are full
		local inventoryFull = true;
		if GetMyClass() ~= "HUNTER" then
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
		elseif GetMyClass() == "HUNTER" then
			for i = 1, 4 do 
				if (i ~= 0) then 
					for y=1,GetContainerNumSlots(i-1) do 
						local texture, itemCount, locked, quality, readable = GetContainerItemInfo(i-1,y);
						if (itemCount == 0 or itemCount == nil) then 
							inventoryFull = false; 
						end 
					end
				end 
			end 
		end

		-- Tell the grinder we cant loot
		if (inventoryFull) then
			_questEX.bagsFull = true;
		end
		
		if _questEX.bagsFull then
			return false;
		end

		if script_grind.skipLooting then
			script_grind.lootObj = nil;
		end
		
		if (not script_grind.timerSet) and (not IsEating()) and (not IsDrinking()) and (IsStanding()) and (not IsInCombat()) then
			script_grind.blacklistLootTimeCheck = GetTimeEX() + (script_grind.blacklistLootTimeVar * 1000);
			script_grind.timerSet = true;
		end

	-- loot objects
	if (not IsInCombat()) and not script_grind.skipLooting then
		if script_grind.lootObj == nil then
			script_grind.lootObj = script_nav:getLootTarget(script_grind.findLootDistance);
		end
		if script_grind.lootObj ~= nil then
			if script_grind:isTargetLootBlacklisted(script_grind.lootObj:GetGUID()) then
				script_grind.lootObj = nil;
			end
		end

		if ((script_grind.lootObj ~= nil and not IsInCombat()) or (IsInCombat() and not script_grind:isAnyTargetTargetingMe()))
		and not script_grind.skipLooting and not script_grindEX.bagsFull and not script_grind:isTargetLootBlacklisted(script_grind.lootObj:GetGUID()) then

			_quest.message = "Looting "..script_grind.lootObj:GetUnitName()..", "..math.floor(script_grind.lootObj:GetDistance()).." (yd)";
			_questDoCombat.blacklistTimer = GetTimeEX() + 10000

			if (script_grind.lootObj:GetDistance() <= script_grind.lootDistance) then
				if (IsMoving()) then
					StopMoving();
					return true;
				end
				if not IsMoving() then
					_quest:setTimer (250);
				end
			end

			if (script_grind:doLoot(localObj)) then
				return true;
			elseif PlayerHasTarget() and GetTarget():IsDead() and not IsLooting then
				ClearTarget();
			end
		end
	end

	if IsInCombat() and PlayerHasTarget() then
		if (not script_grind:isAnyTargetTargetingMe() and GetTarget():GetHealthPercentage() > 99) then
			if IsMoving() then
				StopMoving();
			return true;
			end

			_quest.message = "Still in combat!";
		return true;
		end
	end

	if (not script_grind.getSpells or localObj:IsDead() or IsGhost()) then
		script_getSpells.getSpellsStatus = 0;
	end

	if (script_grind.getSpells) and (not _quest.pause) and (not IsInCombat()) and (_quest.weHaveQuest and _quest.isQuestComplete or GetNumQuestLogEntries() == 0) and not IsEating() and not IsDrinking() then
		if script_grind.getSpells and (script_getSpells:checkForSpellsNeeded()) then
			if (PlayerHasTarget()) then
				ClearTarget();
			end

			_quest.message = "Moving to class trainer for spells";
			if (IsMoving()) and (not _quest.pause) then
				if (not script_unstuck:pathClearAuto(2)) then
					script_unstuck:unstuck();
					return true;
				end
			end
		return true;
		end
	end

	if (script_grind.getSpells) and (not IsInCombat()) then
		if script_getSpells.getSpellsStatus > 0 then
			return true;
		end
	end

return false;
end