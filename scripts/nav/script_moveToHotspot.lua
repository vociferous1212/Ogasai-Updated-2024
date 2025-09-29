script_moveToHotspot = {}


-- script character limit... need to continue splitting files...
function script_moveToHotspot:moveToHotspot(localObj)

	if not script_grind.adjustTickRate then
		script_grind.tickRate = 135;
	end

	-- return false if we are going to get spells at low level don't return to hotspot until done
	if (script_getSpells.getSpellsStatus == 1) then
		return false;
	end

	-- if we have a hotspot and can move and auto path saved locations < 3 and we have not reached the hotspot or left range of hotspot
	if (script_nav.currentHotSpotName ~= 0) and (not script_checkDebuffs:hasDisabledMovement()) and (script_nav.numSavedLocation < 3 or not script_grind.hotspotReached or not script_grindEX:isThereAnyValidEnemyNearby()) then

		-- make sure the grinder tick rate is set quicker
		if (not script_grind.adjustTickRate) then
			script_grind.tickRate = 135;
		end
		
		
		-- if hotspot is not reached yet then reset blacklist timer
		if (not script_grind.hotspotReached) then

			-- reset blacklist time when not gathering and not in combat
			if (not IsInCombat()) and (not script_gather.gathering) then
				script_gather.blacklistTime = GetTimeEX() + script_gather.blacklistSetTime*1000;
			end
			
		end


		-- mount/stealth/cat form/ travel form/ ghost wolf
		if (not IsMounted() and not script_grind.useMount or not script_grind.hasAMount) and
			(HasSpell("Stealth") or HasSpell("Cat Form") or HasSpell("Travel Form") or HasSpell("Ghost Wolf")) and (not IsIndoors()) then
			if (not script_checkDebuffs:hasPoison()) and (script_rogue.useStealth or script_druid.useStealth) and
				(not IsSpellOnCD("Stealth")) and (not IsSpellOnCD("Prowl")) then
				if (HasSpell("Stealth")) then
					CastStealth();
				end
				if script_druid.useStealth and (not script_druid.useBear) and (GetLocalPlayer():HasBuff("Cat Form")) then
					CastStealth();
				end
				if (not script_druid.useBear) and (not HasForm()) then
					if (GetTimeEX() > script_grindEX.tryTravelFormTimer) then
						script_druidEX:travelForm();
						script_grindEX.tryTravelFormTimer = GetTimeEX() + 5000;
					end
				end
			end
			--CastGhostWolf();
			if (HasSpell("Sprint")) and (not IsSpellOnCD("Sprint")) then
				CastSprint();
			end
		end
		
		-- stop moving so we can mount
		if (not IsInCombat()) and (not IsMounted()) and (not IsIndoors()) and (not HasForm()) and (script_grind.useMount and script_grind.hasAMount) then
			if (IsMoving()) then
				StopMoving();
				return;
			end
		return;
		end
	
		-- get hotspot distance var
		local hsDist = 0;

		-- get hotspot distance
		if (script_nav:getDistanceToHotspot() ~= nil and script_nav:getDistanceToHotspot() ~= 0) then
			hsDist = math.floor(script_nav:getDistanceToHotspot());
		end
	
		-- if we have not reached the hotspot yet then return to moving to hotspot
		if (not script_grind.hotspotReached or not script_grindEX:isThereAnyValidEnemyNearby()) and (script_getSpells.getSpellsStatus < 1) then
			script_navEX:moveToTarget(localObj, script_nav.currentHotSpotX, script_nav.currentHotSpotY, script_nav.currentHotSpotZ);
			
				
		-- if we cannot find a path to hotspot, try to switch hotspots
			-- need a way to search table and skip current entry. we can even go to a lower level hotspot closer
		
		end

	-- else we have saved auto path nodes and are within range of the hotspot then run auto path nodes
	elseif (script_nav.numSavedLocation >= 3 and self.hotspotReached) then

		script_nav:moveToSavedLocation(GetLocalPlayer(), script_grind.minLevel, script_grind.maxLevel, script_grind.staticHotSpot);

	end

return false;
end