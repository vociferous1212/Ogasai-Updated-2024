_questMenuEX = {}


function _questMenuEX:menu()



	wasClicked, _questMenu.showDBInfo = Checkbox("Show All Quests", _questMenu.showDBInfo);

	if _questMenu.showDBInfo then

		EndWindow()

		if NewWindow("Quest Info", 320, 320) then

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
					for i=0, _questDB.numQuests -1 do
						if _questDB.questList[i]['mapID'] == 85 then
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
								compl = "Yes";
							else
								compl = "No";
							end
							Text(num.." - Complete - "..compl.." - "..faction.." | "..name.." | Level "..min.." - "..max.." | Type - "..type); Separator();

						end
					end
				end
				if CollapsingHeader(">>> |+| Dun Morogh") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i=0, _questDB.numQuests -1 do
						if _questDB.questList[i]['mapID'] == 1 then
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
								compl = "Yes";
							else
								compl = "No";
							end
							Text(num.." - Complete - "..compl.." - "..faction.." | "..name.." | Level "..min.." - "..max.." | Type - "..type); Separator();

						end
					end
				end
				if CollapsingHeader(">>> |+| Elywnn Forest") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i=0, _questDB.numQuests -1 do
						if _questDB.questList[i]['mapID'] == 12 then
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
								compl = "Yes";
							else
								compl = "No";
							end
							Text(num.." - Complete - "..compl.." - "..faction.." | "..name.." | Level "..min.." - "..max.." | Type - "..type); Separator();

						end
					end
				end

				if CollapsingHeader(">>> |+| Silverpine Forest") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i=0, _questDB.numQuests -1 do
						if _questDB.questList[i]['mapID'] == 130 then
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
								compl = "Yes";
							else
								compl = "No";
							end
							Text(num.." - Complete - "..compl.." - "..faction.." | "..name.." | Level "..min.." - "..max.." | Type - "..type); Separator();

						end
					end
				end




			end -- end eastern kingdoms

			if CollapsingHeader("Kalimdor") then

				if CollapsingHeader(">>> |+| Teldrassil") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i=0, _questDB.numQuests -1 do
						if _questDB.questList[i]['mapID'] == 141 then
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
								compl = "Yes";
							else
								compl = "No";
							end
							Text(num.." - Complete - "..compl.." - "..faction.." | "..name.." | Level "..min.." - "..max.." | Type - "..type); Separator();

						end
					end
				end

				if CollapsingHeader(">>> |+| Mulgore") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i=0, _questDB.numQuests -1 do
						if _questDB.questList[i]['mapID'] == 215 then
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
								compl = "Yes";
							else
								compl = "No";
							end
							Text(num.." - Complete - "..compl.." - "..faction.." | "..name.." | Level "..min.." - "..max.." | Type - "..type); Separator();
						end
					end
				end
				if CollapsingHeader(">>> |+| Durotar") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i=0, _questDB.numQuests -1 do
						if _questDB.questList[i]['mapID'] == 14 then
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
								compl = "Yes";
							else
								compl = "No";
							end
							Text(num.." - Complete - "..compl.." - "..faction.." | "..name.." | Level "..min.." - "..max.." | Type - "..type); Separator();
						end
					end
				end
				if CollapsingHeader(">>> |+| The Barrens") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i=0, _questDB.numQuests -1 do
						if _questDB.questList[i]['mapID'] == 17 then
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
								compl = "Yes";
							else
								compl = "No";
							end
							Text(num.." - Complete - "..compl.." - "..faction.." | "..name.." | Level "..min.." - "..max.." | Type - "..type); Separator();
						end
					end
				end





			end
		end
	end
end