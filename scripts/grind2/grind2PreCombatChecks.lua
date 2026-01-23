grind2PreCombatChecks = {

}

function grind2PreCombatChecks:run()

	-- move away from additional targets in combat
	if IsInCombat() and grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil then
		if grind2.enemyTarget:GetHealthPercentage() >= 25 and not script_checkDebuffs:hasDisabledMovement() then
			if script_checkAdds:checkAdds() then
				script_om:FORCEOM();
			return;
			end
		end
	end

	-- clear any target that is not enemy target when we are not in combat
	if not IsInCombat() and grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil then

		if PlayerHasTarget() and not IsCasting() and not IsChanneling() then

			if GetTarget():GetGUID() ~= grind2.enemyTarget:GetGUID() then

				ClearTarget();
			end
		end
	end

	-- if we are in combat and don't have a target attacking us then get target atacking us
	if IsInCombat() and grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil then

		if not PlayerHasTarget() and IsInCombat() and not IsCasting() and not IsChanneling() then

			if grind2IsTargetingMe:target(grind2.enemyTarget) or grind2IsTargetingPet:target(grind2.enemyTarget) then

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