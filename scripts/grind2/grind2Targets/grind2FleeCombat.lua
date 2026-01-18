grind2FleeCombat = {

	fleeCombat = true,

	fleeWithAdds = false,

	healthToFlee = 30,

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

	if IsInCombat() and NumberTargetsAttackingPlayer() >= 2 and self.fleeWithAdds then
		grind2SaveCoordinates:moveToSavedLocation();
		return true;
	end

	if IsInCombat() and health <= self.healthToFlee and mana <= self.manaToFlee then
		if GetPet() ~= nil and GetPet() ~= 0 then
			PetFollow();
		end
		grind2SaveCoordinates:moveToSavedLocation();
		return true;
	end

return false;
end
