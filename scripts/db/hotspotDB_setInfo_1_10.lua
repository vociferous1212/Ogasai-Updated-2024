hotspotDB_setInfo_1_10 = {}

-- set grinder options based on hotspot ID loaded... primitive...

-- called in the script_grindEX do checks function

function hotspotDB_setInfo_1_10_checkMobs()

	for i=0, hotspotDB.numHotspots - 1 do

		-- dun morogh level 1
		if hotspotDB.hotspotList[i]['idd'] == 23 then
			script_grind.distToHotSpot = 300;
		end
		-- dun morogh level 2
		if hotspotDB.hotspotList[i]['idd'] == 24 then
			script_grind.distToHotSpot = 250;
		end
		-- dun morogh level 3
		if hotspotDB.hotspotList[i]['idd'] == 25 then	
			script_grind.distToHotSpot = 300;
			script_grind.skipBeast = true;
		end
		-- dun morogh level 4
		if hotspotDB.hotspotList[i]['idd'] == 26 then	
			script_grind.distToHotSpot = 300;
			script_grind.skipBeast = true;
		end
		-- dun morogh level 5-6
		if hotspotDB.hotspotList[i]['idd'] == 27 then	
			script_grind.distToHotSpot = 200;
			script_grind.skipBeast = true;
		end

	end
return false;
end
