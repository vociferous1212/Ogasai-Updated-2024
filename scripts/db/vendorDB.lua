vendorDB = {
	vendorList = {},
	numVendors = 0,
	includeVendorDB_1_10 = include("scripts\\db\\vendorDB_1_10.lua"),
	includeVendorDB_10_20 = include("scripts\\db\\vendorDB_10_20.lua"),
	includeVendorDB_20_30 = include("scripts\\db\\vendorDB_20_30.lua"),
	includeVendorDB_30_40 = include("scripts\\db\\vendorDB_30_40.lua"),
	includeVendorDB_40_50 = include("scripts\\db\\vendorDB_40_50.lua"),
	includeVendorDB_50_60 = include("scripts\\db\\vendorDB_50_60.lua"),
}

--[[
	todo:
		- Add class trainers
--]]

function vendorDB:addVendor(name, faction, continentID, mapID, canRepair, hasFood, hasWater, hasArrow, hasBullet, posX, posY, posZ, race)

	--[[
		faction:  1610 high elf            !  GetFaction() returns 1 for humans, 2 for orc, 3 for dwarf, 4 for NE, 5 for undead, 6 for tauren, 8 for gnome?, 9 for troll and 115 for gnome)  !
			0 = Alliance	
			1 = Horde
	--]]

	self.vendorList[self.numVendors] = {};
	self.vendorList[self.numVendors]['name'] = name;
	self.vendorList[self.numVendors]['faction'] = faction;
	self.vendorList[self.numVendors]['continentID'] = continentID;
	self.vendorList[self.numVendors]['mapID'] = mapID;
	self.vendorList[self.numVendors]['canRepair'] = canRepair;
	self.vendorList[self.numVendors]['hasFood'] = hasFood;
	self.vendorList[self.numVendors]['hasWater'] = hasWater;
	self.vendorList[self.numVendors]['hasArrow'] = hasArrow;
	self.vendorList[self.numVendors]['hasBullet'] = hasBullet;
	self.vendorList[self.numVendors]['pos'] = {};
	self.vendorList[self.numVendors]['pos']['x'] = posX;
	self.vendorList[self.numVendors]['pos']['y'] = posY;
	self.vendorList[self.numVendors]['pos']['z'] = posZ;
	self.numVendors = self.numVendors + 1;
end

function vendorDB:GetVendorByID(id)
	return self.vendorList[id];
end

function vendorDB:GetVendor(faction, continentID, mapID, canRepair, needFood, needWater, needArrow, needBullet, posX, posY, posZ, race)
	local bestDist = 10000;
	local bestIndex = -1;
	
	for i=0,self.numVendors - 1 do
		if (self.vendorList[i]['faction'] == faction and self.vendorList[i]['continentID'] == continentID) then	
			if((needFood and self.vendorList[i]['hasFood'] or not needFood) and (needWater and self.vendorList[i]['hasWater'] or not needWater)
			and (needArrow and self.vendorList[i]['hasArrow'] or not needArrow) and (needBullet and self.vendorList[i]['hasBullet'] or not needBullet)
			and (canRepair and self.vendorList[i]['canRepair'] or not canRepair)) then
				local _dist = GetDistance3D(posX, posY, posZ, self.vendorList[i]['pos']['x'], self.vendorList[i]['pos']['y'], self.vendorList[i]['pos']['z']);
				if(_dist < bestDist) then
					bestDist = _dist;
					bestIndex = i;
				end
			end
		end
	end
	return bestIndex;
end

