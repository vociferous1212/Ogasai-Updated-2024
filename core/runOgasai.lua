runOgasai = {

	useFisher = false,

	usedFisher = false,

	lootTargets = false,

	isSetup = false,

	showingWindow = true,

	usingRunOgasai = false,

	pause = true,

	manuallyRunQuester = false,

	manuallyRunGrinder = false,

	manuallyRunRotation = false,

	manuallyRunFisher = false,

	currentQuest = "",

	timer = GetTimeEX(),

	usedVendor = true,		-- flip vendor between quester to grinder

	usedVendor2 = true,		-- use vendor when switching between grinder and quester

	currentLevel = PlayerLevel(),

	stopLevel = 10,

	-- quests to allow breaks and pauses between quester and grinder sequences
	quests = {


		-- level 1 - 6
		-- force the bot to run vendor once when we have a quest - useful for long journeys between the map with no vendor near.
		-- _questEX flip vendor var
		--
		starterForceVendorQuests = {

		},


		-- unit name of innkeepers, and locations, to set hearthstone
		starterSetHearthstoneInnkeepers = {


		},

		
		-- hearthstone out of start caves - last quest before heading to new area
		-- level 4-6
		starterHearthstoneQuests = {
			[1] = "Break Sharptusk!",
			[2] = "The Stolen Journal",
			[3] = "Bounty on Garrick Padfoot",
			[4] = "The Red Messenger",
			[5] = "Webwood Egg",
			[6] = "Burning Blade Medallion",

		},

		-- leaving level 1-6 areas
		leaveStarterZoneQuests = {
			[1] = "Report to Sen'jin Village",
			[2] = "Report to Goldshire",
			[3] = "Vital Intelligence",
			[4] = "Rest and Relaxation",
			[5] = "The Stolen Journal",

			-- 2 of the same named quests... need to check description on some
			[6] = {
				name = "Rites of the Earthmother",
				desc = "Take the Totem of Hawkwind to Baine Bloodhoof in Bloodhoof Village. Follow the road out of Camp Narache.",
			}
		},


		-- leaving level 6 - 10 areas
		leaveZone1Quests = {
			[1] = "Delivery to Silverpine Forest",
			[2] = "Mountaineer Stormpike's Task",
			[3] = "Teldrassil",
			[4] = "A Sacred Burial",
			[5] = "Report to Gryan Stoutmantle",
			[6] = "Conscript of the Horde",
		},

		-- leaving level 10 - 20 areas
		leaveZone2Quests = {
			[1] = "abc123",
			[2] = "zyx098"

		},

	}

}


function runOgasai:runGrinder()

	self.manuallyRunQuester = false;

	self.manuallyRunRotation = false;

	self.manuallyRunFisher = false;

	_quest.usingQuester = false;

	script_rotation.usingRotation = false;

	script_fish.usingFisher = false;

	_quest.pause = true;

	script_rotationMenu.pause = true;

	script_fish.pause = true;

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

	self.manuallyRunFisher = false;

	grind2.usingGrinder2 = false;

	script_rotation.usingRotation = false;

	script_fish.usingFisher = false;

	grind2.pause = true;

	script_rotationMenu.pause = true;

	script_fish.pause = true;

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

	self.manuallyRunFisher = false;

	grind2.usingGrinder = false;

	_quest.usingQuester = false;

	script_fish.usingFisher = false;

	grind2.pause = true;

	_quest.pause = true;

	script_fish.pause = true;

	if not self.pause then
		script_rotationMenu.pause = false;
	end

	script_rotation:run();

	if self.showingWindow then
		script_rotation:draw();
	end
end

function runOgasai:runFisher()

	self.usedFisher = true;

	self.manuallyRunGrinder = false;

	self.manuallyRunQuester = false;

	self.manuallyRunRotation = false;

	grind2.usingGrinder = false;

	_quest.usingQuester = false;

	script_rotation.usingRotation = false;

	script_fish.usingFisher = false;

	grind2.pause = true;

	_quest.pause = true;

	script_rotation.pause = true;

	if not self.pause then
		script_fish.pause = false;
	end

	script_fish:run();

	if self.showingWindow then
		script_fish:draw();
	end
