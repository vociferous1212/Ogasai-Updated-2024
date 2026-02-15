grind2FleeCombat = {

	fleeCombat = false,

	fleeWithAdds = false,

	healthToFlee = 36,

	manaToFlee = 100,

	isSetup = false,
}

function grind2FleeCombat:setup()

	if GetMyClass() == "DRUID" then
		self.manaToFlee = 20;
	end

self.isSetup = true;
end

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

-- priest stuffs

	-- cast power word shield
	if not Player():HasDebuff("Weakened Soul") and HasSpell("Power Word: Shield") and not IsSpellOnCD("Power Word: Shield") then
		CastSpellByName("Power Word: Shield", Player());
	end
	-- cast renew
	if not Player():HasBuff("Renew") and HasSpell("Renew") and not IsSpellOnCD("Renew") then
		CastSpellByName("Renew", Player());
	end

-- mage stuffs

-- druid stuffs

-- paladin stuffs

-- ROGUE
	if HasSpell("Sprint") and not IsSpellOnCD("Sprint") and not Player():HasBuff("Sprint") then
		CastSpellByName("Sprint");
	end


-- run out of combat... move to saved locations
	if IsInCombat() then
		if (health <= self.healthToFlee and mana <= self.manaToFlee) or (NumberTargetsAttackingPlayer() >= 2 and self.fleeWithAdds) then
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
