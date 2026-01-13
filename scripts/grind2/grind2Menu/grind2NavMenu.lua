grind2NavMenu = {

}

function grind2NavMenu:run()

	if CollapsingHeader("Navigation Menu") then

		Text("Saved locations in current path = "..grind2SaveCoordinates.numberOfLocations);

		Text("");
		Separator();
	end

end