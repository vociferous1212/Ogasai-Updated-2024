grind2CheckSpentTalentPoints = {



}


-- check for talent points already spent and adjust combat scripts on setup/loading
-- call during setup of combat scripts


function grind2CheckSpentTalentPoints:checkSpentTalentPoints()

	-- tried to do this in tables and by simply adding + 2 (or 3) to each spell range but the bot didn't like it
	-- old fashioned if else then all the way

	local player = GetLocalPlayer();
	local level = player:GetLevel();
	local class = GetMyClass();

	-- get number of talent tabs
	local numTabs = GetNumTalentTabs();

	-- for each talent tab
	for t=1, numTabs do

		-- get number of talents
	    local numTalents = GetNumTalents(t);

		-- for each number of talents
	    for i=1, numTalents do

			-- get the talent info
		    nameTalent, icon, tier, column, currRank, maxRank = GetTalentInfo(t,i);
    		
-- hunter

			-- set hunter combat script attack range
			if level >= 20 and class == "HUNTER" then

				-- hawk eye talent in marksmanship tree
				if nameTalent == "Hawk Eye" then
					if currRank == 1 then
						script_hunter.spellRange = 37;
					elseif currRank == 2 then
						script_hunter.spellRange = 39;
					elseif currRank == 3 then
						script_hunter.spellRange = 41;
					end
				end
			end
			
-- mage
			-- set mage combat script attack range
			if level >= 20 and class == "MAGE" then

				-- frost mage 
				if nameTalent == "Arctic Reach" then
					if currRank == 1 then
						script_mage.spellRange = 33;
					elseif currRank == 2 then 
						script_mage.spellRange = 36;
					end

				-- fire mage
				elseif nameTalent == "Flame Throwing" then
					if currRank == 1 then
						script_mage.spellRange = 33;
					elseif currRank == 2 then
						script_mage.spellRange = 35;

					end
				end
			end
		
-- rogue
			-- set rogue sinister strike energy cost
			if level >= 10 and class == "ROGUE" then

				if nameTalent == "Improved Sinister Strike" then
					if currRank == 1 then
						script_rogue.cpGeneratorCost = 43;
					elseif currRank == 2 then
						script_rogue.cpGeneratorCost = 40;
					end
				end
			end
		
-- druid
			-- set druid maul/claw/rake
			if level >= 10 and class == "DRUID" then

				if nameTalent == "Ferocity" then
					if currRank == 1 then
						script_druid.maulRage = 14;
						script_druid.clawEnergy = 44;
						script_druid.rakeEnergy = 39;
					elseif currRank == 2 then
						script_druid.maulRage = 13;
						script_druid.clawEnergy = 43;
						script_druid.rakeEnergy = 38;
					elseif currRank == 3 then
						script_druid.maulRage = 12;
						script_druid.clawEnergy = 42;
						script_druid.rakeEnergy = 37;
					elseif currRank == 4 then
						script_druid.maulRage = 11;
						script_druid.clawEnergy = 41;
						script_druid.rakeEnergy = 36;
					elseif currRank == 5 then
						script_druid.maulRage = 10;
						script_druid.clawEnergy = 40;
						script_druid.rakeEnergy = 35;
						if IsIdolOfFerocityEquipped() then
							script_druid.clawEnergy = 37;
							script_druid.rakeEnergy = 32;
						end
					end
				end
			end

-- priest
			-- priest shadow reach spell range

			if level >= 20 and class == "PRIEST" then
			
				if nameTalent == "Shadow Reach" then
					script_priest.spellRange = script_priest.spellRange;
				end
			end

-- shaman

			if level >= 10 and class == "SHAMAN" then
				if nameTalent == "" then
					if currRank == 1 then
					end
				end
			end

-- paladin

			if level >= 10 and class == "PALADIN" then
				if nameTalent == "" then
					if currRank == 1 then
					end
				end
			end

-- warlock

			if level >= 10 and class == "WARLOCK" then
				if nameTalent == "Destrucive Reach" then
					if currRank == 1 then
					end
				end
			end

-- warrior

			if level >= 10 and class == "WARRIOR" then

				if nameTalent == "Improved Heroic Strike" then
					if currRank == 1 then
						script_warrior.heroicStrikeRage = 14;
					elseif currRank == 2 then
						script_warrior.heroicStrikeRage = 13;
					elseif currRank == 3 then
						script_warrior.heroicStrikeRage = 12;
					end
				end
				if nameTalent == "Improved Thunderclap" then
					if currRank == 1 then
						script_warrior.thunderclapRage = 19;
					elseif currRank == 2 then
						script_warrior.thunderclapRage = 18;
					elseif currRank == 3 then
						script_warrior.thunderclapRage = 17;
					end
				end
				if nameTalent == "Improved Execute" then
					if currRank == 1 then
						script_warrior.executeRage = 13;
					elseif currRank == 2 then
						script_warrior.executeRage = 11;
					end
				end
				if nameTalent == "Improved Sunder Armor" then
					if currRank == 1 then
						script_warrior.sunderArmorRage = 14;
					elseif currRank == 2 then
						script_warrior.sunderArmorRage = 13;
					elseif currRank == 3 then
						script_warrior.sunderArmorRage = 12;
					end
				end
			end
		end
	end
end