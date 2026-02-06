grind2MiscMenu = {

}

function grind2MiscMenu:run()

	local level = GetLocalPlayer():GetLevel();

	if CollapsingHeader("Miscellanous Menu") then

-- loot targets
		wasClicked, grind2.lootTargets = Checkbox("Loot Targets", grind2.lootTargets);

		SameLine();

		Text(" | ");

		SameLine();

-- use paranoia
		wasClicked, grind2.useParanoia = Checkbox("Use Paranoia", grind2.useParanoia);


-- use mount
		if level >= 40 then

			SameLine();

			Text(" | ")

			SameLine();

			wasClicked, grind2.useMount = Checkbox("Use Mount", grind2.useMount);
		end

		Separator();

-- auto select talents
		if level >= 10 then
			wasClicked, grind2.autoSelectTalents = Checkbox("Auto Talents", grind2.autoSelectTalents);	
		end

-- use first aid
		if HasSpell("First Aid") then
			SameLine();

			Text(" | ");

			SameLine();

			wasClicked, grind2.useFirstAid = Checkbox("First-Aid", grind2.useFirstAid);
		end
		
		Separator();

-- paranoia timer
		if grind2.useParanoia then
			Text("Paranoia Time (sec)");
			grind2Paranoia.paranoidSetTime = SliderInt("Paranoid Time", 0, 300, grind2Paranoia.paranoidSetTime);
					Separator();

		end

-- loot target distance
		if grind2.lootTargets then
			Text("Loot Target Distance (yd)")
			grind2DoLoot.lootTargetDistance = SliderFloat("Loot Target Distance", 0, 5, grind2DoLoot.lootTargetDistance);
		end

		Separator();

-- delete items
		if CollapsingHeader("| + | Delete Unwanted Items | + |") then

			Text("List of items that will be deleted from inventory")
			wasClicked, script_deleteItems.selectedListItem = ComboBox("", script_deleteItems.selectedListItem, unpack(script_deleteItems.deleteItems));

			Separator();

			script_deleteItems.addDeleteItemByName = InputText("Add Item", script_deleteItems.addDeleteItemByName);

			if Button("Add Item") then
				script_deleteItems:addDeleteItem(script_deleteItems.addDeleteItemByName);	
			end

			SameLine();

			if Button("Remove Item") then
				script_deleteItems:removeDeleteItem(script_deleteItems.selectedListItem+1);
			end

			SameLine();

			Text("Add new items in deleteItems script setup");
		end

		Text("");
		Separator();
	end

	-- show message on the menu
	SameLine();
	if grind2DoLoot.lootTarget ~= nil and grind2DoLoot.lootTarget ~= 0 then

		self.grinderMessage = "Moving to loot target - "..grind2DoLoot.lootTarget:GetUnitName().." | "..math.floor(grind2DoLoot.lootTarget:GetDistance()).." (yd)";
		
		Text("		  | Moving to loot target - "..grind2DoLoot.lootTarget:GetUnitName().." | "..math.floor(grind2DoLoot.lootTarget:GetDistance()).." (yd)");
	else

		Text("	      | idle...");
	end
end