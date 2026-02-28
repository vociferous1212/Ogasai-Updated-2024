script_hunterSetup = {

}

function script_hunterSetup:setup()

	script_hunter.feedTimer = GetTimeEX();
	script_hunter.waitTimer = GetTimeEX();

	if GetMyClass() == "HUNTER" then
		itemsList:pickupAmmoSlotFromBag1AndPlaceInBag4()
	end

-- Save the name of pet food we use
	if (GetContainerItemLink(script_hunter.bagWithPetFood-1, script_hunter.slotWithPetFood)  ~= nil) then
		local _, _, iLink = string.find(GetContainerItemLink(script_hunter.bagWithPetFood-1, script_hunter.slotWithPetFood), "(item:%d+)");
		local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
		itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(iLink);
		script_hunter.foodName = itemName;
	end

-- don't buy ammo if less than level 4
	if (GetLocalPlayer():GetLevel() < 4) then
		script_hunter.buyWhenQuiverEmpty = false;
	end
	
-- set drink / eat settings lower if low level
	if (GetLocalPlayer():GetLevel() < 6) then
		script_hunter.drinkMana = 25;
		script_hunter.eatHealth = 45;
	end

-- set drink mana lower if higher level
	if GetLocalPlayer():GetLevel() >= 6 then
		script_hunter.drinkMana = 15;
	end

-- set eat health higher if higher level
	if GetLocalPlayer():GetLevel() > 15 then
		script_hunter.eatHealth = 50;
	end

-- set hunters mark mana lower if lower level
	if (GetLocalPlayer():GetLevel() < 10) then
		script_hunter.useMarkMana = 60;
	end
	
-- level 10 + settings
	if GetLocalPlayer():GetLevel() >= 10 then

-- check for spent talent points
		script_grindCheckSpentTalentPoints:checkSpentTalentPoints()

-- preserve some mana for mend pet
		script_hunter.arcaneShotMana = 25;
		script_hunter.serpentStingMana = 15;
	end

-- if we have aimed shot then set mana lower to use more often
	if HasSpell("Aimed Shot") then
		script_hunter.arcaneShotMana = 15;
	end

-- hardcore realm - set mana / health higher
	if GetRealmName() == "Permadeath - EU" then 

		if GetLocalPlayer():GetLevel() < 20 then
			script_hunter.eatHealth = 85;
		else
			script_hunter.eatHealth = 70;
		end
	end

-- turn on aspect of cheetah if we have it
	if HasSpell("Aspect of the Cheetah") then
		script_hunter.useCheetah = true;
	end




script_hunter.isSetup = true;
end