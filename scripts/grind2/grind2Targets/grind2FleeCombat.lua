grind2FleeCombat = {

	fleeCombat = false,

	fleeWithAdds = false,

	healthToFlee = 36,

	manaToFlee = 100

}


-- intent is to save the character from death by fleeing when health and or mana is too low
-- or when too many targets are attacking
function grind2FleeCombat:run()

	local player = GetLocalPlayer();
	local health = player:GetHealthPercentage();
	local mana = 100;

	if GetMyClass() ~= "WARRIOR" and GetMyClass() ~= "ROGUE" then
		mana = player:GetManaPercentage();
	end

	local targetHealth = 100;

	if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
		targetHealth = grind2.enemyTarget:GetHealthPercentage();
	end
	if IsInCombat() then
		if (health <= self.healthToFlee and mana <= self.manaToFlee and (targetHealth > health or NumberTargetsAttackingPlayer() >= 2) )
		or (NumberTargetsAttackingPlayer() >= 2 and self.fleeWithAdds) then
			if GetPet() ~= nil and GetPet() ~= 0 then
				PetFollow();
			end
			if grind2SaveCoordinates:moveToSavedLocation() then
				return true;
			end
		end
	end

return false;
end
