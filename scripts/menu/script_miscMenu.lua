script_miscMenu = {}

function script_miscMenu:menu()
	if (CollapsingHeader("Talents, Paranoia & Misc Options")) then

		if (GetLocalPlayer():GetLevel() >= 40) then
			wasClicked, script_grind.useMount = Checkbox("Use Mount", script_grind.useMount);
			if (self.helpMenu) then
				Text("HELP *Use mounts above level 40*");
				Separator();
			end
		end

		wasClicked, script_grind.autoTalent = Checkbox("Spend Talent Points  ", script_grind.autoTalent);
		SameLine();
		Text("Change Talents In script_talent.lua");
		if (script_grind.autoTalent) then
			Text("Spending Next Talent Point In: " .. (script_talent:getNextTalentName() or " "));
		end
		if (self.helpMenu) then
			Text("HELP *Choose to auto select talent points*");
		Separator();
		end
		--wasClicked, script_grind.getSpells = Checkbox("Get Spells (IN PROCESS DO NOT USE)", script_grind.getSpells);
		
		script_paranoiaMenu:menu();

		wasClicked, script_grind.adjustTickRate = Checkbox("Adjust Script Speed", script_grind.adjustTickRate);
			if (self.helpMenu) then
				Text("HELP *Determines the mili-second interval for script to run each pass*")
			end
		Separator();
		if (script_grind.adjustTickRate) then
			Text("Script Tick Rate - How Fast The Scripts Run"); script_grind.tickRate = SliderInt("TR (ms)", 0, 3000, script_grind.tickRate);
			if (self.helpMenu) then
				Text("HELP *Determined in mili-seconds. Faster will skip crucial timers*");
				Separator();
			end	
		end

	end

	if (CollapsingHeader("Vendor Options")) then
		wasClicked, script_grind.useVendor = Checkbox("Use Vendoring", script_grind.useVendor);
		if (script_hunter.useVendor) then
			script_grind.useVendor = true;
		end
		if (script_grind.useVendor) then 
			script_vendorMenu:menu(); Separator();
		else
			Separator(); Text("If Inventory Is Full - ");
			wasClicked, script_grind.hsWhenFull = Checkbox("Use Hearthstone", script_grind.hsWhenFull); SameLine();
			wasClicked, script_grind.stopWhenFull = Checkbox("Stop The Bot", script_grind.stopWhenFull); SameLine();
			wasClicked, script_grindEX.logoutOnHearthstone = Checkbox("Exit On Hearth", script_grindEX.logoutOnHearthstone); Separator();
		end
	end
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
		
		-- show auto hotspot button
		if (script_grindMenu.useHotSpotArea) then
			if (Button("Save Current Location As Hotspot")) then
				script_nav:newHotspot(GetMinimapZoneText() .. ' ' .. GetLocalPlayer():GetLevel() .. ' - ' .. GetLocalPlayer():GetLevel()+2);
				if (IsMoving()) then
					StopMoving();
				end
				script_grind.staticHotSpot = false;
				script_grindMenu:printHotspot(); 
				script_grind.hotspotReached = true;
			end
			
			if (not script_grind.hotspotReached) and (not script_grind.useAutoHotspotDist) then
				Text("Distance To Hotspot Reached");
				script_grind.hotspotReachedDistance = SliderInt("HSD", 10, 100, script_grind.hotspotReachedDistance);
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

				wasClicked, self.selectedHotspotID = 
					ComboBox("", self.selectedHotspotID, unpack(hotspotDB.selectionList));
				SameLine();

				if Button("Load") then script_grind.staticHotSpot = false; script_nav:loadHotspotDB(self.selectedHotspotID+1);
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