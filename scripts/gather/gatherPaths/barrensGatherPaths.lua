barrensGatherPaths = {

		barrensPaths = {},
		numBarrensPaths = 1,

}


function barrensGatherPaths:addBarrensPath(id, x, y, z)

    -- don't run the same path every load - add some random offset each reload
    local randomOffset = math.random(-15.24552, 15.12525);

    self.barrensPaths[self.numBarrensPaths] = {};
    self.barrensPaths[self.numBarrensPaths]['id'] = id;
    self.barrensPaths[self.numBarrensPaths]['pos'] = {};
    self.barrensPaths[self.numBarrensPaths]['pos']['x'] = x + randomOffset;
    self.barrensPaths[self.numBarrensPaths]['pos']['y'] = y + randomOffset;
    self.barrensPaths[self.numBarrensPaths]['pos']['z'] = z;

    self.numBarrensPaths = self.numBarrensPaths + 1;

end

function barrensGatherPaths:setupBarrensPaths()


end