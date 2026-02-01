grind2NavMenu = {

}

function grind2NavMenu:run()

	if CollapsingHeader("Navigation Menu") then


		wasClicked, grind2HotSpot.useHotSpots = Checkbox("Use Auto Hot Spots", grind2HotSpot.useHotSpots);


		Text("Distance to hotspot - "..math.floor(grind2HotSpot:distanceToHotspot()).." (yd)")

		SameLine();

		Text(" | "..script_nav.currentHotSpotName)

		Separator();

		Text("Distance to grind from hotspot");
		grind2HotSpot.distanceToHotSpot = SliderInt("Distance to grind from hotspot", 50, 5000, grind2HotSpot.distanceToHotSpot);

		Separator();

		if (Button("Save Current Location As Hotspot")) then
			script_nav:newHotspot(GetMinimapZoneText() .. ' ' .. GetLocalPlayer():GetLevel() .. ' - ' .. GetLocalPlayer():GetLevel()+2);
			script_nav.numSavedLocation = 0;
			vendorDB:loadDBVendors();
			script_grindMenu:printHotspot(); 
			script_grind.hotspotReached = true;
			grind2HotSpot.useHotSpots = false;
			grind2SaveCoordinates.numberOfLocations = 0;
			grind2SaveCoordinates.savedLocations = {};
			grind2SaveCoordinates.currentLocationToMove = 0;
		end

		Separator();

		Text("Saved locations in current path = "..grind2SaveCoordinates.numberOfLocations);








		Text("");
		Separator();
	end
end