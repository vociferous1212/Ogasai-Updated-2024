desolaceGatherPaths = {

		desolacePaths = {},
		numDesolacePaths = 1,

}

function desolaceGatherPaths:addDesolacePath(id, x, y, z)

    local randomOffset = math.random(-3.24552, 4.12525);

    self.desolacePaths[self.numDesolacePaths] = {};
    self.desolacePaths[self.numDesolacePaths]['id'] = id;
    self.desolacePaths[self.numDesolacePaths]['pos'] = {};
    self.desolacePaths[self.numDesolacePaths]['pos']['x'] = x + randomOffset;
    self.desolacePaths[self.numDesolacePaths]['pos']['y'] = y + randomOffset;
    self.desolacePaths[self.numDesolacePaths]['pos']['z'] = z;

    self.numDesolacePaths = self.numDesolacePaths + 1;

end

function desolaceGatherPaths:setupDesolacePaths()

end