end


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

		-- get navmesh load progress
		local navProgress = math.floor(GetLoadNavmeshProgress()*100);

		-- only show bot menu when navmesh has completed loading
		if navProgress == 100 then

		-- resume / pause / reload buttons
			if not self.pause then
				if Button("Pause") then
					self.pause = true;
					_quest.pause = true;
					grind2.pause = true;
					script_rotationMenu.pause = true;
					script_fish.pause = true;
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
		
			Separator();

		else

			ProgressBar("LOADING | ".. navProgress.."%", GetLoadNavmeshProgress());
			Text("");
			Separator();
		end

		if GetMapID() == 215 then
			wasClicked, self.useFisher = Checkbox("auto use fishing in mulgore to level 50", self.useFisher);
		end

		self.stopLevel = SliderInt("Stop Bot At Level", 1, 60, self.stopLevel);

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

		Separator();
		if script_fish.pause then
			Text("fisher paused");
		else
			Text("RUNNING fisher");
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
				self.manuallyRunFisher = false;
				script_rotation.usingRotation = false;
				_quest.usingQuester = false;
				grind2.usingGrinder2 = false;
				script_fish.usingFisher = false;

			end

			if Button("Manually Run Grinder") then
				self.manuallyRunGrinder = true;
				self.manuallyRunQuester = false;
				self.manuallyRunRotation = false;
				self.maniallyRunFisher = false;
				self.pause = false;
				runOgasai:runGrinder();
			end
			
			if Button("Manually Run Quester") then
				self.manuallyRunQuester = true;
				self.manuallyRunGrinder = false;
				self.manuallyRunRotation = false;
				self.maniallyRunFisher = false;
				self.pause = false;
				runOgasai:runQuester();
			end

			if Button("Manually Run Rotation") then
				self.manuallyRunRotation = true;
				self.manuallyRunGrinder = false;
				self.manuallyRunQuester = false;
				self.maniallyRunFisher = false;
				self.pause = false;
				runOgasai:runRotation();
			end

			if Button("Manually Run Fisher") then
				self.manuallyRunFisher = true;
				self.manuallyRunRotation = false;
				self.manuallyRunGrinder = false;
				self.manuallyRunQuester = false;
				self.pause = false;
				script_fish:run()
			end
		end

	else
		self.showingWindow = false;
	end

end



--[[


--]]


function runOgasai:setup()

	if not self.isSetup then

		ClearTarget();

		_quest.enemyTarget = nil;
		
		_questDB:setup();

		_questDB:getQuestStartPos();

		_questSetQuest:setOurCurrentQuest();

		-- don't start at level 1 without a quest
		if PlayerLevel() > 1 or GetNumQuestLogEntries() > 0 then
			self.pause = false;
		end
	end

	self.isSetup = true;

return false;
end

function runOgasai:run()

	if not self.isSetup then
		runOgasai:setup();
	end


	-- need a loot controller to control both blacklist tables, or integrate them
	-- bot is getting stuck in grinder with a valid loot target...
	-- if lootObj ~= nil then check tables

	self.usingRunOgasai = true;

	local quest = _quest.currentQuest;
	local questDesc = _quest.currentDesc;

	-- if paused then show corrosponding windows
	if self.pause or (not grind2.usingGrinder2 and not _quest.usingQuester and not script_rotation.usingRotation and not script_fish.usingFisher) then
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
		if self.manuallyRunFisher and self.showingWindow then
			script_fish:draw();
		end
		if not self.manuallyRunGrinder and not self.manuallyRunQuester and not self.manuallyRunRotation and not self.manuallyRunFisher and self.showingWindow then
			--if PlayerLevel() <= 20 then
				_quest:window();
			--end
			grind2:window();
			grind2:draw();
		end

		grind2.pause = true;
		_quest.pause = true;
		script_rotationMenu.pause = true;
		script_fish.pause = true;
	end

