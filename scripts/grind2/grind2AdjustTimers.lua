grind2AdjustTimers = {

	doLootTimer = 500,

	faceTargetTimer = 200,

	obtainNewTargetTimer = 750,

	waitAfterTargetKilledTimer = 850,

	restTimer = 350,

}

function grind2AdjustTimers:run()

	if CollapsingHeader("Adjust Script Timers") then

		Text("		ADJUST SCRIPTS TIMERS AND SPEED");

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
	end
end