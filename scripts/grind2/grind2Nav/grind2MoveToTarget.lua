grind2MoveToTarget = {

	nextNavNodeDistance = 5.5,		-- distance to next nav node

	lastPathIndex = -1,				-- last path node

	navPosition = {},				-- current position in nav

	lastnavIndex = 0,				-- last position in nav

	timer = 0,						-- script timer

	message = "idle...",

	generateANewPath = false,

	goToX = 0,
	goToY = 0,
	goToZ = 0,
	

}

function grind2MoveToTarget:GenerateNewPath()

	local x, y, z = PlayerPosition();

	if self.goToX ~= 0 then
		self.navPosition['x'] = _x;
		self.navPosition['y'] = _y;
		self.navPosition['z'] = _z;
		-- generate a new path
		GeneratePath(x, y, z, self.goToX, self.goToY, self.goToZ + 1);
	end
end

function grind2MoveToTarget:run(player, _x, _y, _z)

	local player = GetLocalPlayer();

	local localObj = GetLocalPlayer();

	self.goToX, self.goToY, self.goToZ = _x, _y, _z;


-- set distance to nav node further if we are moving faster
	if player:HasBuff("Aspect of the Cheetah") or player:HasBuff("Ghost Wolf") or GetLocalPlayer():GetSpeed() >= 8 then

		self.nextNavNodeDistance = 6;
	
		-- 100% mount speed or faster
		if player:GetSpeed() >= 10 or IsMounted() then
			self.nextNavNodeDistance = 8;
		end
	end

-- set timer
	if self.timer == 0 or self.timer == nil

		then self.timer = GetTimeEX();
	end

-- return for timer or for any reason
	if self.timer > GetTimeEX() then
		return;
	end
	
-- set nav smoothness
	NavmeshSmooth(self.nextNavNodeDistance/2);

-- get current position
	local myX, myY, myZ = PlayerPosition();

	local pathX, pathY, pathZ = GetPathPositionAtIndex(5, self.lastnavIndex);	

	-- If we are close to the next path node, increase our nav node index
	if (GetDistance3D(myX, myY, myZ, pathX, pathY, pathZ) <= 2) then
		self.lastnavIndex = 1 + self.lastnavIndex;		
		if (GetPathSize(5) <= self.lastnavIndex) then
			self.lastnavIndex = GetPathSize(5);
		end
	end              

-- If the target moves more than 2 yard then make a new path
	if (PlayerHasTarget() and GetTarget():IsFleeing() and IsInCombat() and GetDistance3D(_x, _y, _z, self.navPosition['x'], self.navPosition['y'], self.navPosition['z']) >= 2.5)
		
		or (not IsInCombat() and GetDistance3D(_x, _y, _z, self.navPosition['x'], self.navPosition['y'], self.navPosition['z']) >= 1)
		-- or node is out of bounds
		or GetDistance3D(myX, myY, myZ, pathX, pathY, pathZ + 1) >= 20
		-- or distance from path node is greater than next node distance
		or (IsPathLoaded(5) and IsMoving() and GetDistance3D(myX, myY, myZ, pathX, pathY, pathZ + 1) >= self.nextNavNodeDistance + 1.5)
		-- or if we force generate a new path
		or self.generateANewPath then
		-- reset nav position
		self.navPosition['x'] = _x;
		self.navPosition['y'] = _y;
		self.navPosition['z'] = _z;
		-- generate a new path
		GeneratePath(myX, myY, myZ, _x, _y, _z + 1);
		-- reset last nav index position
		self.lastnavIndex = 1; -- start at index 1, index 0 is our position
		-- reset generate a new path var
		self.generateANewPath = false;

		self.message = "Generating Path";
	end	
	
-- path isn't loaded
	if (not IsPathLoaded(5)) then
		self.timer = GetTimeEX() + 50;
		self.message = "Path is loading";
		return false;		-- return without pausing.... let the script load but continue moving to last "bad" path node
	end

-- Get the current path node's coordinates
	pathX, pathY, pathZ = GetPathPositionAtIndex(5, self.lastnavIndex);

	self.message = "Navigating...";

-- we are swimming, try to stay at top of water
	if not Player():IsDead() and not IsGhost() and IsSwimming() then

		-- + 1 each z move
		myX, myY, myZ = localObj:GetPosition();
		pathZ = myZ + 1;
	end

-- Move to the next destination in the path
	Move(pathX, pathY, pathZ + 2);

-- If we are close to the next path node, increase our nav node index
	if (GetDistance3D(myX, myY, myZ, pathX, pathY, pathZ) <= 3) then
		self.lastnavIndex = 1 + self.lastnavIndex;		
		if (GetPathSize(5) <= self.lastnavIndex) then
			self.lastnavIndex = GetPathSize(5);
		end
	end

-- set script timer
	self.timer = GetTimeEX() + 100;

	if not IsMoving() then
		self.generateANewPath = true;
	end

	if PlayerHasTarget() and GetTarget():IsFleeing() and IsInCombat() and not IsMoving() then
		if grind2.enemyTarget ~= nil and grind2.enemyTarget ~= 0 then
			if grind2.enemyTarget:GetDistance() > 3 and not grind2.enemyTarget:IsDead() then
				local x, y, z = grind2.enemyTarget:GetPosition();
				Move(x, y, z);
			end
		end
	end

return false;
end

function grind2MoveToTarget:resetNav() -- navPathPosition used for navigate
	local x, y, z = PlayerPosition();
	self.navPosition['x'] = x;
	self.navPosition['y'] = y;
	self.navPosition['z'] = z;
	self.lastPathIndex = -1;
	self.lastnavIndex = 0;
end