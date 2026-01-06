tirisfalGatherPaths = {

		tirisfalPaths = {},
		numTirisfalPaths = 1,

}

function tirisfalGatherPaths:addTirisfalPath(id, x, y, z)

    local randomOffset = math.random(-11.24552, 11.12525);

    self.tirisfalPaths[self.numTirisfalPaths] = {};
    self.tirisfalPaths[self.numTirisfalPaths]['id'] = id;
    self.tirisfalPaths[self.numTirisfalPaths]['pos'] = {};
    self.tirisfalPaths[self.numTirisfalPaths]['pos']['x'] = x + randomOffset;
    self.tirisfalPaths[self.numTirisfalPaths]['pos']['y'] = y + randomOffset;
    self.tirisfalPaths[self.numTirisfalPaths]['pos']['z'] = z;

    self.numTirisfalPaths = self.numTirisfalPaths + 1;

end

function tirisfalGatherPaths:setupTirisfalPaths()
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1948.2153320313, 293.10296630859, 38.808322906494);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1929.95703125, 350.45767211914, 35.479663848877);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1915.0147705078, 409.70822143555, 35.634727478027);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1895.4532470703, 468.01440429688, 36.106609344482);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1866.8444824219, 520.89544677734, 36.046905517578);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1827.9833984375, 577.39880371094, 37.828788757324);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1789.0191650391, 624.30010986328, 41.094860076904);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1773.6944580078, 683.48254394531, 44.390193939209);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1765.1840820313, 743.39819335938, 50.496452331543);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1777.4683837891, 802.27758789063, 45.023315429688);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1837.3225097656, 813.57330322266, 30.74888420105);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1868.2882080078, 865.28967285156, 28.879867553711);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1881.8188476563, 924.85821533203, 26.25332069397);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1868.8366699219, 983.60101318359, 28.629892349243);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1819.3302001953, 1019.1959228516, 38.379810333252);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1823.0775146484, 1079.1229248047, 39.331912994385);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1880.9836425781, 1095.3114013672, 25.938753128052);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1931.3963623047, 1060.8355712891, 35.007247924805);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1982.0760498047, 1027.7703857422, 38.567947387695);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2042.3259277344, 1018.3900756836, 31.117500305176);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2094.4641113281, 1048.1379394531, 32.112533569336);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2146.7312011719, 1077.8140869141, 32.088310241699);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2199.2202148438, 1107.2780761719, 33.978511810303);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2249.4609375, 1141.6945800781, 36.267784118652);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2285.0834960938, 1190.8571777344, 35.925735473633);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2317.0070800781, 1242.2619628906, 34.447341918945);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2365.7712402344, 1277.2618408203, 31.353534698486);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2388.1909179688, 1333.3543701172, 34.319320678711);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2447.212890625, 1347.9274902344, 27.650880813599);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2508.1604003906, 1356.6693115234, 14.95528793335);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2556.5236816406, 1320.5573730469, 36.7395362854);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2600.4736328125, 1278.4372558594, 53.996212005615);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2655.5595703125, 1249.6608886719, 61.3544921875);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2613.1567382813, 1206.5024414063, 73.166160583496);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2592.9631347656, 1149.3083496094, 78.322135925293);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2600.2619628906, 1088.5451660156, 90.837173461914);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2613.4921875, 1029.3479003906, 99.80891418457);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2641.7429199219, 974.82440185547, 112.57995605469);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2678.703125, 927.35919189453, 111.02104949951);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2739.0297851563, 922.57836914063, 110.11709594727);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2767.5568847656, 867.48602294922, 112.59176635742);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2740.1396484375, 814.07043457031, 112.05516815186);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2678.2973632813, 821.01892089844, 108.68316650391);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2619.7026367188, 834.51208496094, 104.21816253662);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2565.8937988281, 861.12780761719, 94.621147155762);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2519.4616699219, 901.06646728516, 82.32967376709);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2474.7478027344, 941.37377929688, 73.817337036133);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2433.06640625, 985.31903076172, 67.428527832031);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2377.4213867188, 1008.5994262695, 56.289005279541);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2317.7846679688, 1016.2012939453, 49.09899520874);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2273.7109375, 975.36285400391, 45.871704101563);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2270.7561035156, 913.29486083984, 49.747268676758);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2309.3295898438, 864.90002441406, 48.518310546875);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2345.6276855469, 812.91717529297, 39.683475494385);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2357.4375, 750.22045898438, 37.281307220459);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2331.5952148438, 692.49304199219, 38.909023284912);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2312.0895996094, 635.56005859375, 29.724327087402);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2316.1906738281, 575.25677490234, 24.779321670532);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2361.2907714844, 535.25134277344, 29.371950149536);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2417.2683105469, 511.24862670898, 41.993022918701);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2457.529296875, 465.12969970703, 43.714385986328);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2517.3420410156, 458.80783081055, 34.924381256104);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2555.0263671875, 507.92758178711, 17.853055953979);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2568.2856445313, 566.50225830078, 14.208024978638);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2626.6564941406, 548.35919189453, 20.494066238403);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2665.3959960938, 502.14721679688, 14.832101821899);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2714.3254394531, 466.34893798828, 20.726161956787);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2767.8039550781, 439.0908203125, 19.787450790405);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2794.4382324219, 384.5364074707, 22.628128051758);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2849.015625, 358.7868347168, 24.044549942017);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2878.5886230469, 306.18087768555, 28.505380630493);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2858.4440917969, 249.62568664551, 29.253736495972);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2823.546875, 200.76412963867, 30.543628692627);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2775.423828125, 164.48597717285, 28.94492149353);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2713.9750976563, 160.53363037109, 29.775938034058);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2653.89453125, 164.24766540527, 31.462459564209);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2640.7268066406, 104.28762817383, 34.470539093018);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2668.8381347656, 50.812610626221, 31.087371826172);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2712.1931152344, 9.0751447677612, 31.770780563354);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2756.04296875, -32.457946777344, 34.606353759766);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2805.1975097656, -67.226943969727, 32.671581268311);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2826.3354492188, -124.25424957275, 32.338428497314);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2852.0646972656, -179.43496704102, 42.259986877441);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2860.5654296875, -240.26155090332, 50.581874847412);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2857.8137207031, -300.46234130859, 57.460857391357);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2802.21875, -323.19055175781, 72.216133117676);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2745.9926757813, -300.97564697266, 70.164077758789);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2692.1313476563, -273.79364013672, 65.011100769043);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2630.8752441406, -268.45172119141, 59.613521575928);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2568.8029785156, -270.22122192383, 50.989463806152);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2508.4353027344, -280.45489501953, 51.542442321777);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2456.3432617188, -311.74737548828, 64.936912536621);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2462.9262695313, -371.53713989258, 75.011985778809);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2433.6442871094, -423.97247314453, 69.503662109375);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2433.7907714844, -485.21990966797, 73.847229003906);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2446.6298828125, -545.91253662109, 70.806854248047);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2469.9233398438, -602.33038330078, 70.187446594238);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2508.255859375, -651.01336669922, 74.451324462891);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2550.5615234375, -693.90112304688, 67.019462585449);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2598.9638671875, -729.57641601563, 74.24543762207);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2642.4624023438, -771.26226806641, 82.184562683105);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2638.3000488281, -831.78277587891, 70.755714416504);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2624.845703125, -890.80511474609, 62.233070373535);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2609.4953613281, -949.40338134766, 76.00919342041);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2561.9909667969, -986.2099609375, 78.12166595459);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2505.3171386719, -1008.1450195313, 85.699600219727);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2445.0334472656, -1004.2926025391, 80.661643981934);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2401.6474609375, -962.14782714844, 71.962356567383);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2342.1547851563, -953.92980957031, 71.633697509766);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2282.2109375, -959.462890625, 77.628242492676);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2222.4499511719, -953.71575927734, 75.406272888184);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2241.8686523438, -896.20751953125, 75.374893188477);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2271.8796386719, -844.10223388672, 72.181037902832);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2302.068359375, -792.10015869141, 68.420989990234);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2322.7819824219, -734.86309814453, 66.904243469238);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2336.2644042969, -676.26818847656, 70.94970703125);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2351.6389160156, -616.49523925781, 71.266784667969);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2390.2250976563, -569.22308349609, 74.937408447266);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2380.818359375, -456.67337036133, 74.991172790527);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2345.1804199219, -407.15420532227, 69.64769744873);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2362.544921875, -349.62200927734, 64.142211914063);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2322.2141113281, -302.34036254883, 62.015258789063);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2270.9233398438, -271.02676391602, 61.471534729004);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2216.4650878906, -245.73797607422, 54.547962188721);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2161.2592773438, -221.88815307617, 45.707363128662);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2105.2587890625, -200.07418823242, 44.730503082275);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2046.2802734375, -212.78576660156, 37.851692199707);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2007.3154296875, -258.57748413086, 35.416412353516);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1966.2153320313, -302.49005126953, 35.783622741699);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1931.0474853516, -351.27194213867, 36.072551727295);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1917.7973632813, -410.20248413086, 36.5100440979);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1937.3352050781, -467.78399658203, 34.559631347656);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1970.5609130859, -519.03594970703, 43.410541534424);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1982.3602294922, -578.47943115234, 54.449295043945);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1919.3795166016, -590.16149902344, 51.366291046143);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1856.3669433594, -597.33770751953, 40.637145996094);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1795.6357421875, -591.31683349609, 39.647075653076);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1743.2877197266, -561.00067138672, 37.992248535156);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1711.3591308594, -510.05117797852, 37.570850372314);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1704.0256347656, -449.74392700195, 39.985572814941);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1703.6313476563, -389.56127929688, 39.84952545166);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1738.5991210938, -339.61935424805, 34.940761566162);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1797.1319580078, -318.83044433594, 37.44917678833);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1849.6402587891, -289.61441040039, 36.926567077637);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1897.1768798828, -250.99029541016, 33.224361419678);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1943.8129882813, -213.07109069824, 33.290374755859);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 1990.4672851563, -175.13708496094, 33.34268951416);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2037.1760253906, -137.15893554688, 36.336513519287);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2084.0815429688, -97.263229370117, 41.111915588379);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2129.9692382813, -56.705791473389, 42.651336669922);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2154.8627929688, -0.6865690946579, 42.268661499023);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2161.16796875, 59.28050994873, 38.035747528076);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2196.9870605469, 109.85099029541, 42.916481018066);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2234.5571289063, 158.22415161133, 45.455604553223);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2225.853515625, 218.84819030762, 33.412261962891);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2210.6071777344, 276.91027832031, 35.794494628906);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2157.8103027344, 305.6611328125, 42.848278045654);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2099.5815429688, 323.11224365234, 58.076625823975);
tirisfalGatherPaths:addTirisfalPath(self.numTirisfalPaths, 2039.9685058594, 313.06555175781, 50.478324890137);



end