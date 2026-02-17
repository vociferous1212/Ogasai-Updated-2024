script_rotationMenu = {

	pause = true,
	adjustTickRate = false,


}

function script_rotationMenu:menu()

	if (not self.pause) then 
		if (Button("Pause")) then 
			self.pause = true; 
		end
	else 
		if (Button("Resume")) then 
			self.pause = false; 
		end 
	end

	SameLine(); 

	if (Button("Reload")) then 
		coremenu:reload(); 
	end

	SameLine(); 
	
	if (Button("Exit")) then 
		StopBot(); 
	end

	Separator();
	
	wasClicked, script_rotation.lootTargets = Checkbox("Auto-Loot | ", script_rotation.lootTargets);

	SameLine();

	wasClicked, script_rotation.useRestFeature = Checkbox("Auto-Rest | ", script_rotation.useRestFeature);

	SameLine();

	wasClicked, script_rotation.autoFaceTarget = Checkbox("Face Target | ", script_rotation.autoFaceTarget);

	Separator();

	-- Load combat menu by class
	local _ , class = UnitClass("player");
	if (class == 'MAGE') then
		script_mageEX:menu();
	elseif (class == 'HUNTER') then
		script_hunterMenu:menu();
	elseif (class == 'WARLOCK') then
		script_warlockEX:menu();
	elseif (class == 'PALADIN') then
		script_paladinMenu:menu();
	elseif (class == 'DRUID') then
		script_druidEX:menu();
	elseif (class == 'PRIEST') then
		script_priestMenu:menu();
	elseif (class == 'WARRIOR') then
		script_warriorEX:menu();
	elseif (class == 'ROGUE') then
		script_rogueEX:menu();
	elseif (class == 'SHAMAN') then
		script_shamanMenu:menu();
	end	

	Separator();

	if (CollapsingHeader('Display options')) then
		if (CollapsingHeader("|+| Radar")) then
			script_radar:menu();
		end

		local wasClicked = false;

		wasClicked, script_rotationEX.drawEnabled = Checkbox('Show status window', script_rotationEX.drawEnabled);

		wasClicked, script_rotationEX.drawGather = Checkbox('Show gather nodes', script_rotationEX.drawGather);
		SameLine();
		wasClicked, script_grindMenu.showIDD = Checkbox("Show Item ID's", script_grindMenu.showIDD);

		wasClicked, script_rotationEX.drawUnits = Checkbox("Show unit info on screen", script_rotationEX.drawUnits);

		wasClicked, script_rotationEX.drawAggro = Checkbox('Show aggro range circles', script_rotationEX.drawAggro);
		
		Separator();

		if (script_rotationEX.drawAggro) then
			Text("Aggro Circle Range");
			script_rotationEX.aggroRangeTank = SliderInt("AR", 36, 300, script_rotationEX.aggroRangeTank);
		end
	end

	if (CollapsingHeader("Script Tick Rate")) then
		wasClicked, script_rotation.adjustTickRate = Checkbox("Adjust Tick Rate !! Caution !!", script_rotation.adjustTickRate);
		if (script_rotation.adjustTickRate) then
			Text('(ms) How Fast Bot Reacts');
			script_rotation.tickRate = SliderInt("TR", 50, 2000, script_rotation.tickRate);
		end
	end
	

	--wasClicked, script_rotationEX.drawChests = Checkbox("Draw Chests", script_rotationEX.drawChests);

	if script_rotation.lootTargets then
		script_lootMenu:menu();
	end	
end