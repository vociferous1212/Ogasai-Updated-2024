moongladeGatherPaths = {

	moongladePaths = {},
	numMoongladePaths = 1,

}

function moongladeGatherPaths:addMoongladePath(id, x, y, z)

    local randomOffset = math.random(-6.24552, 5.12525);

    self.moongladePaths[self.numMoongladePaths] = {};
    self.moongladePaths[self.numMoongladePaths]['id'] = id;
    self.moongladePaths[self.numMoongladePaths]['pos'] = {};
    self.moongladePaths[self.numMoongladePaths]['pos']['x'] = x + randomOffset;
    self.moongladePaths[self.numMoongladePaths]['pos']['y'] = y + randomOffset;
    self.moongladePaths[self.numMoongladePaths]['pos']['z'] = z;

    self.numMoongladePaths = self.numMoongladePaths + 1;

end

function moongladeGatherPaths:setupMoongladePaths()
moongladeGatherPaths:addMoongladePath(self.numMoongladePaths, 7715.763671875, -2229.5261230469, 454.541015625);
moongladeGatherPaths:addMoongladePath(self.numMoongladePaths, 7770.7602539063, -2258.3989257813, 455.03405761719);
moongladeGatherPaths:addMoongladePath(self.numMoongladePaths, 7822.328125, -2292.7751464844, 457.59378051758);
moongladeGatherPaths:addMoongladePath(self.numMoongladePaths, 7880.6313476563, -2311.0290527344, 465.9143371582);
moongladeGatherPaths:addMoongladePath(self.numMoongladePaths, 7940.4799804688, -2316.5217285156, 475.77044677734);
moongladeGatherPaths:addMoongladePath(self.numMoongladePaths, 7961.3701171875, -2373.5234375, 486.36547851563);
end
