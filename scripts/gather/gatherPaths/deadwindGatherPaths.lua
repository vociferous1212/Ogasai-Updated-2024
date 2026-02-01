deadwindGatherPaths = {

	deadwindPaths = {},
	numDeadwindPaths = 1,

}

function deadwindGatherPaths:addDeadwindPath(id, x, y, z)

	local randomOffset = math.random(-6.24552, 5.12525);

	self.deadwindPaths[self.numDeadwindPaths] = {};
	self.deadwindPaths[self.numDeadwindPaths]['id'] = id;
	self.deadwindPaths[self.numDeadwindPaths]['pos'] = {};
	self.deadwindPaths[self.numDeadwindPaths]['pos']['x'] = x + randomOffset;
	self.deadwindPaths[self.numDeadwindPaths]['pos']['y'] = y + randomOffset;
	self.deadwindPaths[self.numDeadwindPaths]['pos']['z'] = z;

	self.numDeadwindPaths = self.numDeadwindPaths + 1;

end

function deadwindGatherPaths:setupDeadwindPaths()

deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10465.151367188, -1674.6602783203, 79.416679382324);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10461.646484375, -1714.9588623047, 83.302558898926);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10451.641601563, -1755.2368164063, 90.020324707031);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10431.301757813, -1790.1436767578, 97.014106750488);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10432.116210938, -1830.40625, 101.23394775391);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10442.626953125, -1869.5269775391, 104.80292510986);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10441.204101563, -1909.5063476563, 103.9400177002);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10438.987304688, -1949.8917236328, 103.69734191895);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10437.618164063, -1990.1337890625, 99.854278564453);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10435.879882813, -2030.7097167969, 95.448997497559);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10473.99609375, -2043.7552490234, 93.331657409668);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10513.125, -2053.3962402344, 91.993698120117);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10538.763671875, -2085.1291503906, 91.327415466309);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10567.80859375, -2113.2172851563, 91.022918701172);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10592.377929688, -2145.5283203125, 93.079391479492);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10587.2890625, -2185.6159667969, 89.985107421875);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10577.671875, -2224.9404296875, 92.807929992676);
deadwindGatherPaths:addDeadwindPath(self.numDeadwindPaths, -10565.96484375, -2263.6689453125, 94.295967102051);

end

