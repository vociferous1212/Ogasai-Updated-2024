runOgasai = {

	pause = true,

	manuallyRunQuester = false,

	manuallyRunGrinder = false,

	manuallyRunRotation = false,

}


function runOgasai:runGrinder()

	self.manuallyRunQuester = false;

	self.manuallyRunRotation = false;

	_quest.usingQuester = false;

	script_rotation.usingRotation = false;

	_quest.pause = true;

	script_rotationMenu.pause = true;

	if not self.pause then
		grind2.pause = false;
	end

	grind2:run();

end



function runOgasai:runQuester()

	self.manuallyRunGrinder = false;

	self.manuallyRunRotation = false;

	grind2.usingGrinder2 = false;

	script_rotation.usingRotation = false;

	grind2.pause = true;

	script_rotationMenu.pause = true;

	if not self.pause then
		_quest.pause = false;
	end

	_quest:run();
end

function runOgasai:runRotation()

	self.manuallyRunGrinder = false;

	self.manuallyRunQuester = false;

	grind2.usingGrinder = false;

	_quest.usingQuester = false;

	grind2.pause = true;

	_quest.pause = true;

	if not self.pause then
		script_rotationMenu.pause = false;
	end

	script_rotation:run();

	script_rotation:draw();
end




function runOgasai:draw()

end

function runOgasai:window()

	runOgasai:menu()

end

function runOgasai:menu()

	EndWindow();

	if NewWindow("Ogasai", 400, 400) then

		if not self.pause then
			if Button("Pause") then
				self.pause = true;
				_quest.pause = true;
				grind2.pause = true;
				script_rotationMenu.pause = true;
			end
		elseif self.pause then
			if Button("Resume") then
				self.pause = false;
			end
		end

		SameLine();

		if Button("Reload") then
			coremenu:reload();
		end

		SameLine();

		if Button("Exit") then

			StopBot();
		end
		
		if _quest.pause then
			Text("quester paused")
		else 
			Text("RUNNING quester")
		end
		Separator();
		if grind2.pause then
			Text("grinder paused")
		else
			Text("RUNNING grinder")
		end
		Separator();
		if script_rotationMenu.pause then
			Text("rotation paused")
		else
			Text("RUNNING rotation")
		end

		Text("");

		Text("Testing stuff. will do start quests in night elf area,")
		Text("then run grinder aftwards until level 6.")
		Text("Plans to add pathing between towns on roads...")
		Separator();
		if CollapsingHeader("Ogasai Menu") then

			if Button("Return to Ogasai - stop running all manually") then
				self.manuallyRunGrinder = false;
				self.manuallyRunQuester = false;
				self.manuallyRunRotation = false;
				script_rotation.usingRotation = false;
				_quest.usingQuester = false;
				grind2.usingGrinder2 = false;
			end

			if Button("Manually Run Grinder") then
				self.manuallyRunGrinder = true;
				self.manuallyRunQuester = false;
				self.manuallyRunRotation = false;
				self.pause = false;
				runOgasai:runGrinder();
			end
			
			if Button("Manually Run Quester") then
				self.manuallyRunQuester = true;
				self.manuallyRunGrinder = false;
				self.manuallyRunRotation = false;
				self.pause = false;
				runOgasai:runQuester();
			end

			if Button("Manually Run Rotation") then
				self.manuallyRunRotation = true;
				self.manuallyRunGrinder = false;
				self.manuallyRunQuester = false;
				self.pause = false;
				runOgasai:runRotation();
			end

		end
	end
end



--[[


--]]


function runOgasai:run()

	local quest = _quest.currentQuest;

	-- show ogasai menu
	runOgasai:menu();

	if self.pause then
		if self.manuallyRunQuester then
			_quest:window();
		end
		if self.manuallyRunGrinder then
			grind2:window();
		end
		if self.manuallyRunRotation then
			script_rotation:window();
		end
	end

-- test run each mode
	if self.manuallyRunGrinder and not self.manuallyRunQuester and not self.manuallyRunRotation and not self.pause then
		runOgasai:runGrinder();
		self.manuallyRunQuester = false;
		self.manuallyRunRotation = false;
		return;

	elseif self.manuallyRunQuester and not self.manuallyRunGrinder and not self.manuallyRunRotation and not self.pause then
		runOgasai:runQuester();
		self.manuallyRunGrinder = false;
		self.manuallyRunRotation = false;
		return;

	elseif self.manuallyRunRotation and not self.manuallyRunGrinder and not self.manuallyRunQuester and not self.pause then
		runOgasai:runRotation();
		self.manuallyRunGrinder = false;
		self.manuallyRunQuester = false;
		return;
	end


















	-- return if paused
	if self.pause or (grind2.usingGrinder2 and grind2.pause) or (_quest.usingQuester and _quest.pause) or (script_rotation.usingRotation and script_rotationMenu.pause) then

		return;
	end


-- night elf 1 - 6
-- i need to specify breaks in the quester for this to work. tick a variable to true, or whatever, when a set of quests are complete?


	-- player is not level 10 yet so grind to level 10
	if PlayerLevel() < 10 and PlayerLevel() >= 6 then

		if quest == "need to find a good quest to stop the bot" then

			runOgasai:runGrinder();

		end

		-- need to make a path to run to dolanaar
		-- player level is greater than 6 so run to dolanaar
		if quest ~= "find a good quest to stop at" then

			runOgasai:runQuester();
		end
		

-- if player level is less than 6 and we have the end quest for the starter area then run the griner until level 6 is reached
	elseif PlayerLevel() < 6 then

		if quest == "Dolanaar Delivery" then

			runOgasai:runGrinder();
		end

		-- player level is less than 6 so run the quester in the starter area

		if quest ~= "Dolanaar Delivery" then

			runOgasai:runQuester();
		end	
	end

end


-- i need to make a script designating roads... this will help the quester significantly... and flight paths

-- maybe the grinder and quester can be cobbled together with a pather to go from area to area instead of forcing it all into one single enviornment

-- if I'm a night elf hunter then after I complete the starter quests I need to walk to dolanaar.

-- switch to this script and move to dolanaar - pause the quester....

-- would need to make a table of pathing points that are "roads" and run the table and navigate through the points

-- then can unpause the quester... maybe even do some vendor checks and mail??? - get minimap text for each zone to check?

-- but the idea is when the quester runs out of viable quests to do maybe it can run the grinder until a better level is reached

-- when level is reached, switch back here and run the path to darnassus?

-- believe PersistLoadingScreen() does not work properly, or maybe I'm using it wrong... no documention on it..
-- would probably get stuck on other side of portal...

-- would work better for other races, of course. can probably get a tauren to read item ID of the lifts and walk on/off them into TB

-- might even be prudent to seperate the scripts into sections like 1-6 and 6-10 and so on


-- need to check by race and/or zone


