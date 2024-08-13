script_rotationMenu = {

	drawUnits = true,
	drawAggro = true,
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

	if (Button("Reload Scripts")) then 
		coremenu:reload(); 
	end

	SameLine(); 
	
	if (Button("Turn Off")) then 
		StopBot(); 
	end

	if (HasSpell("Corruption")) then
		SameLine();
		wasClicked, script_rotation.warlockDots = Checkbox("DoT's", script_rotation.warlockDots);
	end

	Separator();

	-- Load combat menu by class
	local class = UnitClass("player");
	if (class == 'Mage') then
		script_mageEX:menu();
	elseif (class == 'Hunter') then
		script_hunterEX:menu();
	elseif (class == 'Warlock') then
		script_warlockEX:menu();
	elseif (class == 'Paladin') then
		script_paladinEX:menu();
	elseif (class == 'Druid') then
		script_druidEX:menu();
	elseif (class == 'Priest') then
		script_priestEX:menu();
	elseif (class == 'Warrior') then
		script_warriorEX:menu();
	elseif (class == 'Rogue') then
		script_rogueEX:menu();
	elseif (class == 'Shaman') then
		script_shamanEX:menu();
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

	end
	if (CollapsingHeader("Script Tick Rate")) then
		wasClicked, script_rotation.adjustTickRate = Checkbox("Adjust Tick Rate !! Caution !!", script_rotation.adjustTickRate);
		if (script_rotation.adjustTickRate) then
			Text('(ms) How Fast Bot Reacts');
			script_rotation.tickRate = SliderInt("TR", 50, 2000, script_rotation.tickRate);
		end
	end
	if (script_rotationEX.drawAggro) then
		Text("Aggro Circle Range");
		script_rotationEX.aggroRangeTank = SliderInt("AR", 36, 300, script_rotationEX.aggroRangeTank);
	end

	wasClicked, script_rotationEX.drawChests = Checkbox("Draw Chests", script_rotationEX.drawChests);
		
end