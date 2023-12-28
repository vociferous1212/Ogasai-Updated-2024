script_followDoCombat = {

	timer = GetTimeEX(),

}

function script_followDoCombat:run()

	-- reset the combat status
	script_follow.combatError = nil; 

	-- local enemy var
	local enemy = script_follow.enemyObj;

	-- Healer check: heal/buff the party
	for i = 1, GetNumPartyMembers() do
		local member = GetPartyMember(i);
		if (not member:IsDead()) and (not localObj:IsDead()) and (not IsMoving()) then
			if (script_followHealsAndBuffs:healAndBuff()) then
				self.message = "Healing/buffing the party...";
				script_follow.waitTimer = GetTimeEX() + 500;
				ClearTarget();
				return true;
			end
		end
	end

	if(GetTimeEX() > self.timer) then
		self.timer = GetTimeEX() + script_follow.tickRate;

	if (enemy ~= 0 and enemy ~= nil) or (IsInCombat()) and (not enemy:IsDead()) then

		-- Run the combat script and retrieve combat script status if we have a valid target
		if (enemy ~= nil and enemy ~= 0) or (IsInCombat()) then

			script_follow.combatError = RunCombatScript(enemy:GetGUID());

			-- set combat conditions by class
			local class = UnitClass('player');

				-- no wand equipped then use melee - priest/warlock/mage
				--if (enemy ~= nil) and (class == 'Priest' or class == 'Warlock' or class == 'mage')
				--	and (not localObj:HasRangedWeapon()) and (not enemy:HasDebuff("Frost Nova")) then

					-- move to melee distance
				--	if (enemy:GetDistance() > script_follow.meleeDistance)
				--		or (not enemy:IsInLineOfSight()) then
				--		local x, y, z = enemy:GetPosition();
				--		script_followMoveToTarget:moveToTarget(localObj, x, y, z);
				--		return;
				--	end
				--end

			-- get combat errors from combat scripts

				script_follow.message = "Running the combat script...";
				-- In range: attack the target, combat script returns 0
				if(script_follow.combatError == 0) then
					if IsMoving() then
						StopMoving(); 
						return;
					end
				end
				-- Invalid target: combat script return 2
				if(script_follow.combatError == 2) then
					enemy = nil;
					ClearTarget();
					return;
				end
				-- Move in range: combat script return 3
				if (script_follow.combatError == 3) then
					self.timer = GetTimeEX() + 1000;
					script_follow.message = "Moving to target...";
					local x, y, z = enemy:GetPosition();
					if (Move(x, y, z)) then
					
						return true;
					end
				end
				-- Do nothing, return : combat script return 4
				if (script_follow.combatError == 4) then
					return;
				end	
				-- Stop bot, request from a combat script
				if(script_follow.combatError == 6) then
					script_follow.message = "Combat script request stop bot...";
					Logout();
					StopBot();
					return;
				end

				-- face enemy target
				if (enemy ~= nil) then
					enemy:FaceTarget();
				end
			end
		end
	end
return false;
end