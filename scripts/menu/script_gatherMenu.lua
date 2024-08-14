script_gatherMenu = {}

function script_gatherMenu:menu()

	if (not script_gather.isSetup) then
		script_gather:setup();
	end

	local wasClicked = false;
	
	if (CollapsingHeader("Gather options")) then

		if (not script_gather.gatherAllPossible) then

			if(script_gather.collectMinerals) then
				if (CollapsingHeader("|+| Gather Minerals Selection")) then
					Separator();
					Text('Minerals');
					
					-- -14 for some reason double counts each mineral from above
					for i=0,script_gather.numMinerals - 14 do
						wasClicked, script_gather.minerals[i][2] = Checkbox(script_gather.minerals[i][0], script_gather.minerals[i][2]);
						SameLine(); Text('(' .. script_gather.minerals[i][3] .. ') Req Level');	
					end
				end
			end
				
			if(script_gather.collectHerbs) then
				if (CollapsingHeader("|+| Gather Herbs Selection")) then
					Separator();
					Text('Herbs');

					-- -29 for some reason double counts each herb from above
					for i=0,script_gather.numHerbs - 29 do
						wasClicked, script_gather.herbs[i][2] = Checkbox(script_gather.herbs[i][0], script_gather.herbs[i][2]);
						SameLine(); Text('(' .. script_gather.herbs[i][3] .. ') Req Level');
					end
				end
			end
		end

		wasClicked, script_grind.gather = Checkbox("Use Gatherer", script_grind.gather);
		
		if (script_grind.gather) then

			SameLine();
			if (script_gather.collectMinerals or script_gather.collectHerbs) then
				wasClicked, script_gather.gatherAllPossible = Checkbox("Gather All Possible", script_gather.gatherAllPossible);
			end
			
			wasClicked, script_gather.collectMinerals = Checkbox("Mining", script_gather.collectMinerals);
			SameLine();
			wasClicked, script_gather.collectHerbs = Checkbox("Herbalism", script_gather.collectHerbs);
			SameLine();
			wasClicked, script_gather.collectChests = Checkbox("Chests", script_gather.collectChests);
			
		
			if (script_gather.nodeObj ~= nil and script_gather.nodeObj ~= 0) then
				if (script_gather.nodeGUID ~= 0 and script_gather.nodeGUID ~= nil) then
					Text("Current Gather Node - "..script_gather.nodeObj:GetUnitName().." " ..math.floor(script_gather.nodeObj:GetDistance()).." (yd)");
				end
			end

			Text('Gather Search Distance');
			script_gather.gatherDistance = SliderFloat("GSD", 1, 250, script_gather.gatherDistance);
			if (Button("Add Node To Blacklist By GUID")) then
				if (script_gather.nodeObj ~= 0 and script_gather.nodeObj ~= nil) then
					if (script_gather.nodeGUID ~= nil and script_gather.nodeGUID ~= 0) then
						script_gather:addNodeToBlacklist(script_gather.nodeGUID);
						DEFAULT_CHAT_FRAME:AddMessage("Blacklisting Gather Node " .. script_gather.nodeObj:GetUnitName() .. " " ..math.floor(script_gather.nodeObj:GetDistance()).." (yd)");
					end
				elseif (script_gather.nodeObj == nil or script_gather.nodeObj == 0) then
					DEFAULT_CHAT_FRAME:AddMessage("No target to blacklist gather node!");
				end
			end
			wasClicked, script_gather.safeGather = Checkbox("Safe Gathering", script_gather.safeGather);
			SameLine(); 
			wasClicked, script_grind.killStuffAroundGatherNodes = Checkbox("Kill Stuff Around Nodes", script_grind.killStuffAroundGatherNodes);

			if (script_gather.safeGather) then
				Text("Blacklisting gather nodes with 3 or more enemies in range");
				Text("");
			end
			
			Separator();
			Text("Blacklist Gather Node Time - Seconds - 300 = 5 minutes");
			script_gather.blacklistSetTime = SliderInt("BLT", 1, 300, script_gather.blacklistSetTime);

		end
	end
end