vendorDB_30_40 = {}

function vendorDB_30_40:setup()

	--- (name, faction, continentID, mapID, canRepair, hasFood, hasWater, hasArrow, hasBullet, posX, posY, posZ, race)

-- Arathi Highlands - Horde
	vendorDB:addVendor("Mu'uta", 1, 0, 45, true, false, false, false, false, -933.85, -3477.47, 51.3);
	vendorDB:addVendor("Mu'uta", 1, 0, 45, false, false, false, false, false, -933.85, -3477.47, 51.3);
	vendorDB:addVendor("Mu'uta", 1, 0, 45, false, false, false, true, false, -933.85, -3477.47, 51.3);
	vendorDB:addVendor("Innkeeper Adegwa", 1, 0, 45, false, false, true, false, false, -912.38, -3524.92, 72.68);
	vendorDB:addVendor("Innkeeper Adegwa", 1, 0, 45, false, true, false, false, false, -912.38, -3524.92, 72.68);
	vendorDB:addVendor("Graud", 1, 0, 45, false, false, false, false, true, -910.29, -3534.86, 72.72);

-- Thousand Needles Shimmering Flats - Horde
	vendorDB:addVendor("Riznek", 1, 1, 400, false, false, false, false, false, -6204.33, -3955.97, -58.75);
	vendorDB:addVendor("Riznek", 1, 1, 400, false, false, true, false, false, -6204.33, -3955.97, -58.75);
	vendorDB:addVendor("Synge", 1, 1, 400, true, false, false, false, false, -6225.51, -3970.79, -58.75);
	vendorDB:addVendor("Synge", 1, 1, 400, false, false, false, false, false, -6225.51, -3970.79, -58.75);
	vendorDB:addVendor("Synge", 1, 1, 400, false, false, false, false, true, -6225.51, -3970.79, -58.75);

-- Thousand Needles Shimmering Flats - Alliance
	vendorDB:addVendor("Riznek", 0, 1, 400, false, false, false, false, false, -6204.33, -3955.97, -58.75);
	vendorDB:addVendor("Riznek", 0, 1, 400, false, false, true, false, false, -6204.33, -3955.97, -58.75);
	vendorDB:addVendor("Synge", 0, 1, 400, true, false, false, false, false, -6225.51, -3970.79, -58.75);
	vendorDB:addVendor("Synge", 0, 1, 400, false, false, false, false, false, -6225.51, -3970.79, -58.75);
	vendorDB:addVendor("Synge", 0, 1, 400, false, false, false, false, true, -6225.51, -3970.79, -58.75);

-- Stranglethorn Vale - Horde
	vendorDB:addVendor("Jaquilina Dramet", 1, 0, 33, true, false, false, false, false, -11622.1, -60.62, 10.95);
	vendorDB:addVendor("Jaquilina Dramet", 1, 0, 33, false, false, false, false, false, -11622.1, -60.62, 10.95);

-- Desolace - Alliance
	vendorDB:addVendor("Christi Galvanis", 0, 1, 405, false, false, false, false, false, 243.01, 1238.58, 192.15);
	vendorDB:addVendor("Christi Galvanis", 0, 1, 405, false, false, true, false, false, 243.01, 1238.58, 192.15);
	vendorDB:addVendor("Maxton Strang", 0, 1, 405, true, false, false, false, false, 202.83, 1179.18, 167.99);
	vendorDB:addVendor("Maxton Strang", 0, 1, 405, false, false, false, false, false, 202.83, 1179.18, 167.99);

end
