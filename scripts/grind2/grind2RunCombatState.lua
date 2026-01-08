grind2RunCombatState = {

	autoAttackTimer = GetTimeEX(),		-- timer for auto attack default 1.5seconds set in script

	timer = GetTimeEX()


}

function grind2RunCombatState:run()

-- set variables

	local currentTime = GetTimeEX();
	
	local player = GetLocalPlayer();

	local playerHealth = player:GetHealthPercentage();

	local playerMana = player:GetManaPercentage();

	local targetHealth = 0;

	local targetMana = 0;

	if grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil then
	
		targetHealth = grind2.enemyTarget:GetHealthPercentage();

		targetMana = grind2.enemyTarget:GetManaPercentage();
	end

	local pet = GetPet();

	local petHealth = 0;

	local petFocus = 0;

	if pet ~= 0 and pet ~= nil then
	
		petHealth = pet:GetHealthPercentage();

		petFocus = pet:GetFocusPercentage();
	end

	local xx, yy, zz = 0, 0, 0;

	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
		xx, yy, zz = grind2.enemyTarget:GetPosition();
	end

	local localObj = GetLocalPlayer();

	local x, y, z = player:GetPosition();

	local enemyTarget = nil;

-- if target is not dead and we can attack it
	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then

		enemyTarget = grind2.enemyTarget;

		if enemyTarget:CanAttack() and not enemyTarget:IsDead() then

			-- stand up if sitting
			if not IsStanding() then

				JumpOrAscendStart();
			end

			-- auto attack / target the target
			if ( (GetMyClass() ~= "HUNTER" and not IsAutoCasting("Auto Shot"))
			or (GetMyClass() ~= "HUNTER" and not IsStealth() and not IsAutoCasting("Attack")) )
			and currentTime > self.autoAttackTimer then

				enemyTarget:AutoAttack();
				self.autoAttackTimer = currentTime + 2000;
			end

			-- move to target
			--if x ~= nil and xx ~= nil then
			--	if enemyTarget:GetDistance() > grind2.combatScriptRange or not enemyTarget:IsInLineOfSight() then			--		grind2MoveToTarget:run(localObj, xx, yy, zz);
			--	end
			--end

			-- TEMPORARY move to target
			if script_grind.combatError == 3 or grind2.combatScriptReturn == "MOVE TO TARGET" then
				grind2MoveToTarget:run(localObj, xx, yy, zz);
				-- causing stuttering but without a timer somewhere the nav locks up
				--grind2:setTimer(100);
			end
		
			-- last target targeted
			if enemyTarget ~= nil and enemyTarget ~= 0 then 
				grind2.lastTargetTargetedGUID = enemyTarget:GetGUID();
			end

			-- TEMPORARY run old combat helper
			if IsInCombat() then
				script_combatHelper:run()
			end

			-- return for timer
			if self.timer > currentTime and not IsMoving() then
				return;
			end

			-- TEMPORARY run old combat error
			script_grind.combatError = RunCombatScript(enemyTarget:GetGUID());

			-- run currently loaded combat script
			--RunCombatScript(enemyTarget:GetGUID());
		end
	end

	self.timer = currentTime + grind2AdjustTimersMenu.combatScriptTimer;
return true;
end