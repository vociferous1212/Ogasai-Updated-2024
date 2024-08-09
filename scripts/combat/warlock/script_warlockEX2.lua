script_warlockEX2 = {

	impUsed = false,

}

function script_warlockEX2:isPetActive()
	if (GetPet() ~= 0) and (GetPet() ~= nil) or (GetLocalPlayer():HasBuff("Blood Pact")) then
		script_warlock.hasPet = true;
		return true;
	end
return false;
end

function script_warlockEX2:summonPet()

	if (not script_grind.adjustTickRate) then
	script_grind.tickRate = 1500;
	end

	local localMana = GetLocalPlayer():GetManaPercentage();
	local pet = GetPet();
	local hasPet = pet ~= 0;
	local notHasPet = pet == 0;
	
	-- check pet
	if (notHasPet or hasPet) then
		if (notHasPet) then
			script_warlock.hasPet = false;
		end
		if (hasPet) then
			if (pet:GetHealthPercentage() <= 1) then
				script_warlock.hasPet = false;
			end
		end
	end

	if (IsMoving()) then
		StopMoving();
		return true;
	end

	if (script_warlockEX2:isPetActive()) or (GetPet() ~= 0 and GetPet() ~= nil and GetPet():GetHealthPercentage() >= 1) then
		return false;
	end

	-- no soul shards but have summon voidwalker - summon imp until shards obtained
	if (not HasItem("Soul Shard")) and (notHasPet) and (localMana >= 35) and (HasSpell("Voidwalker")) and (script_warlock.useVoid) then
		CastSpellByName("Summon Imp");
		script_grind:setWaitTimer(15000);
		script_warlock.waitTimer = GetTimeEX() + 15000;
		script_warlock.hasPet = true;
		script_warlock.impUsed = true;
	end
	-- resummon voidwalker after soul shard obtained
	if (script_warlock.impUsed) and (HasItem("Soul Shard")) and (not IsInCombat()) and (localMana >= 35) and (script_warlock.useVoid) then
		CastSpellByName("Summon Voidwalker");
		script_grind:setWaitTimer(15000);
		script_warlock.waitTimer = GetTimeEX() + 15000;
		script_warlock.hasPet = true;
		script_warlock.impUsed = false;
	end

	if (not IsMounted()) then
	-- Check: Summon our Demon if we are not in combat
	if (not IsEating()) and (not script_warlock.hasPet) and (not IsDrinking()) and (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (HasSpell("Summon Imp")) and (script_warlock.useVoid or script_warlock.useImp or script_warlock.useSuccubus or script_warlock.useFelhunter) then


-- Check: Summon our Demon if we have fel domination
	if (localObj:HasBuff("Fel Domination")) and (not script_warlock.hasPet) and (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (localMana >= 20) and (HasSpell("Summon Imp")) and (script_warlock.useVoid or script_warlock.useImp or script_warlock.useSuccubus or script_warlock.useFelhunter) and (not script_warlockEX2:isPetActive()) then
		-- succubus	
		if (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) and (script_warlock.useSuccubus) and (HasSpell("Summon Succubus")) and HasItem('Soul Shard') and (not script_warlockEX2:isPetActive()) then
			if (not IsStanding() or IsMoving()) then 
				StopMoving();
			end
			-- summon succubus
			if (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) then
				if (not IsStanding() or IsMoving()) and (not script_warlockEX2:isPetActive()) then
					StopMoving();
				end
				if (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive()) then
					if (CastSpellByName("Summon Succubus")) then
					script_grind:setWaitTimer(15000);
					script_warlock.waitTimer = GetTimeEX() + 15000;
					script_warlock.message = "Summoning Succubus";
					script_warlock.hasPet = true;
					return 4; 
					end
				end
			end
		elseif (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlockEX2:isPetActive())  and (script_warlock.useVoid) and (HasSpell("Summon Voidwalker")) and (HasItem('Soul Shard')) and (not script_warlock.hasPet) then
			if (not IsStanding() or IsMoving()) then 
				StopMoving();
			end
			-- summon voidwalker
			if (localMana > 20) and (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive())  then
				if (not IsStanding() or IsMoving()) then
					StopMoving();
				end
				if (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive())  then
					if (CastSpellByName("Summon Voidwalker")) then
					script_grind:setWaitTimer(15000);
					script_warlock.waitTimer = GetTimeEX() + 15000;
					script_warlock.message = "Summoning Void Walker";
					script_warlock.hasPet = true;
					return 4; 
					end
				end
			end
		elseif (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (script_warlock.useFelhunter) and (HasSpell("Summon Felhunter")) and (HasItem('Soul Shard')) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive())  then
			if (not IsStanding() or IsMoving()) then 
				StopMoving();
			end
			-- summon Felhunter
			if (localMana > 20) and (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive())  then
				if (not IsStanding() or IsMoving()) then
					StopMoving();
				end
				if (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive())  then
					if (CastSpellByName("Summon Felhunter")) then
					script_grind:setWaitTimer(15000);
					script_warlock.waitTimer = GetTimeEX() + 15000;
					script_warlock.message = "Summoning Felhunter";
					script_warlock.hasPet = true;
					return 4;
					end 
				end
			end
		elseif (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (HasSpell("Summon Imp")) and (script_warlock.useImp) and (not IsChanneling()) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive())  then
			if (not IsStanding() or IsMoving()) then
				StopMoving();
			end
			-- summon Imp
			if (localMana > 20) and (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive()) then
				if (not IsStanding() or IsMoving()) and (not script_warlockEX2:isPetActive())  then
					StopMoving();
				end
				if (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive()) then
					if (CastSpellByName("Summon Imp")) and (not script_warlockEX2:isPetActive())  then
					script_grind:setWaitTimer(15000);
					script_warlock.waitTimer = GetTimeEX() + 15000;
					script_warlock.message = "Summoning Imp";
					script_warlock.hasPet = true;
					return 4;
					end
				end
			end
		end
	end

	-- no fel domination
	-- this was lazy this needs retyped to 
	-- localMana > 35 or hasbuff fel domination and localmana > 20

		-- succubus	
		if (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) and (script_warlock.useSuccubus) and (HasSpell("Summon Succubus")) and HasItem('Soul Shard') and (not script_warlockEX2:isPetActive()) then
			if (not IsStanding() or IsMoving()) then 
				StopMoving();
			end
			-- summon succubus
			if (localMana > 35) and (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive()) then
				if (not IsStanding() or IsMoving()) then
					StopMoving();
				end
				if (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive()) then
					if (CastSpellByName("Summon Succubus")) then
					script_grind:setWaitTimer(15000);
					script_warlock.waitTimer = GetTimeEX() + 15000;
					script_warlock.message = "Summoning Succubus";
					script_warlock.hasPet = true;
					return 4;
					end
				return 4;
				end
			end
		elseif (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (script_warlock.useVoid) and (HasSpell("Summon Voidwalker")) and (HasItem('Soul Shard')) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive()) then
			if (not IsStanding() or IsMoving()) then 
				StopMoving();
			end
			-- summon voidwalker
			if (localMana > 35) and (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive()) then
				if (not IsStanding() or IsMoving()) then
					StopMoving();
				end
				if (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive()) then
					if (CastSpellByName("Summon Voidwalker")) then
					script_grind:setWaitTimer(15000);
					script_warlock.waitTimer = GetTimeEX() + 15000;
					script_warlock.message = "Summoning Void Walker";
					script_warlock.hasPet = true;
					return 4;
					end
				return 4;
				end
			end
		elseif (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (script_warlock.useFelhunter) and (HasSpell("Summon Felhunter")) and (HasItem('Soul Shard')) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive()) then
			if (not IsStanding() or IsMoving()) then 
				StopMoving();
			end
			-- summon Felhunter
			if (localMana > 35) and (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive()) then
				if (not IsStanding() or IsMoving()) then
					StopMoving();
				end
				if (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) then
					if (CastSpellByName("Summon Felhunter")) then	
					script_grind:setWaitTimer(15000);
					script_warlock.waitTimer = GetTimeEX() + 15000;
					script_warlock.message = "Summoning Felhunter";
					script_warlock.hasPet = true;
					return 4; 
					end
				return 4;
				end
			end
		elseif (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (HasSpell("Summon Imp")) and (script_warlock.useImp) and (not IsChanneling()) and (not script_warlock.hasPet) and (not script_warlockEX2:isPetActive()) then
			-- summon Imp
			if (localMana > 35) and (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) then
				if (notHasPet or (hasPet and pet:GetHealthPercentage() <= 1)) and (not script_warlock.hasPet) then
					if (CastSpellByName("Summon Imp")) then
					script_grind:setWaitTimer(15000);
					script_warlock.waitTimer = GetTimeEX() + 15000;
					script_warlock.message = "Summoning Imp";
					script_warlock.hasPet = true;
					return 4;
					end
				return 4;
				end
			end
		end
	end

	if (hasPet) and (script_warlock.hasPet) and (not script_grind.adjustTickRate) then
		script_grind.tickRate = 500;
	end
end
return false;
end

function script_warlockEX2:hasSoulShard()
	for i = 0,4 do 
		for y=0,GetContainerNumSlots(i) do 
			if (GetContainerItemLink(i,y) ~= nil) then
				_,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
				itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
   				itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);

				if (itemName == "Soul Shard") then
					return true;
				end
			end
		end 
	end
return false;
end
		