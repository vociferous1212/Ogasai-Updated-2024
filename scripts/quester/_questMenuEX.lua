_questMenuEX = {

	questToRunByIndex = -1,

	startAtQuestIndexNum = -1,

	menuStyle1 = true,

	menuStyle2 = false,


}


function _questMenuEX:menu()

	wasClicked, _questMenu.showDBInfo = Checkbox("Show All Quests", _questMenu.showDBInfo);

	if _questMenu.showDBInfo then

		EndWindow()

		if NewWindow("Quest Info", 320, 320) then

			if PlayerLevel() <= 6 then
				Text("Quest givers in starter areas levels 1-6 are missing server-side function arugments.");
				Text("Cannot reliably auto-complete these quests in order if quest order is disturbed!");
				Text("Coded specific options to select each quest different from the rest.")
				Text(" ");
				Separator();
			end

			if _quest.currentQuest ~= nil then
				Text("[ Current Quest ] - ".._quest.currentQuest.." - [ Index ID ] : ".._questDB.currentIndex);
			elseif _questDB.curListQuest ~= nil and _questDB.currentIndex >= 0 then
				local x, y, z = PlayerPosition();
				local dist = math.floor(GetDistance3D(x, y, z, _questDB.questList[_questDB.currentIndex]['pos']['x'],  _questDB.questList[_questDB.currentIndex]['pos']['y'],  _questDB.questList[_questDB.currentIndex]['pos']['z']));
				Text("[ Quest To Obtain ] - ".._questDB.curListQuest.." - " .. dist .. " (yds) - [ Index ID ] : ".._questDB.currentIndex);
			end
			Separator();

			if not _quest.weHaveQuest then
				Text(" ");
				Text("Auto Complete Quest In DB Timer - ");
				local removeQuestEntryTime = math.floor((_questAcceptQuest.noQuestTimer - GetTimeEX()) / 1000);
				SameLine();
				Text(removeQuestEntryTime.." seconds")
			end

			if Button("Reset Quest Index") then
				self.questToRunByIndex = -1;
				self.startAtQuestIndexNum = -1;
				_questDB.curListQuest = 0
				_quest.currentQuest = nil
				_quest.currentDesc = nil
				_questDB.curDesc = nil
				_quest.currentMapID = nil
								
				
				_questDB:getQuestStartPos()

			end

			if self.startAtQuestIndexNum < 100 then
				Text("[ Start Quest Index ] "..self.startAtQuestIndexNum.." ");
			else
				Text("[ Start Quest Index ] "..self.startAtQuestIndexNum);
			end

			SameLine();
			self.startAtQuestIndexNum = SliderInt("", -1, _questDB.numQuests -1, self.startAtQuestIndexNum);

			if self.startAtQuestIndexNum ~= -1 then
				if Button("Start At Quest Index") then
					self.questToRunByIndex = self.startAtQuestIndexNum;
					_questDB:getQuestStartPos()
					self.startAtQuestIndexNum = -1;
				end
			else
				Separator();
			end

			if self.startAtQuestIndexNum ~= -1 and self.startAtQuestIndexNum ~= nil then
				SameLine();
				Text("[ Quest Name ] - ".._questDB.questList[self.startAtQuestIndexNum]['questName'])
				Separator();
			end


			Text("	* Not all of these have been tested! *");
			Text("	* Ordered by number to complete *")

			Separator();

			wasClicked, self.menuStyle1 = Checkbox("[ Compact Menu Style ]", self.menuStyle1);

			if not self.menuStyle1 then
				self.menuStyle2 = true;
			end
			if not self.menuStyle2 then
				self.menuStyle1 = true;
			end

			local x, y, z = GetLocalPlayer():GetPosition();

			if not _questDB.isSetup then
				_questDB:setup();
			end
			
			local wasClicked = false;

			if CollapsingHeader("Eastern Kingdoms") then

				if CollapsingHeader(">>> |+| Tirisfal Glades") then
					_questMenuEX:drawZoneByID(85)
				end

				if CollapsingHeader(">>> |+| Dun Morogh") then
					_questMenuEX:drawZoneByID(1)
				end

				if CollapsingHeader(">>> |+| Elwynn Forest") then
					_questMenuEX:drawZoneByID(12)
				end

				if CollapsingHeader(">>> |+| Westfall") then
					_questMenuEX:drawZoneByID(40)
				end

				if CollapsingHeader(">>> |+| Loch Modan") then
					_questMenuEX:drawZoneByID(38)
				end

				if CollapsingHeader(">>> |+| Silverpine Forest") then
					_questMenuEX:drawZoneByID(130)
				end

				if CollapsingHeader(">>> |+| Redridge Mountains") then
					_questMenuEX:drawZoneByID(44)
				end

				if CollapsingHeader(">>> |+| Duskwood") then
					_questMenuEX:drawZoneByID(10)
				end

				if CollapsingHeader(">>> |+| Hillsbrad Foothills") then
					_questMenuEX:drawZoneByID(267)
				end

				if CollapsingHeader(">>> |+| Wetlands") then
					_questMenuEX:drawZoneByID(11)
				end

				if CollapsingHeader(">>> |+| Alterac Mountains") then
					_questMenuEX:drawZoneByID(36)
				end

				if CollapsingHeader(">>> |+| Arathi Highlands") then
					_questMenuEX:drawZoneByID(45)
				end

				if CollapsingHeader(">>> |+| Stranglethorn Vale") then
					_questMenuEX:drawZoneByID(33)
				end

				if CollapsingHeader(">>> |+| Swamp of Sorrows") then
					_questMenuEX:drawZoneByID(8)
				end

				if CollapsingHeader(">>> |+| Badlands") then
					_questMenuEX:drawZoneByID(3)
				end

				if CollapsingHeader(">>> |+| Searing Gorge") then
					_questMenuEX:drawZoneByID(51)
				end

				if CollapsingHeader(">>> |+| Burning Steppes") then
					_questMenuEX:drawZoneByID(46)
				end

				if CollapsingHeader(">>> |+| Blasted Lands") then
					_questMenuEX:drawZoneByID(4)
				end

				if CollapsingHeader(">>> |+| Deadwind Pass") then
					_questMenuEX:drawZoneByID(41)
				end

				if CollapsingHeader(">>> |+| Eastern Plaguelands") then
					_questMenuEX:drawZoneByID(23)
				end

				if CollapsingHeader(">>> |+| Western Plaguelands") then
					_questMenuEX:drawZoneByID(22)
				end


			end -- end eastern kingdoms






			if CollapsingHeader("Kalimdor") then

				if CollapsingHeader(">>> |+| Teldrassil") then
					_questMenuEX:drawZoneByID(141)
				end

				if CollapsingHeader(">>> |+| Mulgore") then
					_questMenuEX:drawZoneByID(215)
				end

				if CollapsingHeader(">>> |+| Durotar") then
					_questMenuEX:drawZoneByID(14)
				end

				if CollapsingHeader(">>> |+| Darkshore") then
					_questMenuEX:drawZoneByID(148)
				end

				if CollapsingHeader(">>> |+| The Barrens") then
					_questMenuEX:drawZoneByID(17)
				end

				if CollapsingHeader(">>> |+| Stonetalon Mountains") then
					_questMenuEX:drawZoneByID(406)
				end

				if CollapsingHeader(">>> |+| Ashenvale") then
					_questMenuEX:drawZoneByID(331)
				end

				if CollapsingHeader(">>> |+| Thousand Needles") then
					_questMenuEX:drawZoneByID(400)
				end

				if CollapsingHeader(">>> |+| Desolace") then
					_questMenuEX:drawZoneByID(405)
				end

				if CollapsingHeader(">>> |+| Dustwallow Marsh") then
					_questMenuEX:drawZoneByID(15)
				end

				if CollapsingHeader(">>> |+| Feralas") then
					_questMenuEX:drawZoneByID(357)
				end

				if CollapsingHeader(">>> |+| Tanaris") then
					_questMenuEX:drawZoneByID(440)
				end

				if CollapsingHeader(">>> |+| Azshara") then
					_questMenuEX:drawZoneByID(16)
				end

				if CollapsingHeader(">>> |+| Felwood") then
					_questMenuEX:drawZoneByID(361)
				end

				if CollapsingHeader(">>> |+| Un'Goro Crater") then
					_questMenuEX:drawZoneByID(490)
				end

				if CollapsingHeader(">>> |+| Silithus") then
					_questMenuEX:drawZoneByID(1377)
				end

				if CollapsingHeader(">>> |+| Moonglade") then
					_questMenuEX:drawZoneByID(493)
				end

				if CollapsingHeader(">>> |+| Winterspring") then
					_questMenuEX:drawZoneByID(618)
				end


			end --end of kalimdor
	


			Separator();


			Text("			Completed Quests")
			Text("__________________________________________________________")
			local num = 1
			for i = _questDB.numQuests - 1, 0, -1 do
				if _questDB.questList[i]['completed'] == "nnil" then
					Text(num.." " .._questDB.questList[i]['questName'].. " || Index "..i);
					num = num + 1;
				end
			end

		end --end of new window
	end
