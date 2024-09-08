_questEX = {bagsFull = false, jumpTimer = 3000}

function _questEX:doStartChecks()
	if not IsUsingNavmesh() then UseNavmesh(true); return true; end
	if (not LoadNavmesh()) then self.message = "Make sure you have mmaps-files..."; return true; end
	if (GetLoadNavmeshProgress() ~= 1) then self.message = "Loading Nav Mesh! Please Wait!"; return true; end
return false;
end
function _questEX:doChecks()

	local localObj = GetLocalPlayer();

	if GetTimeEX() > (_quest.tickRate*1000) + self.jumpTimer then
		local jumpRandom = random(0, 10);
		if (jumpRandom == 10 and IsMoving() and not IsInCombat()) then local randomTimer = math.random(3000, 10000); self.jumpTimer = GetTimeEX() + randomTimer; JumpOrAscendStart(); end end
	if not localObj:IsDead() then if _quest:runRest() then _questDoCombat.blacklistTimer = GetTimeEX() + 10000; _quest:setTimer(500); return true; end end
	if (PlayerHasTarget() and IsInCombat()) or (PlayerHasTarget() and GetTarget():IsDead()) or IsMoving() then
		_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
	end
	if (not HasSpell("First Aid")) then
		script_grind.useFirstAid = false;
	end
	if GetNumQuestLogEntries() > 1 then
		self.message = "Bot only does 1 quest at a time...";
	end
	script_grind.nextToNodeDist = 3;
	NavmeshSmooth(3);
	if GetNumQuestLogEntries() == 0 then
		_quest.weHaveQuest = false;
	end
	if (script_vendor.status == 0) then
		script_vendor.message = "idle...";
	end
	if IsCasting() or IsChanneling() or localObj:IsStunned() then return true; end
	if not _quest.isQuestComplete and script_grind:enemiesAttackingUs() > 2 or (localObj:GetHealthPercentage() < 5 and IsInCombat()) then
		script_navEX:moveToTarget(localObj, _quest.curQuestX, _quest.curQuestY, _quest.curQuestZ);
		_quest.message = "Running out of combat"; return true; end
		
	if (localObj:IsDead()) then
		_quest.message = "Waiting to ressurect...";
		_quest.enemyTarget = nil;
		if (not IsGhost()) then
			if (not RepopMe()) then
				if (script_grindEX.useThisVar) then
					script_grindEX.deathCounter = script_grindEX.deathCounter + 1;
					script_grindEX.useThisVar = false;
				end
				_quest.message = "Walking to corpse...";
			return true;
			end
		return true;
		end
		-- Ressurrect within the ress distance to our corpse
		local _lx, _ly, _lz = localObj:GetPosition();
		if(GetDistance3D(_lx, _ly, _lz, GetCorpsePosition()) > script_grind.ressDistance) then
			script_nav:moveToNav(localObj, GetCorpsePosition());
			return true;

		else
			if (script_grind.safeRess) then
					local rx, ry, rz = GetCorpsePosition();
					if (script_aggro:safeRess(rx, ry, rz, script_grind.ressDistance)) then
						script_grind.message = "Finding a safe spot to ress...";
						return true;
					else
						if (script_aggro.rTime > GetTimeEX()) then
							script_nav:moveToNav(localObj, script_aggro.rX, script_aggro.rY, script_aggro.rZ);
							script_grind.message = "Finding a safe spot to ress...";
							return true;
						end end end RetrieveCorpse(); script_grindEX.useThisVar = true; end return true; end
	-- Check: Spend talent points
	if not IsInCombat() and not localObj:IsDead() and script_grind.autoTalent then
		if script_talent:learnTalents() then
			_quest:setTimer(500);
			_quest.message = "Checking/learning talent: " .. script_talent:getNextTalentName();

		return true; end end
	if not _quest.isQuestComplete and GetTarget() == 0 or GetTarget() == nil and GetPet() ~= 0 and GetPet() ~= nil then
		if GetPet():GetUnitsTarget() ~= 0 and GetPet():GetUnitsTarget() ~= nil then
			_quest.enemyTarget = GetPet():GetUnitsTarget();
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
		self.bagsFull = true;
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
			self.bagsFull = true;
		end
		if self.bagsFull then 
			return false;
		end
		if script_grind.skipLooting then
			script_grind.lootObj = nil;
		end
	-- loot objects
	if (not IsInCombat()) and not script_grind.skipLooting then
		if script_grind.lootObj == nil then
			script_grind.lootObj = script_nav:getLootTarget(script_grind.findLootDistance);
		end
		if ((script_grind.lootObj ~= nil and not IsInCombat()) or (IsInCombat() and not script_grind:isAnyTargetTargetingMe()))
		and not script_grind.skipLooting and not script_grindEX.bagsFull then
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
			elseif PlayerHasTarget() and GetTarget():IsDead() and not IsLooting then ClearTarget(); end
		end
	end
	if IsInCombat() and PlayerHasTarget() then
		if (not script_grind:isAnyTargetTargetingMe() and GetTarget():GetHealthPercentage() > 99) then
			if IsMoving() then StopMoving(); return true; end _quest.message = "Still in combat!" return true; end end
	if (not script_grind.getSpells or localObj:IsDead() or IsGhost()) then script_getSpells.getSpellsStatus = 0; end
	if (script_grind.getSpells) and (not _quest.pause) and (not IsInCombat()) and (_quest.weHaveQuest and _quest.isQuestComplete or GetNumQuestLogEntries() == 0) and not IsEating() and not IsDrinking() then
		if script_grind.getSpells and (script_getSpells:checkForSpellsNeeded()) then
			if (PlayerHasTarget()) then
				ClearTarget();
			end
			_quest.message = "Moving to class trainer for spells";
			if (IsMoving()) and (not _quest.pause) then if (not script_unstuck:pathClearAuto(2)) then script_unstuck:unstuck(); return true; end end return true; end end
	if (script_grind.getSpells) and (not IsInCombat()) then if script_getSpells.getSpellsStatus > 0 then return true; end end

return false;
end