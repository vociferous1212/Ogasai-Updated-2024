script_moveToHotspot = {}


-- script character limit... need to continue splitting files...
function script_moveToHotspot:moveToHotspot(localObj)
	if (script_nav.currentHotSpotName ~= 0) and (not script_checkDebuffs:hasDisabledMovement()) then
		if (not script_grind.adjustTickRate) then
			script_grind.tickRate = 135;
		end
		
	-- move to hotspot coords
		script_nav.message = script_navEX:moveToTarget(localObj, script_nav.currentHotSpotX, script_nav.currentHotSpotY, script_nav.currentHotSpotZ); 

			-- mount/stealth/cat form/ travel form/ ghost wolf
			if (not IsMounted() and not script_grind.useMount) and (HasSpell("Stealth") or HasSpell("Cat Form") or HasSpell("Travel Form") or HasSpell("Ghost Wolf")) then
				CastStealth();
				CastGhostWolf();
				CastSprint();
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
			
		return "Moving to hotspot " .. script_nav.currentHotSpotName .. " Dist (yds) " ..hsDist.. "";
	else
		return "No hotspot has been loaded...";
	end
end