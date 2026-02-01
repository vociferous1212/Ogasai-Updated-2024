blastedlandsGatherPaths = {

	blastedlandsPaths = {},
	numBlastedlandsPaths = 1,

}


function blastedlandsGatherPaths:addBlastedlandsPath(id, x, y, z)

	local randomOffset = math.random(-6.24552, 5.12525);

	self.blastedlandsPaths[self.numBlastedlandsPaths] = {};
	self.blastedlandsPaths[self.numBlastedlandsPaths]['id'] = id;
	self.blastedlandsPaths[self.numBlastedlandsPaths]['pos'] = {};
	self.blastedlandsPaths[self.numBlastedlandsPaths]['pos']['x'] = x + randomOffset;
	self.blastedlandsPaths[self.numBlastedlandsPaths]['pos']['y'] = y + randomOffset;
	self.blastedlandsPaths[self.numBlastedlandsPaths]['pos']['z'] = z;

	self.numBlastedlandsPaths = self.numBlastedlandsPaths + 1;

end

function blastedlandsGatherPaths:setupBlastedlandsPaths()
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -10909.896484375, -2928.9543457031, 12.835256576538);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -10945.034179688, -2879.9018554688, 8.8703718185425);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -10968.484375, -2824.4790039063, 8.3689908981323);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -10963.322265625, -2764.03515625, 5.2778143882751);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11018.751953125, -2738.6799316406, 5.9774460792542);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11078.702148438, -2735.8508300781, 13.213745117188);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11138.834960938, -2736.2492675781, 13.688306808472);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11198.567382813, -2729.3444824219, 14.789912223816);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11259.627929688, -2727.5825195313, 12.419328689575);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11318.638671875, -2738.8090820313, 8.6769456863403);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11378.608398438, -2743.2670898438, 6.5370402336121);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11438.7109375, -2744.6662597656, 7.1827526092529);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11498.892578125, -2745.3422851563, 4.0972204208374);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11558.7265625, -2754.9853515625, 5.3292384147644);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11606.670898438, -2792.7470703125, 3.666690826416);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11649.87109375, -2834.4921875, 0.85314106941223);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11698.28125, -2870.1584472656, -0.15757995843887);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11739.143554688, -2915.4211425781, 5.3516445159912);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11738.713867188, -2976.0900878906, 8.9533386230469);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11694.483398438, -3017.1767578125, 11.509379386902);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11645.708007813, -3052.4606933594, 10.294111251831);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11620.321289063, -3107.7734375, 9.6665191650391);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11616.2734375, -3168.4885253906, 9.7384548187256);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11590.681640625, -3223.6574707031, 6.7604470252991);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11562.432617188, -3276.6591796875, 8.6310186386108);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11510.02734375, -3309.2111816406, 8.6961765289307);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11453.161132813, -3330.6945800781, 8.3727655410767);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11399.282226563, -3302.9604492188, 6.1663155555725);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11377.274414063, -3246.927734375, 3.5203375816345);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11357.977539063, -3189.2087402344, 12.597348213196);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11356.876953125, -3129.09375, 4.7986688613892);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11328.98828125, -3075.5974121094, 1.4261212348938);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11285.987304688, -3033.7131347656, 0.97720193862915);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11226.794921875, -3019.6557617188, 6.1972322463989);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11199.974609375, -3073.9282226563, 7.8741402626038);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11171.9765625, -3129.2626953125, 9.9548797607422);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11181.796875, -3188.7004394531, 6.4818587303162);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11191.9453125, -3248.2241210938, 10.381150245667);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11132.49609375, -3239.3803710938, 9.9878749847412);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11076.21875, -3218.5012207031, 23.907848358154);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11039.552734375, -3170.2963867188, 41.957370758057);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11092.55859375, -3140.7724609375, 41.335983276367);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -11023.530273438, -3112.37890625, 43.538024902344);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -10965.200195313, -3097.7702636719, 43.69017791748);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -10911.948242188, -3070.1083984375, 45.506824493408);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -10861.012695313, -3036.8146972656, 47.901828765869);
blastedlandsGatherPaths:addBlastedlandsPath(self.numBlastedlandsPaths, -10863.521484375, -2976.2065429688, 22.229417800903);

end