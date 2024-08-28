script_pathMenu = {}

function script_pathMenu:menu()
	if (CollapsingHeader("Path Options")) then

		local wasClicked = false;

		-- checkbox use auto hotspots
		wasClicked, script_grindMenu.useHotSpotArea = Checkbox("Use Auto Hotspots", script_grindMenu.useHotSpotArea);
		if (script_grindMenu.useHotSpotArea) then
			-- choose to auto set distance from hotspot areas
			SameLine();
			wasClicked, script_grind.useAutoHotspotDist = Checkbox("(TODO) Auto Dist From Hotspot", script_grind.useAutoHotspotDist);

			wasClicked, script_grind.autoSelectTargets = Checkbox("(TODO) Auto Select Hotspot Enemies", script_grind.autoSelectTargets);

			wasClicked, script_grind.staticHotSpot = Checkbox("Auto Load Hotspots From - HotspotDB.lua", script_grind.staticHotSpot);
		end
			--wasClicked, script_grind.attackTargetsOnRoutes = Checkbox("Attack Unfriendly NPC's Going To Hotspots", script_grind.attackTargetsOnRoutes);
		
		-- show auto hotspot button
		if (script_grindMenu.useHotSpotArea) then
			if (Button("Save Current Location As Hotspot")) then
				script_nav:newHotspot(GetMinimapZoneText() .. ' ' .. GetLocalPlayer():GetLevel() .. ' - ' .. GetLocalPlayer():GetLevel()+2);
				if (script_grind.pause) and (IsMoving()) then
					StopMoving();
				end
				if (script_grind.autoSelectVendors) then
					vendorDB:loadDBVendors();
				end
				script_grind.staticHotSpot = false;
				script_grindMenu:printHotspot(); 
				script_grind.hotspotReached = true;
				script_grind:setWaitTimer(1500);
			end
			
			-- distance from hotspot slider
			Text('Distance To Move From Hotspot');
			script_grind.distToHotSpot = SliderInt("DHS (yd)", 100, 2500, script_grind.distToHotSpot);
		end

		-- if not use hotspot then show rest of pathing
		if (not script_grindMenu.useHotSpotArea) then

			-- click auto pathing (nav)
			--wasClicked, script_grind.autoPath = Checkbox("Auto Pathing)", script_grind.autoPath);

			--click walk path (no nav)
			--wasClicked, script_grindMenu.selectedWalkPath = Checkbox("Use Walk Paths", script_grindMenu.selectedWalkPath);

			-- if auto pathing then show hotspot
			if (script_grind.autoPath) then

			-- draw save current location button
			if (Button("Save Current Location To Log File")) then script_nav:newHotspot(GetMinimapZoneText() .. ' ' .. GetLocalPlayer():GetLevel() .. ' - ' .. GetLocalPlayer():GetLevel()+2);
				script_grind.staticHotSpot = false;
				script_grindMenu:printHotspot(); 
			end

				-- select hotspot dropdown menu
				Text("Select A Hotspot From Database:");

				wasClicked, script_grindMenu.selectedHotspotID = 
					ComboBox("", script_grindMenu.selectedHotspotID, unpack(hotspotDB.selectionList));
				SameLine();

				if Button("Load") then script_grind.staticHotSpot = false; script_nav:loadHotspotDB(script_grindMenu.selectedHotspotID+1);
				end
				Text('Distance To Move From Hotspot');
				script_grind.distToHotSpot = SliderInt("DHS (yd)", 100, 2500, script_grind.distToHotSpot);
			end

				-- select walk path input text box
				if (script_grindMenu.selectedWalkPath) then
					Separator();

					Text("Current Walk Path");
					Text("E.g. paths\\1-5 Durotar.xml");
					script_grind.pathName = InputText(' ', script_grind.pathName);
				
					Separator();

			-- set next to node distance for walk paths
			Text('Next Node Distance'); script_grind.nextToNodeDist = SliderFloat("ND (yd)", 1, 10, script_grind.nextToNodeDist);
					Separator();
				end
		
		end
		
		-- checkbox use unstuck script
		wasClicked, script_grind.useUnstuck = Checkbox("Use Unstuck Feature (script_unstuck)", script_grind.useUnstuck);

		if (script_grind.useUnstuck) then
			Text("Adjust Unstuck Sensitivity");
			script_unstuck.turnSensitivity = SliderFloat("Sensitivity", .01, 3, script_unstuck.turnSensitivity);
		end

		Separator()
		
		-- ressurect distance
		wasClicked, script_grind.safeRess = Checkbox("Ressurect In Safe Area", script_grind.safeRess);
		SameLine();
		wasClicked, script_grindEX.allowSwim = Checkbox("(Has Bugs) Allow Swimming", script_grindEX.allowSwim);

		Text('Ressurect To Corpse Distance'); script_grind.ressDistance = SliderFloat("RD (yd)", 1, 35, script_grind.ressDistance);
		Separator();
	end
end