grind2SaveCoordinates = {

	numberOfLocations = 0,

	savedLocations = {},

	currentLocationToMove = 0

}

function grind2SaveCoordinates:saveTargetsLocation(target)

	local x, y, z = target:GetPosition();

	local saveLocation = true;

	-- don't use if we are walking to vendor

	if (self.numberOfLocations > 0) and x ~= nil and script_vendor.status < 1 then

		for i = 0, self.numberOfLocations -1 do

			local distanceToLastSave = math.sqrt((x - self.savedLocations[i]['x']) ^ 2 + (y - self.savedLocations[i]['y']) ^ 2);

			if (distanceToLastSave <= 40) or not grind2HotSpot.hotSpotReached then

				saveLocation = false;
			end
		end
	end

	if saveLocation and script_vendor.status < 1 then

		self.savedLocations[self.numberOfLocations] = {};
		self.savedLocations[self.numberOfLocations]['x'] = x;
		self.savedLocations[self.numberOfLocations]['y'] = y;
		self.savedLocations[self.numberOfLocations]['z'] = z;
		self.numberOfLocations = self.numberOfLocations + 1;
		self.currentLocationToMove = self.currentLocationToMove + 1;
	end
end

function grind2SaveCoordinates:moveToSavedLocation()

	local player = GetLocalPlayer();

	local x, y, z = player:GetPosition();

	if self.timer == 0 or self.timer == nil then
		self.timer = GetTimeEX();
	end

	if self.timer > GetTimeEX() then
		return;
	end

	if self.savedLocations[self.currentLocationToMove-1] ~= nil then

		local distanceToNextLocation = math.sqrt((x - self.savedLocations[self.currentLocationToMove-1]['x']) ^ 2 + (y - self.savedLocations[self.currentLocationToMove-1]['y']) ^ 2);

		if distanceToNextLocation ~= nil and distanceToNextLocation ~= 0 then
			if distanceToNextLocation <= 10 and self.currentLocationToMove > 1 then
				-- reverse
					self.currentLocationToMove = self.currentLocationToMove - 1;
			end
		end

		if self.currentLocationToMove <= 1 then
			self.currentLocationToMove = self.numberOfLocations;
		end
		
		if grind2MoveToTarget:run(GetLocalPlayer(), grind2SaveCoordinates.savedLocations[grind2SaveCoordinates.currentLocationToMove-1]['x'], grind2SaveCoordinates.savedLocations[grind2SaveCoordinates.currentLocationToMove-1]['y'], grind2SaveCoordinates.savedLocations[grind2SaveCoordinates.currentLocationToMove-1]['z']) then
			self.timer = GetTimeEX() + 100;
			return true;
		end
	end

return false;
end
