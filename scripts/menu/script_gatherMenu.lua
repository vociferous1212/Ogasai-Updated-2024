script_gatherMenu = {

	addItemToGather = "",

}

function script_gatherMenu:menu()

	if (not script_gather.isSetup) then

		script_gather:setup();
	end

	local wasClicked = false;
	
	if (CollapsingHeader("Gather Menu")) then

		if (not script_gather.gatherAllPossible) then

-- collect minerals
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
				
-- collect herbs
			if(script_gather.collectHerbs) then
				if (CollapsingHeader("|+| Gather Herbs Selection")) then
					Separator();
					Text('Herbs');

					for i=0,script_gather.numHerbs - 29 do
						wasClicked, script_gather.herbs[i][2] = Checkbox(script_gather.herbs[i][0], script_gather.herbs[i][2]);
						SameLine(); Text('(' .. script_gather.herbs[i][3] .. ') Req Level');
					end
				end
			end
		end

-- use gatherer
		wasClicked, script_grind.gather = Checkbox("Use Gatherer", script_grind.gather);

-- grind2 gather on/off
		if script_grind.gather == false then
			grind2.gather = false;
		else
			grind2.gather = true;
		end
		
		if (script_grind.gather) then

			SameLine();

-- gather all possible
			if (script_gather.collectMinerals or script_gather.collectHerbs) then
				wasClicked, script_gather.gatherAllPossible = Checkbox("Gather All Possible", script_gather.gatherAllPossible);
			end
			
-- collect minerals checkbox
			wasClicked, script_gather.collectMinerals = Checkbox("Mining", script_gather.collectMinerals);

-- collect herbs checkbox
			SameLine();
			wasClicked, script_gather.collectHerbs = Checkbox("Herbalism", script_gather.collectHerbs);

-- collect chests checkbox
			SameLine();
			wasClicked, script_gather.collectChests = Checkbox("Chests", script_gather.collectChests);
			
		
			if (script_gather.nodeObj ~= nil and script_gather.nodeObj ~= 0) then
				if (script_gather.nodeGUID ~= 0 and script_gather.nodeGUID ~= nil) then
					Text("Current Gather Node - "..script_gather.nodeObj:GetUnitName().." " ..math.floor(script_gather.nodeObj:GetDistance()).." (yd)");
				end
			end

			Text('Gather Search Distance');
			script_gather.gatherDistance = SliderFloat("GSD", 1, 250, script_gather.gatherDistance);
			if (Button("Add Current Node To Blacklist By GUID")) then
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
			
			if (script_gather.safeGather) then
				Text("Blacklisting gather nodes with 3 or more enemies in range");
			end
			
			Separator();

			SameLine() Text("");

-- thousand needles quest items
			if GetMapID() == 400 then
				if Button("Collect Rocket Car Parts") then	
					script_gather.collectChests = true;
					script_gather:addChest("rocket car", 449, 1, true);
					script_gather:addChest("rocket car", 450, 1, true);
					script_gather:addChest("rocket car", 451, 1, true);
					script_gather:addChest("rocket car", 452, 1, true);
					script_gather:addChest("rocket car", 453, 1, true);
					script_gather:addChest("rocket car", 454, 1, true);
				end
			end

-- ungoro crater power crystals and items
			if GetMapID() == 490 then
				if Button("Collect Power Crystals") then	
					script_gather.collectChests = true;

					script_gather:addChest("Green Power Crystal", 2976, 1, true);
					script_gather:addChest("Green Power Crystal", 2972, 1, true);

					script_gather:addChest("Red Power Crystal", 2977, 1, true);
					script_gather:addChest("Red Power Crystal", 2973, 1, true);

					script_gather:addChest("Blue Power Crystal", 2971, 1, true);
					script_gather:addChest("Blue Power Crystal", 2975, 1, true);

					script_gather:addChest("Yellow Power Crystal", 2974, 1, true);
					script_gather:addChest("Yellow Power Crystal", 2978, 1, true);
				end

				SameLine();

				if Button("Collect Dirt") then
					script_gather.collectChests = true;
					script_gather:addChest("Un'Goro Dirt Pile", 49, 1, true);
				end

				SameLine();

				if Button("Collect Sprouts") then
					script_gather.collectChests = true;
					script_gather:addChest("Bloodpetal Sprout", 391, 1, true);
				end
			end

			Separator();

-- add item to gather input box
			if Button("Add Item To Gather") then
				local itemID = tonumber(self.addItemToGather);
				script_gather:addChest("Item", itemID)

				if not script_gather.collectChests then
					script_gather.collectChests = true;
				end
			end
			
			SameLine();

			Text("Add item to gather by ItemID");


			self.addItemToGather = InputText("Gather Item", self.addItemToGather);
			
			Separator();
			Text("Blacklist Gather Node Time - Seconds - 300 = 5 minutes");
			script_gather.blacklistSetTime = SliderInt("BLT", 1, 300, script_gather.blacklistSetTime);

		end
		Text("");
		Separator();
	end
end