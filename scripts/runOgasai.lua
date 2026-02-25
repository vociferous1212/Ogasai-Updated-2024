runOgasai = {

	showingWindow = true,

	usingRunOgasai = false,

	pause = true,

	manuallyRunQuester = false,

	manuallyRunGrinder = false,

	manuallyRunRotation = false,

	currentQuest = "",

	timer = GetTimeEX(),

	quests = {

		starterQuests = {
			[1] = "Report to Sen'jin Village",
			[2] = "Report to Goldshire",
			[3] = "Vital Intelligence",
			[4] = "Rest and Relaxation",
			[5] = "Senir's Observations",
			[6] = "Rites of the Earthmother"
		},


		leaveZone1Quests = {
			[1] = "Delivery to Silverpine Forest",
			[2] = "Report to Gryan Stoutmantle",
			[3] = "Mountaineer Stormpike's Task",
			[4] = "Teldrassil",
			[5] = "A Sacred Burial",
			[6] = "Conscript of the Horde",
		},

		leaveZone2Quests = {
			[1] = "abc123",
			[2] = "zyx098"

		},

	}

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

	if self.showingWindow then
		grind2:draw();
	end
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

	if self.showingWindow then
		_quest:draw();
	end
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

	if self.showingWindow then
		script_rotation:draw();
	end
end

-- run fisher ?


--[[


--]]


function runOgasai:draw()

end

function runOgasai:window()

	runOgasai:menu()

end

function runOgasai:menu()

	EndWindow();

	if NewWindow("Ogasai", 400, 400) then

		self.showingWindow = true;

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

		Text("Testing stuff. will do start quests in each area,")
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
	else
		self.showingWindow = false;
	end
end



--[[


--]]


function runOgasai:run()

	self.usingRunOgasai = true;

	local quest = _quest.currentQuest;

	-- if paused then show corrosponding windows
	if self.pause or (not grind2.usingGrinder2 and not _quest.usingQuester and not script_rotation.usingRotation) then
		-- show ogasai menu
		runOgasai:menu();
	end

-- if paused then show windows
	if self.pause then
		if self.manuallyRunQuester and self.showingWindow then
			_quest:window();
			_quest:draw();
		end
		if self.manuallyRunGrinder and self.showingWindow then
			grind2:window();
			grind2:draw();
		end
		if self.manuallyRunRotation and self.showingWindow then
			script_rotation:window();
			script_rotation:draw();
		end
		if not self.manuallyRunGrinder and not self.manuallyRunQuester and not self.manuallyRunRotation and self.showingWindow then
			if PlayerLevel() <= 20 then
				_quest:window();
			end
			grind2:window();
			grind2:draw();
		end

		grind2.pause = true;
		_quest.pause = true;
		script_rotationMenu.pause = true;
	end

-- force use grinder 2 when in combat
	if (IsInCombat() or PlayerHasTarget() and GetTarget():CanAttack()) and not self.pause and not script_rotation.usingRotation then
		runOgasai:runGrinder();
		grind2.pause = false;
		self.timer = GetTimeEX() + 1000;
		_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
		return;
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


--[[


--]]

--[[


--]]

	-- return if paused
	if self.pause or self.timer > GetTimeEX() or (grind2.usingGrinder2 and grind2.pause) or (_quest.usingQuester and _quest.pause) or (script_rotation.usingRotation and script_rotationMenu.pause) then
		if not grind2.showingWindow then
			ShowBar();
		end
		return;
	end

--[[


--]]


-- no quests after level 20 currently - force run grinder
	if PlayerLevel() >= 20 then
		DEFAULT_CHAT_FRAME:AddMessage(" ");
		DEFAULT_CHAT_FRAME:AddMessage("No quests at this level - running grinder.");
		DEFAULT_CHAT_FRAME:AddMessage(" ");
		self.manuallyRunGrinder = true;
	end

--[[


--]]


	if PlayerLevel() >= 10 and PlayerLevel() <= 20 then
	
		-- why does this need to be 2 for it to not return anything?
		for i = 1, 2 do
			if quest == self.quests.leaveZone2Quests[i] then
				self.currentQuest = self.quests.leaveZone2Quests[i];
				break;
			end
		end

		-- no quest found run grinder
		if _questDB.curListQuest == nil then
			runOgasai:runGrinder();
			return;
		end

		if quest == self.currentQuest then

			runOgasai:runGrinder();

		end

		if quest ~= self.currentQuest then

			runOgasai:runQuester();
		end

		
	end


--[[


--]]



	if PlayerLevel() <= 10 then

		-- this is a little confusing....
		-- local 'quest' is the quester script current quest
		-- while self.currentquest is our transition quests in this script table
		-- if we have a trasisition quest then we have a current quest
		-- transition quests will be where paths need to be ran AND they start / end the sequence
		for i = 1, 6 do
			if quest == self.quests.starterQuests[i] then
				self.currentQuest = self.quests.starterQuests[i];
				break;
			end
		end

		-- check for zone 1 quests
		for i = 1, 6 do
			if quest == self.quests.leaveZone1Quests[i] then
				self.currentQuest = self.quests.leaveZone1Quests[i];
				break;
			end
		end

		-- player is not level 10 yet so grind to level 10
		if PlayerLevel() >= 6 then

			-- no quest found run grinder
			if _questDB.curListQuest == nil then
				runOgasai:runGrinder();
				return;
			end

			if quest == self.quests.leaveZone1Quests[i] then

				runOgasai:runGrinder();

			end

			if quest ~= self.quests.leaveZone1Quests[i] then

				runOgasai:runQuester();
			end

			

		end


--[[


--]]


		-- run transition quests
		if PlayerLevel() >= 6 and PlayerLevel() < 10 and quest == self.currentQuest then
			
				runOgasai:runQuester();

		-- if player level is less than 6 and we have the end quest for the starter area then run the griner until level 6 is reached
		elseif PlayerLevel() < 6 then

			-- no quest found run grinder
			if _questDB.curListQuest == nil then
				runOgasai:runGrinder();
				return;
			end

			if quest == self.currentQuest then

				runOgasai:runGrinder();
			end

			-- player level is less than 6 so run the quester in the starter area
			if quest ~= self.currentQuest then

				runOgasai:runQuester();
			end	

			
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
