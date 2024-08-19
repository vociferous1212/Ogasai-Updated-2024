fpDB = {isSetup = false, fpList = {}, numfps = 0, cityList = {}, numCity = 0,}

--org AH
--1685.1613769531, -4460.06640625, 18.851095199585


-- local name = GetLocalPlayer():GetUnitsTarget():GetUnitName();
-- local fx, fy, fz = GetLocalPlayer():GetUnitsTarget():GetPosition();
-- local id = GetMapID();
-- ToFile('"'..name..'";');
-- ToFile(fx..', '..fy..', '..fz..';');
-- ToFile("map ID"..id);


--intent... add all known FP's to a list. call this list as a setup and run script_gotofp:run().
-- run gotofp script
-- script_gotofp:run() should collect current mapID, current zone and
-- current minimap zone text. it should save these as a 'recall' point when done with collecting spells from a trainer.
-- the bot should then walk to the closest fp from db and once at or near flight master it should call the
-- fbDP:findClosestCity() script to return a minimap zone, zone name for bot to use the taxi service...
-- pause bot! and keep the bot targeting player and checking for unitontaxi
-- unpause when unit not on taxi
-- stop gotofp script

-- start get spells script
-- get spells should return back to a fp if level < 10
-- get spells should return fpDB:getCity from db 
-- walk to flight master
-- once at flight master the bot should 'recall' the last area mapid, zone text and area text to use the taxi service
-- pause bot!
-- target player for unitontaxi
-- unpause when unit is not on taxi anymore
-- end get spells script

-- restart grinder




function fpDB:addFP(name, faction, mapID, posX, posY, posZ)
	self.fpList[self.numfps] = {};
	self.fpList[self.numfps]['name'] = name;
	self.fpList[self.numfps]['faction'] = faction;
	self.fpList[self.numfps]['mapID'] = mapID;
	self.fpList[self.numfps]['pos'] = {};
	self.fpList[self.numfps]['pos']['x'] = posX;
	self.fpList[self.numfps]['pos']['y'] = posY;
	self.fpList[self.numfps]['pos']['z'] = posZ;

	self.numfps = self.numfps + 1;
end
function fpDB:addCity(name, faction, mapID, zone, posX, posY, posZ)
	self.cityList[self.numCity] = {};
	self.cityList[self.numCity]['name'] = name;
	self.cityList[self.numCity]['faction'] = faction;
	self.cityList[self.numCity]['mapID'] = mapID;
	self.cityList[self.numCity]['zone'] = zone;
	self.cityList[self.numCity]['pos'] = {};
	self.cityList[self.numCity]['pos']['x'] = posX;
	self.cityList[self.numCity]['pos']['y'] = posY;
	self.cityList[self.numCity]['pos']['z'] = posZ;

	self.numCity = self.numCity + 1;
end
function fpDB:removeCity()
	for i=0, self.numCity do
		if (script_goToFP.fpTarget == self.cityList[i]['name']) then
			self.cityList[self.numCity]['name'] = nil;
			self.cityList[self.numCity]['faction'] = nil;
			self.cityList[self.numCity]['mapID'] = nil;
			self.cityList[self.numCity]['zone'] = nil;
			self.cityList[self.numCity]['pos']['x'] = nil;
			self.cityList[self.numCity]['pos']['y'] = nil;
			self.cityList[self.numCity]['pos']['z'] = nil;

			self.numCity = self.numCity - 1;
		end
	end
end
function fpDB:removeFP()
	for i=0, self.numCity do
		if (script_goToFP.fpTarget == self.fpList[i]['name']) then
			self.fpList[self.numfps]['name'] = nil;
			self.fpList[self.numfps]['faction'] = nil;
			self.fpList[self.numfps]['mapID'] = nil;
			self.fpList[self.numfps]['zone'] = nil;
			self.fpList[self.numfps]['pos']['x'] = nil;
			self.fpList[self.numfps]['pos']['y'] = nil;
			self.fpList[self.numfps]['pos']['z'] = nil;

			self.numfps = self.numfps - 1;
		end
	end
end

function fpDB:goToAshenvale()
	local faction = GetFaction();
	local myfaction = 1;
	if faction == 1 or faction == 3 or faction == 4 or faction == 115 then
		myfaction = 0;
	end

	local x, y, z = GetLocalPlayer():GetPosition();
	if (myfaction == 1) then
		if (GetDistance3D(x, y, z, 2305.6398925781, -2520.1499023438, 103.80885314941) > 5) then
			if (script_navEX:moveToTarget(GetLocalPlayer(), 2305.6398925781, -2520.1499023438, 103.80885314941)) then
					return true;
				end
		else
			fpDB.goTo = false;
		end
	end
	if (myfaction == 0) then
		if (GetDistance3D(x, y, z, 2828.3798828125, -284.25, 106.67706298828) > 5) then
			if (script_navEX:moveToTarget(GetLocalPlayer(), 2828.3798828125, -284.25, 106.67706298828)) then
				return true;
			end
		else
			fpDB.goTo = false;
		end
	end
