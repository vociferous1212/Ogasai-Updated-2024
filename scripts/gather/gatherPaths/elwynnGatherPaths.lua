elwynnGatherPaths = {
			
		elwynnPaths = {},
		numElwynnPaths = 1,

}

function elwynnGatherPaths:addElwynnPath(id, x, y, z)

    local randomOffset = math.random(-15.24552, 15.12525);

    self.elwynnPaths[self.numElwynnPaths] = {};
    self.elwynnPaths[self.numElwynnPaths]['id'] = id;
    self.elwynnPaths[self.numElwynnPaths]['pos'] = {};
    self.elwynnPaths[self.numElwynnPaths]['pos']['x'] = x + randomOffset;
    self.elwynnPaths[self.numElwynnPaths]['pos']['y'] = y + randomOffset;
    self.elwynnPaths[self.numElwynnPaths]['pos']['z'] = z;

    self.numElwynnPaths = self.numElwynnPaths + 1;

end

function elwynnGatherPaths:setupElwynnPaths()

elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9181.8994140625, 129.94761657715, 73.046203613281);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9218.3408203125, 276.45751953125, 73.40665435791);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9235.0458984375, 416.73812866211, 87.55973815918);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9361.248046875, 334.71850585938, 62.53267288208);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9533.5537109375, 305.65185546875, 52.290828704834);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9685.9599609375, 364.57870483398, 42.657093048096);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9616.251953125, 607.19964599609, 42.575531005859);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9662.0791015625, 789.96258544922, 34.962451934814);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9819.09765625, 666.22003173828, 34.829040527344);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9980.0966796875, 552.92926025391, 37.675750732422);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9972.0625, 428.67733764648, 36.288341522217);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9814.6982421875, 312.9807434082, 37.97546005249);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9701.3525390625, 195.56683349609, 50.150131225586);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9712.1669921875, 77.791076660156, 51.319538116455);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9848.8095703125, -33.817375183105, 25.151174545288);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9765.2822265625, -178.4787902832, 35.751842498779);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9771.8203125, -346.6516418457, 52.461082458496);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9701.0673828125, -432.67947387695, 50.887844085693);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9716.970703125, -576.2958984375, 45.605415344238);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9739.076171875, -730.36846923828, 40.991542816162);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9765.2978515625, -864.05969238281, 39.493644714355);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9899.0654296875, -990.91351318359, 29.092885971069);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9624.185546875, -964.82641601563, 44.251068115234);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9616.7861328125, -1119.4949951172, 42.171878814697);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9737.1875, -1128.9069824219, 38.930332183838);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9825.1689453125, -1222.2703857422, 36.999439239502);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9898.8046875, -1350.0054931641, 32.792507171631);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9791.8642578125, -1495.1993408203, 43.319980621338);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9654.8232421875, -1465.4172363281, 54.66170501709);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9533.048828125, -1483.93359375, 61.625606536865);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9419.802734375, -1440.0797119141, 59.554882049561);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9325.818359375, -1352.8811035156, 66.212783813477);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9288.939453125, -1247.4813232422, 70.706733703613);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9305.3037109375, -1164.5731201172, 69.054420471191);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9385.880859375, -1122.8677978516, 61.418880462646);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9407.4619140625, -1089.5699462891, 59.919651031494);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9428.705078125, -1056.3905029297, 59.554809570313);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9427.666015625, -975.08343505859, 62.664348602295);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9389.6943359375, -868.15240478516, 65.320419311523);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9301.4150390625, -725.71820068359, 65.292510986328);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9424.7744140625, -638.48687744141, 66.636116027832);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9460.2236328125, -539.77105712891, 65.364151000977);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9348.74609375, -481.87380981445, 68.756713867188);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9328.4140625, -368.93557739258, 68.273284912109);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9316.90625, -243.7536315918, 68.216323852539);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9302.1455078125, -158.32983398438, 62.411365509033);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9300.2490234375, -133.66288757324, 63.113868713379);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9248.474609375, -37.481712341309, 72.203765869141);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9201.177734375, 58.236961364746, 77.922569274902);
elwynnGatherPaths:addElwynnPath(self.numElwynnPaths, -9209.8671875, 123.3486328125, 73.410049438477);

end