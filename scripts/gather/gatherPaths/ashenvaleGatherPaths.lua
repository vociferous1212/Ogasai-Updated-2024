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

ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3541.1499023438, 59.090579986572, 7.3261308670044);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3694.3669433594, 14.846064567566, 3.3157734870911);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3894.0881347656, 39.353881835938, 15.250705718994);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3899.3947753906, -106.80947875977, 5.6717958450317);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3774.1645507813, -116.48118591309, -0.22014997899532);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3621.0573730469, -175.02238464355, 3.9702343940735);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3516.4919433594, -108.33492279053, 1.8849503993988);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3459.2082519531, -30.171146392822, 5.9125742912292);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3374.1604003906, 113.60749053955, 0.86109519004822);
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
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2004.3585205078, -1907.1469726563, 98.504432678223);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1973.0852050781, -1986.7160644531, 96.8349609375);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1941.1314697266, -2124.0029296875, 94.897773742676);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1856.2247314453, -2174.6728515625, 96.452644348145);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1727.5124511719, -2186.4724121094, 91.544548034668);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1622.5274658203, -2221.9631347656, 94.968215942383);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1520.2674560547, -2227.193359375, 95.061462402344);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1445.2640380859, -2297.7687988281, 89.958976745605);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1491.2170410156, -2408.5964355469, 102.38380432129);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1617.8117675781, -2437.1674804688, 104.76062774658);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1669.458984375, -2505.697265625, 97.135185241699);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1741.0270996094, -2480.6398925781, 92.567367553711);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1805.8791503906, -2439.5258789063, 88.727729797363);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1881.4545898438, -2457.6520996094, 75.262840270996);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1803.6188964844, -2568.3852539063, 82.968269348145);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1861.5258789063, -2663.9694824219, 94.013114929199);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1884.5552978516, -2777.84375, 100.14105987549);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1977.8303222656, -2685.9143066406, 104.65009307861);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2103.9096679688, -2714.9262695313, 107.05550384521);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2060.4577636719, -2818.9685058594, 109.12100219727);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2043.1403808594, -2924.5319824219, 108.26073455811);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2130.1037597656, -2940.1765136719, 115.10512542725);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2176.6743164063, -2975.4467773438, 119.29717254639);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2124.9680175781, -3090.0791015625, 109.37146759033);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1993.4947509766, -3139.0383300781, 102.23568725586);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1881.482421875, -3160.0229492188, 95.833030700684);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1761.6614990234, -3174.6049804688, 90.383422851563);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1679.9342041016, -3114.2375488281, 89.334609985352);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1621.1301269531, -3054.3427734375, 89.761199951172);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1739.3277587891, -3172.3334960938, 91.651016235352);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1833.3247070313, -3182.98828125, 92.529731750488);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1920.8757324219, -3151.7414550781, 97.672225952148);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1923.5062255859, -3032.4909667969, 100.95098876953);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2001.0396728516, -2940.8203125, 108.14962005615);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2041.1398925781, -2935.095703125, 108.22602081299);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2066.2294921875, -2817.5385742188, 109.12307739258);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2177.9890136719, -2636.2084960938, 108.16841125488);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2079.1186523438, -2530.88671875, 96.271301269531);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1995.3786621094, -2381.9431152344, 88.602264404297);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 1945.0086669922, -2265.7604980469, 92.173805236816);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2041.1904296875, -2271.7993164063, 108.10636901855);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2148.4445800781, -2292.244140625, 97.651336669922);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2211.0422363281, -2222.9172363281, 102.15710449219);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2279.6274414063, -2186.9650878906, 108.5348739624);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2417.0092773438, -2293.3684082031, 132.42654418945);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2472.3359375, -2295.1845703125, 139.43310546875);
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
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2380.9462890625, -1477.208984375, 125.28603363037);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2437.9521484375, -1303.2561035156, 125.27146148682);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2501.4907226563, -1084.0609130859, 127.73024749756);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2521.4887695313, -955.58068847656, 129.96231079102);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2528.8884277344, -847.82824707031, 132.81056213379);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2690.7741699219, -827.26129150391, 143.80889892578);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2830.1437988281, -793.56616210938, 154.23432922363);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2910.4067382813, -786.82116699219, 165.27551269531);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2942.244140625, -912.51263427734, 195.76596069336);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2962.4978027344, -742.37585449219, 170.89456176758);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3069.5661621094, -656.89874267578, 168.22624206543);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3161.0705566406, -561.63732910156, 149.84144592285);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3274.4985351563, -547.69219970703, 156.72816467285);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3369.5229492188, -427.51473999023, 150.53036499023);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3400.5747070313, -329.23709106445, 135.26264953613);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3252.2641601563, -242.4829864502, 120.98025512695);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 3132.4924316406, -178.16929626465, 107.60642242432);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2978.36328125, -108.45629882813, 97.739334106445);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2858.544921875, -29.05924987793, 98.554168701172);
ashenvaleGatherPaths:addAshenvalePath(self.numAshenvalePaths, 2865.673828125, 160.59555053711, 98.705589294434);

end