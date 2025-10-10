arathiGatherPaths = {

		arathiPaths = {},
		numArathiPaths = 1,

}


function arathiGatherPaths:addArathiPath(id, x, y, z)

    local randomOffset = math.random(-6.24552, 5.12525);

    self.arathiPaths[self.numArathiPaths] = {};
    self.arathiPaths[self.numArathiPaths]['id'] = id;
    self.arathiPaths[self.numArathiPaths]['pos'] = {};
    self.arathiPaths[self.numArathiPaths]['pos']['x'] = x + randomOffset;
    self.arathiPaths[self.numArathiPaths]['pos']['y'] = y + randomOffset;
    self.arathiPaths[self.numArathiPaths]['pos']['z'] = z;

    self.numArathiPaths = self.numArathiPaths + 1;

end

function arathiGatherPaths:setupArathiPaths()

arathiGatherPaths:addArathiPath(self.numArathiPaths, -2064.2985839844, -2602.1687011719, 77.060501098633);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1970.8585205078, -2536.4069824219, 72.312393188477);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1832.7171630859, -2696.0939941406, 53.517356872559);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1685.5904541016, -2822.71875, 39.403720855713);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1592.0056152344, -2631.8742675781, 48.49010848999);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1546.2504882813, -2462.3857421875, 64.324089050293);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1570.3670654297, -2354.0771484375, 84.411071777344);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1518.1655273438, -2241.2719726563, 32.150581359863);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1731.3815917969, -2151.5532226563, 47.186771392822);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1620.8258056641, -2075.0581054688, 36.842380523682);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1500.6207275391, -1997.9166259766, 32.405868530273);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1368.0297851563, -1968.6462402344, 58.460353851318);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1318.8094482422, -1835.5502929688, 63.91495513916);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1280.2481689453, -1723.4915771484, 59.429912567139);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1422.2501220703, -1643.0446777344, 40.175682067871);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1575.4832763672, -1551.7749023438, 36.816612243652);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1444.6107177734, -1553.6879882813, 41.600059509277);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1314.3912353516, -1508.638671875, 52.774936676025);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1132.4852294922, -1479.9904785156, 52.855197906494);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1016.2638549805, -1553.3210449219, 51.54740524292);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1208.1246337891, -1641.6525878906, 49.138458251953);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1077.091796875, -1769.9742431641, 58.524429321289);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -890.45953369141, -1706.7396240234, 54.610939025879);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -769.98364257813, -1746.5495605469, 59.227874755859);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -640.17028808594, -1878.2722167969, 54.974136352539);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -666.79840087891, -1998.0001220703, 56.990539550781);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -733.4892578125, -2097.1105957031, 45.538021087646);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -803.22912597656, -2222.0466308594, 47.111171722412);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -913.68908691406, -2300.7810058594, 48.175098419189);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1069.3771972656, -2199.708984375, 62.142665863037);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1173.3326416016, -2183.392578125, 55.713981628418);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1232.8649902344, -2339.9748535156, 58.843273162842);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1129.7463378906, -2435.8310546875, 50.266952514648);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1021.146484375, -2507.4050292969, 53.477733612061);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -973.77093505859, -2607.6452636719, 59.968139648438);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1033.7293701172, -2658.5854492188, 53.625030517578);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1175.8858642578, -2690.3208007813, 51.326976776123);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1301.2755126953, -2800.2604980469, 54.011291503906);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1190.0916748047, -2921.5400390625, 49.318157196045);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1031.7060546875, -3017.7265625, 54.543117523193);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -917.17486572266, -3109.2868652344, 49.963035583496);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1001.8666381836, -3182.3068847656, 45.515647888184);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -935.50610351563, -3214.4731445313, 70.657432556152);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -823.0234375, -3187.1086425781, 81.240829467773);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -809.67242431641, -3333.2980957031, 79.207786560059);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -947.20208740234, -3386.5690917969, 63.794967651367);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1055.9559326172, -3235.4064941406, 39.622985839844);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1149.3664550781, -3115.5815429688, 45.002723693848);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1232.76953125, -3384.0270996094, 37.046985626221);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1186.7116699219, -3551.9851074219, 47.464923858643);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1063.0419921875, -3695.2788085938, 86.295387268066);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1150.7874755859, -3548.8713378906, 52.610736846924);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1287.4086914063, -3452.6696777344, 41.044345855713);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1369.7399902344, -3354.0686035156, 44.927112579346);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1502.060546875, -3365.9211425781, 37.832759857178);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1627.7313232422, -3419.671875, 42.584983825684);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1682.7623291016, -3484.3425292969, 54.340785980225);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1737.5947265625, -3402.6437988281, 40.423831939697);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1835.1750488281, -3361.2844238281, 46.04528427124);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1805.1866455078, -3259.4008789063, 25.958675384521);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1686.8305664063, -3142.4719238281, 30.916242599487);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1735.5751953125, -3015.0405273438, 29.835889816284);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1817.7254638672, -2873.8786621094, 60.485954284668);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1817.2257080078, -2778.9321289063, 55.766193389893);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -1917.2443847656, -2691.380859375, 68.980018615723);
arathiGatherPaths:addArathiPath(self.numArathiPaths, -2026.4215087891, -2581.1140136719, 72.57593536377);


end