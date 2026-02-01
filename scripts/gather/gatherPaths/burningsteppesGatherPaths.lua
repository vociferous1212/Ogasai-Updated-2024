burningsteppesGatherPaths = {

	burningsteppesPaths = {},
	numBurningsteppesPaths = 1,

}

function burningsteppesGatherPaths:addBurningsteppesPath(id, x, y, z)

	local randomOffset = math.random(-6.24552, 5.12525);

	self.burningsteppesPaths[self.numBurningsteppesPaths] = {};
	self.burningsteppesPaths[self.numBurningsteppesPaths]['id'] = id;
	self.burningsteppesPaths[self.numBurningsteppesPaths]['pos'] = {};
	self.burningsteppesPaths[self.numBurningsteppesPaths]['pos']['x'] = x + randomOffset;
	self.burningsteppesPaths[self.numBurningsteppesPaths]['pos']['y'] = y + randomOffset;
	self.burningsteppesPaths[self.numBurningsteppesPaths]['pos']['z'] = z;

	self.numBurningsteppesPaths = self.numBurningsteppesPaths + 1;

end

function burningsteppesGatherPaths:setupBurningsteppesPaths()

burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8247.3115234375, -2597.0895996094, 133.14923095703);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8242.087890625, -2657.5793457031, 133.44671630859);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8220.2021484375, -2714.5161132813, 134.2899017334);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8204.6435546875, -2773.4721679688, 138.18919372559);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8172.6684570313, -2824.2563476563, 136.25773620605);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8126.3295898438, -2862.6784667969, 136.06181335449);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8075.7592773438, -2896.69140625, 135.03511047363);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8015.4633789063, -2903.9379882813, 133.73139953613);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7955.1499023438, -2895.8220214844, 134.67958068848);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7895.0927734375, -2898.7778320313, 134.10624694824);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7835.3413085938, -2910.458984375, 132.37750244141);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7777.7275390625, -2927.669921875, 131.45933532715);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7719.6713867188, -2943.515625, 133.35577392578);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7658.8959960938, -2941.0439453125, 131.87434387207);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7630.2016601563, -2887.3369140625, 132.82942199707);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7619.8354492188, -2828.1188964844, 133.37283325195);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7884.5224609375, -2379.6323242188, 131.76686096191);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7907.9829101563, -2435.71484375, 132.13830566406);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7963.8266601563, -2458.9499511719, 133.38366699219);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8023.1674804688, -2469.0849609375, 132.21821594238);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8082.9653320313, -2474.0275878906, 136.32774353027);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8121.5537109375, -2427.0014648438, 130.51266479492);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8109.1196289063, -2367.8828125, 129.00028991699);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8052.69140625, -2345.6301269531, 129.51887512207);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8004.5517578125, -2306.4099121094, 129.99186706543);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7963.248046875, -2261.5578613281, 128.88925170898);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7971.0810546875, -2202.0356445313, 128.41955566406);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7989.1782226563, -2144.6213378906, 126.34778594971);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8007.6435546875, -2086.7995605469, 131.12727355957);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8039.7846679688, -2035.3106689453, 132.52770996094);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8019.669921875, -1978.6429443359, 136.59561157227);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7966.6704101563, -1949.4916992188, 135.87733459473);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7908.6171875, -1931.552734375, 131.66355895996);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7870.3393554688, -1884.6976318359, 136.25291442871);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7819.5688476563, -1917.0626220703, 135.65534973145);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7776.9428710938, -1959.3225097656, 133.7008972168);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7730.640625, -1998.0994873047, 133.43936157227);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7679.947265625, -1965.8208007813, 134.04377746582);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7682.5283203125, -1905.4937744141, 136.65342712402);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7696.6420898438, -1846.0350341797, 133.46897888184);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7683.9326171875, -1786.5848388672, 133.115234375);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7700.07421875, -1728.2009277344, 132.36215209961);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7725.0864257813, -1672.7287597656, 130.87115478516);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7757.3447265625, -1620.9724121094, 132.08618164063);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7773.689453125, -1562.5865478516, 133.24188232422);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7816.30859375, -1520.0736083984, 134.19342041016);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7816.3803710938, -1459.8365478516, 135.91799926758);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7876.9814453125, -1454.1185302734, 144.7946472168);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7937.1958007813, -1458.3463134766, 148.57124328613);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7939.2163085938, -1397.5355224609, 136.92094421387);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7972.626953125, -1347.0057373047, 133.77500915527);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8032.5502929688, -1335.84375, 134.29788208008);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8040.220703125, -1275.8220214844, 135.09181213379);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8064.5869140625, -1220.0311279297, 133.82510375977);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8062.1918945313, -1159.6578369141, 131.08683776855);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8044.302734375, -1102.2506103516, 131.08699035645);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8023.755859375, -1045.7478027344, 130.73640441895);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7991.5161132813, -995.14086914063, 129.27456665039);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7969.3725585938, -939.13293457031, 133.65428161621);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -7977.3334960938, -879.61450195313, 129.58303833008);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8009.1635742188, -827.65936279297, 133.81684875488);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8048.9418945313, -782.56695556641, 131.33679199219);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8107.8427734375, -768.64953613281, 132.2120513916);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8165.0776367188, -789.13720703125, 129.86293029785);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8188.9399414063, -845.3603515625, 132.05242919922);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8202.10546875, -904.85162353516, 133.85716247559);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8236.0302734375, -955.42785644531, 135.87330627441);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8245.1376953125, -1015.5703735352, 144.93882751465);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8244.212890625, -1075.6843261719, 142.95959472656);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8214.7353515625, -1128.0246582031, 144.47969055176);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8177.947265625, -1175.7874755859, 140.71627807617);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8140.923828125, -1223.1673583984, 133.11848449707);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8108.6206054688, -1273.8350830078, 133.50570678711);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8124.0659179688, -1332.3753662109, 133.57618713379);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8136.2426757813, -1391.2595214844, 132.8050994873);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8148.8349609375, -1449.9365234375, 134.80270385742);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8167.4868164063, -1507.1062011719, 135.87278747559);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8190.6684570313, -1562.5283203125, 133.51988220215);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8208.7568359375, -1619.9497070313, 142.62435913086);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8203.6513671875, -1679.7918701172, 142.55709838867);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8237.330078125, -1729.6219482422, 143.74769592285);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8269.998046875, -1780.7808837891, 143.21832275391);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8276.0126953125, -1841.6448974609, 144.38200378418);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8279.439453125, -1901.6395263672, 142.42045593262);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8247.501953125, -1952.8404541016, 147.01371765137);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8198.8505859375, -1989.8815917969, 144.34844970703);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8195.470703125, -2050.3747558594, 145.67570495605);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8201.111328125, -2110.2292480469, 149.02029418945);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8205.7646484375, -2170.2475585938, 132.88500976563);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8205.7900390625, -2231.4152832031, 133.41532897949);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8198.2255859375, -2291.0104980469, 133.5671081543);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8191.2856445313, -2350.6550292969, 134.46813964844);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8203.974609375, -2409.40625, 137.98641967773);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8213.783203125, -2469.5476074219, 135.90437316895);
burningsteppesGatherPaths:addBurningsteppesPath(self.numBurningsteppesPaths, -8231.7763671875, -2527.6279296875, 137.94207763672);

end