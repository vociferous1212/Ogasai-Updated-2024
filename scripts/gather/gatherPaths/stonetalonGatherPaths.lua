stonetalonGatherPaths = {

		stonetalonPaths = {},
		numStonetalonPaths = 1,

}

function stonetalonGatherPaths:addStonetalonPath(id, x, y, z)

    local randomOffset = math.random(-3.24552, 4.12525);

    self.stonetalonPaths[self.numStonetalonPaths] = {};
    self.stonetalonPaths[self.numStonetalonPaths]['id'] = id;
    self.stonetalonPaths[self.numStonetalonPaths]['pos'] = {};
    self.stonetalonPaths[self.numStonetalonPaths]['pos']['x'] = x + randomOffset;
    self.stonetalonPaths[self.numStonetalonPaths]['pos']['y'] = y + randomOffset;
    self.stonetalonPaths[self.numStonetalonPaths]['pos']['z'] = z;

    self.numStonetalonPaths = self.numStonetalonPaths + 1;

end

function stonetalonGatherPaths:setupStonetalonPaths()

end