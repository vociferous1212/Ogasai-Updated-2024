ashenvaleGatherPaths = {

		ashenvalePaths = {},
		numAshenvalePaths = 1,

}

function ashenvaleGatherPaths:addAshenvalePath(id, x, y, z)

    local randomOffset = math.random(-11.24552, 11.12525);

    self.ashenvalePaths[self.numAshenvalePaths] = {};
    self.ashenvalePaths[self.numAshenvalePaths]['id'] = id;
    self.ashenvalePaths[self.numAshenvalePaths]['pos'] = {};
    self.ashenvalePaths[self.numAshenvalePaths]['pos']['x'] = x + randomOffset;
    self.ashenvalePaths[self.numAshenvalePaths]['pos']['y'] = y + randomOffset;
    self.ashenvalePaths[self.numAshenvalePaths]['pos']['z'] = z;

    self.numAshenvalePaths = self.numAshenvalePaths + 1;

end

function ashenvaleGatherPaths:setupAshenvalePaths()

ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3360.4306640625, 219.38861083984, 12.802869796753);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3306.1794433594, 351.63711547852, 5.2041721343994);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3512.1567382813, 393.83197021484, 1.6547569036484);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3517.8991699219, 569.41381835938, 7.6685166358948);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3551.2661132813, 754.2431640625, 6.0169315338135);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3687.9968261719, 852.81384277344, 2.6796760559082);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3843.0500488281, 833.09851074219, 2.5605216026306);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3863.0834960938, 657.04632568359, 9.0137462615967);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3678.0400390625, 627.02471923828, 6.8620405197144);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3495.1767578125, 651.90490722656, 7.618371963501);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3277.1364746094, 554.89489746094, 0.05822491645813);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3138.9328613281, 447.20462036133, 5.935332775116);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3033.7407226563, 473.01998901367, 5.8486666679382);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3193.7016601563, 396.14093017578, 3.4779584407806);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3213.4328613281, 228.93910217285, 11.338026046753);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3098.7822265625, 225.84977722168, 38.214946746826);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3020.0126953125, 149.21258544922, 63.668533325195);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2893.259765625, 196.58294677734, 89.94654083252);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2824.4982910156, 2.2995758056641, 94.405059814453);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2709.111328125, -52.835704803467, 91.37321472168);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2532.759765625, 27.29501914978, 85.258834838867);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2413.8225097656, -12.079040527344, 94.943496704102);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2390.7224121094, -277.6936340332, 97.662353515625);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2295.7302246094, -388.18209838867, 95.691909790039);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2154.7917480469, -323.36740112305, 100.56874084473);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2033.2972412109, -531.43353271484, 99.583763122559);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2160.2839355469, -698.0234375, 104.1868057251);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2199.2080078125, -770.24096679688, 104.87306213379);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2482.1550292969, -765.47985839844, 132.57952880859);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2516.4465332031, -1007.0715332031, 128.90879821777);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2460.0439453125, -1194.001953125, 124.92975616455);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2270.6042480469, -1228.2313232422, 78.788414001465);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2157.8017578125, -1111.2677001953, 101.01150512695);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2260.189453125, -1483.2551269531, 89.992179870605);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2149.7868652344, -1633.6455078125, 81.282653808594);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2055.0668945313, -1707.6746826172, 69.619613647461);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2149.5947265625, -2028.212890625, 101.58424377441);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2279.6274414063, -2186.9650878906, 108.5348739624);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2417.0092773438, -2293.3684082031, 132.42654418945);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2611.3774414063, -2411.3986816406, 165.5807800293);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2775.3112792969, -2430.4025878906, 202.96006774902);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2720.3974609375, -2226.6123046875, 196.89524841309);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2865.1535644531, -2137.1831054688, 203.37051391602);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2986.12890625, -2051.3537597656, 201.79522705078);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2976.8542480469, -1924.0140380859, 170.14324951172);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2794.6865234375, -1954.9956054688, 164.15447998047);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2598.3005371094, -1928.6304931641, 150.35066223145);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2441.3947753906, -1841.8055419922, 130.66828918457);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2304.9191894531, -1764.1978759766, 115.39309692383);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2356.5744628906, -1591.2932128906, 125.28608703613);

end