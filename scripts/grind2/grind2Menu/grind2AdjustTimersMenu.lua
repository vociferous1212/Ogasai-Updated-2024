grind2AdjustTimersMenu = {

	doLootTimer = 650,

	faceTargetTimer = 750,

	obtainNewTargetTimer = 1550,

	waitAfterTargetKilledTimer = 550,

	restTimer = 550,

	combatScriptTimer = 200,

	blacklistLootTime = 30,

}

-- show adjust timers menu
function grind2AdjustTimersMenu:run()

-- show current script speed
	local speed = "Player Adjusted";
	if grind2.scriptSpeed == 250 then
		speed = "Normal";
	elseif grind2.scriptSpeed == 100 then
		speed = " Fast";
	elseif grind2.scriptSpeed == 750 then
		speed = "Slow";
	end

	Text("Paranoia - Current Script Speed == "..speed);

-- show paranoia texts
	if grind2.useParanoia and not grind2.pause then
		if grind2Paranoia.paranoidTargetGUID ~= nil and grind2Paranoia.paranoidTargetGUID ~= 0 then
			if grind2Paranoia.paranoidTargetName ~= nil then
				if grind2Paranoia.paranoidTargetDistance ~= nil and grind2Paranoia.paranoidTargetDistance ~= 0 then
					-- for some reason bot is randomly closing when trying to display this data?
					local name = grind2Paranoia.paranoidTargetName;
					local distance = grind2Paranoia.paranoidTargetDistance;
					Text("Player in range - "..name.." | "..math.floor(distance).." (yd)");
					Text("Timer - "..math.floor((GetTimeEX() - grind2Paranoia.paranoidTime) + grind2Paranoia.paranoidSetTime) / 1000);
				end
			end
		end
	end


-- set speed fast button
	if Button("Set Speed Fast") then	
		grind2Paranoia:setSpeedFast();
		grind2Menu.scriptSpeedWasAdjusted = true;
	end

-- set speed normal button
	SameLine();
		if Button("Set Speed Normal") then
		grind2Paranoia:setSpeedNormal();
		grind2Menu.scriptSpeedWasAdjusted = true;
	end

-- set speed slow button
	SameLine();
	if Button("Set Speed Slow") then

		grind2Paranoia:setSpeedSlow();
		grind2Menu.scriptSpeedWasAdjusted = true;
	end

-- set timers to zero
	SameLine();
	if Button("Set All Timers To Zero") then
		grind2AdjustTimersMenu:setTimersToZero();
		DEFAULT_CHAT_FRAME:AddMessage("All timers set to 0. Timers left are necessary to allow server-to-client updates to prevent disconnects and bugs.")
	end
	Separator();


-- adjust script speed
	wasClicked, grind2Menu.adjustScriptSpeed = Checkbox("Manually Adjust Bot Speed / Reaction Time", grind2Menu.adjustScriptSpeed);

	if grind2Menu.adjustScriptSpeed then

		Text("Grind script speed (miliseconds) - How fast the bot reacts");

		Text("Normal human speed is 250ms between actions")

		grind2.scriptSpeed = SliderInt(" (ms) Script Speed", 0, 1000, grind2.scriptSpeed);


		if CollapsingHeader("Adjust Script Timers Menu") then

			Text("		ADJUST SCRIPTS TIMERS AND SPEED");
			Text("		Miliseconds - 1000ms = 1 second")

			Separator();

			Text("Loot Timer");
			self.doLootTimer = SliderInt("Loot Timer", 0, 3000, self.doLootTimer);

			Separator();

			Text("Face Target Timer");
			self.faceTargetTimer = SliderInt("Face Target Timer", 0, 2000, self.faceTargetTimer);

			Separator();

			Text("New Target Timer");
			self.obtainNewTargetTimer = SliderInt("New Target Timer", 0, 3000, self.obtainNewTargetTimer);

			Separator();

			Text("Wait After Target Killed Timer");
			self.waitAfterTargetKilledTimer = SliderInt("Target Killed Timer", 0, 3000, self.waitAfterTargetKilledTimer);
		
			Separator();

			Text("Rest Timer");
			self.restTimer = SliderInt("Rest Timer", 0, 3000, self.restTimer);

			Separator();

			Text("Combat Script Timer - How fast combat script reacts");
			self.combatScriptTimer = SliderInt("Combat Script Timer", 0, 2000, self.combatScriptTimer);

			Text("Blacklist Loot Time - Seconds")
			self.blacklistLootTime = SliderInt("Blacklist Loot Timer", 0, 45, self.blacklistLootTime);
		end
	end
end

function grind2AdjustTimersMenu:setTimersToZero()

	grind2.scriptSpeed = 0;

	self.doLootTimer = 0;

	--self.faceTargetTimer = 0;

	self.obtainNewTargetTimer = 0;

	self.waitAfterTargetKilledTimer = 0;

	self.restTimer = 0;

	self.combatScriptTimer = 0;
end