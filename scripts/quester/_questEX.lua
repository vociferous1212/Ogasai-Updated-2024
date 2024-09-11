_questEX = {bagsFull = false, jumpTimer = 3000, breathTimer = 0, standingInFireTimer = 0}

function _questEX:doStartChecks()
	if not IsUsingNavmesh() then UseNavmesh(true); return true; end
	if (not LoadNavmesh()) then self.message = "Make sure you have mmaps-files..."; return true; end
	if (GetLoadNavmeshProgress() ~= 1) then self.message = "Loading Nav Mesh! Please Wait!"; return true; end
		if _quest.enemyTarget ~= nil then if not _quest.enemyTarget:CanAttack() then _quest.enemyTarget = nil; end end
	if PlayerHasTarget() and _quest.currentType == 10 then
		if GetTarget():GetUnitName() == GetLocalPlayer():GetUnitName() then
			if UnitOnTaxi("player") then
				_quest.pause = true;
			end
		end
	end
	if _quest.currentType == 10 and _quest.pause then
		if PlayerHasTarget() then
			if GetTarget():GetUnitName() == GetLocalPlayer():GetUnitName() then
				if not UnitOnTaxi("Player") then
					_quest.pause = false;
				end
			end
		end
	end

	if GetTimeEX() > self.standingInFireTimer then
	script_helper:areWeStandingInFire()
	self.standingInFireTimer = GetTimeEX() + 5000;
	end

return false;
end
function _questEX:doChecks()

	local localObj = GetLocalPlayer();

	if GetTimeEX() > (_quest.tickRate*1000) + self.jumpTimer then
		local jumpRandom = random(0, 10);
		if (jumpRandom == 10 and IsMoving() and not IsInCombat()) then local randomTimer = math.random(3000, 10000); self.jumpTimer = GetTimeEX() + randomTimer; JumpOrAscendStart(); end end
	if not localObj:IsDead() then if _quest:runRest() then _questDoCombat.blacklistTimer = GetTimeEX() + 10000; _quest:setTimer(500); return true; end end
	local sx, sy, sz = 0, 0, 0;
	if not IsSwimming() then sx, sy, sz = localObj:GetPosition(); self.breathTimer = GetTimeEX() + 45000; end
	if IsSwimming() and ((not IsInCombat() and not PlayerHasTarget()) or (GetTimeEX() > self.breathTimer)) and not IsLooting() and self.grindSpotReached then Move(x, y, z); if not self.breathTimerSet then self.breathTimer = GetTimeEX() + 45000; end return; end
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

		local _lx, _ly, _lz = localObj:GetPosition();
		local _rtx, _rty, _rtz = _questDB:getReturnTargetPos();

		if GetCorpsePosition() ~= nil and _quest.isQuestComplete and GetDistance3D(_lx, _ly, _lz, _rtx, _rty, _rtz) < 300 and GetDistance3D(_lx, _ly, _lz, GetCorpsePosition()) > 200 and GetDistance3D(_rtx, _rty, _rtz, GetCorsePosition()) > 100 then
		
			_questRessAtGY:ressurect();
			return true;
		else

		
		-- Ressurrect within the ress distance to our corpse
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
						end end end RetrieveCorpse(); script_grindEX.useThisVar = true; end return true; end end
	if _questEX2:doChecks() then
		return true;
	end
return false;
end