function vendorDB:loadDBVendors()
	local localObj = GetLocalPlayer();
	local x, y, z = localObj:GetPosition();
	local factionID = 1; -- horde
	local factionNr = GetFaction();
	if (factionNr == 1 or factionNr == 3 or factionNr == 4 or factionNr == 115 or factionNr == 614 or factionNr == 1610) then
		factionID = 0; -- alliance
	end
	
	local repID, sellID, foodID, drinkID, arrowID, bulletID = -1, -1, -1, -1, -1, -1;

	repID = vendorDB:GetVendor(factionID, GetContinentID(), GetMapID(), true, false, false, false, false, x, y, z, race);
	-- turn first false to true (must search for repair vendor) to force bot to use 1 vendor
	sellID = vendorDB:GetVendor(factionID, GetContinentID(), GetMapID(), false, false, false, false, false, x, y, z, race);
	foodID = vendorDB:GetVendor(factionID, GetContinentID(), GetMapID(), false, true, false, false, false, x, y, z, race);
	drinkID = vendorDB:GetVendor(factionID, GetContinentID(), GetMapID(), false, false, true, false, false, x, y, z, race);
	arrowID = vendorDB:GetVendor(factionID, GetContinentID(), GetMapID(), false, false, false, true, false, x, y, z, race);
	bulletID = vendorDB:GetVendor(factionID, GetContinentID(), GetMapID(), false, false, false, false, true, x, y, z, race);

	if (repID ~= -1) then
		script_vendor.repairVendor = vendorDB:GetVendorByID(repID);
		--DEFAULT_CHAT_FRAME:AddMessage('Repair vendor ' .. script_vendor.repairVendor['name'] .. ' loaded from DB...');
	end

	if (sellID ~= -1) then
		script_vendor.sellVendor = vendorDB:GetVendorByID(sellID);
		--DEFAULT_CHAT_FRAME:AddMessage('Sell vendor ' .. script_vendor.sellVendor['name'] .. ' loaded from DB...');
	end

	if (foodID ~= -1) then
		script_vendor.foodVendor = vendorDB:GetVendorByID(foodID);
		--DEFAULT_CHAT_FRAME:AddMessage('Food vendor ' .. script_vendor.foodVendor['name'] .. ' loaded from DB...');
	end

	if (drinkID ~= -1) then
		script_vendor.drinkVendor = vendorDB:GetVendorByID(drinkID);
		--DEFAULT_CHAT_FRAME:AddMessage('Drink vendor ' .. script_vendor.drinkVendor['name'] .. ' loaded from DB...');
	end

	if (arrowID ~= -1) then
		script_vendor.arrowVendor = vendorDB:GetVendorByID(arrowID);
		--DEFAULT_CHAT_FRAME:AddMessage('Arrow vendor ' .. script_vendor.arrowVendor['name'] .. ' loaded from DB...');
	end

	if (bulletID ~= -1) then
		script_vendor.bulletVendor = vendorDB:GetVendorByID(bulletID);
		--DEFAULT_CHAT_FRAME:AddMessage('Bullet vendor ' .. script_vendor.bulletVendor['name'] .. ' loaded from DB...');
	end

	if (repID == -1 and sellID == -1 and foodID == -1 and drinkID == -1 and arrowID == -1 and bulletID == -1) then
		--DEFAULT_CHAT_FRAME:AddMessage('No Vendor found close to our location in vendorDB...');
	end 
