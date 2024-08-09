script_warlockEX2 = {

	impUsed = false,
	shardCount = 0,

}

function script_warlockEX2:summonPet()

	script_warlock.message = "Summoning Pet";

	if (not script_grind.adjustTickRate) then
		script_grind.tickRate = 1500;
		script_rotation.tickRate = 1500;
	end

	local localMana = GetLocalPlayer():GetManaPercentage();

	if (IsMoving()) then
		StopMoving();
		return true;
	end

	if (HasPet()) then
		return false;
	end

	if (script_warlock.useImp) and (not HasPet()) and (localMana >= 45) then
		CastSpellByName("Summon Imp");
		script_grind:setWaitTimer(15000);
		script_warlock.waitTimer = GetTimeEX() + 15000;
		script_rotation.waitTimer = GetTimeEX() + 15000;
	end

	-- no soul shards but have summon voidwalker - summon imp until shards obtained
	if (not HasItem("Soul Shard")) and (not HasPet()) and (localMana >= 35) and (HasSpell("Voidwalker")) and (script_warlock.useVoid) then
		CastSpellByName("Summon Imp");
		script_grind:setWaitTimer(15000);
		script_warlock.waitTimer = GetTimeEX() + 15000;
		script_rotation.waitTimer = GetTimeEX() + 15000;
		script_warlock.impUsed = true;
	end

	-- resummon voidwalker after soul shard obtained
	if (script_warlock.impUsed) and (GetLocalPlayer():HasBuff("Blood Pact")) and (HasItem("Soul Shard")) and (not IsInCombat()) and (localMana >= 35) and (script_warlock.useVoid) then
		CastSpellByName("Summon Voidwalker");
		script_grind:setWaitTimer(15000);
		script_warlock.waitTimer = GetTimeEX() + 15000;
		script_warlock.impUsed = false;
	end

	-- succubus	
	if (not HasPet()) and (script_warlock.useSuccubus) and (HasSpell("Summon Succubus")) and HasItem('Soul Shard') then
		if (not IsStanding() or IsMoving()) then 
			StopMoving();
		end
		-- summon succubus
		if (localMana > 35) and (not HasPet()) then
			if (not IsStanding() or IsMoving()) then
				StopMoving();
			end
			if (not HasPet()) then
				if (CastSpellByName("Summon Succubus")) then
					script_grind:setWaitTimer(15000);
					script_warlock.waitTimer = GetTimeEX() + 15000;
					script_rotation.waitTimer = GetTimeEX() + 15000;
					script_warlock.message = "Summoning Succubus";
					script_warlock.hasPet = true;
				return 4;
				end
			return 4;
			end
		end
	end

	-- voidwalker
	if (not HasPet()) and (script_warlock.useVoid) and (HasSpell("Summon Voidwalker")) and (HasItem('Soul Shard')) then
		if (not IsStanding() or IsMoving()) then 
			StopMoving();
		end
		-- summon voidwalker
		if (localMana > 35) and (not HasPet()) then
			if (not IsStanding() or IsMoving()) then
				StopMoving();
			end
			if (not HasPet()) then
				if (CastSpellByName("Summon Voidwalker")) then
					script_grind:setWaitTimer(15000);
					script_warlock.waitTimer = GetTimeEX() + 15000;
					script_rotation.waitTimer = GetTimeEX() + 15000;
					script_warlock.message = "Summoning Void Walker";
				return 4;
				end
			return 4;
			end
		end
	end
	
	-- summon felhunter
	if (not HasPet()) and (script_warlock.useFelhunter) and (HasSpell("Summon Felhunter")) and (HasItem('Soul Shard')) then
		if (not IsStanding() or IsMoving()) then 
			StopMoving();
		end
		-- summon Felhunter
		if (localMana > 35) and (not HasPet()) then
			if (not IsStanding() or IsMoving()) then
				StopMoving();
			end
			if (not HasPet()) then
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
	end

	if (HasPet()) and (not script_grind.adjustTickRate) then
		script_grind.tickRate = 500;
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
function script_warlockEX2:numberSoulShard()
	local shardCount = 0;
	self.shardCount = 0;
	for i = 0,4 do 
		for y=0,GetContainerNumSlots(i) do 
			if (GetContainerItemLink(i,y) ~= nil) then
				_,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
				itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
   				itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
				for t = 0, GetContainerNumSlots(i,y) do
					if (itemName == "Soul Shard") then
						shardCount = shardCount + 1;
						self.shardCount = self.shardCount + 1;
						return shardCount;
					end
				end
			end
		end 
	end
return shardCount;
end