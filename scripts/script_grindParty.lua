script_grindParty = {

	forceTarget = false,
	waitForGroup = false,	--wait for group mana / health
	waitForMemberDistance = false,	-- wait for group distance
	healGroup = false,
	partyHealsLoaded = include("scripts\\follow\\script_followHealsAndBuffs.lua"),
	usePartybots = false,
	partybotFollowTimer = 0,
	partybotAttackTimer = 0,
	partybotActionTime = 7	-- adjust time to tell partybots to attack and follow

}

function script_grindParty:partyOptions()

	if script_grind.waitTimer > GetTimeEX() then return; end
	if self.usePartybots then

		local target = script_grind.enemyObj;
		local setTime = self.partybotActionTime * 1000;

		if GetTimeEX() > self.partybotAttackTimer then
			if target ~= nil and target ~= nil and PlayerHasTarget() then
				SendChatMessage(".partybot Attack");
				self.partybotAttackTimer = GetTimeEX() + setTime;
			end
		end
		if GetTimeEX() > self.partybotFollowTimer then
			if not IsInCombat() and not PlayerHasTarget() and (target == nil or target == 0) then
				SendChatMessage(".partybot ComeToMe")
				self.partybotFollowTimer = GetTimeEX() + setTime;
			end
		end
	end

--

	local groupMana = 0;
	local manaUsers = 0;
	local memberEnergy = 0;
	local memberRage = 0;
	local memberHealth = 0;
	local memberMana = 0;
	local member = 0;
	local memberDistance = 0;

	for i = 1, GetNumPartyMembers() do

			if (GetNumPartyMembers() > 0) then
				member = GetPartyMember(i);
				memberHealth = member:GetHealthPercentage();
				memberDistance = member:GetDistance();
			end	
			if (member:GetManaPercentage() > 0) then
				groupMana = groupMana + member:GetManaPercentage();
				manaUsers = manaUsers + 1;
				memberMana = member:GetManaPercentage();
			end
	
			if (member:GetRagePercentage() > 0) then
				memberRage = member:GetRagePercentage();
			end
	
			if (member:GetEnergyPercentage() > 0) then
				memberEnergy = member:GetEnergyPercentage();
			end
	end

	if self.forceTarget and IsInCombat() and GetNumPartyMembers() ~= 0 then
		local i, t = GetFirstObject();
		while i ~= 0 do
			if t == 3 or t == 4 then
				if i:GetDistance() <= 40 and script_grind:isTargetingGroup(i) and i:CanAttack() then
					script_grind.enemyObj = i;
					if not IsAutoCasting("Attack") then
						i:AutoAttack();
					end
				end
			end
		i, t = GetNextObject(i);
		end
	end
	
	if (self.waitForGroup) and (script_grind:getTargetAttackingUs() == nil) and (not IsInCombat()) then
		if (member:HasBuff("Drink") and memberMana < 90) or (member:HasBuff("Eat") and memberHealth < 90) then
			if (member:GetDistance() < 10) then
				--local x, y, z = member:GetDistance();
				--if (script_navEX:moveToTarget(localObj, x, y, z)) then
				--	return true;
				--end
			end
			
			script_grind.message = 'Waiting for group to regen mana (25%+)...';
			ClearTarget();
		return true;
		end
	end

	if (self.waitForMemberDistance) and (memberDistance > 100) and (not IsInCombat()) and (not script_grindParty:isAttackingGroup()) then

		if (IsMoving()) then
			StopMoving();
		end

		script_grind.message = 'Waiting for group members...';
		ClearTarget();
		return true;
	end

	if (self.healGroup) then
		if (member:GetDistance() <= 40) then
			if (script_followHealsAndBuffs:healAndBuff()) then
				return true;
			end
		end
	end
return false;
end

function script_grindParty:isAttackingGroup()
	local i, typeObj = GetFirstObject();
	while i ~= 0 do
		if (typeObj == 3 or typeObj == 4) and (i:GetDistance() < 60) and (i:CanAttack()) and (not i:IsDead()) and i:CanAttack() then
			local target = i:GetUnitsTarget();
			if (target ~= nil) then
				for p = 1, GetNumPartyMembers() do
					local member = GetPartyMember(p);
					if (member ~= nil and target:GetGUID() == member:GetGUID()) then
						return true;
					end
				end
			end
		end
		i, typeObj = GetNextObject(i);
	end
	return false
end