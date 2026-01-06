script_warlock2handleSpells = {}

function script_warlock2handleSpells:createHealthstone()
	if (HasSpell("Create Healthstone (Major)")) then
		if (not HasItem("Major Healthstone")) and (HasItem("Soul Shard")) then
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			if (CastSpellByName("Create Healthstone (Major)()")) then
				script_warlock2.hasHealthstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock2:setTimer(1.75);
				return true;
			end
		end
	elseif (HasSpell("Create Healthstone (Greater)")) then
		if (not HasItem("Greater Healthstone")) and (HasItem("Soul Shard")) then
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			if (CastSpellByName("Create Healthstone (Greater)()")) then
				script_warlock2.hasHealthstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock2:setTimer(1.75);
				return true;
			end
		end
	elseif (HasSpell("Create Healthstone")) then
		if (not HasItem("Healstone")) and (HasItem("Soul Shard")) then
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			if (CastSpellByName("Create Healthstone ()")) then
				script_warlock2.hasHealthstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock2:setTimer(1.75);
				return true;
			end
		end
	elseif (HasSpell("Create Healthstone (Lesser)")) then
		if (not HasItem("Lesser Healthstone")) and (HasItem("Soul Shard")) then
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			if (CastSpellByName("Create Healthstone (Lesser)()")) then
				script_warlock2.hasHealthstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock2:setTimer(1.75);
				return true;
			end
		end
	elseif (HasSpell("Create Healthstone (Minor)")) then
		if (not HasItem("Minor Healthstone")) and (HasItem("Soul Shard")) then
			if (IsMoving()) then
				StopMoving();
				return true;
			end
			if (CastSpellByName("Create Healthstone (Minor)()")) then
				script_warlock2.hasHealthstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock2:setTimer(1.75);
				return true;
			end
		end
	end
return false;
end

function script_warlock2handleSpells:createSoulstone()
	if (HasSpell("Create Soulstone (Major)")) then
		if (not HasItem("Major Soulstone")) and (HasItem("Soul Shard")) then
			if (CastSpellByName("Create Soulstone (Major)()")) then
				script_warlock2.hasSoulstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock2:setTimer(1.75);
				return true;
			end
		end
	elseif (HasSpell("Create Soulstone (Greater)")) then
		if (not HasItem("Greater Soulstone")) and (HasItem("Soul Shard")) then
			if (CastSpellByName("Create Soulstone (Greater)()")) then
				script_warlock2.hasSoulstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock2:setTimer(1.75);
				return true;
			end
		end
	elseif (HasSpell("Create Soulstone ()")) then
		if (not HasItem("Healstone")) and (HasItem("Soul Shard")) then
			if (CastSpellByName("Create Soulstone ()")) then
				script_warlock2.hasSoulstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock2:setTimer(1.75);
				return true;
			end
		end
	elseif (HasSpell("Create Soulstone (Lesser)")) then
		if (not HasItem("Lesser Soulstone")) and (HasItem("Soul Shard")) then
			if (CastSpellByName("Create Soulstone (Lesser)()")) then
				script_warlock2.hasSoulstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock2:setTimer(1.75);
				return true;
			end
		end
	elseif (HasSpell("Create Soulstone (Minor)")) then
		if (not HasItem("Minor Soulstone")) and (HasItem("Soul Shard")) then
			if (CastSpellByName("Create Soulstone (Minor)()")) then
				script_warlock2.hasSoulstone = true;
				script_grind:setWaitTimer(1750);
				script_warlock2:setTimer(1.75);
				return true;
			end
		end
	end
return false;
end

function script_warlock2handleSpells:doWeHaveHealthstone()

script_warlock2.hasHealthstone = false;
return false;
end

function script_warlock2handleSpells:doWeHaveSoulstone()

script_warlock2.hasSoulstone = false;
return false;
end

function script_warlock2handleSpells:useHealthstone()

	if (HasItem("Major Healthstone")) then
		UseItem("Major Healthstone");
		script_warlock2.hasHealthstone = false;
		return true;
	elseif (HasItem("Greater Healthstone")) then
		UseItem("Greater Healthstone");
		script_warlock2.hasHealthstone = false;
		return true;
	elseif (HasItem("Healthstone")) then
		UseItem("Healthstone");
		script_warlock2.hasHealthstone = false;
		return true;
	elseif (HasItem("Lesser Healthstone")) then
		UseItem("Lesser Healthstone");
		script_warlock2.hasHealthstone = false;
		return true;
	elseif (HasItem("Minor Healthstone")) then
		UseItem("Minor Healthstone");
		script_warlock2.hasHealthstone = false;
		return true;
	end

script_warlock2.hasHealthstone = false;
return false;
end

function script_warlock2handleSpells:useSoulstone()
	if PlayerHasTarget() and (GetLocalPlayer():GetUnitsTarget():GetGUID() ~= GetLocalPlayer():GetGUID()) then
		ClearTarget();
	end

	local coolDown = 30;
	for i=0, 6 do
		for y=0,GetContainerNumSlots(i) do 
			if (GetContainerItemLink(i,y) ~= nil) then
				_,_,itemLink=string.find(GetContainerItemLink(i,y),"(item:%d+)");
				itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
   				itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
				if (itemName == "Minor Soulstone") or (itemName == "Lesser Soulstone") or (itemName == "Soulstone") or (itemName == "Greater Soulstone") or (itemName == "Major Soulstone") then
					local cooldown = GetContainerItemCooldown(i, y);
					coolDown = cooldown;
				end	
			end
		end
	end
	if (coolDown > 0) then
		return false;
	end

	if (HasItem("Major Soulstone")) then
		UseItem("Major Soulstone");
		script_warlock2.hasSoulstone = false;
		return true;
	elseif (HasItem("Greater Soulstone")) then
		UseItem("Greater Soulstone");
		script_warlock2.hasSoulstone = false;
		return true;
	elseif (HasItem("Soulstone")) then
		UseItem("Soulstone");
		script_warlock2.hasSoulstone = false;
		return true;
	elseif (HasItem("Lesser Soulstone")) then
		UseItem("Lesser Soulstone");
		script_warlock2.hasSoulstone = false;
		return true;
	elseif (HasItem("Minor Soulstone")) then
		UseItem("Minor Soulstone");
		script_warlock2.hasSoulstone = false;
		return true;
	end
script_warlock2.hasSoulstone = false;
return false;
end