westernplaguelandsGatherPaths = {

	westernplaguelandsPaths = {},
	numWesternplaguelandsPaths = 1,

}

function westernplaguelandsGatherPaths:addWesternplaguelandsPath(id, x, y, z)

	-- don't run the same path every load - add some random offset each reload
	local randomOffset = math.random(-6.6252, 5.3255);

	self.westernplaguelandsPaths[self.numWesternplaguelandsPaths] = {};
	self.westernplaguelandsPaths[self.numWesternplaguelandsPaths]['id'] = id;
	self.westernplaguelandsPaths[self.numWesternplaguelandsPaths]['pos'] = {};
	self.westernplaguelandsPaths[self.numWesternplaguelandsPaths]['pos']['x'] = x + randomOffset;
	self.westernplaguelandsPaths[self.numWesternplaguelandsPaths]['pos']['y'] = y + randomOffset;
	self.westernplaguelandsPaths[self.numWesternplaguelandsPaths]['pos']['z'] = z;

	self.numWesternplaguelandsPaths = self.numWesternplaguelandsPaths + 1;

end

function westernplaguelandsGatherPaths:setupWesternplaguelandsPaths()
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1633.5251464844, -1058.7075195313, 68.398567199707);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1573.2416992188, -1064.779296875, 70.953010559082);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1511.4361572266, -1065.6569824219, 73.725463867188);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1456.1904296875, -1090.0073242188, 70.982894897461);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1453.0310058594, -1150.6667480469, 70.53572845459);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1464.8499755859, -1211.2971191406, 60.964866638184);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1510.0532226563, -1252.7437744141, 57.421157836914);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1571.5284423828, -1255.3433837891, 60.248226165771);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1626.2645263672, -1230.5234375, 67.854446411133);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1640.0378417969, -1171.6662597656, 60.30587387085);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1676.5682373047, -1123.9040527344, 63.860378265381);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1727.90234375, -1091.8780517578, 64.560676574707);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1782.6322021484, -1119.28515625, 62.261474609375);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1826.3237304688, -1160.5114746094, 60.472110748291);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1863.9846191406, -1208.4140625, 61.583969116211);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1865.5932617188, -1268.4263916016, 63.777851104736);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1853.0490722656, -1327.1497802734, 62.129508972168);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1819.3621826172, -1377.6237792969, 63.127143859863);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1763.9862060547, -1403.2225341797, 65.543312072754);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1711.9890136719, -1433.1983642578, 64.813583374023);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1664.0596923828, -1471.1607666016, 59.566745758057);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1648.9104003906, -1529.2346191406, 61.34944152832);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1653.6502685547, -1589.1772460938, 59.864738464355);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1625.7711181641, -1643.4111328125, 58.611328125);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1615.2321777344, -1703.6362304688, 59.851142883301);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1570.7546386719, -1745.1094970703, 59.500732421875);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1512.4997558594, -1768.9801025391, 60.464645385742);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1455.8297119141, -1790.6812744141, 60.189903259277);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1400.5588378906, -1816.3251953125, 60.279842376709);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1384.9544677734, -1874.6661376953, 62.193698883057);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1411.6036376953, -1928.5758056641, 64.595558166504);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1465.9931640625, -1954.4816894531, 59.687046051025);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1521.33984375, -1982.5628662109, 60.67253112793);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1563.3188476563, -2025.5499267578, 59.303451538086);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1598.3603515625, -2075.5305175781, 58.221328735352);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1637.7950439453, -2122.3195800781, 60.779155731201);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1675.2834472656, -2169.4204101563, 59.705833435059);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1633.3596191406, -2213.1098632813, 60.910469055176);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1615.7709960938, -2271.1198730469, 59.999828338623);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1642.2548828125, -2325.0725097656, 59.742057800293);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1689.1030273438, -2362.6667480469, 60.344329833984);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1733.1087646484, -2406.0939941406, 60.073863983154);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1790.0395507813, -2429.6069335938, 59.328582763672);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1845.7287597656, -2454.4895019531, 62.683441162109);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1893.1397705078, -2491.4357910156, 65.546783447266);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1947.9705810547, -2516.0661621094, 61.583393096924);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2001.9737548828, -2489.162109375, 60.274311065674);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2057.4377441406, -2465.96875, 60.453144073486);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2113.0825195313, -2443.1748046875, 61.57466506958);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2072.0305175781, -2399.3774414063, 61.761192321777);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2013.3653564453, -2381.4008789063, 59.77534866333);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2010.2243652344, -2321.189453125, 59.637149810791);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1968.2119140625, -2277.9770507813, 60.252815246582);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1922.7736816406, -2238.3708496094, 61.450092315674);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1875.7170410156, -2200.9194335938, 61.071361541748);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1870.6303710938, -2139.2062988281, 68.693687438965);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1886.0512695313, -2080.0766601563, 72.97940826416);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1896.2811279297, -2020.8421630859, 77.811462402344);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1882.3475341797, -1961.8790283203, 75.608367919922);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1919.3431396484, -1913.1138916016, 76.24910736084);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1979.9602050781, -1917.5621337891, 75.004653930664);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2039.2691650391, -1904.2435302734, 67.984329223633);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2084.9841308594, -1863.3996582031, 64.135330200195);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2129.5236816406, -1821.822265625, 63.444820404053);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2186.8654785156, -1800.9073486328, 67.729095458984);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2247.7290039063, -1798.00390625, 75.865692138672);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2268.9985351563, -1740.9079589844, 87.454780578613);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2305.833984375, -1693.4853515625, 100.34600830078);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2251.5651855469, -1665.0994873047, 91.955535888672);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2227.0639648438, -1609.2575683594, 83.093856811523);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2208.1682128906, -1551.3588867188, 74.195854187012);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2152.951171875, -1526.7424316406, 63.429721832275);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2093.7414550781, -1544.9558105469, 64.776725769043);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 2032.9240722656, -1552.1943359375, 65.526214599609);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1972.7200927734, -1552.0678710938, 61.104427337646);
westernplaguelandsGatherPaths:addWesternplaguelandsPath(self.numWesternplaguelandsPaths, 1948.3898925781, -1496.6134033203, 62.626232147217);
end
