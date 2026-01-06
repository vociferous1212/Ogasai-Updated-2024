script_displayOptionsMenu = {}

function script_displayOptionsMenu:menu()

	if (CollapsingHeader('Display Options')) then

		local wasClicked = false;

		if (script_grind.drawEnabled) then
			if (CollapsingHeader(">>> |+| Status Window")) then
				script_drawStatus.adjustX = SliderInt("adjust X scale", -300, 300, script_drawStatus.adjustX);
				script_drawStatus.adjustY = SliderInt("adjust Y scale", -300, 300, script_drawStatus.adjustY);
			end
		end
		if (CollapsingHeader(">>> |+| Radar")) then
			local wasClicked = false;
			script_radar:menu()
		end

		wasClicked, script_grind.drawEnabled = Checkbox('Status Window |', script_grind.drawEnabled);
		
		if (GetLocalPlayer():GetLevel() < 60) then
			SameLine();
			wasClicked, script_grind.useExpChecker = Checkbox("Exp Tracker |", script_grind.useExpChecker);
		end
		SameLine();
		wasClicked, script_grind.drawUnits = Checkbox("Unit Info", script_grind.drawUnits);

		wasClicked, script_grind.drawAggro = Checkbox('Aggro Range |', script_grind.drawAggro);
		SameLine();
		wasClicked, script_grind.drawAutoPath = Checkbox('Auto-Path Nodes |', script_grind.drawAutoPath);
		SameLine();
		wasClicked, script_grind.drawPath = Checkbox('Move Path', script_grind.drawPath);

		wasClicked, script_grind.drawGather = Checkbox('Gather Nodes |', script_grind.drawGather);
		SameLine();
		wasClicked, script_grind.drawChests = Checkbox("Show Chests |", script_grind.drawChests);
		SameLine();
		wasClicked, script_gatherEX.drawFishingPools = Checkbox("Show Fish Pools", script_gatherEX.drawFishingPools);

		wasClicked, script_grindMenu.showIDD = Checkbox("ID's |", script_grindMenu.showIDD);
		SameLine();
		wasClicked, script_grindMenu.debugMenu = Checkbox("Debug Stuff |", script_grindMenu.debugMenu);
		SameLine();
		wasClicked, script_grind.showOM = Checkbox("Show Object Manager", script_grind.showOM);

	end
end