grind2FleeCombat = {

	fleeCombat = false,

	fleeWithAdds = false,

	healthToFlee = 36,

	manaToFlee = 100,

	isSetup = false,
}

function grind2FleeCombat:setup()

	if GetRealmName() == "Permadeath - EU" then
		self.fleeCombat = true;
		self.fleeWithAdds = true;
	end

	if GetMyClass() == "DRUID" or GetMyClass() == "SHAMAN" or GetMyClass() == "PRIEST" or GetMyClass() == "PALADIN" then
		if PlayerLevel() <= 10 then
			self.manaToFlee = 40;
		else
			self.manaToFlee = 20;
		end
	end

	if GetMyClass() == "WARLOCK" or GetMyClass() == "MAGE" or GetMyClass() == "HUNTER" then
		self.manaToFlee = 100;
	end

	if PlayerLevel() <= 20 then
		if GetMyClass() == "MAGE" or GetMyClass() == "WARLOCK" then
			self.healthToFlee = 45;
		end
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

	if GetTimeEX() > grind2Potions.potionTimer then
		grind2Potions:useHealthPotion();
	end

-- priest stuffs
	-- cast power word shield
	if not Player():HasDebuff("Weakened Soul") and HasSpell("Power Word: Shield") and not IsSpellOnCD("Power Word: Shield") then
		local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Power Word: Shield");
		if PlayerManaTotal() >= cost then
			CastSpellByName("Power Word: Shield", Player());
		end
	end
	-- cast renew
	if not Player():HasBuff("Renew") and HasSpell("Renew") and not IsSpellOnCD("Renew") then
		local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Renew");
		if PlayerManaTotal() >= cost then
			CastSpellByName("Renew", Player());
		end
	end

-- shaman stuffs
	-- earthbind totem
	if HasItem("Earth Totem") and HasSpell("Earthbind Totem") and not IsSpellOnCD("Earthbind Totem") then
		local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Earthbind Totem");
		if PlayerManaTotal() >= cost then
			CastSpellByName("Earthbind Totem");
		end
	end

-- mage stuffs
	-- ice block if every other CC on cooldown - check conditions thoroughly

	-- ice armor
	-- OR
	-- mage armor

	-- frost nova
	if HasSpell("Frost Nova") and not IsSpellOnCD("Frost Nova") then
		local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Frost Nova");
		if PlayerManaTotal() >= cost then
			CastSpellByName("Frost Nova");
		end
	end
	-- blink
	if HasSpell("Blink") and not IsSpellOnCD("Blink") then
		local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Blink");
		if (PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 10 then
			CastSpellByName("Blink");
		end
	end

-- druid stuffs


-- hunter
	-- feign death
		-- controlled in grinder
	if HasSpell("Feign Death") and not IsSpellOnCD("Feign Death") then
		local castTime, maxRange, minRange, powerType, cost, spellID, spellObj = GetSpellInfo("Feign Death");
		if (PlayerManaTotal() >= cost and cost ~= 0) or PlayerMana() >= 5 then
			CastSpellByName("Feign Death");
			grind2:setTimer(5000);
		end
	end

--[[
	-- aspect of the monkey
	if not HasSpell("Feign Death") or (IsSpellOnCD("Feign Death") and not Player():HasBuff("Feign Death")) then
		if HasSpell("Aspect of the Monkey") and not IsSpellOnCD("Aspect of the Monkey") and PlayerMana() >= 15 then
			CastSpellByName("Aspect of the Monkey");
		end
	end
--]]

-- paladin stuffs


-- rogue stuffs
	-- sprint
	if HasSpell("Sprint") and not IsSpellOnCD("Sprint") and not Player():HasBuff("Sprint") then
		CastSpellByName("Sprint");
	end


-- run out of combat... move to saved locations
	if IsInCombat() then
		if (health <= self.healthToFlee and mana <= self.manaToFlee) or (NumberTargetsAttackingPlayer() >= 2 and self.fleeWithAdds) then
			if GetPet() ~= nil and GetPet() ~= 0 then
				PetFollow();
			end
			local fbTable = {[116] = true, [205] = true, [837] = true, [7322] = true, [8406] = true, [8407] = true, [8408] = true, [10179] = true, [10180] = true, [10181] = true, [25304] = true};
			if fbTable[GetLocalPlayer():GetCasting()] then
				SpellStopCasting();
			end
			if grind2SaveCoordinates:moveToSavedLocation() then
				return true;
			end
		end
	end

return false;
end
