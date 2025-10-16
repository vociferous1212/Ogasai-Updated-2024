vendorDB_40_50 = {}

function vendorDB_40_50:setup()

	--- (name, faction, continentID, mapID, canRepair, hasFood, hasWater, hasArrow, hasBullet, posX, posY, posZ, race)

	-- feralas alliance next to thousand needles
	vendorDB:addVendor("Rendow", 0, 1, 357, true, false, false, false, false, -4491.61, -768.04, -36.72);
	vendorDB:addVendor("Rendow", 0, 1, 357, false, false, false, false, false, -4491.61, -768.04, -36.72);


	-- feralas alliance feathermoon stronghold
	vendorDB:addVendor("Dulciea Frostmoon", 0, 1, 357, true, false, false, false, false, -4365.9, 3302, 13.55);
	vendorDB:addVendor("Dulciea Frostmoon", 0, 1, 357, false, false, false, false, false, -4365.9, 3302, 13.55);
	vendorDB:addVendor("Mardrack Greenwell", 0, 1, 357, false, true, false, false, false, -4364.44, 3284.21, 13.55);
	vendorDB:addVendor("Mardrack Greenwell", 0, 1, 357, false, false, true, false, false, -4364.44, 3284.21, 13.55);
	vendorDB:addVendor("Faralorn", 0, 1, 357, false, false, false, true, false, -4379.03, 3311.83, 13.55);
	vendorDB:addVendor("Faralorn", 0, 1, 357, false, false, false, false, true, -4379.03, 3311.83, 13.55);

	-- ferelas horde camp mojache
	vendorDB:addVendor("Worb Strongstitch", 1, 1, 357, true, false, false, false, false, -4339.65, 249.37, 26.31);
	vendorDB:addVendor("Worb Strongstitch", 1, 1, 357, false, false, false, false, false, -4339.65, 249.37, 26.31);
	vendorDB:addVendor("Innkeeper Greul", 1, 1, 357, false, true, false, false, false, -4460.11, 242.72, 39.1);
	vendorDB:addVendor("Innkeeper Greul", 1, 1, 357, false, false, true, false, false, -4460.11, 242.72, 39.1);
	vendorDB:addVendor("Loorana", 1, 1, 357, false, true, false, false, false, -4400.11, 194.32, 26.42);
	vendorDB:addVendor("Loorana", 1, 1, 357, false, false, true, false, false, -4400.11, 194.32, 26.42);

	-- hinterlands alliance
	vendorDB:addVendor("Truk Wildbeard", 0, 0, 47, false, false, false, false, false, 380.8, -2128.06, 121);
	vendorDB:addVendor("Truk Wildbeard", 0, 0, 47, false, true, false, false, false, 380.8, -2128.06, 121);
	vendorDB:addVendor("Truk Wildbeard", 0, 0, 47, false, false, true, false, false, 380.8, -2128.06, 121);
	vendorDB:addVendor("Harggan", 0, 0, 47, true, false, false, false, false, 333.7, -2091.52, 131.56);

	-- tanaris both

vendorDB:addVendor("Jabbey", 0, 1, 440, false, false, false, false, false, -6886.48, -4842.28, 8.53);
vendorDB:addVendor("Jabbey", 0, 1, 440, false, false, true, false, false, -6886.48, -4842.28, 8.53);
vendorDB:addVendor("Jabbey", 0, 1, 440, false, false, false, true, false, -6886.48, -4842.28, 8.53);
vendorDB:addVendor("Jabbey", 0, 1, 440, false, false, false, false, true, -6886.48, -4842.28, 8.53);


	
end
