westfallGatherPaths = {

		westfallPaths = {},
		numWestfallPaths = 1,

}

function westfallGatherPaths:addWestfallPath(id, x, y, z)

    local randomOffset = math.random(-12.24552, 10.12525);

    self.westfallPaths[self.numWestfallPaths] = {};
    self.westfallPaths[self.numWestfallPaths]['id'] = id;
    self.westfallPaths[self.numWestfallPaths]['pos'] = {};
    self.westfallPaths[self.numWestfallPaths]['pos']['x'] = x + randomOffset;
    self.westfallPaths[self.numWestfallPaths]['pos']['y'] = y + randomOffset;
    self.westfallPaths[self.numWestfallPaths]['pos']['z'] = z;

    self.numWestfallPaths = self.numWestfallPaths + 1;

end

function westfallGatherPaths:setupWestfallPaths()

westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10715.760742188, 897.53112792969, 38.411128997803);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10615.79296875, 726.71331787109, 48.394508361816);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10501.515625, 873.20281982422, 41.129489898682);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10301.481445313, 878.85833740234, 35.349193572998);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10137.89453125, 905.64862060547, 36.270435333252);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10021.608398438, 855.2314453125, 32.858238220215);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -9928.998046875, 835.02465820313, 32.013771057129);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -9894.0185546875, 911.38775634766, 32.274089813232);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -9815.099609375, 969.01922607422, 29.130605697632);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -9701.90625, 1006.1496582031, 36.345676422119);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -9729.04296875, 1095.2281494141, 10.206003189087);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -9629.935546875, 1154.1091308594, 5.6776661872864);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -9640.50390625, 1333.9327392578, 8.298656463623);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -9634.8388671875, 1521.1304931641, 5.0432453155518);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -9758.60546875, 1675.7333984375, 6.2384700775146);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -9888.369140625, 1775.8159179688, 7.7672843933105);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -9983.6318359375, 1906.1931152344, 6.7173156738281);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10191.017578125, 2009.3178710938, 9.1868944168091);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10365.779296875, 2064.5727539063, 5.3447675704956);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10521.122070313, 2082.6962890625, 9.4979648590088);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10689.23828125, 2082.1313476563, 5.6203122138977);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10681.014648438, 1952.8188476563, 32.003517150879);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10603.126953125, 1801.7559814453, 35.109428405762);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10409.514648438, 1653.6124267578, 37.283584594727);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10195.41796875, 1715.4611816406, 34.252265930176);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10043.728515625, 1681.6864013672, 36.274517059326);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10072.31640625, 1547.474609375, 42.5100440979);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10046.788085938, 1413.3131103516, 43.815132141113);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10001.256835938, 1235.0397949219, 41.20654296875);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10071.475585938, 1080.3502197266, 38.711620330811);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10339.037109375, 1065.1646728516, 43.521667480469);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10257.768554688, 1292.9536132813, 38.309730529785);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10185.215820313, 1441.6134033203, 40.558769226074);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10265.717773438, 1635.7653808594, 39.181625366211);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10458.587890625, 1609.4919433594, 50.337116241455);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10543.737304688, 1410.4039306641, 53.179683685303);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10747.162109375, 1297.7436523438, 40.71276473999);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10806.313476563, 1126.9608154297, 41.87366104126);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10734.03125, 964.32513427734, 47.370468139648);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10607.469726563, 831.97430419922, 49.627353668213);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10778.255859375, 729.87603759766, 37.342166900635);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10976.692382813, 676.52142333984, 34.290344238281);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -11101.275390625, 771.82177734375, 36.728130340576);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -11111.491210938, 927.05993652344, 35.338836669922);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10964.140625, 1077.3217773438, 38.497440338135);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10989.72265625, 1292.7888183594, 43.804309844971);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -11013.59375, 1435.6499023438, 43.010402679443);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10829.06640625, 1568.4967041016, 49.068214416504);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10819.567382813, 1698.8197021484, 39.577198028564);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10943.274414063, 1793.8665771484, 56.59029006958);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -11082.88671875, 1776.3790283203, 38.250717163086);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -11206.735351563, 1729.8509521484, 38.251190185547);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -11333.139648438, 1714.0778808594, 38.344718933105);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -11266.430664063, 1817.7348632813, 39.061798095703);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -11130.982421875, 1871.3614501953, 39.321243286133);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -11001.245117188, 1903.9294433594, 40.999492645264);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10904.290039063, 1913.265625, 49.860397338867);
westfallGatherPaths:addWestfallPath(self.numWestfallPaths, -10834.333984375, 1721.2026367188, 39.375389099121);


end
