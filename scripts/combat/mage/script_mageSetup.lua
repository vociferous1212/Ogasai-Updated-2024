script_mageSetup = {}

function script_mageSetup:setup()

	script_mage:addWater('Conjured Crystal Water');
	script_mage:addWater('Conjured Sparkling Water');
	script_mage:addWater('Conjured Mineral Water');
	script_mage:addWater('Conjured Spring Water');
	script_mage:addWater('Conjured Purified Water');
	script_mage:addWater('Conjured Fresh Water');
	script_mage:addWater('Conjured Water');
	
	script_mage:addFood('Conjured Cinnamon Roll');
	script_mage:addFood('Conjured Sweet Roll');
	script_mage:addFood('Conjured Sourdough')
	script_mage:addFood('Conjured Pumpernickel');
	script_mage:addFood('Conjured Rye');
	script_mage:addFood('Conjured Bread');
	script_mage:addFood('Conjured Muffin');
	
	script_mage:addManaGem('Mana Agate');
	script_mage:addManaGem('Mana Citrine');
	script_mage:addManaGem('Mana Jade');
	script_mage:addManaGem('Mana Ruby');

	if HasSpell("Frostbolt") then
		script_mage.startedNewCharacter = false;
	end

	-- no more bugs first time we run the bot
	script_mage.waitTimer = GetTimeEX();
	script_mage.gemTimer = GetTimeEX();
	script_mage.cooldownTimer = GetTimeEX();
	script_mage.polyTimer = GetTimeEX();

	-- set cone of cold to false - debug stuff
	if (not HasSpell("Cone of Cold")) then
		script_mage.useConeOfCold = false;
	end

	-- set frost nova to false - debug stuff
	if (not HasSpell("Frost Nova")) then
		script_mage.useFrostNova = false;
	end

	localObj = GetLocalPlayer();

	-- set spec below level 4
	if (not HasSpell("Frostbolt")) then
		script_mage.fireMage = true;
		script_mage.spellRange = 35;
		script_mage.frostMage = false;
	end

	if (GetLocalPlayer():GetLevel() < 10) and (localObj:HasRangedWeapon()) then
		script_mage.useWandHealth = 75;
	end

	if PlayerLevel() >= 10 and PlayerLevel() < 20 then
		script_mage.useWandHealth = 35;
	end
	
	-- set group settings mainly used for easy follower reloads
	if (GetNumPartyMembers() > 1) then
		script_mage.useBlink = false;
		script_mage.useFrostNova = false;
		script_mage.polymorphAdds = false;
		script_mage.useDampenMagic = false;
		script_mage.drinkMana = 35;
	end

	-- if no wand then don't use wand
	if (not localObj:HasRangedWeapon()) then
		script_mage.useWand = false;
	end

	-- use cold snap to set frost mage as true
	if (HasSpell("Cold Snap")) then
		script_mage.frostMage = true;
		script_mage.fireMage = false;
	end
	
	-- use pyroblast to set fire mage as true
	if (HasSpell("Pyroblast")) then
		script_mage.fireMage = true;
		script_mage.frostMage = false;
		script_mage.shieldHealth = 95;
		script_mage.eatHealth = 65;
		script_mage.useWandHealth = 15;
	end

	-- hide scorch until high enough level for talent obtained debuffs
	if (GetLocalPlayer():GetLevel() < 27) or (script_mage.frostMage) then
		script_mage.useScorch = false;
	end
	
	if GetLocalPlayer():GetLevel() < 7 then
		script_mage.moveAwayRest = false;
	end

	if PlayerLevel() <= 4 then
		script_mage.drinkMana = 15;
	end

	if PlayerLevel() < 6 then
		script_mage.drinkMana = 25;
	end

	-- if we have cone of cold we can start saving a lot of mana...
	if HasSpell("Cone of Cold") then
		script_mage.drinkMana = 35;
	end

	-- use mage armor because the mana conservation works well with botting
	if HasSpell("Mage Armor") and GetLocalPlayer():GetLevel() < 60 then
		script_mage.useMageArmor = true;
		script_mage.useFrostArmor = false;
	end

	-- check for spent talent points
	if GetLocalPlayer():GetLevel() >= 10 then
		script_grindCheckSpentTalentPoints:checkSpentTalentPoints()
	end

	script_mage.isSetup = true;
end