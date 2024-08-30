script_moveToHotspot = {}


-- script character limit... need to continue splitting files...
function script_moveToHotspot:moveToHotspot(localObj)

	if (script_getSpells.getSpellsStatus == 1) then
		return false;
	end

	if (script_nav.currentHotSpotName ~= 0) and (not script_checkDebuffs:hasDisabledMovement()) and (script_nav.numSavedLocation < 3) then
		if (not script_grind.adjustTickRate) then
			script_grind.tickRate = 135;
		end
		
		-- move to hotspot coords
		if (not script_grind.hotspotReached) then

			if (not IsInCombat()) and (not script_gather.gathering) then
				script_gather.blacklistTime = GetTimeEX() + script_gather.blacklistSetTime*1000;
			end
			
		end
			-- mount/stealth/cat form/ travel form/ ghost wolf
		if (not IsMounted() and not script_grind.useMount) and
			(HasSpell("Stealth") or HasSpell("Cat Form") or HasSpell("Travel Form") or HasSpell("Ghost Wolf")) and (not IsIndoors()) then
			if (not script_checkDebuffs:hasPoison()) and (script_rogue.useStealth or script_druid.useStealth) and
				(not IsSpellOnCD("Stealth")) and (not IsSpellOnCD("Prowl")) then
				if (HasSpell("Stealth")) then
					CastStealth();
				end
				if (not script_druid.useBear) and (GetLocalPlayer():HasBuff("Cat Form")) then
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
		if (not IsInCombat()) and (not IsMounted()) and (not IsIndoors()) and (not HasForm()) and (script_grind.useMount) then
			if (IsMoving()) then
				StopMoving();
				return;
			end
		return;
		end
	
		-- display distance to hotspot in message window
		local hsDist = 0;
		if (script_nav:getDistanceToHotspot() ~= nil and script_nav:getDistanceToHotspot() ~= 0) then
			hsDist = math.floor(script_nav:getDistanceToHotspot());
		end
	
		if (not script_grind.hotspotReached) and (script_getSpells.getSpellsStatus < 1) then
			script_nav.message = script_navEX:moveToTarget(localObj, script_nav.currentHotSpotX, script_nav.currentHotSpotY, script_nav.currentHotSpotZ);
		if (not IsMoving() and not IsPathLoaded(5)) then
			Move(script_nav.currentHotSpotX, script_nav.currentHotSpotY, script_nav.currentHotSpotZ);
		end
		return "Moving to hotspot " .. script_nav.currentHotSpotName .. " Dist (yds) " ..hsDist.. "";

		end

		
	--else
	--	local hsDist = 0;
	--	if (script_nav:getDistanceToHotspot() ~= nil and script_nav:getDistanceToHotspot() ~= 0) then
	--		hsDist = math.floor(script_nav:getDistanceToHotspot());
	--	end
	--
	--	script_nav.message = script_navEX:moveToTarget(localObj, script_nav.currentHotSpotX, script_nav.currentHotSpotY, script_nav.currentHotSpotZ);
	--	return "Moving to hotspot " .. script_nav.currentHotSpotName .. " Dist (yds) " ..hsDist.. "";
	--end
	elseif (script_nav.numSavedLocation >= 3) then
		self.message = script_nav:moveToSavedLocation(GetLocalPlayer(), script_grind.minLevel, script_grind.maxLevel, script_grind.staticHotSpot);
	end
	--else
	--	return "No hotspot has been loaded...";
	--end
return false;
end