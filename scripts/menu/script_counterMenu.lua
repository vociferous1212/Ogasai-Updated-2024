script_counterMenu = {

}

function script_counterMenu:menu()

	Separator();

	-- show text since last reload
	Text("Counters Since Last Reload - "); SameLine(); Text(" | "); SameLine(); wasClicked, script_grind.useFirstAid = Checkbox("Auto FirstAid", script_grind.useFirstAid);

		-- counter is grindEX script counter
		local lastReloadDeathCounter = script_grindEX.deathCounter;

		-- show text death counter
		Text("Deaths : " ..lastReloadDeathCounter);

		-- count is grind script counter
		local monsterKillCount = script_grind.monsterKillCount;

		-- show text monster kill count
		Text("Monster Kills : " ..monsterKillCount);


	-- get money amount
	
		-- get copper amount
		local moneyObtainedCount = script_grind.moneyObtainedCount;

		-- get silver amount from copper
		local moneyObtainedCountSilver = math.floor(moneyObtainedCount / 100);

		-- get gold amount from copper
		local moneyObtainedCountGold = math.floor(moneyObtainedCount / 10000);

		-- silver from copper when we have gold
		local test = (moneyObtainedCount - moneyObtainedCountSilver * 100);

		-- copper from gold when we have gold??
		local test2 = (moneyObtainedCount - moneyObtainedCountSilver) / 100;
		
	
		-- less than 100 copper
		if (moneyObtainedCount < 100) then

			-- show copper only
			Text("Money Obtained : " ..moneyObtainedCount.. " Copper");

		-- more than 100 copper but less than 10000 copper
		elseif (moneyObtainedCount > 100) and (moneyObtainedCount < 10000) then

			-- show silver and copper
			Text("Money Obtained : " ..moneyObtainedCountSilver .. " Silver " ..test.. " Copper");

		-- more than 1000 copper then we have 1 gold!
		elseif (moneyObtainedCount >= 1000) then

			-- show gold and silver
			Text("Money Obtained : " ..moneyObtainedCountGold.. " Gold " ..test2.. " Silver");
		end

		-- counter is grind script counter
		local paranoiaCounter = script_grind.paranoiaCounter
		
		-- show paranoia counter
		Text("Paranoia Used : " ..paranoiaCounter);



-- show pick pocket money obtained
		-- get copper amount
		local money = script_rogue.pickpocketMoney;

		-- get silver amount from copper
		local moneySilver = math.floor(money / 100);

		-- get gold amount from copper
		local moneyGold = math.floor(money / 10000);

		-- silver from copper when we have gold
		local ppTest = (money - moneySilver * 100);

		-- copper from gold when we have gold??
	
		if (HasSpell("Stealth") and script_rogue.useStealth) then
			-- less than 100 copper
			if (money < 100) then
	
				-- show copper only
				Text("Money Obtained PickPocketing : " ..money.. " Copper");
	
			-- more than 100 copper but less than 10000 copper
			elseif (money > 100) and (money < 10000) then
	
				-- show silver and copper
				Text("Money Obtained PickPocketing : " ..moneySilver .. " Silver " ..ppTest.. " Copper");
	
			-- more than 1000 copper then we have 1 gold!
			elseif (money >= 1000) then
	
				-- show gold and silver
				Text("Money Obtained PickPocketing : " ..moneyGold.. " Gold " ..ppTest.. " Silver");
			end
		end
end