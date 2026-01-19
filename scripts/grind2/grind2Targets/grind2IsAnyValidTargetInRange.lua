grind2IsAnyValidTargetInRange = {

}

function grind2IsAnyValidTargetInRange:run()

	-- there are no valid enemies when we are grinding and hotspot isn't reached...
	if grind2HotSpot.hotSpotReached then

		local i, t = GetFirstObject();

		while i ~= 0 do

			if t == 3 or t == 4 then

				if i:GetDistance() <= grind2.findTargetDistance and not i:IsDead() and not i:IsCritter() and i:CanAttack() then	

					if grind2IsTargetValid:target(i) then

						return true;
					end
				end
			end

		i, t = GetNextObject(i);
		end
	end

return false;
end