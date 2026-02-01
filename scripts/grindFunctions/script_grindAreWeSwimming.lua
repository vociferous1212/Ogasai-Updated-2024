script_grindAreWeSwimming = {}

-- fall back check to see if we are swimming or not. it works better this way, similar to cone of cold spell requiring its own function to run
function script_grindAreWeSwimming:areWeSwimming()

	if (GetLocalPlayer():GetHealthPercentage() >= 1) and (not GetLocalPlayer():IsDead()) then

		if (IsSwimming()) then

			return true;
		end
	end
return false;
end