grind2Paranoia = {

	timer = 0,

	paranoidSetTime = 30,	-- 30 seconds until paranoia triggers

	paranoidTime = 0,

	paranoidRange = 200,

	paranoidTimerSet = false,

	paranoidTargetGUID = nil,

	paranoidTarget = nil,

	paranoidTargetName = "",

	paranoidTargetDistance = 0,

}

function grind2Paranoia:checkAndDoParanoia()

	local currentTime = GetTimeEX();

	if grind2Paranoia:checkForPlayersNearby() then

		-- we have a target
		if self.paranoidTargetGUID ~= nil and self.paranoidTargetGUID ~= 0 then

			if not self.paranoidTimerSet then

				self.paranoidTime = currentTime;

				self.paranoidTimerSet = true;
			end

			-- someone around, run bot normal speed - less than paranoid set time
			if currentTime < (self.paranoidSetTime * 1000) + self.paranoidTime then

				grind2Paranoia:setSpeedNormal();
				
			end

			-- someone around for too long, run bot slower - more than paranoid set time
			if currentTime > (self.paranoidSetTime * 1000) + self.paranoidTime then

				grind2Paranoia:setSpeedSlow()

			end

			-- someone around for waaaay too long, logout...
			if not IsInCombat() and currentTime > (self.paranoidSetTime * 4000) + self.paranoidTime then
			
				Logout();

				StopBot();

				return true;

			end

			-- someone around for too long, pause
			if not IsInCombat() and currentTime > (self.paranoidSetTime * 1000 * 2) + self.paranoidTime then

				return true;

			end
		end
	else

		if not grind2Menu.adjustScriptSpeed then
			grind2Paranoia:setSpeedFast();
		end

		-- reset variables
		self.paranoidTargetGUID = nil;
		self.paranoidTarget = nil;
		self.paranoidTimerSet = false;
		self.paranoidTargetName = "";
		self.paranoidTargetDistance = 0;
		self.paranoidTime = GetTimeEX() * 2;

	end

return false;
end

function grind2Paranoia:checkForPlayersNearby()

	local i, t = GetFirstObject();

	while i ~= 0 do

		if t == 4 then

			if i:GetDistance() <= self.paranoidRange and i:GetGUID() ~= nil and i:GetGUID() ~= 0 and i:GetGUID() ~= GetLocalPlayer():GetGUID() then

				self.paranoidTargetGUID = i:GetGUID();

				self.paranoidTarget = i;

				self.paranoidTargetName = i:GetUnitName();

				self.paranoidTargetDistance = i:GetDistance();

				return true;
			end
		end
	i, t = GetNextObject(i);
	end

	-- reset variables
	self.paranoidTargetGUID = nil;
	self.paranoidTarget = nil;
	self.paranoidTimerSet = false;
	self.paranoidTargetName = "";
	self.paranoidTargetDistance = 0;
	self.paranoidTime = GetTimeEX() * 2;

return false;
end

function grind2Paranoia:setSpeedNormal()

	grind2AdjustTimersMenu.doLootTimer = 650;

	grind2AdjustTimersMenu.obtainNewTargetTimer = 1550;

	grind2AdjustTimersMenu.waitAfterTargetKilledTimer = 550;

	grind2AdjustTimersMenu.restTimer = 550;

	grind2AdjustTimersMenu.combatScriptTimer = 200;

	grind2.scriptSpeed = 100;


end

function grind2Paranoia:setSpeedFast()

	grind2AdjustTimersMenu.doLootTimer = 150;

	grind2AdjustTimersMenu.obtainNewTargetTimer = 150;

	grind2AdjustTimersMenu.waitAfterTargetKilledTimer = 250;

	grind2AdjustTimersMenu.restTimer = 250;

	grind2AdjustTimersMenu.combatScriptTimer = 150;

	grind2.scriptSpeed = 75;

end

function grind2Paranoia:setSpeedSlow()

	grind2AdjustTimersMenu.doLootTimer = 900;

	grind2AdjustTimersMenu.obtainNewTargetTimer = 3000;

	grind2AdjustTimersMenu.waitAfterTargetKilledTimer = 2750;

	grind2AdjustTimersMenu.restTimer = 1700;

	grind2AdjustTimersMenu.combatScriptTimer = 450;

	grind2.scriptSpeed = 750;

end
