fpDB = {isSetup = false, fpList = {}, numfps = 0,}

--org AH
--1685.1613769531, -4460.06640625, 18.851095199585


-- local name = GetLocalPlayer():GetUnitsTarget():GetUnitName();
-- local fx, fy, fz = GetLocalPlayer():GetUnitsTarget():GetPosition();
-- local id = GetMapID();
-- ToFile('"'..name..'";');
-- ToFile(fx..', '..fy..', '..fz..';');
-- ToFile("id = "..id";");

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

function fpDB:getFP(faction, mapID)
	local fx, fy, fz = 0, 0 ,0;

	-- faction check - 0 for alliance and 1 for horde
	local factions = -1;
	if (GetFaction() == 115 or GetFaction() == 3 or GetFaction() == 4 or GetFaction() == 1) then
		factions = 0;
	else
		factions = 1;
	end

	for i=0, self.numfps - 1 do
		if faction == [i]['faction'] then
			if self.fpList[i]['mapID'] == GetMapID() then
				fx, fy, fz = self.fpList[i]['pos']['x'], self.fpList[i]['pos']['y'], self.fpList[i]['pos']['z'];
				script_goToFP.fpTarget = self.fpList[i]['name'];
			end
		end
	end

return fx, fy, fp;
end

function fpDB:goToDarnassus()

	-- ashenvale 331 

	id = GetMapID();
	zonesCloseToDarnassusTable = {331, 

	if (script_getSpells:areWeAlliance()) then
		if (id == 331 then
			script_goToFP.fpTarget = "Daelyshia";
			fx, fy, fz = 2828.3798828125, -284.25, 106.67706298828;
		end

	end


	
end

function fpDB:leaveDarnassus()
	
	if (id ~= 1657) then
		script_goToFP.fpTarget = "Vesprystus";
		script_goToFP.fx, script_goToFP.fy, script_goToFP.fz = 8640.580078125, 841.11798095703, 23.263628005981;
	end
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

function fpDB:ashenvale()
	id = GetMapID();

	if (id == 331) and (script_getSpells:areWeAlliance()) then

		script_goToFP.fpTarget = "Daelyshia";
		fx, fy, fz = 2828.3798828125, -284.25, 106.67706298828;

	end
return fx, fy, fz;
end

function fpDB:getFPTest()
	local fx, fy, fz = 0

	if (fpDB:ashenvale()) then
		fx, fy, fz = fpDB:ashenvale();
	elseif (fpDB:

return fx, fy, fz;
end

function fpDB:crossroads();
id = GetMapID();

	if (id == 331) and (not script_getSpells:areWeAlliance()) then
		script_goToFP.fpTarget = "Devrak";
		fx, fy, fz = -437.1369934082, -2596, 95.787719726563;

	end
return fx, fy, fz;
end

function fbDB:ratchet()
id = GetMapID();

	if (id == 331) and (not script_getSpells:areWeAlliance()) then
		script_goToFP.fpTarget = "Bragok";
		fx, fy, fz = -898.24597167969, -3769.6499023438, 11.710169792175;
return fx, fy, fz;
end