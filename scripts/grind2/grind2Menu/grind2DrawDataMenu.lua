grind2DrawDataMenu = {

	drawMessages = true,

	drawUnits = true,

	drawObjects = true,

	drawChestNodes = true,

	drawGatherNodes = true,

	showGameObjectIDs = false,

	newTheme = true,

	drawPath = true


}

function grind2DrawDataMenu:run()

	local wasClicked = false;

-- draw unit and message data on screen
	if CollapsingHeader("Draw Data Menu") then

		wasClicked, self.drawMessages = Checkbox("Messages", self.drawMessages);

		SameLine();

		Text(" | ")

		SameLine();

		wasClicked, self.drawUnits = Checkbox("Units", self.drawUnits);

		SameLine();

		Text(" | ")

		SameLine();

		wasClicked, self.drawObjects = Checkbox("Game Objects", self.drawObjects);

		SameLine();

		Text(" | ");

		SameLine();

		wasClicked, self.newTheme = Checkbox("Theme", self.newTheme);

		if not self.newTheme then
			NewTheme(false);
		else
			NewTheme(true);
		end
		Separator();


-- aggro circles
		wasClicked, grind2DrawAggroCircles.drawAggroCircles = Checkbox("Aggro Circles", grind2DrawAggroCircles.drawAggroCircles);

		SameLine();

		Text(" | ");

		SameLine();

-- draw path
		wasClicked, self.drawPath = Checkbox("Path", self.drawPath);

-- aggro circles slider
		if grind2DrawAggroCircles.drawAggroCircles then

			Text("Aggro Circle Range")

			grind2DrawAggroCircles.circleRange = SliderInt("Aggro Circle Range", 1, 150, grind2DrawAggroCircles.circleRange);

		end

		

-- show or hide unit data on screen
		if self.drawUnits then

			if CollapsingHeader("| + | Draw Unit Data | + |") then

				Text("				UNIT DATA")

				Separator();
	
				wasClicked, grind2SelectDrawTargets.drawLevel = Checkbox("Level ", grind2SelectDrawTargets.drawLevel);

				SameLine();

				Text(" | ")

				SameLine();

				wasClicked, grind2SelectDrawTargets.drawHP =  Checkbox("Health ", grind2SelectDrawTargets.drawHP);

				SameLine();
				
				Text(" | ")

				SameLine();

				wasClicked, grind2SelectDrawTargets.drawDistance =  Checkbox("Distance ", grind2SelectDrawTargets.drawDistance);

				SameLine();
				
				Text(" | ")

				SameLine();

				wasClicked, grind2SelectDrawTargets.drawName = Checkbox("Name", grind2SelectDrawTargets.drawName);


				Separator();


				wasClicked, grind2DrawUnitData.drawPlayers = Checkbox("Draw Players ", grind2DrawUnitData.drawPlayers);
			
				SameLine();
				
				Text(" | ")

				SameLine();
	
				wasClicked, grind2DrawUnitData.drawNPC = Checkbox("Draw NPCs ", grind2DrawUnitData.drawNPC);

				SameLine();
				
				Text(" | ")

				SameLine();

				wasClicked, grind2DrawUnitData.drawTargeted = Checkbox("Draw Targeted ", grind2DrawUnitData.drawTargeted);


				Separator();


				if grind2DrawUnitData.drawNPC then

					wasClicked, grind2DrawUnitData.drawFriendlies = Checkbox("Draw Friendly NPC ", grind2DrawUnitData.drawFriendlies);

					SameLine();
					
					Text(" | ")

					SameLine();

					wasClicked, grind2DrawUnitData.drawEnemies = Checkbox("Draw Enemy NPC ", grind2DrawUnitData.drawEnemies);
				end

				if grind2DrawUnitData.drawPlayers then
				
					wasClicked, grind2SelectDrawTargets.drawFriendlyPlayers = Checkbox("Draw Friendly Players", grind2SelectDrawTargets.drawFriendlyPlayers);

					SameLine();

					Text(" | ")

					SameLine();

					wasClicked, grind2SelectDrawTargets.drawEnemyPlayers = Checkbox("Draw Enemy Players", grind2SelectDrawTargets.drawEnemyPlayers);
				end
			end
		end

-- show or hide game objects on screen
		if self.drawObjects then

			if CollapsingHeader("| + | Draw Game/Gather Objects | + |") then
			
				wasClicked, self.drawChestNodes = Checkbox("Chests", self.drawChestNodes);

				SameLine();
				
				Text(" | ")

				SameLine();

				wasClicked, self.drawGatherNodes = Checkbox("Herbs/Minerals", self.drawGatherNodes);

				Separator();

				-- controlled in gatherer menu grind menu
				wasClicked, self.showGameObjectIDs = Checkbox("Show Game Object ID's", self.showGameObjectIDs);

			end
		end
	end
end