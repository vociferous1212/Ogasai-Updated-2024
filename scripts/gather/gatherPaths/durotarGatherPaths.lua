durotarGatherPaths = {

		durotarPaths = {},
		numDurotarPaths = 1,

}

function durotarGatherPaths:addDurotarPath(id, x, y, z)

    local randomOffset = math.random(-4.24552, 6.12525);

    self.durotarPaths[self.numDurotarPaths] = {};
    self.durotarPaths[self.numDurotarPaths]['id'] = id;
    self.durotarPaths[self.numDurotarPaths]['pos'] = {};
    self.durotarPaths[self.numDurotarPaths]['pos']['x'] = x + randomOffset;
    self.durotarPaths[self.numDurotarPaths]['pos']['y'] = y + randomOffset;
    self.durotarPaths[self.numDurotarPaths]['pos']['z'] = z;

    self.numDurotarPaths = self.numDurotarPaths + 1;

end

function durotarGatherPaths:setupDurotarPaths()



end