--[[
-- force use grinder 2 when in combat
	if IsInCombat() and not self.pause and not script_rotation.usingRotation then
		runOgasai:runGrinder();
		grind2.pause = false;
		_questDoCombat.blacklistTimer = GetTimeEX() + 10000;
		return true;
	end
--]]

-- test run each mode
	if self.manuallyRunGrinder and not self.manuallyRunQuester and not self.manuallyRunRotation and not self.manuallyRunFisher and not self.pause then
		runOgasai:runGrinder();
		self.manuallyRunQuester = false;
		self.manuallyRunRotation = false;
		self.manuallyRunFisher = false;
		return;

	elseif self.manuallyRunQuester and not self.manuallyRunGrinder and not self.manuallyRunRotation and not self.manuallyRunFisher and not self.pause then
		runOgasai:runQuester();
		self.manuallyRunGrinder = false;
		self.manuallyRunRotation = false;
		self.manuallyRunFisher = false;
		return;

	elseif self.manuallyRunRotation and not self.manuallyRunGrinder and not self.manuallyRunQuester and not self.manuallyRunFisher and not self.pause then
		runOgasai:runRotation();
		self.manuallyRunGrinder = false;
		self.manuallyRunQuester = false;
		self.manuallyRunFisher = false;
		return;
	elseif self.manuallyRunFisher and not self.manuallyRunGrinder and not self.manuallyRunQuester and not self.manuallyRunRotation and not self.pause then
		runOgasai:runFisher();
		self.manuallyRunGrinder = false;
		self.manuallyRunQuester = false;
		self.manuallyRunRotation = false;
		return;
	end

--[[


--]]

--[[


--]]

	-- return if paused
	if self.pause or self.timer > GetTimeEX() or (grind2.usingGrinder2 and grind2.pause) or (_quest.usingQuester and _quest.pause) or (script_rotation.usingRotation and script_rotationMenu.pause) or (script_fish.usingFisher and script_fish.pause) then
		if not grind2.showingWindow then
			ShowBar();
		end
		return;
	end

	if PlayerLevel() >= self.stopLevel then
		self.stopLevel = PlayerLevel() + 1;
		self.pause = true;
	end

--[[


--]]


	-- need to figure out weapon swap, works otherwise
		-- do skill check fish to 50ish?
	if not IsInCombat() and self.useFisher then
		local skillLevel = 0;
		if HasSpell("Fishing") then
			for i = 1, GetNumSkillLines() do
				local name, _, _, level, _, _ = GetSkillLineInfo(i);
				if (name == "Fishing") then
					skillLevel = level;
					break;
				end
			end
		end
		if skillLevel < 50 and ((GetMinimapZoneText() == "Bloodhoof Village" or GetMinimapZoneText() == "Stonebull Lake") or (HasSpell("Fishing") and GetZoneText() == "Mulgore")) then
			local myX, myY, myZ = PlayerPosition();
			local fishX, fishY, fishZ = -2134.5583496094, -329.17123413086, -14.048094749451;
			local distanceToFish = GetDistance3D(myX, myY, myZ, fishX, fishY, fishZ);

			if HasSpell("Fishing") and (HasItem("Fishing Pole") or script_fish:doWeHaveFishingPoleEquipped()) and distanceToFish <= 2 then
				runOgasai:runFisher();
				if not IsMoving() then
					if Player():GetAngle() < .75 or Player():GetAngle() > 1.5 then
						FaceAngle(1.1207504272461);
					end
				end
				return;
			elseif not HasSpell("Fishing") then
			
				local target = "Uthan Stillwater";
				local x, y, z = -2350.5100097656, -238.71600341797, -8.3894739151001;
				if GetDistance3D(myX, myY, myZ, x, y, z) > 3 then
					grind2MoveToTarget:run(Player(), x, y, z);
				else
					if not PlayerHasTarget() then
						TargetByName(target);
					elseif PlayerHasTarget() then
						if GetTarget():GetUnitName() ~= target then
							ClearTarget();
						end
					end

					if PlayerHasTarget() and not IsMoving() then
						if (GetTarget():UnitInteract()) then
							SelectGossipOption(1);
						end
						for i = 1, 5 do
							BuyTrainerService(i);
						end
					end
				end

			elseif (not HasItem("Fishing Pole") and not script_fish:doWeHaveFishingPoleEquipped()) and GetMoney() >= 23 then

				local target = "Harn Longcast"
				local x, y, z = -2158.6000976563, -392.94799804688, -3.0308721065521;
				local myX, myY, myZ = PlayerPosition();
				if GetDistance3D(myX, myY, myZ, x, y, z) > 3 then
					grind2MoveToTarget:run(Player(), x, y, z);
				else
					if not PlayerHasTarget() then
						TargetByName(target);
					elseif PlayerHasTarget() then
						if GetTarget():GetUnitName() ~= target then
							ClearTarget();
						end
					end

					if PlayerHasTarget() and not IsMoving() then
						if not IsVendorWindowOpen() and not HasItem("Fishing Pole") then
							SkipGossip();
							if GetTarget():UnitInteract() then
								return true;
							end
						elseif GetTimeEX() > self.timer then				
							BuyItem("Fishing Pole", 1);
							self.timer = GetTimeEX() + 5000;
						end
					end
				end
			elseif distanceToFish > 2 then
				grind2MoveToTarget:run(Player(), fishX, fishY, fishZ);
			end
		return;
		end
	elseif self.usedFisher then
		-- turn item link from game into a useable text string
		local itemLink = GetInventoryItemLink("player", 16)	-- 16 is main hand inventory slot... 17 is offhand
		if itemLink then
			local startPos, endPos = string.find(itemLink, "%[.+%]")
			if startPos and endPos then
				local itemName = string.sub(itemLink, startPos + 1, endPos - 1)
				if itemName ~= script_fish.weaponMainHand then
					if script_fish.weaponMainHand ~= "nil" then
						UseItem(script_fish.weaponMainHand);
					end
					if script_fish.offHandWeapon ~= "nil" then
						UseItem(script_fish.weaponOffHand)
					end
				end
			end
		end	

	self.usedFisher = false;
	end

