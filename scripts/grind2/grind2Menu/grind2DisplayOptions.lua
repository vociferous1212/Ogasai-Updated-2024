grind2DisplayOptions = {


}

function grind2DisplayOptions:run()

	local wasClicked = false;

	if CollapsingHeader("Draw Data Options") then

		wasClicked, grind2.showMessages = Checkbox("Show Messages", grind2.showMessages);


-- aggro circles
		wasClicked, grind2DrawAggroCircles.drawAggroCircles = Checkbox("Draw Aggro Circles", grind2DrawAggroCircles.drawAggroCircles);

		if grind2DrawAggroCircles.drawAggroCircles then

			Text("Aggro Circle Range")

			grind2DrawAggroCircles.circleRange = SliderInt("Aggro Circle Range", 1, 150, grind2DrawAggroCircles.circleRange);

		end

-- show or hide unit data on screen
		if CollapsingHeader("| + | Draw Unit Data | + |") then

			Text("				UNIT DATA")

			Separator();
	
			wasClicked, grind2SelectDrawTargets.drawLevel = Checkbox("Level ", grind2SelectDrawTargets.drawLevel);

			SameLine();

			wasClicked, grind2SelectDrawTargets.drawHP =  Checkbox("Health ", grind2SelectDrawTargets.drawHP);

			SameLine();

			wasClicked, grind2SelectDrawTargets.drawDistance =  Checkbox("Distance ", grind2SelectDrawTargets.drawDistance);

			SameLine();

			wasClicked, grind2SelectDrawTargets.drawName = Checkbox("Name", grind2SelectDrawTargets.drawName);




			wasClicked, grind2DrawUnitData.drawPlayers = Checkbox("Draw Players ", grind2DrawUnitData.drawPlayers);
			
			SameLine();
	
			wasClicked, grind2DrawUnitData.drawNPC = Checkbox("Draw NPCs ", grind2DrawUnitData.drawNPC);

			SameLine();

			wasClicked, grind2DrawUnitData.drawTargeted = Checkbox("Draw Targeted ", grind2DrawUnitData.drawTargeted);


			if grind2DrawUnitData.drawNPC then

				wasClicked, grind2DrawUnitData.drawFriendlies = Checkbox("Draw Friendlies ", grind2DrawUnitData.drawFriendlies);

				SameLine();

				wasClicked, grind2DrawUnitData.drawEnemies = Checkbox("Draw Enemies ", grind2DrawUnitData.drawEnemies);
			end
		end
	end
end