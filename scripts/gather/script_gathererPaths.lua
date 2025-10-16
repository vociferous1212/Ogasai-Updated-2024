script_gathererPaths = {

    paths = nil,    -- used to sort table selection by map ID
    numPaths = nil,  -- used to sort table selection by map ID

    currentLocationInPath = 1, -- Start at the first path node
    currentLocationID = 1,

    currentPath = nil,

    firstStart = true,  -- find closest path node on first start
    
    runNodesMin = 0,
    runNodesMax = 0,

    alteracGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\alteracGatherPaths.lua"),
    arathiGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\arathiGatherPaths.lua"),
    ashenvaleGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\ashenvaleGatherPaths.lua"),
    azsharaGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\azsharaGatherPaths.lua"),
    badlandsGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\badlandsGatherPaths.lua"),
    barrensGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\barrensGatherPaths.lua"),
    blastedlandsGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\blastedlandsGatherPaths.lua"),
    burningsteppesGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\burningsteppesGatherPaths.lua"),
    darkshoreGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\darkshoreGatherPaths.lua"),
    deadwindGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\deadwindGatherPaths.lua"),
    desolaceGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\desolaceGatherPaths.lua"),
    dunmoroghGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\dunmoroghGatherPaths.lua"),
    durotarGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\durotarGatherPaths.lua"),
    duskwoodGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\duskwoodGatherPaths.lua"),
    dustwallowGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\dustwallowGatherPaths.lua"),
    easternplaguelandsGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\easternplaguelandsGatherPaths.lua"),
    elwynnGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\elwynnGatherPaths.lua"),
    felwoodGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\felwoodGatherPaths.lua"),
    feralasGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\feralasGatherPaths.lua"),
    hillsbradGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\hillsbradGatherPaths.lua"),
    hinterlandsGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\hinterlandsGatherPaths.lua"),
    lochmodanGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\lochmodanGatherPaths.lua"),
    moongladeGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\moongladeGatherPaths.lua"),
    mulgoreGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\mulgoreGatherPaths.lua"),
    redridgeGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\redridgeGatherPaths.lua"),
    searinggorgeGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\searinggorgeGatherPaths.lua"),
    silithusGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\silithusGatherPaths.lua"),
    silverpineGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\silverpineGatherPaths.lua"),
    stranglethornGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\stranglethornGatherPaths.lua"),
    stonetalonGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\stonetalonGatherPaths.lua"),
    swampofsorrowsGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\swampofsorrowsGatherPaths.lua"),
    tanarisGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\tanarisGatherPaths.lua"),
    teldrassilGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\teldrassilGatherPaths.lua"),
    thousandneedlesGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\thousandneedlesGatherPaths.lua"),
    tirisfalGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\tirisfalGatherPaths.lua"),
    ungoroGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\ungoroGatherPaths.lua"),
    westernplaguelandsGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\westernplaguelandsGatherPaths.lua"),
    westfallGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\westfallGatherPaths.lua"),
    wetlandsGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\wetlandsGatherPaths.lua"),
    winterspringGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\winterspringGatherPaths.lua"),



}

