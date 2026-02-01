script_rogueCheckPoisons = {}

function script_rogueCheckPoisons:checkPoisons()

	-- don't apply poisons if we are incombat or eating and we want to use poisons
	if (not IsInCombat() and not IsEating()) and (script_rogue.usePoison) then

		-- wow api to check for weapon enchant
		hasMainHandEnchant, _, _, hasOffHandEnchant, _, _ = GetWeaponEnchantInfo();

		-- check mainhand enchant
		if (hasMainHandEnchant == nil and HasItem(script_rogue.mainhandPoison)) then 

			-- Check: Stop moving, sitting
			if (not IsStanding() or IsMoving()) then 

				StopMoving(); 

			-- return if we are standing or moving
			return; 
			end

			-- Check: Dismount
			if (IsMounted()) then

				DisMount();

			return true;
			end

		-- Apply poison to the main-hand

			script_rogue.message = "Applying poison to main hand..."

			-- ogasai api use item
			UseItem(script_rogue.mainhandPoison); 

			-- inventory item 16 is main hand weapon slot
			PickupInventoryItem(16);  

			-- set some timers to stop the bot
			script_rogue.waitTimer = GetTimeEX() + 6000;
			script_grind.waitTimer = GetTimeEX() + 6000;

			-- reset blacklisting time since we are waiting more than 12 seconds
			script_grind.autoBlacklistTimer = GetTimeEX() + 15000;

		return true;
		end

		-- check offhand enchant
		if (hasOffHandEnchant == nil and HasItem(script_rogue.offhandPoison)) then

			-- Check: Stop moving, sitting
			if (not IsStanding() or IsMoving()) then 

				StopMoving(); 

			-- return if we are moving or not standing
			return; 
			end 

			-- Check: Dismount
			if (IsMounted()) then

				DisMount();

			return true;
			end

			-- Apply poison to the off-hand
			script_rogue.message = "Applying poison to off hand..."

			-- ogasai api use item
			UseItem(script_rogue.offhandPoison); 

			-- inventory item 17 is off hand weapon slot
			PickupInventoryItem(17); 

			-- set some timers to stop the bot
			script_rogue.waitTimer = GetTimeEX() + 6000;
			script_grind.waitTimer = GetTimeEX() + 6000;

			-- reset blacklisting time since we are waiting more than 12 seconds
			script_grind.autoBlacklistTimer = GetTimeEX() + 15000;

		-- return true if function conditions met
		return true; 
		end
	end

-- else return false for the function 
return false;
end