grind2CheckUnstuck = {

	useUnstuck = true,

	unstuckTimer = GetTimeEX()

}

function grind2CheckUnstuck:run()

	-- check intial unstuck
	if not grind2.pause and self.useUnstuck and GetTimeEX() > self.unstuckTimer then

		if grind2Unstuck:checkUnstuck() then

			self.unstuckTimer = GetTimeEX() + 250;
		end
	end

	-- our position must be changing and we must still be stuck so try another unstuck
	-- use unstuck feature
	if self.useUnstuck and IsMoving() and not grind2.pause and GetTimeEX() > self.unstuckTimer then

		if not grind2Unstuck:pathClearAuto(2) then

			self.unstuckTimer = GetTimeEX() + 350;

			grind2Unstuck:unstuck();
		end
	end

return false;
end