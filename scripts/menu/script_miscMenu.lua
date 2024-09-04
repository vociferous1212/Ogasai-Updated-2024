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
			wasClicked, script_grindEX.logoutOnHearth = Checkbox("Exit On Hearth", script_grindEX.logoutOnHearth); Separator();
		end
	end

	script_pathMenu:menu();

end