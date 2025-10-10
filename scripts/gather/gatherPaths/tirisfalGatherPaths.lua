tirisfalGatherPaths = {

		tirisfalPaths = {},
		numTirisfalPaths = 1,

}

function tirisfalGatherPaths:addTirisfalPath(id, x, y, z)

    local randomOffset = math.random(-11.24552, 11.12525);

    self.tirisfalPaths[self.numTirisfalPaths] = {};
    self.tirisfalPaths[self.numTirisfalPaths]['id'] = id;
    self.tirisfalPaths[self.numTirisfalPaths]['pos'] = {};
    self.tirisfalPaths[self.numTirisfalPaths]['pos']['x'] = x + randomOffset;
    self.tirisfalPaths[self.numTirisfalPaths]['pos']['y'] = y + randomOffset;
    self.tirisfalPaths[self.numTirisfalPaths]['pos']['z'] = z;

    self.numTirisfalPaths = self.numTirisfalPaths + 1;

end

function tirisfalGatherPaths:setupTirisfalPaths()



end