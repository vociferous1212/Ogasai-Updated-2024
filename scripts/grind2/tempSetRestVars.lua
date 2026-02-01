tempSetRestVars = {}


-- temp function to set mana and health		TEMPORARY
function tempSetRestVars:setRestVars()

	if GetMyClass() == "DRUID" then
		grind2.restMana = script_druid.drinkMana;
		grind2.restHealth = script_druid.eatHealth;
	elseif GetMyClass() == "HUNTER" then
		grind2.restMana = script_hunter.drinkMana;
		grind2.restHealth = script_hunter.eatHealth;
	elseif GetMyClass() == "MAGE" then
		grind2.restMana = script_mage.drinkMana;
		grind2.restHealth = script_mage.eatHealth;
	elseif GetMyClass() == "PALADIN" then
		grind2.restMana = script_paladin.drinkMana;
		grind2.restHealth = script_paladin.eatHealth;
	elseif GetMyClass() == "SHAMAN" then
		grind2.restMana = script_shaman.drinkMana;
		grind2.restHealth = script_shaman.eatHealth;
	elseif GetMyClass() == "WARLOCK" then
		grind2.restMana = script_warlock.drinkMana;
		grind2.restHealth = script_warlock.eatHealth;
	elseif GetMyClass() == "WARRIOR" then
		grind2.restHealth = script_warrior.eatHealth;
	elseif GetMyClass() == "ROGUE" then
		grind2.restHealth = script_rogue.eatHealth;
	elseif GetMyClass() == "PRIEST" then
		grind2.restMana = script_priest.drinkMana;
		grind2.restHealth = script_priest.eatHealth;
	end
end