-- if we have no quest and current quest in quester is nil then get a quest to check
	if (GetNumQuestLogEntries() == nil or GetNumQuestLogEntries() == 0 or _quest.currentQuest == nil) and not _quest.noQuestsToRun then
		runOgasai:runQuester();
		return;
	end

	if (GetNumQuestLogEntries() == nil or GetNumQuestLogEntries() == 0 or _quest.currentQuest == nil) and _quest.noQuestsToRun then
		runOgasai:runGrinder();
		return;
	end

--check continent ID and compare with levels when switching zones
-- bot likes to reload when swithcing zones, but that can be somewhat dealt with
-- by allowing the bot to start unpaused and check our zone, quests, and level.
-- move accordingly


	


-- no quests after level 20 currently - force run grinder
	--if PlayerLevel() >= 20 then
	--	DEFAULT_CHAT_FRAME:AddMessage(" ");
	--	DEFAULT_CHAT_FRAME:AddMessage("No quests at this level - running grinder.");
	--	DEFAULT_CHAT_FRAME:AddMessage(" ");
	--	self.manuallyRunGrinder = true;
	--end

--[[


-- the quester automatically starts the quest sequence when you enter a new area
-- need to figure out pathing here
-- for example, a level 10 cow shouldn't be in eastern kingdoms. if it is, we used the zeppelin



-- this is a little confusing....
-- local 'quest' is the quester script current quest
-- while self.currentquest is our transition quests in this script table
-- if we have a trasisition quest then we have a current quest
-- transition quests will be where paths need to be ran AND they start / end the sequence


PLAYER LEVEL 10 - 20

--]]


	if PlayerLevel() >= 10 then

		-- why does this need to be 2 for it to not return anything?
		-- add more entries...
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

		-- we have transition quest and level 10 is not reached, run grinder
		if quest == self.currentQuest then

			if not self.usedVendor then
				script_vendor.status = 1;
				self.usedVendor = true;
			end

			self.usedVendor2 = false;

			runOgasai:runGrinder();
		end

		-- run quester until transtion quest is reached
		if quest ~= self.currentQuest then
			if not self.usedVendor2 then
				script_vendor.status = 1;
				self.usedVendor2 = false;
			end

			self.usedVendor = false;

			runOgasai:runQuester();
		end
	end




