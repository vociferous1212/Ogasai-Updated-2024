zoneNamesList = {


	zoneNames = {
		-- Major Zones (always appear)
		["Alterac Mountains"] = true,
		["Arathi Highlands"] = true,
		["Ashenvale"] = true,
		["Azshara"] = true,
		["Badlands"] = true,
		["Blasted Lands"] = true,
		["Burning Steppes"] = true,
		["Darkshore"] = true,
		["Deadwind Pass"] = true,
		["Desolace"] = true,
		["Dun Morogh"] = true,
		["Durotar"] = true,
		["Duskwood"] = true,
		["Dustwallow Marsh"] = true,
		["Eastern Plaguelands"] = true,
		["Elwynn Forest"] = true,
		["Felwood"] = true,
		["Feralas"] = true,
		["Hillsbrad Foothills"] = true,
		["Loch Modan"] = true,
		["Mulgore"] = true,
		["Redridge Mountains"] = true,
		["Searing Gorge"] = true,
		["Silithus"] = true,
		["Silverpine Forest"] = true,
		["Stonetalon Mountains"] = true,
		["Stranglethorn Vale"] = true,
		["Swamp of Sorrows"] = true,
		["Tanaris"] = true,
		["Teldrassil"] = true,
		["The Barrens"] = true,
		["The Hinterlands"] = true,
		["Thousand Needles"] = true,
		["Tirisfal Glades"] = true,
		["Un'Goro Crater"] = true,
		["Western Plaguelands"] = true,
		["Westfall"] = true,
		["Wetlands"] = true,
		["Winterspring"] = true,

		-- Starter Subzone Headers (these DO appear)
		["Northshire Valley"] = true,      -- Human
		["Coldridge Valley"] = true,       -- Dwarf/Gnome
		["Shadowglen"] = true,             -- Night Elf
		["Valley of Trials"] = true,       -- Orc/Troll
		["Red Cloud Mesa"] = true,         -- Tauren
		["Deathknell"] = true,             -- Undead

		-- Additional Subzones that appear as headers
		["Camp Narache"] = true,           -- Tauren early quests
		["Razor Hill"] = true,             -- Durotar
		["Sen'jin Village"] = true,        -- Durotar
		["Brill"] = true,                  -- Tirisfal
		["Goldshire"] = true,              -- Elwynn
		["Kharanos"] = true,               -- Dun Morogh
		["Auberdine"] = true,              -- Darkshore
		["Rut'theran Village"] = true,     -- Teldrassil
		["Nighthaven"] = true,             -- Moonglade
		["Cenarion Hold"] = true,          -- Silithus
		["Gadgetzan"] = true,              -- Tanaris
		["Booty Bay"] = true,              -- Stranglethorn Vale
		["Rebel Camp"] = true,             -- Stranglethorn Vale
		["Light's Hope Chapel"] = true,    -- Eastern Plaguelands
		["Chillwind Camp"] = true,         -- Western Plaguelands
		["Southshore"] = true,             -- Hillsbrad
		["Tarren Mill"] = true,            -- Hillsbrad
		["Hammerfall"] = true,             -- Arathi
		["Refuge Pointe"] = true,          -- Arathi
		["Thorium Point"] = true,          -- Searing Gorge
		["Marshal's Refuge"] = true,       -- Un'Goro
		["Nijel's Point"] = true,          -- Desolace
		["Shadowprey Village"] = true,     -- Desolace
		["Feathermoon Stronghold"] = true, -- Feralas
		["Camp Mojache"] = true,           -- Feralas
		["Everlook"] = true,               -- Winterspring
		["Freewind Post"] = true,          -- Thousand Needles
		["Sun Rock Retreat"] = true,       -- Stonetalon
		["Astranaar"] = true,              -- Ashenvale
		["Splintertree Post"] = true,      -- Ashenvale
		["Bloodvenom Post"] = true,        -- Felwood
		["Emerald Sanctuary"] = true,      -- Felwood
		["Talrendis Point"] = true,        -- Azshara
		["Valormok"] = true,               -- Azshara
	}


}

function zoneNamesList:isZoneAQuestHeaderInQuestLog()

	for a = 0, GetNumQuestLogEntries() do

		local title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(a);
		
		if zoneNamesList.zoneNames[title] then
			return true;
		end
	end

return false;
end