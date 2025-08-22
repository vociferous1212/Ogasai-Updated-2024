script_rogueRest = {}

function script_rogueRest:rest()

	local localObj = GetLocalPlayer();
	local localHealth = localObj:GetHealthPercentage();

	if (HasItem("Linen Bandage")) or 
		(HasItem("Heavy Linen Bandage")) or 
		(HasItem("Wool Bandage")) or 
		(HasItem("Heavy Wool Bandage")) or 
		(HasItem("Silk Bandage")) or 
		(HasItem("Heavy Silk Bandage")) or 
		(HasItem("Mageweave Bandage")) or 
		(HasItem("Heavy Mageweave Bandage")) or 
		(HasItem("Runecloth Bandage")) or 
		(HasItem("Heavy Runecloth Bandage")) then

		script_rogue.hasBandages = true;
	else
		script_rogue.hasBandages = false;
		if (not script_grind.useFirstAid) then
			script_rogue.useBandage = false;
		end
	end


	-- craft bandages
	if (not GetLocalPlayer():IsDead()) and (not script_rogue.hasBandages) and (script_grind.useFirstAid) and (HasSpell("First Aid")) then
		if script_firstAid:canCraftBandage() then
			if (script_firstAid:craftBandages()) then
				return true;
			end
		end
		if (script_firstAid.bookOpen) then
			script_firstAid.bookOpen = false;
			CloseTradeSkill();
		end
	end

	--if (IsMounted()) then
	--	Dismount();
	--end

	-- if we are undead then use cannibalize on humanoids or other undeads
	if (HasSpell("Cannibalize")) and (not IsSpellOnCD("Cannibalize")) then
		if (Cannibalize()) then
			script_rogue.waitTimer = GetTimeEX() + 10000;
			script_grind:setWaitTimer(2500);
			return true;
		end
	end

	-- if has bandage then use bandages
	if (script_rogue.eatHealth >= 35) and (script_rogue.hasBandages) and (script_rogue.useBandage) and (not IsMoving()) and (localHealth < script_rogue.eatHealth) then
		if (not script_checkDebuffs:hasPoison()) and (not IsEating()) and (not localObj:HasDebuff("Recently Bandaged")) then
		if (IsMoving()) then
			StopMoving();
		end
			script_rogue.waitTimer = GetTimeEX() + 1200;
			script_grind:setWaitTimer(1500);

		if (IsStanding()) and (not IsInCombat()) and (not IsMoving()) and (not localObj:HasDebuff("Recently Bandaged")) then
			if (script_helper:useBandage()) then	
				script_rogue.waitTimer = GetTimeEX() + 6000;
			end
		end
		return 0;
		end
	end

	-- set tick rate for script to run
	if (not script_grind.adjustTickRate) then

		local tickRandom = random(306, 692);

		if (IsMoving()) or (not IsInCombat()) then
			script_grind.tickRate = 135;
		elseif (not IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom
		elseif (IsInCombat()) and (not IsMoving()) then
			script_grind.tickRate = tickRandom;
		end
	end


	if (HasSpell("Cold Blood")) and (not IsSpellOnCD("Cold Blood")) and (not localObj:HasBuff("Cold Blood")) then
		CastSpellByName("Cold Blood");
		return 0;
	end

	-- Eat something
	if (not IsEating() and localHealth < script_rogue.eatHealth) and (not IsInCombat()) and (not IsSwimming()) then
		script_grind:setWaitTimer(1500);
		script_rogue.waitTimer = GetTimeEX() + 2000;
		script_rogue.message = "Need to eat...";
		if (IsInCombat()) then
			return false;
		end
			
		if (IsMoving()) then StopMoving(); return true; end

		if (script_helper:eat()) then 
			script_rogue.message = "Eating..."; 
			script_rogue.waitTimer = GetTimeEX() + 2000;
			script_grind:setWaitTimer(1500);
			return true; 
		else 
			script_rogue.message = "No food! (or food not included in script_helper)";
			return true;
		end
	ClearTarget();
	return true;		
	end

	-- Stealth when we eat
	if (HasSpell("Stealth")) and (not IsSpellOnCD("Stealth")) and (not IsStealth()) and (IsEating())  and (not script_checkDebuffs:hasPoison()) and (localHealth < 45) then
		if (not IsStealth()) then
			CastStealth();
			return true;
		end
	end
	
	-- Continue eating until we are full
	if(localHealth < 98 and IsEating()) then
		script_rogue.message = "Resting up to full health...";
		script_rogue.waitTimer = GetTimeEX() + 2000;
		return true;
	end
		
	if (not IsDrinking()) and (not IsEating()) then
		if (not IsStanding()) then
			JumpOrAscendStart();
		end
	end

	local vendorStatus = script_vendor:getStatus();

	if (HasSpell("Stealth")) and (not IsStealth()) and (IsSpellOnCD("Stealth")) and (script_rogue.useStealth) and (not IsLooting()) and (script_grind.lootObj == nil) and (vendorStatus ~= 1) and (vendorStatus ~= 2) and (vendorStatus ~= 3) and (vendorStatus ~= 4) and (script_grind.lootObj == nil or script_grind.lootObj == 0) then
		script_rogue.message = "Waiting for Stealth cooldown...";
		ClearTarget();
		return 4;
	end
	
-- Don't need to eat
return false;
end