script_followStartChecks = {}

-- do checks before running anything else in follow script
function script_followStartChecks:doStartChecks()

-- auto unstuck feature
	local thisTime = script_followMoveToTarget.moveTimer - 4000;

	if (script_follow.unstuck) and (IsMoving()) then

		script_unstuck.turnSensitivity = 3;

		if (not script_unstuck:pathClearAuto(2)) then
			script_follow.isStuck = true;
			script_unstuck:unstuck();
			script_follow.message = script_unstuck.message;
		return true;
		else
			script_follow.isStuck = false;
		end
	end

-- set script speed
	script_follow.tickRate = 135;
	if (IsMoving()) then
		script_follow.tickRate = 50;
	end
	if (IsInCombat()) and (not IsMoving()) then
		script_follow.tickRate = 500;
	end

-- follower messages
	if (not IsMoving()) and (not IsInCombat()) then
		script_follow.message = "Waiting for action";
	end
	if (not IsInCombat()) then
		script_follow.combatError = nil; 
	end

	if (AreBagsFull() and not IsInCombat()) then
		script_follow.message = 'Warning bags are full...';
	end


-- Wait out the wait-timer and/or casting or channeling
	if (script_follow.waitTimer > GetTimeEX() + script_follow.tickRate or IsCasting() or IsChanneling()) then
	return;
	end

-- random follow leader distance
	if (GetTimeEX() > script_follow.followTimer) and (script_follow.randomFollow) then
		local r = math.random(10, 20);
		script_follow.followLeaderDistance = r;
		localObj = GetLocalPlayer();
		script_follow.followTimer = GetTimeEX() + 18000;
	end

-- Accept group invite
	if (GetNumPartyMembers() < 1 and script_follow.acceptTimer < GetTimeEX()) then
		script_follow.acceptTimer = GetTimeEX() + 5000;
		AcceptGroup();
	end

	local leader = GetPartyLeaderObject();
	local isVendoring = false;

-- VENDORING PHASE IF WE ARE CLOSE TO A VENDOR

-- If bags are full
	if (script_followDoVendor.useVendor) and (not IsInCombat()) and (script_followDoVendor:closeToVendor()) then isVendoring = true;
		if (script_vendor:sell()) then
			if (CanMerchantRepair()) then
				RepairAllItems(); 
	-- sell
				script_vendorMenu:sellLogic();
				script_follow.waitTimer = GetTimeEX() + 300;
			return;
			else
				script_vendorMenu:sellLogic();
			return;
			end
		return;
		end
	end

-- CORPSE WALK PHASE

	local localObj = GetLocalPlayer();

-- Corpse-walk if we are dead
	if(localObj:IsDead()) then
		script_follow.tickRate = 100;
		script_follow.message = "Walking to corpse...";

-- Release body
		if(not IsGhost()) then
			RepopMe(); 
		return;
		end

-- Ressurrect within the ress distance to our corpse
		local _lx, _ly, _lz = localObj:GetPosition();
		
		if (GetDistance3D(_lx, _ly, _lz, GetCorpsePosition()) > script_follow.ressDistance) then
			script_nav:moveToNav(localObj, GetCorpsePosition());
			script_follow.message = "Running to corpse...";
		return;
		else
			local rx, ry, rz = GetCorpsePosition();
-- safe res
			if (script_aggro:safeRess(rx, ry, rz, script_grind.ressDistance)) then
				script_grind.message = "Finding a safe spot to ress...";
			return;
			end
-- retrieve corpse
		RetrieveCorpse();

		end
	return;
	end
end