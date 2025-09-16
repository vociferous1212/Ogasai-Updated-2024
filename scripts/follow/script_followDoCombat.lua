script_followDoCombat = {

	timer = GetTimeEX(),

}

function script_followDoCombat:run()

	-- reset the combat status
	script_follow.combatError = nil; 

	local localObj = GetLocalPlayer();

	-- local enemy var
	local enemy = nil;
	if script_follow.enemyObj ~= nil and script_follow.enemyObj ~= 0 then
		enemy = script_follow.enemyObj;
	end

	-- Healer check: heal/buff the party
	for i = 1, GetNumPartyMembers() do
		local member = GetPartyMember(i);
		if (not member:IsDead()) and (not localObj:IsDead()) and (not IsMoving()) then
			if (script_followHealsAndBuffs:healAndBuff()) then
				self.message = "Healing/buffing the party...";
				script_follow.waitTimer = GetTimeEX() + 500;
				self.timer = GetTimeEX() + 500;
				ClearTarget();
	-- can try to return here instead of return true
				return;
			end
		end
	end

	-- do combat script only if wait timer has finished
	if (GetTimeEX() + script_follow.tickRate > self.timer) and not IsCasting() and not IsChanneling() then

		if script_follow.enemyObj ~= nil then

			local enemy = script_follow.enemyObj;

			if (enemy ~= 0 and enemy ~= nil) or (IsInCombat()) and (not enemy:IsDead()) then
	
				-- Run the combat script and retrieve combat script status if we have a valid target
				if (enemy ~= nil and enemy ~= 0) or (IsInCombat()) then
		
					script_follow.combatError = RunCombatScript(enemy:GetGUID());
		
					-- set combat conditions by class
					local _ , class = UnitClass('player');
		
					-- get combat errors from combat scripts
						
					--script_follow.message = "Running the combat script...";
					-- In range: attack the target, combat script returns 0
					if(script_follow.combatError == 0) then
						if IsMoving() then
							StopMoving(); 
							return;
						end
					end
					-- Invalid target: combat script return 2
					if (script_follow.combatError == 2) then
						enemy = nil;
						ClearTarget();
						return;
					end
					-- Move in range: combat script return 3
					if (script_follow.combatError == 3) then
						
						script_follow.message = "Moving to target...";
						local x, y, z = enemy:GetPosition();
						script_navEXCombat:moveToTarget(localObj, x, y, z)
						if not IsMoving() then Move(x, y, z); script_follow.message = "Nav broke..."; end
						--return;
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
	end

-- maybe returning false each pass with help run the healer scripts
return false;
end