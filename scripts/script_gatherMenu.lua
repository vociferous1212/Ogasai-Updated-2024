script_gatherMenu = {}

function script_gatherMenu:menu()

	if (not script_gather.isSetup) then
		script_gather:setup();
	end

	local wasClicked = false;
	
	if (CollapsingHeader("Gather options")) then
		wasClicked, script_grind.gather = Checkbox("Gather on/off", script_grind.gather);
		
		wasClicked, script_gather.collectMinerals = Checkbox("Mining", script_gather.collectMinerals);
		SameLine();
		wasClicked, script_gather.collectHerbs = Checkbox("Herbalism", script_gather.collectHerbs);
		SameLine();
		wasClicked, script_gather.collectChests = Checkbox("Chests", script_gather.collectChests);

		Text('Gather Search Distance');
		script_gather.gatherDistance = SliderFloat("GSD", 1, 250, script_gather.gatherDistance);

		if (script_gather.nodeGUID ~= 0) then
			if (Button("Add Node To Blacklist By GUID")) then
				
				script_gather:addNodeToBlacklist(script_gather.nodeGUID);
			end
			if (script_gather.nodeObj ~= nil and script_gather.nodeObj ~= 0) then
				Text("Current Gather Node - "..script_gather.nodeObj:GetUnitName().." " ..math.floor(script_gather.nodeObj:GetDistance()).." (yd)");
			end
		end
		Separator();
		Text("Blacklist Gather Node Time - Seconds");
		script_gather.blacklistSetTime = SliderInt("BLT", 1, 120, script_gather.blacklistSetTime);
		
		if (script_gather.collectMinerals or script_gather.collectHerbs) then
			wasClicked, script_gather.gatherAllPossible = Checkbox("Gather All Possible", script_gather.gatherAllPossible);
		end

		if(script_gather.collectMinerals and not script_gather.gatherAllPossible) then
			Separator();
			Text('Minerals');
			
			-- -14 for some reason double counts each mineral from above
			for i=0,script_gather.numMinerals - 14 do
				wasClicked, script_gather.minerals[i][2] = Checkbox(script_gather.minerals[i][0], script_gather.minerals[i][2]);
				SameLine(); Text('(' .. script_gather.minerals[i][3] .. ') Req Level');
			end
		end
		
		-- -29 for some reason double counts each herb from above
		if(script_gather.collectHerbs and not script_gather.gatherAllPossible) then
			Separator();
			Text('Herbs');
			
			for i=0,script_gather.numHerbs - 29 do
				wasClicked, script_gather.herbs[i][2] = Checkbox(script_gather.herbs[i][0], script_gather.herbs[i][2]);
				SameLine(); Text('(' .. script_gather.herbs[i][3] .. ') Req Level');
			end
		end
	end
end