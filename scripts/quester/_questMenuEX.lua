_questMenuEX = {

	questToRunByIndex = -1,


}


function _questMenuEX:menu()

	wasClicked, _questMenu.showDBInfo = Checkbox("Show All Quests", _questMenu.showDBInfo);

	if _questMenu.showDBInfo then

		EndWindow()

		if NewWindow("Quest Info", 320, 320) then

			if Button("Reset Quest Index") then
				self.questToRunByIndex = -1;
			end

			Text("Run button not working yet... grind spot / quest giver coords complication?")
			Text("	* Not all of these have been tested! *");
			Text("	* Ordered by number to complete *")

			local x, y, z = GetLocalPlayer():GetPosition();

			if not _questDB.isSetup then
				_questDB:setup();
			end
			
			local wasClicked = false;
			if CollapsingHeader("Eastern Kingdoms") then
				if CollapsingHeader(">>> |+| Tirisfal Glades") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 85 then
							if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();

						end
					end
				end
				if CollapsingHeader(">>> |+| Dun Morogh") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 1 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();

						end
					end
				end
				if CollapsingHeader(">>> |+| Elwynn Forest") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 12 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();

						end
					end
				end
				if CollapsingHeader(">>> |+| Westfall") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 40 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();

						end
					end
				end
				if CollapsingHeader(">>> |+| Loch Modan") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 38 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();

						end
					end
				end
				if CollapsingHeader(">>> |+| Silverpine Forest") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 130 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();

						end
					end
				end
				
				if CollapsingHeader(">>> |+| Redridge Mountains") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 44 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();

						end
					end
				end


				if CollapsingHeader(">>> |+| Duskwood") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 10 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();

						end
					end
				end

				if CollapsingHeader(">>> |+| Hillsbrad Foothills") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 267 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();

						end
					end
				end

				if CollapsingHeader(">>> |+| Stranglethorn Vale") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 33 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();

						end
					end
				end

				if CollapsingHeader(">>> |+| Searing Gorge") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 51 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();
						end
					end
				end


			end -- end eastern kingdoms






			if CollapsingHeader("Kalimdor") then

				if CollapsingHeader(">>> |+| Teldrassil") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 141 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();
						end
					end
				end
				if CollapsingHeader(">>> |+| Mulgore") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 215 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();
						end
					end
				end
				if CollapsingHeader(">>> |+| Durotar") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 14 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();
						end
					end
				end
				if CollapsingHeader(">>> |+| The Barrens") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 17 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();
						end
					end
				end
				if CollapsingHeader(">>> |+| Darkshore") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 148 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();
						end
					end
				end
				if CollapsingHeader(">>> |+| Stonetalon Mountains") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 406 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();
						end
					end
				end
				if CollapsingHeader(">>> |+| Thousand Needles") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 400 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();
						end
					end
				end
				if CollapsingHeader(">>> |+| Tanaris") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 440 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction'];
							local faction = "";
							local type = _questDB.questList[i]['type'];
							if factiontemp == 0 then
								faction = "Alliance";
							else
								faction = "Horde";
							end
							name = _questDB.questList[i]['questName'];
							local min = _questDB.questList[i]['minLevel'];
							local max = _questDB.questList[i]['maxLevel'];
							local compltemp = _questDB.questList[i]['completed'];
							if compltemp == "nnil" then
								compl = "Completed";
							else
								compl = "Not Complete";
							end
							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();
						end
					end
				end
				if CollapsingHeader(">>> |+| Un'Goro Crater") then
					local num = 0
					local minlevel = 0
					local maxlevel = 0

					for i = _questDB.numQuests - 1, 0, -1 do
						if _questDB.questList[i]['mapID'] == 490 then
						if Button("Run ".. i) then self.questToRunByIndex = i;
								_questDB.curListQuest = _questDB.questList[i]['questName'];
								_quest.currentQuest = _questDB.questList[i]['questName']
								_quest.currentType = _questDB.questList[i]['type'];
								_quest.usingItem = _questDB.questList[i]['useItem'];
								_quest.gossipOption = _questDB.questList[i]['gossipOption'];
								_quest.currentMapID = _questDB.questList[i]['mapID'];
							end
							SameLine();
							num = num + 1
							local factiontemp = _questDB.questList[i]['faction']
							local faction = ""
							local type = _questDB.questList[i]['type']

							if factiontemp == 0 then
								faction = "Alliance"
							else
								faction = "Horde"
							end

							name = _questDB.questList[i]['questName']
							local min = _questDB.questList[i]['minLevel']
							local max = _questDB.questList[i]['maxLevel']
							local compltemp = _questDB.questList[i]['completed']

							if compltemp == "nnil" then
								compl = "Yes"
							else
								compl = "No"
							end

							local space = " ";
							if num < 10 then
								space = " "; elseif num > 100 then space = "  ";
							end
							Text(num..space..compl.." - "..faction.." | "..name.." | Type - "..type); Separator();
						end
					end
				end
			end --end of kalimdor
	


			Separator();


			Text("			Completed Quests")
			Text("__________________________________________________________")
			for i = 0, _questDB.numQuests - 1 do
				if _questDB.questList[i]['completed'] == "nnil" then
					Text("Completed - " .._questDB.questList[i]['questName'].. " || Index "..i);
				end
			end

		end --end of new window
	end
end