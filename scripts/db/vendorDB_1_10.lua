vendorDB_1_10 = {}

function vendorDB_1_10:setup()

	--- (name, faction, continentID, mapID, canRepair, hasFood, hasWater, hasArrow, hasBullet, posX, posY, posZ, race)

	-- dun morogh
	vendorDB:addVendor("Rybrad Coldbank", 0, 0, 1, true, false, false, false, false, -6101.11, 390.56, 395.54);
	vendorDB:addVendor("Rybrad Coldbank", 0, 0, 1, false, false, false, false, false, -6101.11, 390.56, 395.54);
	vendorDB:addVendor("Adlin Pridedrift", 0, 0, 1, false, true, false, false, false, -6226.67, 320.05, 383.11);
	vendorDB:addVendor("Adlin Pridedrift", 0, 0, 1, false, false, true, false, false, -6226.67, 320.05, 383.11);
	vendorDB:addVendor("Adlin Pridedrift", 0, 0, 1, false, false, false, true, false, -6226.67, 320.05, 383.11);
	vendorDB:addVendor("Adlin Pridedrift", 0, 0, 1, false, false, false, false, true, -6226.67, 320.05, 383.11);
	vendorDB:addVendor("Kreg Bilmn", 0, 0, 1, false, false, false, true, false, -5597.67, -521.86, 399.65);
	vendorDB:addVendor("Kreg Bilmn", 0, 0, 1, false, false, false, false, true, -5597.67, -521.86, 399.65);
	vendorDB:addVendor("Kreg Bilmn", 0, 0, 1, false, true, false, false, false, -5597.67, -521.86, 399.65);
	vendorDB:addVendor("Kreg Bilmn", 0, 0, 1, false, false, true, false, false, -5597.67, -521.86, 399.65);
	vendorDB:addVendor("Grawn Thromwyn", 0, 0, 1, true, false, false, false, false, -5590.67, -428.42, 397.32);
	vendorDB:addVendor("Grawn Thromwyn", 0, 0, 1, false, false, false, false, false, -5590.67, -428.42, 397.32);
	vendorDB:addVendor("Frast Dokner", 0, 0, 1, true, false, false, false, false, -5712.23, -1596.21, 383.2);
	vendorDB:addVendor("Frast Dokner", 0, 0, 1, false, false, false, false, false, -5712.23, -1596.21, 383.2);
	vendorDB:addVendor("Kazan Mogosh", 0, 0, 1, false, true, false, false, false, -5665.09, -1567.93, 383.2);
	vendorDB:addVendor("Kazan Mogosh", 0, 0, 1, false, false, true, false, false, -5665.09, -1567.93, 383.2);

	-- Teldrassil
	vendorDB:addVendor("Keina", 0, 1, 141, true, false, false, false, false, 10436.7, 794.83, 1322.7);
	vendorDB:addVendor("Keina", 0, 1, 141, false, false, false, false, false, 10436.7, 794.83, 1322.7);
	vendorDB:addVendor("Dellylah", 0, 1, 141, false, true, false, false, false, 10450.2, 779.85, 1322.66);
	vendorDB:addVendor("Dellylah", 0, 1, 141, false, false, true, false, false, 10450.2, 779.85, 1322.66);
	vendorDB:addVendor("Keina", 0, 1, 141, false, false, false, true, false, 10436.7, 794.83, 1322.7);
	vendorDB:addVendor("Lyrai", 0, 1, 141, false, false, false, false, true, 10442.9, 783.98, 1337.28);
	vendorDB:addVendor("Meri Ironweave", 0, 1, 141, true, false, false, false, false, 9815.88, 948.6, 1308.76);
	vendorDB:addVendor("Meri Ironweave", 0, 1, 141, false, false, false, false, false, 9815.88, 948.6, 1308.76);
	vendorDB:addVendor("Innkeeper Keldamyr", 0, 1, 141, false, false, true, false, false, 9802.2, 982.6, 1313.89);
	vendorDB:addVendor("Innkeeper Keldamyr", 0, 1, 141, false, true, false, false, false, 9802.2, 982.6, 1313.89);
	vendorDB:addVendor("Jeena Featherbow", 0, 1, 141, false, false, false, true, false, 9821.98, 968.83, 1308.77);
	vendorDB:addVendor("Danlyia", 0, 1, 141, false, true, false, false, false, 9890.16, 994.67, 1313.83);
	vendorDB:addVendor("Danlyia", 0, 1, 141, false, false, true, false, false, 9890.16, 994.67, 1313.83);
	vendorDB:addVendor("Aldia", 0, 1, 141, false, false, false, false, true, 9891.87, 988.3, 1327.56);

	-- Elwynn Forest	
	vendorDB:addVendor("Brother Danil", 0, 0, 12, false, false, false, false, true, -8901.59, -112.72, 81.85);
	vendorDB:addVendor("Brother Danil", 0, 0, 12, false, false, false, true, false, -8901.59, -112.72, 81.85);
	vendorDB:addVendor("Godric Rothgar", 0, 0, 12, false, false, false, false, false, -8898.24, -119.84, 81.83);
	vendorDB:addVendor("Godric Rothgar", 0, 0, 12, true, false, false, false, false, -8898.24, -119.84, 81.83);
	vendorDB:addVendor("Brother Danil", 0, 0, 12, false, true, false, false, false, -8901.59, -112.72, 81.85);
	vendorDB:addVendor("Brother Danil", 0, 0, 12, false, false, true, false, false, -8901.59, -112.72, 81.85);
	vendorDB:addVendor("Kurran Steele", 0, 0, 12, true, false, false, false, false, -9457.64, 99.68, 58.34);
	vendorDB:addVendor("Kurran Steele", 0, 0, 12, false, false, false, false, false, -9457.64, 99.68, 58.34);
	vendorDB:addVendor("Barkeep Dobbins", 0, 0, 12, false, true, false, false, false, -9459.99, 8.41, 56.96);
	vendorDB:addVendor("Barkeep Dobbins", 0, 0, 12, false, false, true, false, false, -9459.99, 8.41, 56.96);
	vendorDB:addVendor("Rallic Finn", 0, 0, 12, true, false, false, false, false, -9469.29, -1355.24, 47.2);
	vendorDB:addVendor("Rallic Finn", 0, 0, 12, false, false, false, false, false, -9469.29, -1355.24, 47.2);
	vendorDB:addVendor("Rallic Finn", 0, 0, 12, false, false, false, true, false, -9469.29, -1355.24, 47.2);
	vendorDB:addVendor("Drake Lindgren", 0, 0, 12, false, true, false, false, false, -9483.1, -1356.25, 46.95);
	vendorDB:addVendor("Drake Lindgren", 0, 0, 12, false, false, true, false, false, -9483.1, -1356.25, 46.95);
	vendorDB:addVendor("Drake Lindgren", 0, 0, 12, false, false, false, false, true, -9483.1, -1356.25, 46.95);

	-- Mulgore - Horde
	vendorDB:addVendor("Moodan Sungrain", 1, 1, 215, false, false, false, false, false, -2940.85, -245.96, 53.81);
	vendorDB:addVendor("Marjak Keenblade", 1, 1, 215, true, false, false, false, false, -2926.33, -215.72, 54.17);
	vendorDB:addVendor("Kawnie Softbreeze", 1, 1, 215, false, false, false, true, false, -2893.72, -279.34, 53.91);
	vendorDB:addVendor("Kawnie Softbreeze", 1, 1, 215, false, false, false, false, true, -2893.72, -279.34, 53.91);
	vendorDB:addVendor("Moodan Sungrain", 1, 1, 215, false, false, true, false, false, -2940.85, -245.96, 53.81);
	vendorDB:addVendor("Moodan Sungrain", 1, 1, 215, false, true, false, false, false, -2940.85, -245.96, 53.81);

	-- Tirisfal Glades - Horde
	vendorDB:addVendor("Archibald Kava", 1, 0, 85, true, false, false, false, false, 1859.39, 1568.81, 94.31);
	vendorDB:addVendor("Archibald Kava", 1, 0, 85, false, false, false, false, false, 1859.39, 1568.81, 94.31);
	vendorDB:addVendor("Eliza Callen", 1, 0, 85, true, false, false, false, false, 2246.33, 308.23, 35.18);
	vendorDB:addVendor("Eliza Callen", 1, 0, 85, false, false, false, false, false, 2246.33, 308.23, 35.18);
	vendorDB:addVendor("Innkeeper Renee", 1, 0, 85, false, true, false, false, false, 2269.51, 244.94, 34.25);
	vendorDB:addVendor("Innkeeper Renee", 1, 0, 85, false, false, true, false, false, 2269.51, 244.94, 34.25);
	vendorDB:addVendor("Mrs. Winters", 1, 0, 85, false, false, false, true, false, 2253.34, 270.22, 34.26);
	vendorDB:addVendor("Mrs. Winters", 1, 0, 85, false, false, false, false, true, 2253.34, 270.22, 34.26);
	vendorDB:addVendor("Constance Brisboise", 1, 0, 85, false, false, false, false, false, 2157.34, 656.66, 34.54);
	vendorDB:addVendor("Constance Brisboise", 1, 0, 85, true, false, false, false, false, 2157.34, 656.66, 34.54);

end