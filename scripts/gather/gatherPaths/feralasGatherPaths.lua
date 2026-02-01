feralasGatherPaths = {

		feralasPaths = {},
		numFeralasPaths = 1,

}

function feralasGatherPaths:addFeralasPath(id, x, y, z)

	local randomOffset = math.random(-3.24552, 4.12525);

	self.feralasPaths[self.numFeralasPaths] = {};
	self.feralasPaths[self.numFeralasPaths]['id'] = id;
	self.feralasPaths[self.numFeralasPaths]['pos'] = {};
	self.feralasPaths[self.numFeralasPaths]['pos']['x'] = x + randomOffset;
	self.feralasPaths[self.numFeralasPaths]['pos']['y'] = y + randomOffset;
	self.feralasPaths[self.numFeralasPaths]['pos']['z'] = z;

	self.numFeralasPaths = self.numFeralasPaths + 1;

end

function feralasGatherPaths:setupFeralasPaths()


feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4472.4321289063, -573.84320068359, 5.348518371582);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4462.5239257813, -365.72418212891, 39.761905670166);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4471.3569335938, -236.21661376953, 60.3879737854);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4441.5590820313, -46.651950836182, 57.321235656738);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4196.67578125, -113.28044128418, 57.009254455566);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4134.6943359375, -59.072834014893, 59.849185943604);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4056.8762207031, 47.87882232666, 60.93244934082);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4109.7749023438, 191.4600982666, 61.879486083984);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4091.9792480469, 282.72573852539, 53.757911682129);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4271.3129882813, 411.31262207031, 52.668197631836);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4306.1396484375, 543.78778076172, 55.605587005615);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4462.7299804688, 624.59619140625, 60.926212310791);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4560.8002929688, 621.66033935547, 45.713817596436);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4565.0649414063, 745.89312744141, 46.220977783203);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4606.1875, 691.03851318359, 49.224166870117);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4674.2924804688, 615.11486816406, 51.505924224854);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4752.6909179688, 551.96325683594, 39.374492645264);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4839.0170898438, 487.1110534668, 21.280307769775);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4950.8232421875, 404.27572631836, 10.328077316284);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4859.6171875, 269.06301879883, 39.320461273193);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4870.3671875, 189.12504577637, 60.082912445068);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4709.517578125, 202.8669128418, 39.428169250488);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4629.4555664063, 120.19950866699, 76.944984436035);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4778.490234375, 218.85304260254, 40.677742004395);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4884.279296875, 207.93951416016, 54.426078796387);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4859.6513671875, 241.79039001465, 43.896987915039);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4945.5317382813, 345.50250244141, 20.326818466187);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5048.52734375, 386.63433837891, 12.147480964661);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5123.3837890625, 209.10482788086, 53.933616638184);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5244.6069335938, 321.04928588867, 57.11417388916);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5258.78125, 450.49215698242, 45.375186920166);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5305.7416992188, 520.12634277344, 59.20418548584);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5224.69140625, 569.49505615234, 57.232082366943);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5054.12109375, 588.68835449219, 30.012493133545);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4928.0815429688, 602.37896728516, 22.165399551392);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4872.7421875, 539.04040527344, 13.183892250061);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4747.3041992188, 507.44454956055, 33.602191925049);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4675.5625, 512.95520019531, 41.271266937256);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4572.91015625, 531.22973632813, 60.707447052002);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4535.185546875, 643.18585205078, 56.980045318604);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4686.302734375, 722.14978027344, 76.212951660156);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4652.7758789063, 806.13983154297, 82.699546813965);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4647.1147460938, 867.51416015625, 85.854675292969);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4686.7924804688, 918.19104003906, 92.004005432129);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4691.0571289063, 956.79779052734, 99.31778717041);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4722.447265625, 1011.7642211914, 108.673828125);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4810.5610351563, 1043.9475097656, 103.46227264404);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4829.3125, 1130.7316894531, 90.830535888672);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4898.6059570313, 1146.5703125, 81.606727600098);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4994.9091796875, 1207.8875732422, 52.826286315918);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5124.0620117188, 1208.6208496094, 57.736366271973);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5269.267578125, 1160.9027099609, 76.795288085938);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5360.31640625, 1202.9033203125, 48.711009979248);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5346.7553710938, 1343.7033691406, 33.325450897217);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5436.6962890625, 1391.0836181641, 27.026931762695);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5502.0390625, 1280.0264892578, 24.119197845459);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5575.3579101563, 1193.0491943359, 27.360626220703);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5507.8354492188, 1417.1595458984, 22.583148956299);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5506.2553710938, 1545.0159912109, 34.654174804688);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5543.1455078125, 1674.9681396484, 65.044174194336);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5670.056640625, 1633.0848388672, 81.142951965332);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5518.4594726563, 1715.0795898438, 67.782585144043);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5389.7573242188, 1647.2119140625, 51.118846893311);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5309.533203125, 1550.7698974609, 44.715057373047);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5282.9887695313, 1422.6590576172, 32.075805664063);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5194.5639648438, 1344.8933105469, 42.924980163574);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5074.0981445313, 1399.7712402344, 45.294666290283);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -5045.181640625, 1521.2390136719, 54.19953918457);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4968.5180664063, 1454.8527832031, 60.978252410889);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4948.435546875, 1352.1281738281, 55.567863464355);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4902.2534179688, 1346.5385742188, 63.847503662109);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4841.6499023438, 1325.4720458984, 81.301574707031);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4758.0786132813, 1320.5335693359, 90.165985107422);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4715.9672851563, 1398.1959228516, 88.844261169434);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4726.640625, 1482.8277587891, 95.122039794922);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4747.0830078125, 1645.1042480469, 87.87141418457);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4717.8359375, 1748.0921630859, 93.469345092773);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4672.9194335938, 1816.8843994141, 92.208374023438);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4673.6982421875, 1938.1971435547, 72.231903076172);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4573.5234375, 2020.1778564453, 47.408512115479);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4451.0756835938, 2062.6242675781, 45.519222259521);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4282.708984375, 2105.5305175781, 77.62614440918);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4165.9072265625, 2093.1506347656, 88.366714477539);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4055.0434570313, 2050.7058105469, 88.615768432617);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3935.6252441406, 1978.4931640625, 82.010711669922);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3814.9611816406, 1959.2055664063, 70.255706787109);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3712.5327148438, 1964.0532226563, 71.525199890137);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3643.9465332031, 1961.9202880859, 75.206184387207);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3588.2192382813, 1964.0437011719, 70.709907531738);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3503.8610839844, 1922.3646240234, 52.566871643066);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3410.0910644531, 1901.1850585938, 46.592670440674);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3334.7370605469, 1903.3397216797, 47.728214263916);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3439.1433105469, 1939.1728515625, 42.643516540527);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3542.9504394531, 2008.0402832031, 48.057495117188);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3515.7456054688, 2096.8193359375, 44.391815185547);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3546.2219238281, 2237.8688964844, 38.289409637451);    -- 97
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3543.71875, 2450.9787597656, 63.045604705811);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3510.8432617188, 2516.083984375, 54.477825164795);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3416.8217773438, 2523.2358398438, 35.67191696167);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3342.1645507813, 2549.755859375, 22.189392089844);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3275.0615234375, 2598.9499511719, 25.213119506836);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3204.0759277344, 2641.7221679688, 35.869255065918);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3193.3569335938, 2559.947265625, 42.143249511719);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3260.5004882813, 2493.7612304688, 50.834320068359);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3320.3395996094, 2414.2224121094, 41.149059295654);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3462.3425292969, 2269.0063476563, 21.136379241943);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3356.7126464844, 2253.4128417969, 22.668926239014);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3316.1123046875, 2230.5146484375, 30.312963485718);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3144.4702148438, 2217.9077148438, 37.525611877441);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -2983.7043457031, 2240.4731445313, 43.618434906006);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -2914.4328613281, 2556.9558105469, 51.673732757568);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -2822.8740234375, 2625.1733398438, 67.873573303223);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -2791.4697265625, 2539.0080566406, 58.649040222168);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -2753.6440429688, 2384.1032714844, 65.532234191895);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -2721.404296875, 2324.7600097656, 66.502876281738);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -2960.2358398438, 2243.67578125, 44.285873413086);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3141.1555175781, 2217.6042480469, 37.856857299805);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3306.20703125, 2221.3188476563, 30.210851669312);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3406.5712890625, 2230.7380371094, 24.147840499878);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3542.3623046875, 2217.51953125, 34.722881317139);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3542.5017089844, 2114.6877441406, 52.935253143311);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3650.3322753906, 2178.0656738281, 71.925483703613);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3741.4709472656, 2155.0063476563, 96.675712585449);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3841.6892089844, 2128.5461425781, 113.93766784668);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -3907.3305664063, 2078.8969726563, 119.22702026367);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4057.248046875, 2111.6516113281, 109.66892242432);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4220.0424804688, 2100.380859375, 82.969955444336);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4389.8149414063, 2088.0222167969, 56.884048461914);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4581.5004882813, 2020.6428222656, 48.504634857178);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4676.6015625, 1904.6871337891, 79.625053405762);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4586.1201171875, 395.47662353516, 39.706970214844);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4381.4487304688, 421.14282226563, 46.345127105713);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4238.201171875, 324.21014404297, 54.531719207764);
feralasGatherPaths:addFeralasPath(self.numFeralasPaths, -4249.2822265625, 163.74461364746, 58.756301879883);


end