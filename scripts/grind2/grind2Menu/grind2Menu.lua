grind2Menu = {

	isSetup = false,

	adjustScriptSpeed = false,

	}


function grind2Menu:setup()

	if not self.isSetup then

		script_shaman:setup();		script_druid:setup();		script_mage:setup();
		script_warlock:setup();		script_priest:setup();		script_paladin:setup();
		script_warrior:setup();		script_rogue:setup();		script_warlock2:setup();
	end

	self.isSetup = true;
end



function grind2Menu:run()

-- setup class scripts
	if not self.isSetup then

		grind2Menu:setup();

		return;
	end

-- show rested exp if we have any
	if GetXPExhaustion() ~= nil then
	
		-- exp bubbles count
		local expBubbles = math.ceil(20 * GetXPExhaustion() / UnitXPMax("player"));

		-- if we have 30 bubbles / max rested exp
		if expBubbles == 30 then

			Text('Rested Exp: MAX - '..expBubbles.. ' bubbles');
		else

			-- show reamining bubbles
			Text('Rested Exp: '..GetXPExhaustion()..' - '..expBubbles.. ' bubbles');
		end
	end

-- get navmesh load progress
	local navProgress = math.floor(GetLoadNavmeshProgress()*100);

	-- only show bot menu when navmesh has completed loading
	if navProgress == 100 then

-- resume / pause / reload buttons
		if not grind2.pause then

			if Button("  Stop  ") then

				grind2.pause = true;
			end
		else

			if Button(" Resume ") then

				grind2.pause = false;
			end
		end

		SameLine();

		if Button(" Reload ") then

			if coremenu:reload() then

				coremenu:reload();
			end

			self.isSetup = false;
		end

		SameLine();

		if Button("  Exit  ") then

			StopBot();
		end
		
		SameLine();

		-- show exp / hour
		Text("| "..script_expChecker:calculateXPPerHour().." EXP/hour");

		SameLine();

		if Button("Reset EXP") then
			script_expChecker.initialXP = UnitXP("player");
			script_expChecker.startTime = GetTimeEX() / 1000;
			script_expChecker.lastXPPerHour = 0;
			script_expChecker.lastTimeToLevel = "N/A";
			script_expChecker.lastLevel = GetLocalPlayer():GetLevel();
		end
	else
		Text("		LOADING		");
	end

-- combat menu script
	grind2ShowCombatMenu:run();

-- miscellanous Menu
	grind2MiscMenu:run();


-- nav menu script
	grind2NavMenu:run();

	SameLine();


	Text("			| "..grind2MoveToTarget.message);

-- target menu script
	grind2TargetMenu:run();

	SameLine();

	if grind2.enemyTarget == nil or grind2.enemyTarget == 0 then
		Text("				| No Target...");

	else
		Text("				| "..grind2.enemyTarget:GetUnitName().." "..math.floor(grind2.enemyTarget:GetDistance()).." (yd)");
	end

-- gather menu script
	script_gatherMenu:menu();

	SameLine();

	if script_gather.nodeObj ~= nil and script_gather.nodeObj ~= 0 then
		Text("				| "..script_gather.nodeObj:GetUnitName());
	else
		Text("				| No Object...")
	end

-- vendor menu script
	if CollapsingHeader("Vendor Menu") then

		wasClicked, grind2.useVendor = Checkbox("Use Vendoring", grind2.useVendor);
		Separator();

		if grind2.useVendor then

			script_vendorMenu:menu();
		end

	end

	SameLine();

	Text("				| "..script_vendor.message);

-- display options menu script
	grind2DrawDataMenu:run();

-- temporary counter menu
	--script_counterMenu:menu();

	Text("");

	Separator();

	Text("Enemy Kills  | "..grind2.numberOfKills);

	-- count your money
	if grind2.totalGainedMoney < 100 then

		Text("Money Gained | "..grind2.totalGainedMoney.." copper");
	elseif grind2.totalGainedMoney >= 100 and grind2.totalGainedMoney < 10000 then

		Text("Money Gained | "..grind2MoneyCounter:silverFromCopper().." silver "..grind2MoneyCounter:copperFromSilver().." copper");
	elseif grind2.totalGainedMoney >= 10000 then
	
		Text("Money Gained | "..grind2MoneyCounter:goldFromCopper().." gold "..grind2MoneyCounter:silverFromGold().." silver ");
	end

	Text("________________________________________________________________________________________________________________________________________________________________________")
	wasClicked, self.adjustScriptSpeed = Checkbox("Adjust Bot Speed / Reaction Time", self.adjustScriptSpeed);

-- script speed
	if self.adjustScriptSpeed then

		Text("Grind script speed (miliseconds) - How fast the bot reacts");

		Text("Normal human speed is 250ms between actions")

		grind2.scriptSpeed = SliderInt(" (ms) Script Speed", 0, 1000, grind2.scriptSpeed);

-- adjust timers menu
		grind2AdjustTimersMenu:run()

	end

-- end of main menu function
end