function script_gathererPaths:moveThroughPaths()

    -- get position
    local player = GetLocalPlayer();
    local x, y, z = player:GetPosition();

    -- reset blacklist timer if we are moving through the paths and not gathering a node
	script_gather.blacklistTime = GetTimeEX() + script_gather.blacklistSetTime*1000;

    -- run the paths in the temp setup window instead of paths in lua files
    if tempSetupWindow.useOtherPaths then

        -- paths = paths in setup window file
        self.paths = tempSetupWindow.savedLocations;
		self.currentPath = tempSetupWindow.savedLocations[self.currentLocationInPath];
		self.numPaths = tempSetupWindow.numLocations;

    -- else run paths in each lua file
	else

        -- get our area and path to run GetZone and GetZoneText
        getCurrentAreaAndPath:getCurrentAreaAndPath()

        -- Reset to first node if out of bounds
        if self.currentLocationInPath < 1 or self.currentLocationInPath >= self.numPaths then
            self.currentLocationInPath = 1;

            if self.runNodesMin ~= 0 then
                self.currentLocationInPath = self.runNodesMin;
            end
        end
    
            -- find closest path node on first start
            if not self.firstStart then
                -- not first start so get current path based on current location in path num (starts with 1)
                self.currentPath = self.paths[self.currentLocationInPath];
            elseif self.firstStart then
                -- find the cloest path to player
                self.currentPath = self.paths[script_gathererPaths:findClosestPathNode()];
                self.currentLocationInPath = script_gathererPaths:findClosestPathNode();
                self.firstStart = false;
            end
    
    end

    -- recheck our path and get closest node
    if self.currentPath == nil then getCurrentAreaAndPath:getCurrentAreaAndPath(); end



    -- set variables
    local idNum = self.currentPath['id'];
    local xx = self.currentPath['pos']['x'];
    local yy = self.currentPath['pos']['y'];
    local zz = self.currentPath['pos']['z'];

    -- Calculate distance to the current path node
    local distance = GetDistance3D(x, y, z, xx, yy, zz);

    -- If within 10 yards of the node, move to the next one
    if distance <= 20 or math.sqrt((x-xx)^2+(y-yy)^2) <= 25 then
        -- increase node distance by + 1
        self.currentLocationInPath = self.currentLocationInPath + 1;

        if self.runNodesMin == 0 then
            -- reached end of path nums so reset back to 1
            if self.currentLocationInPath >= self.numPaths then
                self.currentLocationInPath = 1;
            end
        else
            self.currentLocationInPath = self.runNodesMin;
        end

        -- get next node in path
        self.currentPath = self.paths[self.currentLocationInPath];
        xx = self.currentPath['pos']['x'];
        yy = self.currentPath['pos']['y'];
        zz = self.currentPath['pos']['z'];
    end

    -- if we are not moving for some reason then force the bot to move...
    if not IsMoving() and not IsCasting() and not IsChanneling() and ((not IsMounted() and not script_grind.useMount) or (script_grind.hasAMount and IsMounted() and script_grind.useMount)) then 
      Move(xx, yy, zz); 
    end

    -- Move to the current path node
    script_navEXCombat:moveToTarget(GetLocalPlayer(), xx, yy, zz);
    
    -- short wait timer
    script_gather.waitTimer = GetTimeEX() + 150;

    return false;
end

function script_gathererPaths:findClosestPathNode()
    local dist = 10000;
    local _dist = 0;
    local closestPathNum = 1;
    local x, y, z = GetLocalPlayer():GetPosition();

    -- get our current area and path
    getCurrentAreaAndPath:getCurrentAreaAndPath();

    if self.runNodesMin == 0 then
        -- Find the closest path node to player
        for i = 1, self.numPaths -1 do
            if self.paths[i] then
                if (i < self.currentLocationInPath + 10 and i > self.currentLocationInPath - 10) or (self.firstStart) then
                    _dist = GetDistance3D(x, y, z, self.paths[i]['pos']['x'], self.paths[i]['pos']['y'], self.paths[i]['pos']['z']);
                    if _dist < dist then
                        dist = _dist;
                        closestPathNum = self.paths[i]['id'];
                    end
                end
            end
        end
    else
        for i = self.runNodesMin, self.runNodesMax -1 do
            if self.paths[i] then
                if (i < self.currentLocationInPath + 10 and i > self.currentLocationInPath - 10) or (self.firstStart) then
                    _dist = GetDistance3D(x, y, z, self.paths[i]['pos']['x'], self.paths[i]['pos']['y'], self.paths[i]['pos']['z']);
                    if _dist < dist then
                        dist = _dist;
                        closestPathNum = self.paths[i]['id'];
                    end
                end
            end
        end
    end
    return closestPathNum;
end

