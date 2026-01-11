grind2PreChecks2 = {

	jumpTimer = 0,
}

function grind2PreChecks2:run()

-- random jump
	if IsMoving() then

		local random = math.random(-100, 100);
		local randomTimer = math.random(1500, 6500);

		-- added random to slow it down
		-- if randomTimer + old jump timer > current time then jump
		if random >= 99 and GetTimeEX() > self.jumpTimer + randomTimer then

			JumpOrAscendStart();

			-- reset jump timer
			self.jumpTimer = GetTimeEX();
		end
	end


end