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

	scriptAutoAdjustedSpeed = true,

}

function grind2Paranoia:checkAndDoParanoia()

	local currentTime = GetTimeEX();

		-- set speed fast if we are in combat about close to death... fuck it
		if grind2.scriptSpeed > 0 and not grind2Menu.adjustScriptSpeed then
			if self.scriptAutoAdjustedSpeed and (PlayerHealth() <= 30 or NumberTargetsAttackingPlayer() >= 2) then
				grind2Paranoia:setSpeedFast();
				return false;
			elseif self.scriptAutoAdjustedSpeed and PlayerHealth() > 30 then
				self.scriptAutoAdjustedSpeed = false;
			end
		end

	if grind2Paranoia:checkForPlayersNearby() then

		-- we have a target
		if self.paranoidTarget ~= nil and self.paranoidTarget ~= 0 then

			if script_buffOtherPlayers:doBuffs() then

				return true;
			end

			if not self.paranoidTimerSet then

				self.paranoidTime = currentTime;

				self.paranoidTimerSet = true;
			end
					

			-- someone around, run bot normal speed - less than paranoid set time
			if currentTime < (self.paranoidSetTime * 1000) + self.paranoidTime then

				grind2Paranoia:setSpeedNormal();
				self.scriptAutoAdjustedSpeed = true;
				
			end

			-- someone around for too long, run bot slower - more than paranoid set time
			if currentTime > (self.paranoidSetTime * 1000) + self.paranoidTime then

				grind2Paranoia:setSpeedSlow();
				self.scriptAutoAdjustedSpeed = true;

			end

			-- someone around for waaaay too long, logout...
			if not IsInCombat() and not IsLooting() and currentTime > (self.paranoidSetTime * 4000) + self.paranoidTime then

				if HasSpell("Shadowmeld") and not IsSpellOnCD("Shadowmeld") and not Player():HasBuff("Shadowmeld") and not Player():HasBuff("Stealth") and not HasForm() then
					if CastSpellByName("Shadowmeld") then
						return true;
					end
				end
			
				Logout();

				self.paranoidTime = GetTimeEX() + self.paranoidSetTime;

				StopBot();

				return true;

			end

			-- someone around for too long, pause
			if not IsInCombat() and not IsLooting() and currentTime > (self.paranoidSetTime * 3000) + self.paranoidTime then
			
				if HasSpell("Shadowmeld") and not IsSpellOnCD("Shadowmeld") and not Player():HasBuff("Shadowmeld") and not Player():HasBuff("Stealth") and not HasForm() then
					if CastSpellByName("Shadowmeld") then
						return true;
					end
				end

				if HasSpell("Stealth") and not IsSpellOnCD("Stealth") and not Player():HasBuff("Stealth") then
					if CastSpellByName("Stealth") then
						return true;
					end
				end

			return true;
			end
		end
	else

		-- if we don't want to adjust script speed and we haven't set all timers to zero already
		if not grind2Menu.adjustScriptSpeed and grind2.scriptSpeed > 0 then

			grind2Paranoia:setSpeedFast();

			-- reset variables
			self.paranoidTarget = nil;
			self.paranoidTargetGUID = nil;
			self.paranoidTimerSet = false;
			self.paranoidTargetName = nil;
			self.paranoidTargetDistance = 0;
			self.paranoidTime = GetTimeEX() * 2;
		end

	end

return false;
end

function grind2Paranoia:checkForPlayersNearby()

	local i, t = GetFirstObject();

	while i ~= 0 do

		if t == 4 then

			if i:GetDistance() <= self.paranoidRange and i:GetGUID() ~= GetLocalPlayer():GetGUID() then
			
				if i:GetGUID() ~= nil and i:GetGUID() ~= 0 then

					self.paranoidTarget = i;

					if self.paranoidTarget ~= nil then
						
						self.paranoidTargetGUID = i:GetGUID();
							
						self.paranoidTargetName = i:GetUnitName();

						self.paranoidTargetDistance = i:GetDistance();
					end
				end

				return true;
			end
		end

	i, t = GetNextObject(i);
	end

return false;
end

function grind2Paranoia:setSpeedNormal()

	grind2AdjustTimersMenu.doLootTimer = 650;

	grind2AdjustTimersMenu.obtainNewTargetTimer = 1750;

	grind2AdjustTimersMenu.waitAfterTargetKilledTimer = 550;

	grind2AdjustTimersMenu.restTimer = 2250;

	grind2AdjustTimersMenu.combatScriptTimer = 350;

	grind2.scriptSpeed = 250;


end

function grind2Paranoia:setSpeedFast()

	grind2AdjustTimersMenu.doLootTimer = 250;

	grind2AdjustTimersMenu.obtainNewTargetTimer = 1000;

	grind2AdjustTimersMenu.waitAfterTargetKilledTimer = 125;

	grind2AdjustTimersMenu.restTimer = 1550;

	grind2AdjustTimersMenu.combatScriptTimer = 50;

	grind2.scriptSpeed = 100;

end

function grind2Paranoia:setSpeedSlow()

	grind2AdjustTimersMenu.doLootTimer = 900;

	grind2AdjustTimersMenu.obtainNewTargetTimer = 3500;

	grind2AdjustTimersMenu.waitAfterTargetKilledTimer = 2750;

	grind2AdjustTimersMenu.restTimer = 3000;

	grind2AdjustTimersMenu.combatScriptTimer = 750;

	grind2.scriptSpeed = 750;

end
