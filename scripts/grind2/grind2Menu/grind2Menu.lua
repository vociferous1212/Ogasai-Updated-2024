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

			if Button("Pause") then

				grind2.pause = true;
			end
		else

			if Button("Resume") then

				grind2.pause = false;
			end
		end

		SameLine();

		if Button("Reload") then

			if coremenu:reload() then

				coremenu:reload();
			end

			self.isSetup = false;
		end

		SameLine();

		if Button("Exit") then

			StopBot();
		end
	end

-- combat menu script
	grind2ShowCombatMenu:run();

-- nav menu script
	grind2NavMenu:run();

	-- target menu script
	grind2TargetMenu:run();

-- display options menu script
	grind2DisplayOptions:run();

	
	Separator();

	-- empty space / new line
	Text("");

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
