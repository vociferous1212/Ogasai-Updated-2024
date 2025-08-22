script_rogueCheckPoisons = {}

function script_rogueCheckPoisons:checkPoisons()

	if (not IsInCombat() and not IsEating()) and (script_rogue.usePoison) then
		hasMainHandEnchant, _, _, hasOffHandEnchant, _, _ = GetWeaponEnchantInfo();
		if (hasMainHandEnchant == nil and HasItem(script_rogue.mainhandPoison)) then 
			-- Check: Stop moving, sitting
			if (not IsStanding() or IsMoving()) then 
				StopMoving(); 
				return; 
			end
			-- Check: Dismount
			if (IsMounted()) then DisMount(); return true; end
			-- Apply poison to the main-hand
			script_rogue.message = "Applying poison to main hand..."
			UseItem(script_rogue.mainhandPoison); 
			PickupInventoryItem(16);  
			script_rogue.waitTimer = GetTimeEX() + 6000; 
			return true;
		end
		if (hasOffHandEnchant == nil and HasItem(script_rogue.offhandPoison)) then
			-- Check: Stop moving, sitting
			if (not IsStanding() or IsMoving()) then 
				StopMoving(); 
				return; 
			end 
			-- Check: Dismount
			if (IsMounted()) then DisMount(); return true; end
			-- Apply poison to the off-hand
			script_rogue.message = "Applying poison to off hand..."
			UseItem(script_rogue.offhandPoison); 
			PickupInventoryItem(17); 
			script_rogue.waitTimer = GetTimeEX() + 6000; 
			script_grind.autoBlacklistTimer = GetTimeEX() + 15000;

			return true; 
		end
	end 
return false;
end