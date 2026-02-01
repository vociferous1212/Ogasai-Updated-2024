duskwoodGatherPaths = {

		duskwoodPaths = {},
		numDuskwoodPaths = 1,

}


function duskwoodGatherPaths:addDuskwoodPath(id, x, y, z)

	local randomOffset = math.random(-12.24552, 10.12525);

	self.duskwoodPaths[self.numDuskwoodPaths] = {};
	self.duskwoodPaths[self.numDuskwoodPaths]['id'] = id;
	self.duskwoodPaths[self.numDuskwoodPaths]['pos'] = {};
	self.duskwoodPaths[self.numDuskwoodPaths]['pos']['x'] = x + randomOffset;
	self.duskwoodPaths[self.numDuskwoodPaths]['pos']['y'] = y + randomOffset;
	self.duskwoodPaths[self.numDuskwoodPaths]['pos']['z'] = z;

	self.numDuskwoodPaths = self.numDuskwoodPaths + 1;

end

function duskwoodGatherPaths:setupDuskwoodPaths()

duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -11052.326171875, 206.88948059082, 27.017719268799);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10960.849609375, 287.80227661133, 29.192354202271);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10864.287109375, 353.76754760742, 41.441284179688);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10891.8203125, 499.66268920898, 34.883014678955);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10704.783203125, 482.30725097656, 35.617790222168);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10560.250976563, 489.66329956055, 31.521965026855);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10526.16796875, 440.28253173828, 37.127182006836);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10440.727539063, 552.25891113281, 25.936674118042);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10308.653320313, 545.92517089844, 42.920932769775);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10246.151367188, 432.41372680664, 47.873184204102);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10262.431640625, 310.25006103516, 45.638278961182);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10267.776367188, 165.04614257813, 34.691539764404);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10245.43359375, 43.247699737549, 43.329635620117);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10248.0625, -87.751235961914, 37.006282806396);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10171.114257813, -159.60900878906, 30.651443481445);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10084.756835938, -231.95555114746, 32.34200668335);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10052.392578125, -344.97640991211, 30.76594543457);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10005.510742188, -472.10784912109, 35.832225799561);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10033.360351563, -643.24096679688, 41.841781616211);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10112.620117188, -805.34527587891, 36.336315155029);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10191.025390625, -885.12084960938, 39.460826873779);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10307.607421875, -920.57543945313, 38.268180847168);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10416.982421875, -899.66436767578, 48.4521484375);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10535.084960938, -913.94378662109, 46.883605957031);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10631.208007813, -939.02185058594, 57.392013549805);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10677.8515625, -849.04534912109, 63.011341094971);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10641.20703125, -767.20239257813, 57.511898040771);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10742.650390625, -675.71331787109, 41.617530822754);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10815.448242188, -611.95483398438, 39.383907318115);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10825.80859375, -502.27984619141, 42.427867889404);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10905.03515625, -397.08303833008, 41.155586242676);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10852.2890625, -223.01316833496, 38.081432342529);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10811.70703125, -97.255561828613, 29.256862640381);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10679.7734375, -89.668678283691, 34.399234771729);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10528.455078125, -61.217247009277, 44.502841949463);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10404.805664063, -33.303646087646, 48.183197021484);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10277.38671875, -4.3934893608093, 44.11353302002);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10292.91796875, 79.961891174316, 38.762580871582);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10389.749023438, 124.70890808105, 32.384063720703);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10410.874023438, 221.14730834961, 33.425846099854);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10382.06640625, 325.46298217773, 43.910846710205);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10475.103515625, 295.89343261719, 34.05802154541);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10548.510742188, 289.30239868164, 29.997388839722);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10674.241210938, 290.91024780273, 39.25333404541);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10779.489257813, 280.91955566406, 40.902805328369);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10908.724609375, 240.20401000977, 29.092338562012);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10926.923828125, 109.94149017334, 40.192844390869);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10806.700195313, -50.841682434082, 31.664255142212);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10871.580078125, -255.07835388184, 38.740524291992);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10949.60546875, -322.45687866211, 32.805461883545);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10993.344726563, -168.6569519043, 16.041549682617);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -11024.638671875, -75.034820556641, 15.795708656311);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -11024.646484375, -192.10464477539, 16.211116790771);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10904.700195313, -397.30044555664, 41.135787963867);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10917.009765625, -537.08355712891, 54.198455810547);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10949.330078125, -660.20092773438, 55.373626708984);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10861.495117188, -783.33880615234, 56.394886016846);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -11004.733398438, -860.85168457031, 62.876697540283);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -11027.2421875, -946.00439453125, 65.774551391602);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10907.024414063, -1008.8377075195, 76.089599609375);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10804.903320313, -1001.1480712891, 52.313819885254);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10769.827148438, -1124.4207763672, 28.4371509552);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10821.235351563, -1210.5466308594, 38.997997283936);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10926.443359375, -1246.7965087891, 47.695728302002);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10994.971679688, -1310.3455810547, 52.725395202637);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10971.221679688, -1344.1987304688, 52.016819000244);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10861.668945313, -1351.9822998047, 51.106307983398);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10777.708984375, -1348.9029541016, 37.606800079346);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10698.38671875, -1377.2696533203, 39.171779632568);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10630.546875, -1372.9600830078, 55.680011749268);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10645.248046875, -1309.0711669922, 45.92085647583);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10651.864257813, -1193.0988769531, 28.601852416992);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10468.202148438, -1180.2420654297, 27.596424102783);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10389.395507813, -1114.8022460938, 22.228372573853);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10345.291015625, -1256.8254394531, 35.302436828613);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10215.852539063, -1147.2735595703, 22.5042552948);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10092.76171875, -1252.2823486328, 29.553131103516);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10058.251953125, -1206.8673095703, 30.298992156982);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10094.236328125, -995.94140625, 32.613082885742);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10160.658203125, -871.41955566406, 34.632396697998);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10158.27734375, -714.96728515625, 41.599269866943);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10063.4140625, -607.21661376953, 46.614414215088);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10021.587890625, -493.88858032227, 42.335620880127);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10043.896484375, -341.67626953125, 29.205169677734);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10100.120117188, -262.17422485352, 31.432424545288);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10210.1953125, -148.36424255371, 34.048477172852);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10245.096679688, -57.125255584717, 38.594711303711);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10289.119140625, 60.06290435791, 40.70671081543);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10272.685546875, 192.05535888672, 36.178123474121);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10273.005859375, 367.38507080078, 59.443252563477);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10268.801757813, 515.80920410156, 30.677616119385);
duskwoodGatherPaths:addDuskwoodPath(self.numDuskwoodPaths, -10339.552734375, 652.36724853516, 28.004480361938);


end
