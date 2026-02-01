script_followDoVendor = {

	useVendor = true,
	sellVendor = 0,
}

-- call vendor sell function
function script_followDoVendor:sellStuff()

	if (script_vendor:sell()) then
		return true;
	end

return false;
end

-- are we close enough to vendor?
function script_followDoVendor:closeToVendor()

	local localObj = GetLocalPlayer();
	local x, y, z = localObj:GetPosition();
	local factionID = 1; -- horde
	local factionNr = GetFaction();

	-- set our faction
	if (factionNr == 1 or factionNr == 3 or factionNr == 4 or factionNr == 115) then
		factionID = 0; -- alliance
	end

	local vendor = nil;
	local vendorID = -1;

	-- if we have a valid vendor
	if (self.sellVendor ~= 0) then
		vendor = self.sellVendor;
	else

	-- else get a vendor from DB
		local vendorID = vendorDB:GetVendor(factionID, GetContinentID(), GetMapID(), false, false, false, false, false, x, y, z);
	
		-- we have a vendor
		if (vendorID ~= -1) then
			vendor = vendorDB:GetVendorByID(vendorID);
		else

		-- can't find vendor
			self.message = "No vendor found, see scripts\\VendorDB.lua...";
			return false;
		end
	end

	-- get party leader
	local leader = GetPartyLeaderObject();

	-- we have a valid vendor
	if (vendor ~= nil) and (leader ~= 0) then

		-- vendor distance
		local vX, vY, vZ = vendor['pos']['x'], vendor['pos']['y'], vendor['pos']['z'];
		
		-- leader distance
		local leadX, leadY, leadZ = leader:GetPosition();

		local distance = script_follow.followLeaderDistance;

	--and (leader:GetDistance() <= self.followLeaderDistance + 10)

		-- are we close enough to vendor to walk to it and sell?

		-- if we are close to vendor
		if (GetDistance3D(x, y, z, vX, vY, vZ) <= distance+10)

			-- and party leader is close to vendor
			and (GetDistance3D(leadX, leadY, leadZ, vX, vY, vZ) <= distance+10)

			-- and we are still within distance to party leader
			and (GetDistance3D(x, y, z, leadX, leadY, leadZ) <= distance+10) then

			-- we can vendor
			return true;
		end
	end

-- we aren't close enough to a vendor
return false;
end