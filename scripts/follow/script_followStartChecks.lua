script_followStartChecks = {}

-- do checks before running anything else in follow script
function script_followStartChecks:doStartChecks()

-- set script speed
	script_follow.tickRate = 135;
	if (IsMoving()) then
		script_follow.tickRate = 50;
	end
	if (IsInCombat()) and (not IsMoving()) then
		script_follow.tickRate = 500;
	end

-- follower messages
	if (not IsMoving()) and (not IsInCombat())
	and script_followNumEnemiesAttackingLeader:numEnemiesAttackingLeader() == 0
	and script_followNumEnemiesAttackingUs:numEnemiesAttackingUs() == 0
	
	then
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

-- auto unstuck feature

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

-- random follow leader distance
	script_followRandomFollowLeaderDistance:randomFollowLeaderDistance();

-- accept group invites
	script_followAcceptGroupInvite:acceptGroupInvite();


-- VENDORING PHASE IF WE ARE CLOSE TO A VENDOR

	local leader = GetPartyLeaderObject();

	local isVendoring = false;

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


-- if we are dead then do corpse walk
	script_followPlayerIsDead:playerIsDead();


end