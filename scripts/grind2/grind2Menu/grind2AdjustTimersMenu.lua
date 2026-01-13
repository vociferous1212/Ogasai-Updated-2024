grind2AdjustTimersMenu = {

	doLootTimer = 900,

	faceTargetTimer = 120,

	obtainNewTargetTimer = 450,

	waitAfterTargetKilledTimer = 550,

	restTimer = 550,

	combatScriptTimer = 200

}

-- show adjust timers menu
function grind2AdjustTimersMenu:run()

	if CollapsingHeader("Adjust Script Timers Menu") then

		Text("		ADJUST SCRIPTS TIMERS AND SPEED");
		Text("		Miliseconds - 1000ms = 1 second")

		if Button("Set All Timers To Zero") then
			grind2AdjustTimersMenu:setTimersToZero();
		end

		Separator();

		Text("Loot Timer");
		self.doLootTimer = SliderInt("Loot Timer", 0, 2000, self.doLootTimer);

		Separator();

		Text("Face Target Timer");
		self.faceTargetTimer = SliderInt("Face Target Timer", 0, 2000, self.faceTargetTimer);

		Separator();

		Text("New Target Timer");
		self.obtainNewTargetTimer = SliderInt("New Target Timer", 0, 2000, self.obtainNewTargetTimer);

		Separator();

		Text("Wait After Target Killed Timer");
		self.waitAfterTargetKilledTimer = SliderInt("Target Killed Timer", 0, 2000, self.waitAfterTargetKilledTimer);
		
		Separator();

		Text("Rest Timer");
		self.restTimer = SliderInt("Rest Timer", 0, 2000, self.restTimer);

		Separator();

		Text("Combat Script Timer - How fast combat script reacts");
		self.combatScriptTimer = SliderInt("Combat Script Timer", 0, 2000, self.combatScriptTimer);
	end
end

function grind2AdjustTimersMenu:setTimersToZero()

	grind2.scriptSpeed = 0;

	self.doLootTimer = 0;

	self.faceTargetTimer = 0;

	self.obtainNewTargetTimer = 0;

	self.waitAfterTargetKilledTimer = 0;

	self.restTimer = 0;

	self.combatScriptTimer = 0;
end