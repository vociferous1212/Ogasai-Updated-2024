grind2PreCombatChecks = {

}

function grind2PreCombatChecks:run()

	-- clear any target that is not enemy target when we are not in combat
	if grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil then

		if PlayerHasTarget() and not IsInCombat() and not IsCasting() and not IsChanneling() then

			if GetTarget():GetGUID() ~= grind2.enemyTarget:GetGUID() then

				ClearTarget();
			end
		end
	end

	-- if we are in combat and enemy target is not attacking me then clear target
	if grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil then

		if PlayerHasTarget() and IsInCombat() and not IsCasting() and not IsChanneling() then

			if not grind2IsTargetingMe:target(grind2.enemyTarget) and not grind2IsTargetingPet:target(grind2.enemyTarget) then

				grind2.enemyTarget = grind2GetTargetAttackingMe:run();
			end
		end
	end

	-- clear blacklisted targets if they are not attacking me
	if PlayerHasTarget() and grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil then

		if not grind2IsTargetingMe:target(grind2.enemyTarget) and not grind2IsTargetingPet:target(grind2.enemyTarget) and grind2Blacklisting:isTargetBlacklisted(grind2.enemyTarget:GetGUID()) then
			
			grind2.enemyTarget = nil;

			ClearTarget();

			return;
		end
	end

end