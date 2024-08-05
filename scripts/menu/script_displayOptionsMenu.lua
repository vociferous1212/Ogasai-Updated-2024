script_displayOptionsMenu = {}

function script_displayOptionsMenu:menu()

	if (CollapsingHeader('Display Options')) then

		local wasClicked = false;

		if (script_grind.drawEnabled) then
			if (CollapsingHeader("|+| Move Status Window")) then
				script_grind.adjustX = SliderInt("adjust X scale", -300, 300, script_grind.adjustX);
				script_grind.adjustY = SliderInt("adjust Y scale", -300, 300, script_grind.adjustY);
			end
		end
		if (CollapsingHeader("|+| Draw Radar")) then
			local wasClicked = false;
			script_radar:menu()
		end

		wasClicked, script_grind.drawEnabled = Checkbox('Display Status Window', script_grind.drawEnabled);
		
		if (GetLocalPlayer():GetLevel() < 60) then
		
			wasClicked, script_grind.useExpChecker = Checkbox("Display Exp Tracker", script_grind.useExpChecker);
		end

		wasClicked, script_grind.drawAggro = Checkbox('Display Aggro Range', script_grind.drawAggro);
		wasClicked, script_grind.drawUnits = Checkbox("Display Unit Info On Screen", script_grind.drawUnits);
		wasClicked, script_grind.drawAutoPath = Checkbox('Display Auto-Path Nodes', script_grind.drawAutoPath);
		wasClicked, script_grind.drawPath = Checkbox('Display Move Path', script_grind.drawPath);
		wasClicked, script_grind.drawGather = Checkbox('Display Gather Nodes', script_grind.drawGather);
			SameLine();
			wasClicked, script_grindMenu.showIDD = Checkbox("Show Item ID's", script_grindMenu.showIDD);
		wasClicked, script_grindMenu.debugMenu = Checkbox("Display Debug Stuff", script_grindMenu.debugMenu);
	end
end