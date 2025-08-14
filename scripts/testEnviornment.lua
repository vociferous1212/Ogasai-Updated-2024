testEnviornment = {waitTimer = GetTimeEX(), a = false,}

function testEnviornment:draw()
end

function testEnviornment:run()

	--if (self.waitTimer > GetTimeEX()) then
	--	return;
	--end

	--if IsLooting() then
	--	LootTarget();
	--	self.waitTimer = GetTimeEX() + 250;
	--end
	
	
	--ReplaceEnchant();
	--self.waitTimer = GetTimeEX() + 250;

function script_gatherBot:run()
    if self.waitTimer > GetTimeEX() then
        return
    end
script_gatherBot:menu()
    local localObj = GetLocalPlayer()
    if localObj:IsDead() or IsGhost() then
        self.status = "dead"
        StopMoving()
        self.waitTimer = GetTimeEX() + 2000
        return
    end

    -- Check for combat first
    if IsInCombat() or script_info:nrTargetingMe() > 0 then
        self.status = "combat"
        self.combatTimer = GetTimeEX() + 1000
        if script_combat:run() then
            self.waitTimer = GetTimeEX() + 50
            return
        end
    end

    -- Resume gathering after combat
    if self.status == "combat" and self.combatTimer > GetTimeEX() then
        return
    end

    -- Run gathering logic
    if script_gatherRun:gather() then
        self.status = "gathering"
        local node = script_gatherRun.nodeObj
        if node and node:IsValid() then
            local dist = node:GetDistance()
            local nx, ny, nz = node:GetPosition()
            if dist > script_gatherRun.lootDistance then
                self.status = "moving"
                if IsPathLoaded(5) then
                    if not script_pather:moveToTarget(nx, ny, nz) then
                        script_pather:moveFallback(nx, ny, nz)
                    end
                else
                    script_pather:moveFallback(nx, ny, nz)
                end
                self.waitTimer = GetTimeEX() + 50
            else
                self.gatherTimer = GetTimeEX() + 1650 -- Match script_gatherRun's gather timer
            end
        else
            self.status = "searching"
        end
        return
    end

    -- If no node found, patrol waypoints
    self.status = "searching"
    self:moveToNextWaypoint()
end

-- Move to the next waypoint in the selected area
function script_gatherBot:moveToNextWaypoint()
    if self.selectedArea == 0 then
        ToFile("No area selected, stopping bot")
        StopBot()
        return
    end

    local area = self.areas[self.selectedArea]
    local numWaypoints = 0
    local i = 1
    while area.coords[i] ~= nil do
        numWaypoints = numWaypoints + 1
        i = i + 1
    end

    local wx, wy, wz = area.coords[self.currentWaypoint].x, area.coords[self.currentWaypoint].y, area.coords[self.currentWaypoint].z
    local px, py, pz = GetLocalPlayer():GetPosition()
    local dist = GetDistance3D(px, py, pz, wx, wy, wz)

    if dist < 5 then
        self.currentWaypoint = self.currentWaypoint + 1
        if self.currentWaypoint > numWaypoints then
            self.currentWaypoint = 1 -- Loop back to first waypoint
        end
        wx, wy, wz = area.coords[self.currentWaypoint].x, area.coords[self.currentWaypoint].y, area.coords[self.currentWaypoint].z
    end

    if IsPathLoaded(5) then
        if not script_pather:moveToTarget(wx, wy, wz) then
            script_pather:moveFallback(wx, wy, wz)
        end
    else
        script_pather:moveFallback(wx, wy, wz)
    end
    self.waitTimer = GetTimeEX() + 50
end

-- Menu for selecting the farming area
function script_gatherBot:menu()
    if CollapsingHeader("[Gather Bot Options") then
        Separator()
        Text("Select Farming Area")
        local areaNames = ""
        local i = 1
        while i <= self.numAreas do
            areaNames = areaNames .. self.areas[i].name
            if i < self.numAreas then
                areaNames = areaNames .. " | "
            end
            i = i + 1
        end
        local newSelection
        self.selectedArea, newSelection = ComboBox("Area", self.selectedArea - 1, areaNames)
        self.selectedArea = self.selectedArea + 1 -- Adjust for 1-based indexing
        if newSelection then
            ToFile("Selected area: " .. self.areas[self.selectedArea].name)
            self.currentWaypoint = 1
            self.status = "searching"
        end
        Text("Status: " .. self.status)
        if Button("Run") then
            StartBot()
            ToFile("Gather bot started")
        end
        SameLine()
        if Button("Stop") then
            StopBot()
            ToFile("Gather bot stopped")
        end
    end
end
end
