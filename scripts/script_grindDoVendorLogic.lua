script_grindDoVendorLogic = {}

function script_grindDoVendorLogic:run()

local vendorStatus = script_vendor.status;

-- VENDOR LOGIC

	if (vendorStatus >= 1 and not IsInCombat()) then
		script_grind.currentTime2 = GetTimeEX();

		-- do loot and skinning if we kill something on way to vendor
		if not script_grind.skipLooting
		and not AreBagsFull()
		and not script_grind.bagsFull 
		and not script_hunter.bagsFull
		
		then
			if (script_grind:lootAndSkin()) then
				return true;
			end
		end

		-- use mount
		if script_grind.useMount
		and not IsMounted()
		and GetLocalPlayer():GetLevel() >= 40
		
		then
			if (script_helper:useMount()) then

			end
		end

		-- driud use cat form/travel form to vendor
		if (GetLocalPlayer():GetLevel() <= 40)
		and (IsMoving())
		and (HasSpell("Bear Form"))
		and (not script_grindEX:areWeSwimming())

		then
			if not HasSpell("Travel Form")
			and HasSpell("Cat Form")
			and script_grind.enemyObj == nil or script_grind.enemyObj == 0
			
			then
				script_druidEX2:catForm();

			elseif HasSpell("Travel Form")
			and not localObj:HasBuff("Cat Form")
			and GetTimeEX() > script_grind.tryTravelFormTimer
			
			then
				script_druidEX:travelForm();
				script_grind.tryTravelFormTimer = GetTimeEX() + 5000;
			end
		end

		-- use stealth if we are cat form
		if script_druid.useStealth
		and IsCatForm()
		and HasSpell("Prowl")
		and not IsSpellOnCD("Prowl")
		and not GetLocalPlayer():HasBuff("Prowl")
		
		then
			CastSpellByName("Prowl");
			script_grind:setWaitTimer(1500);
		end

		-- use stealth if we are rogue
		if script_rogue.useStealth
		and not GetLocalPlayer():HasBuff("Stealth")
		and not IsSpellOnCD("Stealth")
		and HasSpell("Stealth")
		
		then
			CastSpellByName("Stealth");
			script_grind:setWaitTimer(1500);
		end
	end

-- 1 Check: If our gear is yellow and need to repair
	if not IsInCombat() and script_grind.repairWhenYellow and script_grind.useVendor then
		for i = 1, 16 do
		local status = GetInventoryAlertStatus('' .. i);
			if (status ~= nil) then 
				if (status >= 3 and script_vendor.repairVendor ~= 0 and not IsInCombat()) then
					if (script_vendor:repair()) then
						script_grind.newTargetTime = GetTimeEX();
						if GetMyClass() ~= "HUNTER" then
							script_grind.message = "Armor is reading as yellow, going to repair..."
						elseif GetMyClass() == "HUNTER" then
							script_grind.message = "Armor is reading as yellow, or there is no ammo, going to repair..."
						end
					return true;
					end
				end
			end
		end
	end

-- 2 if bags are full then sell
	if (script_grind.bagsFull or AreBagsFull() or script_hunter.bagsFull)
	and not script_grind.skipLooting
	and script_grind.useVendor
		
	then
		script_vendor.status = 2;
	end

-- 4 check if we need drink/food
	if (script_grind.useVendor and script_grind.vendorRefill and not IsInCombat()) then
		if (script_vendorMenu:checkVendor(script_grind.useMana)) then
			return true;
		end
	end

-- run vendor logic - 1 = repair, 2 = sell, 3 = buy ammo, 4 = buy food/drink
	if (
		(not IsInCombat() and not PetHasTarget()) 
		or IsMounted()
		)
	and not script_grind:shouldWeRest()
		
	then

		-- vendor repair
		if (vendorStatus == 1) then
			script_grind.message = "Repairing at vendor...";
			script_vendor:repair();
			script_grind:setWaitTimer(100);
		return true;

		-- vendor sell
		elseif (vendorStatus == 2) then
			script_grind.message = "Selling to vendor...";
			script_vendor:sell();
			script_grind:setWaitTimer(100);
		return true;

		-- vendor buy ammo/bullets
		elseif (vendorStatus == 3) then
			script_grind.message = "Buying ammo at vendor...";
			script_vendor:continueBuyAmmo();
			script_grind:setWaitTimer(100);
		return true;

		-- vendor buy drink/food
		elseif (vendorStatus == 4) then
			script_grind.message = "Buying food/drink at vendor...";
			script_vendor:continueBuy();
			script_grind:setWaitTimer(100);
		return true;
		end
	end
return false;
end