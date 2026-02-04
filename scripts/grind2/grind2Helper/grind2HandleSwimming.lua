grind2HandleSwimming = {

	timer = 0,

	breathTimeLeft = 0,

	timerSet = false,
}

-- this does not work...
-- jumping counts as moving and not swimming when you jumping
-- intent was to jump until not swimming...
-- but jumping = not swimming
function grind2HandleSwimming:run()

	if self.timer == 0 or self.timer == nil then

		self.timer = GetTimeEX();
	end

	if self.timer > GetTimeEX() then
		return;
	end

	if not IsSwimming() and IsMoving() then
	
		self.breathTimeLeft = GetTimeEX() * 2;

		self.timerSet = false;
		end

	if IsSwimming() and not self.timerSet then
		
		self.breathTimeLeft = GetTimeEX() + 6000;

		self.timerSet = true;
	end

	if GetTimeEX() >= self.breathTimeLeft and IsSwimming() and self.timerSet then
	
		JumpOrAscendStart();

		self.breathTimeLeft = GetTimeEX() + 1200;

		self.timer = GetTimeEX() + 1200;

	end

		

return false;
end