winterspringGatherPaths = {

		winterspringPaths = {},
		numWinterspringPaths = 1,

}


function winterspringGatherPaths:addWinterspringPath(id, x, y, z)

    local randomOffset = math.random(-7.24552, 5.12525);

    self.winterspringPaths[self.numWinterspringPaths] = {};
    self.winterspringPaths[self.numWinterspringPaths]['id'] = id;
    self.winterspringPaths[self.numWinterspringPaths]['pos'] = {};
    self.winterspringPaths[self.numWinterspringPaths]['pos']['x'] = x + randomOffset;
    self.winterspringPaths[self.numWinterspringPaths]['pos']['y'] = y + randomOffset;
    self.winterspringPaths[self.numWinterspringPaths]['pos']['z'] = z;

    self.numWinterspringPaths = self.numWinterspringPaths + 1;

end

function winterspringGatherPaths:setupWinterspringPaths()

end