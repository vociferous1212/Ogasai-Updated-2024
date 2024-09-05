script_checkDebuffs = {

}

-- use script_checkDebuffs:functionName(); as a boolean true or false.
-- returns true if player has debuff
-- returns false if player does not has debuff

-- make check for not specific debuffs like rend
function script_checkDebuffs:hasCurse()

	local player = GetLocalPlayer();

	if (player:HasDebuff("Curse of Mending")) or (player:HasDebuff("Curse of the Shadowhorn")) or (player:HasDebuff("Curse of Recklessness")) or (player:HasDebuff("Curse of Thule")) or (player:HasDebuff("Curse of Thorns")) then
		return true;
	end
return false;
end

function script_checkDebuffs:hasPoison()
	local player = GetLocalPlayer();
	if (player:HasDebuff("Weak Poison")) or (player:HasDebuff("Corrosive Poison")) or (player:HasDebuff("Poison")) or (player:HasDebuff("Slowing Poison")) or (player:HasDebuff("Poisoned Shot")) or (player:HasDebuff("Venom Spit")) or (player:HasDebuff("Bottle of Poison")) or (player:HasDebuff("Venom Sting")) or (player:HasDebuff("Touch of Zanzil")) or (player:HasDebuff("Webwood Lurker's Poison")) or (player:HasDebuff("Deadly Poison")) then
		return true;
	end
return false;
end

function script_checkDebuffs:hasDisease()

	local player = GetLocalPlayer();

	if (player:HasDebuff("Rabies"))
		or (player:HasDebuff("Fevered Fatigue"))
		or (player:HasDebuff("Dark Sludge"))
		or (player:HasDebuff("Infected Bite"))
		or (player:HasDebuff("Wandering Plague"))
		or (player:HasDebuff("Plague Mind"))
		or (player:HasDebuff("Fevered Fatigue"))
		or (player:HasDebuff("Tetanus")) 
		or (player:HasDebuff("Creeping Mold"))
		or (player:HasDebuff("Diseased Slime"))
	
		then

		return true;
	end
return false;
end

function script_checkDebuffs:hasMagic()


	local player = GetLocalPlayer();

	if (player:HasDebuff("Faerie Fire")) 
		or (player:HasDebuff("Sleep"))
		or (player:HasDebuff("Sap Might"))
		or (player:HasDebuff("Frost Nova"))
		or (player:HasDebuff("Fear"))
		or (player:HasDebuff("Entangling Roots"))
		or (player:HasDebuff("Sonic Burst"))
		or (player:HasDebuff("Shadow Word: Pain"))
		or (player:HasDebuff("Crystalline Slumber"))

	
	then

		return true;

	end
return false;

end

function script_checkDebuffs:hasDisabledMovement()

	local player = GetLocalPlayer();

	if (player:HasDebuff("Web"))
		or (player:HasDebuff("Net"))
		or (player:HasDebuff("Frost Nova"))
		or (player:HasDebuff("Entangling Roots"))
		or (player:HasDebuff("Slowing Poison"))


	then
	
		return true;

	end
return false;
end

-- pet debuff checks
function script_checkDebuffs:petDebuff()

		local _ , class = UnitClass('player');

	if (class == 'HUNTER' or class == 'WARLOCK') and (GetLocalPlayer():GetLevel() >= 10) and (GetPet() ~= 0) then
		local pet = GetPet();
	
		if (pet:HasDebuff("Web"))
	
	
		then
	
			return true;
		end
	end
return false;
end

-- undead will of the forsaken
function script_checkDebuffs:undeadForsaken()
		
		local player = GetLocalPlayer();
	
	if (player:HasDebuff("Sleep"))
		or (player:HasDebuff("Fear"))
		or (player:HasDebuff("Mind Control"))

	then

		return true;

	end
return false;

end

function script_checkDebuffs:hasSilence()

		local player = GetLocalPlayer();

	if (player:HasDebuff("Silence"))
	or (player:HasDebuff("Sonic Burst"))
	or (player:HasDebuff("Overwhelming Stench"))

	then
	
		return true;
	
	end
return false;
end

function script_checkDebuffs:enemyBuff()
	
	local localObj = GetLocalPlayer();
	local hasTarget = localObj:GetUnitsTarget();
	
	if (script_grind.enemyObj ~= 0 and script_grind.enemyObj ~= nil) then
		if (hasTarget ~= 0) then

			local enemy = script_grind.enemyObj;
	
			if (enemy:HasBuff("Power Word:Shield")) 
			or (enemy:HasBuff("Quick Flame Ward"))
			or (enemy:HasBuff("Rejuvenation"))
			or (enemy:HasBuff("Regrowth"))
			or (enemy:HasBuff("Renew"))
			or (enemy:HasBuff("Mana Shield"))
			


			then
			
			return true;
	
			end
		end
	end
return false;
end