return false;
end



function fpDB:setup()

	--ashenvale alliance
	fpDB:addFP("Daelyshia", 0, 331, 2828.3798828125, -284.25, 106.67706298828);
	--ashenvale horde
	fpDB:addFP("Vhulgra", 1, 331, 2305.6398925781, -2520.1499023438, 103.80885314941);
	fpDB:addFP("Andruk", 1, 331, 3373.6899414063, 994.35101318359, 5.2784662246704);

	--westfall
	fpDB:addFP("Thor", 0, 40, -10628.299804688, 1037.2700195313, 34.110454559326);

	-- loch modan
	fpDB:addFP("Thorgrum Borrelson", 0, 38, -5424.8500976563, -2929.8701171875, 347.56225585938);

	-- wetlands
	fpDB:addFP("Shellei Brondir", 0, 11, -3793.1999511719, -782.05200195313, 9.0148887634277);

	-- crossroads
	fpDB:addFP("Devrak", 1, 17, -437.1369934082, -2596, 95.787719726563);

	-- camp tarujo
	fpDB:addFP("Omusa Thunderhorn", 1, 17, -2384.080078125, -1880.9399414063, 95.850372314453);

	-- ratchet
	fpDB:addFP("Bragok", 0, 17, -898.24597167969, -3769.6499023438, 11.710169792175);
	fpDB:addFP("Bragok", 1, 17, -898.24597167969, -3769.6499023438, 11.710169792175);

	-- darkshire
	fpDB:addFP("Felicia Maline", 0, 10, -10513.799804688, -1258.7900390625, 41.431617736816);

	-- lakeshire
	fpDB:addFP("Ariena Stormfeather", 0, 44, -9435.2099609375, -2234.8798828125, 69.10888671875);

	-- darkshore
	fpDB:addFP("Caylais Moonfeather", 0, 148, 6343.2001953125, 561.65100097656, 15.798759460449);

	-- silverpine
	fpDB:addFP("Karos Razok", 1, 130, 473.93899536133, 1533.9499511719, 131.8770904541);

	-- hillsbrad
	fpDB:addFP("Zarise", 1, 267, 2.6755700111389, -857.91900634766, 58.774402618408);
	fpDB:addFP("Darla Harris", 0, 267, -715.14599609375, -512.13397216797, 26.544595718384);



	-- stormwind
	fpDB:addCity("Dungar Longdrink", 0, 1519, "Stormwind, Elwynn", -8835.759765625, 490.08401489258, 109.61573028564);

	-- ironforge
	fpDB:addCity("Gryth Thurden", 0, 1537, "Ironforge, Dun Morogh", -4821.1298828125, -1152.4000244141, 502.21157836914);

	--undercity
	fpDB:addCity("Michael Garrett", 1, 1497, "Undercity, Tirisfal", 1567.1199951172, 266.3450012207, -43.102523803711);

	-- darnassus
	fpDB:addCity("Vesprystus", 0, 141, "Rut'theran Village, Teldrassil", 8640.580078125, 841.11798095703, 23.26362991333);

	-- orgrimmar
	fpDB:addCity("Doras", 1, 1637, "Orgrimmar, Durotar", 1676.25, -4313.4501953125, 61.567474365234);

	-- thunderbluff
	fpDB:addCity("Tal", 1, 1638, "Thunder Bluff, Mulgore", -1196.75, 26.077699661255, 176.94920349121);

end

function fpDB:getFP()
	local fx, fy, fz = 0, 0 ,0;
	local bestDist = 10000;
	local x, y, z = GetLocalPlayer():GetPosition();

	-- faction check - 0 for alliance and 1 for horde
	local faction = 1;
	if (GetFaction() == 115 or GetFaction() == 3 or GetFaction() == 4 or GetFaction() == 1) then
		faction = 0;
	end

	for i=0, self.numfps - 1 do

		-- check our faction
		if self.fpList[i]['faction'] ~= nil and faction == self.fpList[i]['faction'] then

			-- check our mapID
			if self.fpList[i]['mapID'] == GetMapID() then

				local dist = GetDistance3D(x, y, z, self.fpList[i]['pos']['x'], self.fpList[i]['pos']['y'], self.fpList[i]['pos']['z']);

				
				if(dist < bestDist) then
					bestDist = dist;
					fx, fy, fz = self.fpList[i]['pos']['x'], self.fpList[i]['pos']['y'], self.fpList[i]['pos']['z'];
					script_goToFP.fpTarget = self.fpList[i]['name'];
				end

			end
		end
	end