end
function vendorDB:setup()

	--- (name, faction, continentID, mapID, canRepair, hasFood, hasWater, hasArrow, hasBullet, posX, posY, posZ, race)

	vendorDB_1_10:setup();
 	vendorDB_10_20:setup();
 	vendorDB_20_30:setup();
 	vendorDB_30_40:setup();
 	vendorDB_40_50:setup();
 	vendorDB_50_60:setup();

	-- Durotar - Horde

	-- Silverpine Forest - Horde
	vendorDB:addVendor("Nadia Vernon", 1, 0, 130, true, false, false, false, false, 566.3, 1559.59, 132.51);
	vendorDB:addVendor("Nadia Vernon", 1, 0, 130, false, false, false, false, false, 566.3, 1559.59, 132.51);
	vendorDB:addVendor("Gwyn Farrow", 1, 0, 130, false, true, false, false, false, 553.08, 1600.14, 129.12);
	vendorDB:addVendor("Edwin Harly", 1, 0, 130, false, false, true, false, false, 549.58, 1602.98, 128.48);
	vendorDB:addVendor("Edwin Harly", 1, 0, 130, false, false, false, false, true, 549.58, 1602.98, 128.48);
	vendorDB:addVendor("Nadia Vernon", 1, 0, 130, false, false, false, true, false, 566.3, 1559.59, 132.51);

	-- Darkshore - Alliance
	vendorDB:addVendor("Ullanna", 0, 1, 148, false, false, false, false, false, 4998.97, 72.87, 52.7);
	vendorDB:addVendor("Tiyani", 0, 1, 148, false, true, false, false, false, 4986.99, 80.03, 52.74);
	vendorDB:addVendor("Tiyani", 0, 1, 148, false, false, true, false, false, 4986.99, 80.03, 52.74);	

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

	-- Stonetalon - Horde
	vendorDB:addVendor("Innkeeper Jayka", 1, 1, 406, false, false, true, false, false, 893.65, 927.94, 106.25);
	vendorDB:addVendor("Innkeeper Jayka", 1, 1, 406, false, true, false, false, false, 893.65, 927.94, 106.25);
	vendorDB:addVendor("Borand", 1, 1, 406, true, false, false, false, false, 992.18, 1030.95, 105.58);
	vendorDB:addVendor("Borand", 1, 1, 406, false, false, false, false, false, 992.18, 1030.95, 105.58);
	vendorDB:addVendor("Borand", 1, 1, 406, false, false, false, true, false, 992.18, 1030.95, 105.58);
	vendorDB:addVendor("Denni'ka", 1, 1, 406, false, false, false, false, false, -188.43, -347.65, 8.79);
	vendorDB:addVendor("Denni'ka", 1, 1, 406, false, true, false, false, false, -188.43, -347.65, 8.79);

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


	--alliance	
		--Blasted Lands
	 vendorDB:addVendor("Strumner Flintheel	", 0, 0, 4, true, false, false, false, false, -10952.76, -3454.93, 66.73);
		--Winterspring
	vendorDB:addVendor("Syurana", 0, 1, 618, false, false, false, false, false, 7122.5, -3977.65, 745.61);

	  -- Eeastern Plaguelands
	  vendorDB:addVendor("Jase Farlane", 0, 0, 139, true, false, false, false, false, 2313.87, -5305, 81.99);
	   vendorDB:addVendor("Jase Farlane", 1, 0, 139, true, false, false, false, false, 2313.87, -5305, 81.99);
	
	-- Barrens - Horde
	vendorDB:addVendor("Zlagk", 1, 1, 14, true, false, false, false, false, -560.13, -4217.21, 41.59);
	vendorDB:addVendor("Uthrok", 1, 1, 17, false, false, false, false, false, -351.19, -2556.52, 95.78);
	vendorDB:addVendor("Uthrok", 1, 1, 17, true, false, false, false, false, -351.19, -2556.52, 95.78);
	vendorDB:addVendor("Sanuye Runetotem", 1, 1, 17, true, false, false, false, false, -2374.27, -1948.8, 96.08);
	vendorDB:addVendor("Sanuye Runetotem", 1, 1, 17, false, false, false, false, false, -2374.27, -1948.8, 96.08);
	vendorDB:addVendor("Innkeeper Byula", 1, 1, 17, false, true, false, false, false, -2376.28, -1995.74, 96.7);
	vendorDB:addVendor("Innkeeper Byula", 1, 1, 17, false, false, true, false, false, -2376.28, -1995.74, 96.7);

	-- Barrens Ratchet - Horde
	vendorDB:addVendor("Ironzar", 1, 1, 17, true, false, false, false, false, -919.62, -3683.77, 8.15);
	vendorDB:addVendor("Ironzar", 1, 1, 17, false, false, false, false, false, -919.62, -3683.77, 8.15);
	vendorDB:addVendor("Jazzik", 1, 1, 17, false, false, false, true, false, -1008.67, -3651.95, 20.06);
	vendorDB:addVendor("Jazzik", 1, 1, 17, false, false, false, false, true, -1008.67, -3651.95, 20.06);
	vendorDB:addVendor("Innkeeper Wiley", 1, 1, 17, false, false, true, false, false, -1050.05, -3664.81, 23.88);
	vendorDB:addVendor("Innkeeper Wiley", 1, 1, 17, false, true, false, false, false, -1050.05, -3664.81, 23.88);
	-- Barrens Ratchet - Alliance
	vendorDB:addVendor("Ironzar", 0, 1, 17, true, false, false, false, false, -919.62, -3683.77, 8.15);
	vendorDB:addVendor("Ironzar", 0, 1, 17, false, false, false, false, false, -919.62, -3683.77, 8.15);
	vendorDB:addVendor("Jazzik", 0, 1, 17, false, false, false, true, false, -1008.67, -3651.95, 20.06);
	vendorDB:addVendor("Jazzik", 0, 1, 17, false, false, false, false, true, -1008.67, -3651.95, 20.06);
	vendorDB:addVendor("Innkeeper Wiley", 0, 1, 17, false, false, true, false, false, -1050.05, -3664.81, 23.88);
	vendorDB:addVendor("Innkeeper Wiley", 0, 1, 17, false, true, false, false, false, -1050.05, -3664.81, 23.88);

	-- Hillsbrad Foothills - Horde
	vendorDB:addVendor("Ott", 1, 0, 267, false, false, false, false, false, -158.53, -867.18, 56.89);
	vendorDB:addVendor("Ott", 1, 0, 267, true, false, false, false, false, -158.53, -867.18, 56.89);
	vendorDB:addVendor("Innkeeper Shay", 1, 0, 267, false, true, false, false, false, -5.74, -942.02, 57.16);
	vendorDB:addVendor("Innkeeper Shay", 1, 0, 267, false, false, true, false, false, -5.74, -942.02, 57.16);

	
	-- Ally: Night Elf
	vendorDB:addVendor("Keina", 0, 1, 141, true, false, false, true, false, 10436.70, 794.83, 1322.7); -- Repair, Arrows vendor
	vendorDB:addVendor("Jeena Featherbow", 0, 1, 141, true, false, false, true, false, 9821.98, 968.83, 1308.77); -- Repair, Arrows vendor
	vendorDB:addVendor("Mydrannul", 0, 1, 1657, false, false, true, true, true, 9821.98, 968.83, 1308.77); -- General - ammo/shots/drinks Darnassus
	vendorDB:addVendor("Naram Longclaw", 0, 1, 148, true, false, false, false, false, 6571.59, 480.53, 8.25); -- Repair - Darkshore
	vendorDB:addVendor("Xai'ander", 0, 1, 331, true, false, false, false, false, 2672.31, -363.60, 110.73); -- Repair - Astranaar

	-- Ally: Westfall 
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


	-- Ally: Gnome & Dwarf
	vendorDB:addVendor('Kreg Bilmn', 0, 0, 1, false, false, false, true, true, -5597.66, -521.85, 399.66); -- general bullets/ammo
	vendorDB:addVendor('Grawn Thromwyn', 0, 0, 1, true, false, false, false, false, -5590.67, -428.415, 397.326); -- repair Northshire
	vendorDB:addVendor('Morhan Coppertongue', 0, 0, 38, true, false, false, false, false, -5343.68, -2932.13, 324.36); -- repair Lock Modan
	vendorDB:addVendor("Grundel Harkin", 0, 0, 1, true, false, false, false, false, -6104.5, 384.02, 395.54);


	-- Ally: Wetlands
	vendorDB:addVendor('Gruham Rumbnul', 0, 0, 11, false, false, false, true, true, -3746.03, 888.59, 11.01); -- Ammo, Bullets, General
	vendorDB:addVendor('Murndan Derth', 0, 0, 11, true, false, false, false, false, -3790.13, -858.47, 11.60); -- Repair

	-- Ally + Horde Wetlands
	vendorDB:addVendor("Kixxle", 0, 0, 11, false, false, false, false, false, -3188.04, -2465.58, 9.56);

	-- Ally: Hillsbrad
	vendorDB:addVendor('Sarah Raycroft', 0, 0, 267, false, false, true, true, true, -774.52, -505.75, 23.63); -- ammo drinks hillsbrad
	vendorDB:addVendor('Robert Aebischer', 0, 0, 267, true, false, false, false, false, -815.53, -572.19, 15.23); -- repair

	-- Tanaris - Ally + Horde
	vendorDB:addVendor('Krinkle Goodsteel', 0, 1, 440, true, false, false, false, false, -7200.40, -3769.75, 8.68); -- Repair Vendor
	vendorDB:addVendor('Krinkle Goodsteel', 1, 1, 440, true, false, false, false, false, -7200.40, -3769.75, 8.68); -- Repair Vendor
	vendorDB:addVendor('Blizrlk Buckshot', 0, 1, 440, true, false, false, false, true, -7141.79, -3719.82, 8.49); -- Bullets (not arrows) ammo, repair
	
	-- Azshara Alliance
	vendorDB:addVendor('Brinna Valanaar', 0, 1, 16, true, false, false, true, false, 2691.28, -3885.87, 109.22); -- Repair + Arrows (no ammo)

	-- Arathi Highlands - Alliance
	vendorDB:addVendor('Jannos Ironwill', 0, 0, 45, true, false, false, false, false, -1277.01, -2522.03, 21.36); -- Repair Vendor
	vendorDB:addVendor('Vikki Lonsav', 0, 0, 45, false, false, true, true, true, -1274.51, -2537.41, 21.43); -- General Trade for Ammo & Drinks

	-- Winterspring - Ally + Horde
	vendorDB:addVendor('Wixxrak', 0, 1, 618, true, false, false, false, false, 6733.39, -4699.04, 721.37);
	vendorDB:addVendor('Wixxrak', 1, 1, 618, true, false, false, false, false, 6733.39, -4699.04, 721.37);
	vendorDB:addVendor('Himmik', 0, 1, 618, false, true, true, false, false, 6679.62, -4670.89, 721.71);
	vendorDB:addVendor('Himmik', 1, 1, 618, false, true, true, false, false, 6679.62, -4670.89, 721.71);

end