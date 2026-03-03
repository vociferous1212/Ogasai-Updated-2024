_questEX = {
	
	bagsFull = false,
	
	jumpTimer = 10000,
	
	breathTimer = 0,
	
	standingInFireTimer = 0,

	retrieveCorpseTimer = GetTimeEX(),

}

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

-- move away from fire if we are standing in it
	if GetTimeEX() > self.standingInFireTimer then
		script_helper:areWeStandingInFire()
		self.standingInFireTimer = GetTimeEX() + 5000;
	end

return false;
end

function _questEX:doChecks()

	local localObj = GetLocalPlayer();

-- random jump
	if GetTimeEX() > (_quest.tickRate*2000) + self.jumpTimer and IsMoving() and script_grind.jump and ((not IsCasting() and not IsChanneling()) or instantCastSpells:isSpellInstantCast()) then
		local jumpRandom = random(-100, 100);

		if (jumpRandom == 100 and IsMoving() and not IsInCombat()) then
			local randomTimer = math.random(10000, 17000);
			self.jumpTimer = GetTimeEX() + randomTimer;
			JumpOrAscendStart();
		end
	end

-- run rest
	if not localObj:IsDead() and not IsInCombat() then
		if _quest:runRest() then
			if not PlayerHasTarget() then
				_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
			end
			_quest:setTimer(500);
			return true;
		end
	end

--[[
-- try to survive water
	local sx, sy, sz = 0, 0, 0;
	if not IsSwimming() and not IsMoving() then
		sx, sy, sz = localObj:GetPosition();
		self.breathTimer = GetTimeEX() + 45000;
	end
	
	if IsSwimming() and ((not IsInCombat() and not PlayerHasTarget()) or (GetTimeEX() > self.breathTimer)) and not IsLooting() and self.grindSpotReached then
		Move(x, y, z);
		if not self.breathTimerSet then
			self.breathTimer = GetTimeEX() + 45000;
		end
	return;
	end
--]]

-- reset blacklist timer
	if (PlayerHasTarget() and IsInCombat()) or (PlayerHasTarget() and GetTarget():IsDead()) or IsMoving() then
		_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
	end
	
	if (not HasSpell("First Aid")) then
		script_grind.useFirstAid = false;
	end
	
	script_grind.nextToNodeDist = 3;
	
	--NavmeshSmooth(2);
	
	if GetNumQuestLogEntries() == 0 then
		_quest.weHaveQuest = false;
	end
	
	if (script_vendor.status == 0) then
		script_vendor.message = "idle...";
	end
	
	if IsCasting() or IsChanneling() or localObj:IsStunned() then
		return true;
	end
		
	if (localObj:IsDead()) then
		_quest.message = "Waiting to ressurect...";
		_quest.enemyTarget = nil;
		if (not IsGhost()) then
			if (not RepopMe()) then
				if (script_grindEX.useThisVar) then
					_quest:setTimer(1500);
					script_grindEX.deathCounter = script_grindEX.deathCounter + 1;
					script_grindEX.useThisVar = false;
				end
				_quest.message = "Walking to corpse...";
			return true;
			end
		return true;
		end

		local _lx, _ly, _lz = localObj:GetPosition();
		local _rtx, _rty, _rtz = _questDB:getReturnTargetPos();

		if GetCorpsePosition() ~= nil and GetCorpsePosition() ~= 0 then
			if _quest.isQuestComplete and GetDistance3D(_lx, _ly, _lz, _rtx, _rty, _rtz) < 300 and GetDistance3D(_lx, _ly, _lz, GetCorpsePosition()) > 200 and GetDistance3D(_rtx, _rty, _rtz, GetCorpsePosition()) > 100 then
				_questRessAtGY:ressurect();
				return true;
			else
				-- Ressurrect within the ress distance to our corpse
				if (GetDistance3D(_lx, _ly, _lz, GetCorpsePosition()) > script_grind.ressDistance) then
					local x, y, z = GetCorpsePosition();
					grind2MoveToTarget:run(Player(), x, y, z);
					return true;
				else
					local rx, ry, rz = GetCorpsePosition();
					if (script_grind.safeRess) then
						if (script_aggro:safeRess(rx, ry, rz, script_grind.ressDistance)) then
							script_grind.message = "Finding a safe spot to ress...";
						else
							if (script_aggro.rTime > GetTimeEX()) then
								grind2MoveToTarget:run(Player(), script_aggro.rX, script_aggro.rY, script_aggro.rZ);
								script_grind.message = "Finding a safe spot to ress...";
								return true;
							end
						end
					end
					if GetDistance3D(_lx, _ly, _lz, rx, ry, rz) <= script_grind.ressDistance and GetTimeEX() > self.retrieveCorpseTimer then
						RetrieveCorpse();
						self.retrieveCorpseTimer = GetTimeEX() + 2500;
					end
					script_grindEX.useThisVar = true;
				end
				return true;
			end
		end 
	end

	if GetNumPartyMembers() > 0 then
		if _quest.enemyTarget == 0 or _quest.enemyTarget == nil and IsInCombat() then
			_quest.enemyTarget = script_grindAssignTarget:assignTarget();
			_quest.message = "Assisting party members";
		end
	end

	if _questEX2:doChecks() then
		return true;
	end


return false;
end