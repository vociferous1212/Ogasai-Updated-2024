script_grindCheckSpentTalentPoints = {}

-- check for talent points already spent and adjust combat scripts on setup/loading
-- call during setup of combat scripts
function script_grindCheckSpentTalentPoints:checkSpentTalentPoints()

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

					script_druid.maulRage = script_druid.maulRage - currRank;

					script_druid.clawEnergy = script_druid.clawEnergy - currRank;

					script_druid.rakeEnergy = script_druid.rakeEnergy - currRank;

				end
			end

-- priest
			-- priest shadow reach spell range

			if level >= 20 and class == "PRIEST" then
			
				if nameTalen == "Shadow Reach" then
					
					script_priest.spellRange = script_priest.spellRange + (currRank * 2);

				end
			end

-- shaman

-- paladin

-- warlock

-- warrior
			
		end
	end
end