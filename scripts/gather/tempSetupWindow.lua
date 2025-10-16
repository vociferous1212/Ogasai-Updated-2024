tempSetupWindow = {pathNum = 0, numLocations = 0, savedLocations = {}, savePaths = false, savePathRange = 60, useOtherPaths = false}

function tempSetupWindow:tempSetupWindow()

    script_gathererPaths.currentLocationInPath = SliderInt("Current Pos", 1, script_gathererPaths.numPaths, script_gathererPaths.currentLocationInPath);

	Text("Current pos in list - "..script_gathererPaths.currentLocationInPath)

    Separator();

	wasClicked, self.savePaths = Checkbox("Save Paths", self.savePaths);
	self.savePathRange = SliderInt("Save Path Range", 5, 100, self.savePathRange);

	Separator();

	wasClicked, self.useOtherPaths = Checkbox("Use paths added to log file", self.useOtherPaths);

    Separator();

    script_gathererPaths.runNodesMin = SliderInt("Min Node", 0, script_gathererPaths.numPaths, script_gathererPaths.runNodesMin);
    script_gathererPaths.runNodesMax = SliderInt("Max Node", 0, script_gathererPaths.numPaths, script_gathererPaths.runNodesMax);




	if self.numLocations ~= 0 then
		for i = 1, self.numLocations -1 do
		local tX, tY, onScreen = WorldToScreen(self.savedLocations[i]['pos']['x'], self.savedLocations[i]['pos']['y'], self.savedLocations[i]['pos']['z'])
            if onScreen then
                DrawText('Path Node: '..i+1, tX, tY - 20, 0, 255, 255)
            end
		end
	end

	if self.savePaths then
	
		local x, y, z = GetLocalPlayer():GetPosition();
		-- Check: Don't save if we are outside the hotspot distance
		local save = true;
		if (self.numLocations > 0) and x ~= nil then
			for i = 0, self.numLocations -1 do
				local dist = math.sqrt((x-self.savedLocations[i]['pos']['x'])^2+(y-self.savedLocations[i]['pos']['y'])^2);
				if (dist < self.savePathRange) then
					save = false;
				end
			end
		end
		if save then
			self.savedLocations[self.numLocations] = {};
			self.savedLocations[self.numLocations]['pos'] = {};
			self.savedLocations[self.numLocations]['pos']['x'] = x;
			self.savedLocations[self.numLocations]['pos']['y'] = y;
			self.savedLocations[self.numLocations]['pos']['z'] = z;
			self.numLocations = self.numLocations + 1;
				
			self.pathNum = self.pathNum + 1
local a = nil;
local b, c, d = GetLocalPlayer():GetPosition();
local e = ");"

-- Helper function to capitalize the first letter, rest lowercase
local function CapitalizeFirst(str)
    if not str or str == "" then
        return "Default"
    end
    return string.upper(string.sub(str, 1, 1)) .. string.lower(string.sub(str, 2))
end

-- Function to extract the short zone name
local function GetShortZoneName(zoneText)
   
    -- List of special zones to return full name, lowercase, no spaces
    local specialZones = {
        ["Western Plaguelands"] = true,
        ["Eastern Plaguelands"] = true,
        ["Dun Morogh"] = true,
        ["Loch Modan"] = true,
        ["Searing Gorge"] = true,
        ["Blasted Lands"] = true,
        ["Thousand Needles"] = true,
        ["Swamp of Sorrows"] = true,
        ["Burning Steppes"] = true,
    }

    -- Check if zoneText is a special zone
    if specialZones[zoneText] then
        local shortName = ""
        local startIndex = 1
        local spaceIndex = string.find(zoneText, " ")
        if spaceIndex then
            -- Concatenate words, removing spaces
            while spaceIndex do
                shortName = shortName .. string.sub(zoneText, startIndex, spaceIndex - 1)
                startIndex = spaceIndex + 1
                spaceIndex = string.find(zoneText, " ", startIndex)
            end
            -- Append the last word
            shortName = shortName .. string.sub(zoneText, startIndex)
        else
            shortName = zoneText -- No spaces, use full name
        end
        shortName = string.lower(shortName) -- Ensure lowercase for f
        return shortName
    end

    -- Check if the zone name starts with "The " (case-insensitive)
    if string.lower(string.sub(zoneText, 1, 4)) == "the " then
        -- Find the first space
        local spaceIndex = string.find(zoneText, " ")
        if spaceIndex then
            -- Extract the second word (text after the first space)
            local secondSpaceIndex = string.find(zoneText, " ", spaceIndex + 1)
            if secondSpaceIndex then
                -- If there's a second space, take the word between the first and second space
                return string.sub(zoneText, spaceIndex + 1, secondSpaceIndex - 1)
            else
                -- If there's only one space, take everything after it
                return string.sub(zoneText, spaceIndex + 1)
            end
        end
    end

    -- If not a special zone or starting with "The", take the first word
    local spaceIndex = string.find(zoneText, " ")
    local shortName
    if spaceIndex then
        shortName = string.sub(zoneText, 1, spaceIndex - 1) -- Extract text before the first space
    else
        shortName = zoneText -- No space, use full name
    end
    return shortName
end

local zoneText = GetZoneText() or "";
if zoneText == "Un'Goro Crater" then zoneText = "Ungoro"; end
local f = string.lower(GetShortZoneName(zoneText));
local g = CapitalizeFirst(GetShortZoneName(zoneText));

a = f.."GatherPaths:add"..g.."Path(self.num"..g.."Paths, ";

ToFile(a..b..", "..c..", "..d..e);
DEFAULT_CHAT_FRAME:AddMessage("added to log file..."..self.pathNum);

		end
	end
end
