vendorDB_10_20 = {}

function vendorDB_10_20:setup()

	--- (name, faction, continentID, mapID, canRepair, hasFood, hasWater, hasArrow, hasBullet, posX, posY, posZ, race)

-- Darkshore - Alliance
	vendorDB:addVendor("Ullanna", 0, 1, 148, false, false, false, false, false, 4998.97, 72.87, 52.7);
	vendorDB:addVendor("Tiyani", 0, 1, 148, false, true, false, false, false, 4986.99, 80.03, 52.74);
	vendorDB:addVendor("Tiyani", 0, 1, 148, false, false, true, false, false, 4986.99, 80.03, 52.74);

-- Westfall - Alliance
	vendorDB:addVendor("Innkeeper Heather", 0, 0, 40, false, true, true, false, false, -10653.41, 1166.52, 34.46); -- drinks, fish
	vendorDB:addVendor("William MacGregor", 0, 0, 40, true, false, false, true, false, -10658.5, 996.85, 32.87); -- rep, arrows
	vendorDB:addVendor("Mike Miller", 0, 0, 40, false, true, false, false, false, -10653.3, 995.39, 32.87); -- bread
	vendorDB:addVendor("Farmer Saldean", 1, 0, 40, false, false, false, false, false, -10128.71, 1055.2, 36.25);
	vendorDB:addVendor("Farmer Saldean", 1, 0, 40, false, true, false, false, false, -10128.71, 1055.2, 36.25);
	vendorDB:addVendor("Farmer Saldean", 1, 0, 40, false, false, true, false, false, -10128.71, 1055.2, 36.25);
	vendorDB:addVendor("Innkeeper Heather", 1, 0, 40, false, true, false, false, false, -10653.3, 1166.43, 34.46);
	vendorDB:addVendor("Innkeeper Heather", 1, 0, 40, false, false, true, false, false, -10653.3, 1166.43, 34.46);
	vendorDB:addVendor("William MacGregor", 1, 0, 40, false, false, false, true, false, -10658.5, 996.85, 32.87);
	vendorDB:addVendor("William MacGregor", 1, 0, 40, true, false, false, false, false, -10658.5, 996.85, 32.87);
	vendorDB:addVendor("William MacGregor", 1, 0, 40, false, false, false, false, false, -10658.5, 996.85, 32.87);	

-- Silverpine Forest - Horde
	vendorDB:addVendor("Nadia Vernon", 1, 0, 130, true, false, false, false, false, 566.3, 1559.59, 132.51);
	vendorDB:addVendor("Nadia Vernon", 1, 0, 130, false, false, false, false, false, 566.3, 1559.59, 132.51);
	vendorDB:addVendor("Gwyn Farrow", 1, 0, 130, false, true, false, false, false, 553.08, 1600.14, 129.12);
	vendorDB:addVendor("Edwin Harly", 1, 0, 130, false, false, true, false, false, 549.58, 1602.98, 128.48);
	vendorDB:addVendor("Edwin Harly", 1, 0, 130, false, false, false, false, true, 549.58, 1602.98, 128.48);
	vendorDB:addVendor("Nadia Vernon", 1, 0, 130, false, false, false, true, false, 566.3, 1559.59, 132.51);

-- Barrens - Horde
	vendorDB:addVendor("Zlagk", 1, 1, 14, true, false, false, false, false, -560.13, -4217.21, 41.59);
	vendorDB:addVendor("Uthrok", 1, 1, 17, false, false, false, false, false, -351.19, -2556.52, 95.78);
	vendorDB:addVendor("Uthrok", 1, 1, 17, true, false, false, false, false, -351.19, -2556.52, 95.78);
	vendorDB:addVendor("Sanuye Runetotem", 1, 1, 17, true, false, false, false, false, -2374.27, -1948.8, 96.08);
	vendorDB:addVendor("Sanuye Runetotem", 1, 1, 17, false, false, false, false, false, -2374.27, -1948.8, 96.08);
	vendorDB:addVendor("Innkeeper Byula", 1, 1, 17, false, true, false, false, false, -2376.28, -1995.74, 96.7);
	vendorDB:addVendor("Innkeeper Byula", 1, 1, 17, false, false, true, false, false, -2376.28, -1995.74, 96.7);
	vendorDB:addVendor("Ironzar", 1, 1, 17, true, false, false, false, false, -919.62, -3683.77, 8.15);
	vendorDB:addVendor("Ironzar", 1, 1, 17, false, false, false, false, false, -919.62, -3683.77, 8.15);
	vendorDB:addVendor("Jazzik", 1, 1, 17, false, false, false, true, false, -1008.67, -3651.95, 20.06);
	vendorDB:addVendor("Jazzik", 1, 1, 17, false, false, false, false, true, -1008.67, -3651.95, 20.06);
	vendorDB:addVendor("Innkeeper Wiley", 1, 1, 17, false, false, true, false, false, -1050.05, -3664.81, 23.88);
	vendorDB:addVendor("Innkeeper Wiley", 1, 1, 17, false, true, false, false, false, -1050.05, -3664.81, 23.88);

