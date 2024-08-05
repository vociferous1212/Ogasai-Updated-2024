script_lootMenu = {}

function script_lootMenu:menu()

	if (CollapsingHeader("Loot Options")) then
		local wasClicked = false;

		if (script_grind.deleteItems) then
			if (CollapsingHeader("|+| Items To Delete")) then
				--for i=0, script_deleteItems.deleteNum -1 do
				--	Text(script_deleteItems.deleteItems[i]);
				--end
				wasClicked, script_deleteItems.selectedListItem = ComboBox("", script_deleteItems.selectedListItem, unpack(script_deleteItems.deleteItems));
				script_deleteItems.addDeleteItemByName = InputText("Add Item", script_deleteItems.addDeleteItemByName);
				if (Button("Add Delete Item")) then
					script_deleteItems:addDeleteItem(script_deleteItems.addDeleteItemByName);	
				end
				SameLine();
				if (Button("Remove Delete Item")) then
					script_deleteItems:removeDeleteItem(script_deleteItems.selectedListItem+1);
				end
				Text(" add new items in deleteItems script setup");
				Separator();
			end
		end

		wasClicked, script_grind.skipLooting = Checkbox("Skip Looting", script_grind.skipLooting);
		if (not script_grind.skipLooting) then
			SameLine();
			wasClicked, script_grind.skinning = Checkbox("Use Skinning", script_grind.skinning);

			wasClicked, script_grind.deleteItems = Checkbox("Delete Items", script_grind.deleteItems);
			Separator();

			Text('Search For Loot Distance');
			script_grind.findLootDistance = SliderFloat("SFL (yd)", 1, 100, script_grind.findLootDistance);

			Text('Loot Corpse Distance');
			script_grind.lootDistance = SliderFloat("LCD (yd)", 1, 5, script_grind.lootDistance);

			Text("Blacklist Loot Time");
			script_grind.blacklistLootTimeVar = SliderInt("BL (sec)", 10, 60, script_grind.blacklistLootTimeVar);
			if (Button("Add Target To Loot Blacklist")) then
				if (GetLocalPlayer():GetUnitsTarget() ~= 0) then
					script_grind:addTargetToLootBlacklist(GetLocalPlayer():GetUnitsTarget():GetGUID());
				DEFAULT_CHAT_FRAME:AddMessage("Blacklisting Loot Target " .. GetLocalPlayer():GetUnitsTarget():GetUnitName() .. "");	
				elseif (script_grind.lootObj ~= 0 and script_grind.lootObj ~= nil) then
					script_grind:addTargetToLootBlacklist(script_grind.lootObj:GetGUID());
					DEFAULT_CHAT_FRAME:AddMessage("Blacklisting Loot Target " .. script_grind.lootObj:GetUnitName() .. "");
				elseif (GetLocalPlayer():GetUnitsTarget() == 0) and (script_grind.lootObj == 0 or script_grind.lootObj == nil) then
					DEFAULT_CHAT_FRAME:AddMessage("No target to blacklist loot!");
				end
			end
		end
	end
end