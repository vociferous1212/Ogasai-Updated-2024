_questEX = {bagsFull = false,}


-- do checks before we can even start the bot
function _questEX:doStartChecks()

	if not IsUsingNavmesh() then

		UseNavmesh(true);

	return true;
	end

	if (not LoadNavmesh()) then

		self.message = "Make sure you have mmaps-files...";

	return true;
	end

	if (GetLoadNavmeshProgress() ~= 1) then
	
		self.message = "Loading Nav Mesh! Please Wait!";
		
	return true;
	end

return false;
end

function _questEX:doChecks()

	local localObj = GetLocalPlayer();

	-- reset blacklist target timer
	if (PlayerHasTarget() and IsInCombat()) or (PlayerHasTarget() and GetTarget():IsDead()) or IsMoving() then

		_questDoCombat.blacklistTimer = GetTimeEX() + 10000;

	end

	if script_grindEX:returnTargetNearMyAggroRange() ~= nil then

		_quest.enemyTarget = script_grindEX:returnTargetNearMyAggroRange();

	end

	if (not HasSpell("First Aid")) then

		script_grind.useFirstAid = false;

	end

	if GetNumQuestLogEntries() > 1 then

		self.message = "Bot only does 1 quest at a time...";

	end


	script_grind.nextToNodeDist = 4.05;
	
	NavmeshSmooth(3.44);


	if GetNumQuestLogEntries() == 0 then

		_quest.weHaveQuest = false;

	end

	-- reset vendor message after selling/repairing
	if (script_vendor.status == 0) then

		script_vendor.message = "idle...";

	end

	-- run gatherer scripts
	if not IsInCombat() and not localObj:IsDead() then

		if script_gatherRun:gather() then

			if (IsLooting()) then

				_quest:setTimer(5000);

			end

		return true;
		end
	end

	-- if we are dead
	if (localObj:IsDead()) then

		_quest.message = "Waiting to ressurect...";

		-- use soul stone
		--if (localObj:HasBuff("Soul Stone")) and (localObj:IsDead()) and (not IsGhost()) then
			--accept text
		--return
		--end

		-- Release body
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

					_quest.message = "Finding a safe spot to ress...";

					return true;

				else

					if (script_aggro.rTime > GetTimeEX()) then

						script_nav:moveToNav(localObj, script_aggro.rX, script_aggro.rY, script_aggro.rZ);

						_quest.message = "Finding a safe spot to ress...";

					return true;
					end
				end
			end

		RetrieveCorpse();

		script_grindEX.useThisVar = true;

		end
	return true;
	end

	-- Check: Spend talent points
	if not IsInCombat() and not GetLocalPlayer():IsDead() and script_grind.autoTalent then

		if script_talent:learnTalents() then

			_quest:setTimer(500);

			_quest.message = "Checking/learning talent: " .. script_talent:getNextTalentName();

		return;
		end
	end

	-- buff other players
	if not script_getSpells:cityZones() and not IsInCombat() and GetTimeEX() > script_grind.buffTimer and script_buffOtherPlayers.enableBuffs
		and GetLocalPlayer():GetManaPercentage() >= 40 and script_vendor.status == 0 and IsStanding() then

		if HasSpell("Arcane Intellect") or HasSpell("Mark of the Wild") or HasSpell("Power Word: Fortitude") or HasSpell("Blessing of Might") then

			script_grind.buffTimer = GetTimeEX() + 5500;

			if not HasSpell("Blessing of Might") then

				if script_buffOtherPlayers:doBuffs() then

					if not IsStanding() then

						JumpOrAscendStart();

					end

				return true;
				end

			elseif HasSpell("Blessing of Might") then

				if script_buffOtherPlayers:doBuffsPaladin() then

					if IsStanding() then

						JumpOrAscendStart();

					end

				return true;
				end
			end
		end	
	end

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

			script_grind.lootObj = script_nav:getLootTarget(50);

		end

		if script_grind.lootObj ~= nil and not script_grind.skipLooting and not script_grindEX.bagsFull then

			_quest.message = "Looting";

			if (script_grind.lootObj:GetDistance() <= script_grind.lootDistance) then

				if (IsMoving()) then

					StopMoving();

					return true;

				end
			end

			if (script_grind:doLoot(GetLocalPlayer())) then

				if IsLooting() then
					_quest:setTimer(500);

					if not LootTarget() then

						_quest:setTimer(500);
						LootTarget();

					end

				_quest:setTimer(800);

				end

			return true;
			end
		return true;
		end
	end


	-- run rest script
	if _quest:runRest() then

		return true;

	end

	-- reset to allow bot to continue if we don't have the checkbox clicked...
	if (not script_grind.getSpells or GetLocalPlayer():IsDead() or IsGhost()) then
	
		script_getSpells.getSpellsStatus = 0;

	end
	
	-- go to trainer and get spells
	if (script_grind.getSpells) and (not _quest.pause) and (not IsInCombat()) and _quest.weHaveQuest then

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


	-- tell bot to continue
	if (script_grind.getSpells) and (not IsInCombat()) then

		if script_getSpells.getSpellsStatus > 0 then

		return true;
		end
	end

return false;
end