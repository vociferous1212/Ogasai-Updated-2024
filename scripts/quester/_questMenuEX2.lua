_questMenuEX2 = {}

function _questMenuEX2:menuEasternKingdom()

		if CollapsingHeader(">>> |+| Redridge Mountains") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i=0, _questDB.numQuests -1 do
						if _questDB.questList[i]['mapID'] == 44 then
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


	if CollapsingHeader(">>> |+| Duskwood") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i=0, _questDB.numQuests -1 do
						if _questDB.questList[i]['mapID'] == 10 then
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


	if CollapsingHeader(">>> |+| Stranglethorn Vale") then
					local num = 0;
					local minlevel = 0;
					local maxlevel = 0
					for i=0, _questDB.numQuests -1 do
						if _questDB.questList[i]['mapID'] == 33 then
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