return fx, fy, fz;
end

-- go to flight master while in a city
function fpDB:getClosestCity()

	local fx, fy, fz = 0, 0 ,0;

	-- faction check - 0 for alliance and 1 for horde
	local faction = 1;
	if (GetFaction() == 115 or GetFaction() == 3 or GetFaction() == 4 or GetFaction() == 1) then
		faction = 0;
	end

	-- we don't need to do any check but to make sure our mapID == mapID of flight master in the city
	for i=0, self.numCity - 1 do
		if self.cityList[i]['faction'] ~= nil and faction == self.cityList[i]['faction'] then
			if (GetMapID() == self.cityList[i]['mapID']) then
				fx, fy, fz = self.cityList[i]['pos']['x'], self.cityList[i]['pos']['y'], self.cityList[i]['pos']['z'];
				script_goToFP.fpTarget = self.cityList[i]['name'];
			end
		end
	end
return fx, fy, fz;
end

-- get the name of the closest city to fly to
function fpDB:getClosestCityZone()

	local fpName = "";
	local x, y, z = GetLocalPlayer():GetPosition();
	local bestDist = 10000;


	-- faction check - 0 for alliance and 1 for horde
	local faction = 1;

	if (GetFaction() == 115 or GetFaction() == 3 or GetFaction() == 4 or GetFaction() == 1) then
		faction = 0;
	end

	for i=0, self.numCity -1 do

		if (self.cityList[i]['faction'] ~= nil) and (self.cityList[i]['faction'] == faction) then

			local dist = GetDistance3D(x, y, z, self.cityList[i]['pos']['x'], self.cityList[i]['pos']['y'], self.cityList[i]['pos']['z']);
		
			if (dist < bestDist) then
				bestDist = dist;
			end
			if (bestDist < dist) then
				fpName = self.cityList[i]['zone'];
			end
		end

	end

return fpName;
end

-- we dont want to use a FP in these areas...
function fpDB:areWeInStarterZones()

	--morogh 1 elwynn 12 if 1537 sw 1519 tirisfal 85 uc 1497 darn 1657 mulgore 215 org 1637 teldrassil 141 tb 1638
	local id = GetMapID();
	local starterZonesTable = {1, 12, 1537, 1519, 85, 1497, 1657, 215, 1637, 141, 1638};

	for i=0, 11 do 
		if id == starterZonesTable[i] then
			return true;
		end
	end
return false;
end

function fpDB:getAHumanZone()
	local sString = "";
	-- go to westfall level 10 - 20
		if (GetLocalPlayer():GetLevel() >= 10 and GetLocalPlayer():GetLevel() < 20) then
			sString = "Sentinel Hill, Westfall";

	-- go to duskwood 10 - 30
		elseif (GetLocalPlayer():GetLevel() >= 20) then
			sString = "Darkshire, Duskwood";
		end
return sString;
end

function fpDB:getAOrcZone()
	local sString = "";
	-- go to barrens
	if (GetLocalPlayer():GetLevel() >= 10 and GetLocalPlayer():GetLevel() < 20) then
			sString = "Crossroads, The Barrens";
	-- go to ashenvale
	elseif (GetLocalPlayer():GetLevel() >= 20) then
		sString = "Camp Taurajo, The Barrens";
	end
	
return sString;
end
function fpDB:getAUndeadZone()
	local sString = "";
	-- go to silverpine
	if (GetLocalPlayer():GetLevel() >= 10 and GetLocalPlayer():GetLevel() < 20) then
			sString = "The Sepulcher, Silverpine Forest";
	-- go to hillsbrad
	elseif (GetLocalPlayer():GetLevel() >= 20) then
		sString = "Tarren Mill, Hillsbrad";
	end
	
return sString;
end
function fpDB:getAElfZone()
	local sString = "";
	-- go to barrens
	if (GetLocalPlayer():GetLevel() >= 10 and GetLocalPlayer():GetLevel() < 20) then
			sString = "Auberdine, Darkshore";
	-- go to hillsbrad
	elseif (GetLocalPlayer():GetLevel() >= 20) then
		sString = "Astranaar, Ashenvale";
	end
	
return sString;
end
function fpDB:getADwarfZone()
	local sString = "";
	-- go to barrens
	if (GetLocalPlayer():GetLevel() >= 10 and GetLocalPlayer():GetLevel() < 20) then
			sString = "Thelsamar, Loch Modan";
	-- go to hillsbrad
	elseif (GetLocalPlayer():GetLevel() >= 20) then
		sString = "Menethil Habor, Wetlands";
	end
	
return sString;
end