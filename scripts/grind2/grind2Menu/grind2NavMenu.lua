grind2NavMenu = {

}

function grind2NavMenu:run()

	if CollapsingHeader("Navigation Menu") then


		wasClicked, grind2HotSpot.useHotSpots = Checkbox("Use HotSpots", grind2HotSpot.useHotSpots);
		Text("Distance to hotspot - "..math.floor(grind2HotSpot:distanceToHotspot()).." (yd)")

		Separator();

		Text("Saved locations in current path = "..grind2SaveCoordinates.numberOfLocations);

		Text("");
		Separator();






	end
end