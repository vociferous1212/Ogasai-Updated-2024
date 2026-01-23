grind2PreChecks2 = {

	jumpTimer = 0,
}

function grind2PreChecks2:run()

-- random jump
	if IsMoving() and not IsInCombat() then

		local random = math.random(-100, 100);
		local randomTimer = math.random(1500, 6500);

		-- added random to slow it down
		-- if randomTimer + old jump timer > current time then jump
		if random >= 99 and GetTimeEX() > self.jumpTimer + randomTimer then

			JumpOrAscendStart();

			-- reset jump timer
			self.jumpTimer = GetTimeEX();
		end
	end

-- reaffirm enemy target - we have a good target
	if grind2.enemyTarget ~= 0 and grind2.enemyTarget ~= nil and not IsStealth() and not grind2.enemyTarget:IsDead() and grind2IsTargetingMe:target(grind2.enemyTarget) then
		if not PlayerHasTarget() then
			grind2.enemyTarget:AutoAttack();
		end
	end

	-- Update pull levels if we leveled up
	if (grind2.currentLevel < GetLocalPlayer():GetLevel()) then
		grind2IsTargetValid.minLevel = GetLocalPlayer():GetLevel() - 4;
		grind2IsTargetValid.maxLevel = GetLocalPlayer():GetLevel() + 2;
		grind2.currentLevel = GetLocalPlayer():GetLevel();
	end

end