end

-- Reusable function that draws all quests for a given mapID
function _questMenuEX:drawZoneByID(mapID)
	local num = 0

	for i = _questDB.numQuests - 1, 0, -1 do
		local quest = _questDB.questList[i]

		if quest['mapID'] == mapID then

			if Button("Run " .. i) then
				self.questToRunByIndex = i
				_questDB.curListQuest = quest['questName']
				_quest.currentQuest = quest['questName']
				_quest.currentType = quest['type']
				_quest.usingItem = quest['useItem']
				_quest.gossipOption = quest['gossipOption']
				_quest.currentMapID = quest['mapID']
				_quest.currentDesc = quest['desc']
				_questDB.curDesc = quest['desc']
			end

			SameLine()
			num = num + 1

			local faction = (quest['faction'] == 0) and "Alliance" or "Horde"
			local compl = (quest['completed'] == "nnil") and "Completed" or "Not Complete"
			local x, y, z = PlayerPosition();
			local dist = math.floor(GetDistance3D(x, y, z, quest['pos']['x'], quest['pos']['y'], quest['pos']['z']));

			local space = " "
			if num < 10 then
				space = " "
			elseif num > 100 then
				space = "  "
			end

			local space2 = "";
			if quest['completed'] == "nnil" then
				space2 = "   ";
			end

			if self.menuStyle1 then
				Text(
					num .. space ..
					compl .. " - " ..
					space2 ..
					faction ..
					" | Type - " .. quest['type'] ..
					" | " ..
					quest['questName'] .. " " ..
					dist .. " (yds)"
				)
				Separator();
			elseif self.menuStyle2 then
				Text(
					num .. space ..
					compl .. " - " ..
					faction ..
					" | Type - " .. quest['type'] ..
					" | " ..
					quest['questName'] ..
					" | " .. dist .. " (yds) \n "
				)
				Separator();
				Text("" .. quest['desc'])
				Text(" ")
				Separator()
			end
		end
	end
end


-- Your UI stays clean and readable:
if CollapsingHeader(">>> |+| Tirisfal Glades") then
	DrawQuestListForMap(85)
end

if CollapsingHeader(">>> |+| Dun Morogh") then
	DrawQuestListForMap(1)
end

if CollapsingHeader(">>> |+| Elwynn Forest") then
	DrawQuestListForMap(12)
end