-- Barrens - Alliance
	vendorDB:addVendor("Ironzar", 0, 1, 17, true, false, false, false, false, -919.62, -3683.77, 8.15);
	vendorDB:addVendor("Ironzar", 0, 1, 17, false, false, false, false, false, -919.62, -3683.77, 8.15);
	vendorDB:addVendor("Jazzik", 0, 1, 17, false, false, false, true, false, -1008.67, -3651.95, 20.06);
	vendorDB:addVendor("Jazzik", 0, 1, 17, false, false, false, false, true, -1008.67, -3651.95, 20.06);
	vendorDB:addVendor("Innkeeper Wiley", 0, 1, 17, false, false, true, false, false, -1050.05, -3664.81, 23.88);
	vendorDB:addVendor("Innkeeper Wiley", 0, 1, 17, false, true, false, false, false, -1050.05, -3664.81, 23.88);

-- Stonetalon - Horde
	vendorDB:addVendor("Innkeeper Jayka", 1, 1, 406, false, false, true, false, false, 893.65, 927.94, 106.25);
	vendorDB:addVendor("Innkeeper Jayka", 1, 1, 406, false, true, false, false, false, 893.65, 927.94, 106.25);
	vendorDB:addVendor("Borand", 1, 1, 406, true, false, false, false, false, 992.18, 1030.95, 105.58);
	vendorDB:addVendor("Borand", 1, 1, 406, false, false, false, false, false, 992.18, 1030.95, 105.58);
	vendorDB:addVendor("Borand", 1, 1, 406, false, false, false, true, false, 992.18, 1030.95, 105.58);
	vendorDB:addVendor("Denni'ka", 1, 1, 406, false, false, false, false, false, -188.43, -347.65, 8.79);
	vendorDB:addVendor("Denni'ka", 1, 1, 406, false, true, false, false, false, -188.43, -347.65, 8.79);

-- Loch Modan - Alliance
	vendorDB:addVendor("Morhan Coppertongue", 0, 0, 38, true, false, false, false, false, -5343.69, -2932.13, 324.36);
	vendorDB:addVendor("Morhan Coppertongue", 0, 0, 38, false, false, false, false, false, -5343.69, -2932.13, 324.36);
	vendorDB:addVendor("Innkeeper Hearthstove", 0, 0, 38, false, true, false, false, false, -5377.92, -2973.91, 323.16);
	vendorDB:addVendor("Innkeeper Hearthstove", 0, 0, 38, false, false, true, false, false, -5377.92, -2973.91, 323.16);
	vendorDB:addVendor("Yanni Stoutheart", 0, 0, 38, false, false, false, true, false, -5381.88, -2952.48, 322.06);
	vendorDB:addVendor("Yanni Stoutheart", 0, 0, 38, false, false, false, false, true, -5381.88, -2952.48, 322.06);
	vendorDB:addVendor("Vrok Blunderblast", 0, 0, 38, false, false, false, false, true, -5286.92, -2981.99, 341.79);
	vendorDB:addVendor("Vrok Blunderblast", 0, 0, 38, true, false, false, false, false, -5286.92, -2981.99, 341.79);
	vendorDB:addVendor("Vrok Blunderblast", 0, 0, 38, false, false, false, false, false, -5286.92, -2981.99, 341.79);
	vendorDB:addVendor("Aldren Cordon", 0, 0, 38, false, false, false, false, false, -5702.53, -3781.8, 322.81);
	vendorDB:addVendor("Aldren Cordon", 0, 0, 38, true, false, false, false, false, -5702.53, -3781.8, 322.81);
end
