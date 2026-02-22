grind2HotSpot = {

	distanceToHotSpot = 275,

	hotSpotReached = false,

	useHotSpots = true,	-- use auto hotspots



}


function grind2HotSpot:updateHotSpot()

	script_nav:updateHotSpot(GetLocalPlayer():GetLevel(), GetFaction(), true);

	script_nav:setHotSpotDistance(grind2HotSpot.distanceToHotSpot); 

end

function grind2HotSpot:moveToHotspot()

	if script_nav.currentHotSpotX ~= 0
		and (grind2HotSpot:distanceToHotspot() > self.distanceToHotSpot or (self.hotSpotReached and not grind2IsAnyValidTargetInRange:run() and grind2HotSpot:distanceToHotspot() > 50))  then

		grind2MoveToTarget:run(GetLocalPlayer(), script_nav.currentHotSpotX, script_nav.currentHotSpotY, script_nav.currentHotSpotZ);

		grind2MoveToTarget.message = "Moving to hotspot " ..script_nav.currentHotSpotName.." | "..math.floor(grind2HotSpot:distanceToHotspot()).." (yd)";

		grind2.grinderMessage = "Moving to hotspot "..script_nav.currentHotSpotName.." | "..math.floor(grind2HotSpot:distanceToHotspot()).." (yd)";
	else

		grind2.grinderMessage = "No hotspot loaded";
	end

return false;
end

function grind2HotSpot:distanceToHotspot()

	local localObj = GetLocalPlayer();

	local _lx, _ly, _lz = localObj:GetPosition();

	if (script_nav.currentHotSpotName ~= '') then

		return math.sqrt((script_nav.currentHotSpotX-_lx)^2+(script_nav.currentHotSpotY-_ly)^2);
	else

		return 0; -- no hot spot loaded
	end
end

