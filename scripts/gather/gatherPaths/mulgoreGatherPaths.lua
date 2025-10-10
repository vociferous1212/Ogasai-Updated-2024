mulgoreGatherPaths = {

		mulgorePaths = {},
		numMulgorePaths = 1,

}

function mulgoreGatherPaths:addMulgorePath(id, x, y, z)

    local randomOffset = math.random(-11.24552, 11.12525);

    self.mulgorePaths[self.numMulgorePaths] = {};
    self.mulgorePaths[self.numMulgorePaths]['id'] = id;
    self.mulgorePaths[self.numMulgorePaths]['pos'] = {};
    self.mulgorePaths[self.numMulgorePaths]['pos']['x'] = x + randomOffset;
    self.mulgorePaths[self.numMulgorePaths]['pos']['y'] = y + randomOffset;
    self.mulgorePaths[self.numMulgorePaths]['pos']['z'] = z;

    self.numMulgorePaths = self.numMulgorePaths + 1;

end

function mulgoreGatherPaths:setupMulgorePaths()



end