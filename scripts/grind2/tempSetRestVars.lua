tempSetRestVars = {}


-- temp function to set mana and health		TEMPORARY
function tempSetRestVars:setRestVars()

	if GetMyClass() == "DRUID" then
		grind2.restMana = script_druid.drinkMana;
		grind2.restHealth = script_druid.eatHealth;
		grind2.potionHealth = script_druid.potionHealth;
		grind2.potionMana = script_druid.potionMana;
	elseif GetMyClass() == "HUNTER" then
		grind2.restMana = script_hunter.drinkMana;
		grind2.restHealth = script_hunter.eatHealth;
		grind2.potionHealth = script_hunter.potionHealth;
		grind2.potionMana = script_hunter.potionMana;
	elseif GetMyClass() == "MAGE" then
		grind2.restMana = script_mage.drinkMana;
		grind2.restHealth = script_mage.eatHealth;
		grind2.potionHealth = script_mage.potionHealth;
		grind2.potionMana = script_mage.potionMana;
	elseif GetMyClass() == "PALADIN" then
		grind2.restMana = script_paladin.drinkMana;
		grind2.restHealth = script_paladin.eatHealth;
		grind2.potionHealth = script_paladin.potionHealth;
		grind2.potionMana = script_paladin.potionMana;
	elseif GetMyClass() == "SHAMAN" then
		grind2.restMana = script_shaman.drinkMana;
		grind2.restHealth = script_shaman.eatHealth;
		grind2.potionHealth = script_shaman.potionHealth;
		grind2.potionMana = script_shaman.potionMana;
	elseif GetMyClass() == "WARLOCK" then
		grind2.restMana = script_warlock.drinkMana;
		grind2.restHealth = script_warlock.eatHealth;
		grind2.potionHealth = script_warlock.potionHealth;
		grind2.potionMana = script_warlock.potionMana;
	elseif GetMyClass() == "WARRIOR" then
		grind2.restHealth = script_warrior.eatHealth;
		grind2.potionHealth = script_warrior.potionHealth;
	elseif GetMyClass() == "ROGUE" then
		grind2.restHealth = script_rogue.eatHealth;
		grind2.potionHealth = script_rogue.potionHealth;
	elseif GetMyClass() == "PRIEST" then
		grind2.restMana = script_priest.drinkMana;
		grind2.restHealth = script_priest.eatHealth;
		grind2.potionHealth = script_priest.potionHealth;
		grind2.potionMana = script_priest.potionMana;
	end
end