grind2MiscMenu = {

}

function grind2MiscMenu:run()

	if CollapsingHeader("Miscellanous Menu") then

		wasClicked, grind2.lootTargets = Checkbox("Loot Targets", grind2.lootTargets);

		Separator();

		Text("Paranoia Time");
		grind2Paranoia.paranoidSetTime = SliderInt("Paranoid Time", 0, 300, grind2Paranoia.paranoidSetTime);


		Text("");
		Text("Mount");
		Text("Talents");
		Text("First Aid");
		Text("Loot options?")

		Separator();
	end

	SameLine();
	if grind2DoLoot.lootTarget ~= nil and grind2DoLoot.lootTarget ~= 0 then

		self.grinderMessage = "Moving to loot target - "..grind2DoLoot.lootTarget:GetUnitName().." | "..math.floor(grind2DoLoot.lootTarget:GetDistance()).." (yd)";
		
		Text("		  | Moving to loot target - "..grind2DoLoot.lootTarget:GetUnitName().." | "..math.floor(grind2DoLoot.lootTarget:GetDistance()).." (yd)");
	else

		Text("	      | idle...");
	end
end