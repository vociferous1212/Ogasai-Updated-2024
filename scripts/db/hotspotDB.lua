hotspotDB = {
	hotspotList = {},
	selectionList = {},
	numHotspots = 0,
	isSetup = false,
	includeHotspotDB_1_10 = include("scripts\\db\\hotspotDB_1_10.lua"),
	includeHotspotDB_10_20 = include("scripts\\db\\hotspotDB_10_20.lua"),
	includeHotspotDB_20_30 = include("scripts\\db\\hotspotDB_20_30.lua"),
	includeHotspotDB_30_40 = include("scripts\\db\\hotspotDB_30_40.lua"),
	includeHotspotDB_40_50 = include("scripts\\db\\hotspotDB_40_50.lua"),
	includeHotspotDB_50_60 = include("scripts\\db\\hotspotDB_50_60.lua"),
}

function hotspotDB:addHotspot(name, race, minLevel, maxLevel, posX, posY, posZ)
	self.hotspotList[self.numHotspots] = {};
	self.hotspotList[self.numHotspots]['name'] = name;
	self.hotspotList[self.numHotspots]['race'] = race;
	self.hotspotList[self.numHotspots]['faction'] = faction;
	self.hotspotList[self.numHotspots]['minLevel'] = minLevel;
	self.hotspotList[self.numHotspots]['maxLevel'] = maxLevel;
	self.hotspotList[self.numHotspots]['pos'] = {};
	self.hotspotList[self.numHotspots]['pos']['x'] = posX;
	self.hotspotList[self.numHotspots]['pos']['y'] = posY;
	self.hotspotList[self.numHotspots]['pos']['z'] = posZ;

	self.selectionList[self.numHotspots] = name;

	self.numHotspots = self.numHotspots + 1;
end


function hotspotDB:setup()

	-- (name, race, faction, minlevel, maxlevel, posX, posY, posZ)
	-- You can set a hotspot for All races by setting the race to "All"
	-- You can set a hotspot to only Horde or "Alliance" by setting race to "Horde" or ""Alliance""

	hotspotDB_1_10:setup();
	hotspotDB_10_20:setup();
	hotspotDB_20_30:setup();
	hotspotDB_30_40:setup();
	hotspotDB_40_50:setup();
	hotspotDB_50_60:setup();
	
	self.isSetup = true;
end

function hotspotDB:getHotSpotByID(id)
	return self.hotspotList[id];
end

function hotspotDB:getHotspotID(race, level)
	local bestDist = 10000;
	local bestIndex = -1;

	for i=0, self.numHotspots - 1 do
		if (level >= self.hotspotList[i]['minLevel'] and level <= self.hotspotList[i]['maxLevel']) then
			
			-- Race specific or All races or faction
			if (self.hotspotList[i]['race'] == race or 
				self.hotspotList[i]['race'] == 'All' or
				self.hotspotList[i]['race'] == UnitFactionGroup("player") ) then
				local myX, myY, myZ = GetLocalPlayer():GetPosition();
				local _dist = GetDistance3D(myX, myY, myZ, self.hotspotList[i]['pos']['x'], self.hotspotList[i]['pos']['y'], self.hotspotList[i]['pos']['z']);
				if(_dist < bestDist) then
					bestDist = _dist;
					bestIndex = i;
				end
			end
		end
	end

	return bestIndex;
end