teldrassilGatherPaths = {

		teldrassilPaths = {},
		numTeldrassilPaths = 1,


}

function teldrassilGatherPaths:addTeldrassilPath(id, x, y, z)

	-- don't run the same path every load - add some random offset each reload
	local randomOffset = math.random(-9.24552, 8.12525);

	self.teldrassilPaths[self.numTeldrassilPaths] = {};
	self.teldrassilPaths[self.numTeldrassilPaths]['id'] = id;
	self.teldrassilPaths[self.numTeldrassilPaths]['pos'] = {};
	self.teldrassilPaths[self.numTeldrassilPaths]['pos']['x'] = x + randomOffset;
	self.teldrassilPaths[self.numTeldrassilPaths]['pos']['y'] = y + randomOffset;
	self.teldrassilPaths[self.numTeldrassilPaths]['pos']['z'] = z;

	self.numTeldrassilPaths = self.numTeldrassilPaths + 1;

end

function teldrassilGatherPaths:setupTeldrassilPaths()


teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9859.1357421875, 837.70007324219, 1307.5875244141);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9882.845703125, 707.32305908203, 1306.1882324219);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9994.6650390625, 571.76043701172, 1313.6987304688);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9975.4111328125, 369.96340942383, 1312.0216064453);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9906.9404296875, 405.37265014648, 1308.0438232422);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9796.6220703125, 391.99719238281, 1310.5294189453);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9682.814453125, 430.6217956543, 1316.5985107422);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9681.5927734375, 539.52325439453, 1308.5744628906);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9774.8828125, 631.07415771484, 1295.6512451172);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9736.361328125, 746.71063232422, 1295.1959228516);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9598.1025390625, 725.22735595703, 1264.7219238281);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9463.1015625, 705.39752197266, 1264.3898925781);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9382.849609375, 762.68243408203, 1261.8121337891);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9335.291015625, 697.82672119141, 1309.4652099609);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9270.47265625, 744.34149169922, 1318.4395751953);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9233.28515625, 872.06146240234, 1326.3870849609);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9336.55859375, 937.86468505859, 1297.3308105469);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9244.7294921875, 1053.5040283203, 1312.4468994141);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9224.4482421875, 1213.5728759766, 1313.1043701172);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9171.5556640625, 1395.9772949219, 1319.4915771484);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9203.9140625, 1521.3173828125, 1307.6148681641);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9298.662109375, 1517.5661621094, 1279.6013183594);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9360.9482421875, 1620.7836914063, 1288.0865478516);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9518.5810546875, 1624.8157958984, 1301.3259277344);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9484.51171875, 1799.9943847656, 1315.8568115234);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9610.673828125, 1832.6821289063, 1296.6068115234);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9817.9208984375, 1739.6442871094, 1316.73828125);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9989.76171875, 1784.0445556641, 1334.3276367188);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 10154.178710938, 1856.9169921875, 1328.6097412109);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 10347.125, 1877.6315917969, 1325.0062255859);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 10552.8828125, 1888.1623535156, 1314.9180908203);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 10651.198242188, 1819.8892822266, 1326.6475830078);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 10522.66015625, 1741.3564453125, 1306.8349609375);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 10376.873046875, 1661.5621337891, 1294.7982177734);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 10394.700195313, 1516.3699951172, 1310.6314697266);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 10589.869140625, 1482.1130371094, 1317.4583740234);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 10864.991210938, 1454.390625, 1304.9498291016);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 10572.28125, 1547.0838623047, 1309.8078613281);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 10472.411132813, 1548.6579589844, 1304.6931152344);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 10299.745117188, 1437.4545898438, 1342.2163085938);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 10181.533203125, 1473.8454589844, 1330.2750244141);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 10057.1328125, 1295.0089111328, 1314.0592041016);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9911.306640625, 1217.4637451172, 1307.8369140625);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9826.146484375, 1214.4893798828, 1286.5202636719);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9687.5888671875, 1207.8966064453, 1270.4539794922);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9573.67578125, 1150.8172607422, 1268.7453613281);
teldrassilGatherPaths:addTeldrassilPath(self.numTeldrassilPaths, 9593.689453125, 935.12261962891, 1266.5445556641);

end