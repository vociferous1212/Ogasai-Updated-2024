vendorDB_20_30 = {}

function vendorDB_20_30:setup()

	--- (name, faction, continentID, mapID, canRepair, hasFood, hasWater, hasArrow, hasBullet, posX, posY, posZ, race)

-- Ashenvale - Horde
	vendorDB:addVendor("Wik'Tar", 1, 1, 331, false, false, false, false, false, 3362.22, 1024.83, 2.87);
	vendorDB:addVendor("Burkrum", 1, 1, 331, true, false, false, false, false, 2354.76, -2540.69, 102.81);
	vendorDB:addVendor("Burkrum", 1, 1, 331, false, false, false, false, false, 2354.76, -2540.69, 102.81);
	vendorDB:addVendor("Innkeeper Kaylisk", 1, 1, 331, false, true, false, false, false, 2341.86, -2566.99, 102.77);
	vendorDB:addVendor("Innkeeper Kaylisk", 1, 1, 331, false, false, true, false, false, 2341.86, -2566.99, 102.77);

-- Ashenvale - Alliance
	vendorDB:addVendor("Xai'ander", 0, 1, 331, true, false, false, false, false, 2672.31, -363.61, 110.72);
	vendorDB:addVendor("Xai'ander", 0, 1, 331, false, false, false, false, false, 2672.31, -363.61, 110.72);
	vendorDB:addVendor("Haljan Oakheart", 0, 1, 331, false, false, false, false, true, 2717.69, -309.67, 110.72);
	vendorDB:addVendor("Haljan Oakheart", 0, 1, 331, false, false, false, true, false, 2717.69, -309.67, 110.72);
	vendorDB:addVendor("Maliynn", 0, 1, 331, false, true, false, false, false, 2751.84, -412.04, 111.45);
	vendorDB:addVendor("Maliynn", 0, 1, 331, false, false, true, false, false, 2751.84, -412.04, 111.45);

-- Hillsbrad Foothills - Horde
	vendorDB:addVendor("Ott", 1, 0, 267, false, false, false, false, false, -158.53, -867.18, 56.89);
	vendorDB:addVendor("Ott", 1, 0, 267, true, false, false, false, false, -158.53, -867.18, 56.89);
	vendorDB:addVendor("Innkeeper Shay", 1, 0, 267, false, true, false, false, false, -5.74, -942.02, 57.16);
	vendorDB:addVendor("Innkeeper Shay", 1, 0, 267, false, false, true, false, false, -5.74, -942.02, 57.16);


end