--[[

PLAYER LEVEL 6 - 10

--]]


	-- run transition quests heading to new area
	if PlayerLevel() >= 6 and PlayerLevel() < 10 then

		for i = 0, 5 do
			if quest == self.quests.leaveStarterZoneQuests[i] then
				self.currentQuest = self.quests.leaveStarterZoneQuests[i]
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

		-- no quest found run grinder
		if _questDB.curListQuest == nil then
			runOgasai:runGrinder();
			return;
		end
			
		-- we have transition quest and level 6 is not reached, run grinder
		if quest == self.currentQuest and PlayerLevel() < 6 then

			if not self.usedVendor then
				script_vendor.status = 1;
				self.usedVendor = true;
			end

			self.usedVendor2 = false;

			runOgasai:runGrinder();
		end

		-- run quester if we have the right quest and level is greater than 6
		if quest == self.currentQuest and PlayerLevel() >= 6 then

			if not self.usedVendor then
				script_vendor.status = 1;
				self.usedVendor = true;
			end

			self.usedVendor2 = false;

			runOgasai:runQuester();
		end

		-- if our quest is not the quest to leave zone 1, then run quester
		if quest ~= self.currentQuest then
			if not self.usedVendor2 then
				script_vendor.status = 1;
				self.usedVendor2 = false;
			end

			runOgasai:checkHearthstoneStartAreas()

			self.usedVendor = false;

			runOgasai:runQuester();
		end

--[[

PLAYER LEVEL LESS THAN 6

--]]

	-- if player level is less than 6 and we have the end quest for the starter area then run the griner until level 6 is reached
	elseif PlayerLevel() < 6 then

		-- get our current quest to check from table
			-- check to leave starter zone table entry 6 by description - 2 quests of the same name
		if quest == self.quests.leaveStarterZoneQuests[6].name then
			if questDesc == self.quests.leaveStarterZoneQuests[6].desc then
				self.currentQuest = self.quests.leaveStarterZoneQuests[6].name;
			end
		end

		-- get our current quest to check from table
			-- check to leave starter zone
		for i = 0, 5 do
			if quest == self.quests.leaveStarterZoneQuests[i] then
				self.currentQuest = self.quests.leaveStarterZoneQuests[i]
				break;
			end
		end

		-- no quest found run grinder
		if _questDB.curListQuest == nil then
			runOgasai:runGrinder();
			return;
		end

		-- we have quest to leave starter zones, but not high enough level yet, run grinder
		if quest == self.currentQuest then

			if not self.usedVendor then
				script_vendor.status = 1;
				self.usedVendor = true;
			end

			self.usedVendor2 = false;

			runOgasai:runGrinder();
		end

		-- player level is less than 6 so run the quester in the starter area
		if quest ~= self.currentQuest then

			runOgasai:checkHearthstoneStartAreas();

			self.usedVendor = false;

			runOgasai:runQuester();
		end	

			
	end
end

function runOgasai:checkHearthstoneStartAreas()
	for i = 1, 6 do
		if _quest.currentQuest == self.quests.starterHearthstoneQuests[i] and not IsInCombat() and not IsCasting() and not IsChanneling() then
			if _quest.isQuestComplete then
				for u = 0, 4 do 
					for t = 0, GetContainerNumSlots(u) do 
						if (GetContainerItemLink(u,t) ~= nil) then
							_,_,itemLink=string.find(GetContainerItemLink(u,t),"(item:%d+)");
							itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType,
							itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemLink);
							if (itemName == "Hearthstone") then
								GetContainerItemLink(u,t)
								if (GetContainerItemCooldown(u, t) == 0) then
									if IsMoving() then
										StopMoving();
									return true;
									end
									if not IsMoving() then
										if UseItem('Hearthstone') then
											runOgasai.waitTimer = GetTimeEX() + 20000;
											return true;
										end
									end
								end
							end
						end
					end 
				end
						
			end
		end
	end
return false;
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
