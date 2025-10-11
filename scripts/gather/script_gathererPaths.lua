script_gathererPaths = {

    paths = nil,    -- used to sort table selection by map ID
    numPaths = nil,  -- used to sort table selection by map ID

    currentLocationInPath = 1, -- Start at the first path node
    currentLocationID = 1,

    currentPath = nil,

    firstStart = true,  -- find closest path node on first start

    arathiGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\arathiGatherPaths.lua"),
    ashenvaleGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\ashenvaleGatherPaths.lua"),
    azsharaGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\azsharaGatherPaths.lua"),
    barrensGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\barrensGatherPaths.lua"),
    darkshoreGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\darkshoreGatherPaths.lua"),
    desolaceGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\desolaceGatherPaths.lua"),
    durotarGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\durotarGatherPaths.lua"),
    duskwoodGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\duskwoodGatherPaths.lua"),
    elwynnGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\elwynnGatherPaths.lua"),
    felwoodGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\felwoodGatherPaths.lua"),
    feralasGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\feralasGatherPaths.lua"),
    mulgoreGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\mulgoreGatherPaths.lua"),
    stonetalonGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\stonetalonGatherPaths.lua"),
    tanarisGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\tanarisGatherPaths.lua"),
    teldrassilGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\teldrassilGatherPaths.lua"),
    tirisfalGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\tirisfalGatherPaths.lua"),
    westfallGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\westfallGatherPaths.lua"),
    wetlandsGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\wetlandsGatherPaths.lua"),
    winterspringGatherPathsLoaded = include("scripts\\gather\\gatherPaths\\winterspringGatherPaths.lua"),



}

function script_gathererPaths:moveThroughPaths()

    local player = GetLocalPlayer();
    local x, y, z = player:GetPosition();

	script_gather.blacklistTime = GetTimeEX() + script_gather.blacklistSetTime*1000;

     script_gatherer:getCurrentArea();
 

    -- Reset to first node if out of bounds
    if self.currentLocationInPath < 1 or self.currentLocationInPath >= self.numPaths then
        self.currentLocationInPath = 1;
    end

    -- find closest path node on first start
    if not self.firstStart then
        self.currentPath = self.paths[self.currentLocationInPath];
    elseif self.firstStart then
        self.currentPath = self.paths[script_gathererPaths:findClosestPathNode()];
        self.currentLocationInPath = script_gathererPaths:findClosestPathNode();
        self.firstStart = false;
    end
    
    -- set variables
    local idNum = self.currentPath['id'];
    local xx = self.currentPath['pos']['x'];
    local yy = self.currentPath['pos']['y'];
    local zz = self.currentPath['pos']['z'];

    -- Calculate distance to the current path node
    local distance = GetDistance3D(x, y, z, xx, yy, zz);

    -- If within 10 yards of the node, move to the next one
    if distance <= 20 or math.sqrt((x-xx)^2+(y-yy)^2) <= 25 then
        self.currentLocationInPath = self.currentLocationInPath + 1;
        if self.currentLocationInPath >= self.numPaths then
            self.currentLocationInPath = 1;
        end
        self.currentPath = self.paths[self.currentLocationInPath];
        xx = self.currentPath['pos']['x'];
        yy = self.currentPath['pos']['y'];
        zz = self.currentPath['pos']['z'];
    end

    -- Move to the current path node
    script_navEXCombat:moveToTarget(GetLocalPlayer(), xx, yy, zz);

    if not IsMoving() and not IsCasting() and not IsChanneling() then 
      Move(xx, yy, zz); 
    end

    script_gather.waitTimer = GetTimeEX() + 150;

    return false;
end

function script_gathererPaths:findClosestPathNode()
    local dist = 10000;
    local _dist = 0;
    local closestPathNum = 1;
    local x, y, z = GetLocalPlayer():GetPosition();

    script_gatherer:getCurrentArea()

    -- Find the closest path node to player
    for i = 1, self.numPaths -1 do
        if self.paths[i] then
            _dist = GetDistance3D(x, y, z, 
               self.paths[i]['pos']['x'], 
                self.paths[i]['pos']['y'], 
                self.paths[i]['pos']['z']);
            if _dist < dist then
                dist = _dist;
                closestPathNum = self.paths[i]['id'];
            end
        end
    end

    return closestPathNum;
end

