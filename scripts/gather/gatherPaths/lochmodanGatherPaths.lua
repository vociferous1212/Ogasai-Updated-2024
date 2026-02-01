lochmodanGatherPaths = {

	lochmodanPaths = {},
	numLochmodanPaths = 1,

}

function lochmodanGatherPaths:addLochmodanPath(id, x, y, z)

	local randomOffset = math.random(-6.24552, 5.12525);

	self.lochmodanPaths[self.numLochmodanPaths] = {};
	self.lochmodanPaths[self.numLochmodanPaths]['id'] = id;
	self.lochmodanPaths[self.numLochmodanPaths]['pos'] = {};
	self.lochmodanPaths[self.numLochmodanPaths]['pos']['x'] = x + randomOffset;
	self.lochmodanPaths[self.numLochmodanPaths]['pos']['y'] = y + randomOffset;
	self.lochmodanPaths[self.numLochmodanPaths]['pos']['z'] = z;

	self.numLochmodanPaths = self.numLochmodanPaths + 1;
end

function lochmodanGatherPaths:setupLochmodanPaths()
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5206.40234375, -3018.7526855469, 332.24047851563);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5146.658203125, -3029.03515625, 328.86477661133);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5086.8974609375, -3042.4084472656, 323.67282104492);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5029.7104492188, -3061.1691894531, 320.65249633789);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4972.6396484375, -3079.9416503906, 317.7643737793);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4913.3178710938, -3090.1618652344, 317.30310058594);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4852.2163085938, -3090.9038085938, 316.46588134766);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4795.9291992188, -3069.119140625, 307.41912841797);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4744.703125, -3035.810546875, 310.64770507813);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4761.6928710938, -2978.1320800781, 319.02215576172);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4801.939453125, -2932.7966308594, 328.82672119141);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4799.744140625, -2872.3879394531, 327.23150634766);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4748.8325195313, -2840.0791015625, 328.84912109375);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4726.1376953125, -2784.1430664063, 324.76733398438);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4745.423828125, -2727.2788085938, 324.71405029297);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4771.2197265625, -2672.0600585938, 332.80978393555);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4814.6147460938, -2714.0554199219, 327.9778137207);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4874.486328125, -2727.0659179688, 327.63241577148);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4925.71484375, -2694.8918457031, 326.32427978516);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4974.4926757813, -2659.0783691406, 327.37094116211);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5034.564453125, -2657.7666015625, 319.90472412109);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5094.9545898438, -2666.8791503906, 326.70001220703);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5152.525390625, -2684.2658691406, 341.4280090332);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5143.7416992188, -2743.8774414063, 335.68814086914);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5124.646484375, -2801.7619628906, 329.28372192383);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5100.0400390625, -2857.1088867188, 325.44866943359);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5132.7036132813, -2907.9475097656, 329.65438842773);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5185.7705078125, -2936.2202148438, 337.5426940918);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5235.6450195313, -2899.6948242188, 338.93646240234);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5265.0825195313, -2846.7639160156, 346.00961303711);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5265.65234375, -2786.6772460938, 348.1731262207);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5318.6079101563, -2756.8059082031, 354.7939453125);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5378.6923828125, -2759.7998046875, 366.45266723633);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5439.7866210938, -2763.9921875, 368.53146362305);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5499.7392578125, -2769.3273925781, 363.85565185547);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5556.0927734375, -2790.5249023438, 367.09002685547);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5616.263671875, -2792.9501953125, 365.49795532227);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5672.634765625, -2772.2395019531, 363.15280151367);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5712.3369140625, -2727.005859375, 354.36749267578);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5721.8823242188, -2806.6691894531, 363.51068115234);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5775.001953125, -2836.9672851563, 368.84985351563);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5830.8920898438, -2861.6740722656, 366.89581298828);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5872.3076171875, -2905.5529785156, 366.38876342773);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5854.51171875, -2962.9182128906, 356.81039428711);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5856.201171875, -3023.6796875, 335.93035888672);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5838.103515625, -3082.1323242188, 325.11663818359);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5782.8012695313, -3105.7094726563, 321.22994995117);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5727.8940429688, -3130.14453125, 315.32565307617);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5673.7895507813, -3156.4846191406, 314.99841308594);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5614.6372070313, -3167.1303710938, 324.81564331055);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5637.7084960938, -3222.5190429688, 322.11682128906);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5681.4125976563, -3265.1843261719, 310.77462768555);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5730.4741210938, -3299.79296875, 307.32928466797);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5790.5888671875, -3299.0927734375, 299.43423461914);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5840.1630859375, -3333.0537109375, 298.24560546875);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5841.806640625, -3394.0732421875, 306.87475585938);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5814.533203125, -3448.2873535156, 312.60043334961);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5771.6796875, -3490.4733886719, 303.88095092773);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5730.5737304688, -3534.3581542969, 302.20376586914);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5715.1630859375, -3592.8933105469, 315.56695556641);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5697.5341796875, -3650.4543457031, 312.47399902344);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5703.2563476563, -3711.6315917969, 313.66751098633);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5747.1215820313, -3754.3361816406, 316.3440246582);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5793.6909179688, -3792.4851074219, 333.6936340332);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5836.3896484375, -3837.2966308594, 342.68218994141);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5863.017578125, -3891.2587890625, 354.87680053711);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5835.8608398438, -3945.5305175781, 355.33010864258);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5809.2348632813, -4000.4975585938, 368.75369262695);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5781.091796875, -4053.5500488281, 369.21405029297);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5720.3862304688, -4057.4321289063, 367.67520141602);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5660.5424804688, -4052.2170410156, 370.24487304688);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5655.8442382813, -4112.5893554688, 389.07739257813);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5709.7983398438, -4139.5649414063, 385.70401000977);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5689.4731445313, -4197.1606445313, 386.13507080078);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5634.5107421875, -4223.0913085938, 384.81674194336);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5583.1845703125, -4191.244140625, 382.74340820313);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5545.5322265625, -4144.333984375, 375.86227416992);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5512.443359375, -4094.1430664063, 369.73916625977);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5480.359375, -4043.2880859375, 358.96185302734);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5448.2998046875, -3992.3354492188, 345.26867675781);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5420.7739257813, -3939.0139160156, 342.81002807617);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5411.8842773438, -3878.6850585938, 334.60049438477);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5386.427734375, -3823.6342773438, 324.24301147461);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5328.5268554688, -3805.1335449219, 317.228515625);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5294.2485351563, -3754.1340332031, 308.93579101563);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5239.2036132813, -3729.9338378906, 309.65133666992);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5186.2626953125, -3761.9938964844, 315.73413085938);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5179.3256835938, -3822.3576660156, 327.12414550781);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5194.4477539063, -3880.6245117188, 330.26675415039);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5228.5629882813, -3930.8237304688, 332.59579467773);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5264.46484375, -3980.1655273438, 330.96960449219);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5297.2919921875, -4031.63671875, 331.55160522461);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5293.9365234375, -4091.7287597656, 326.77346801758);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5234.7446289063, -4103.4619140625, 327.53555297852);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5174.7260742188, -4107.1245117188, 325.7731628418);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5114.4262695313, -4100.5751953125, 319.31158447266);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5062.09765625, -4069.4020996094, 308.20114135742);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -5013.9497070313, -4032.4658203125, 301.11102294922);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4963.7407226563, -3999.4138183594, 298.48287963867);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4912.9052734375, -3967.2983398438, 297.48428344727);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4892.13671875, -3910.5822753906, 299.32806396484);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4883.4438476563, -3851.0810546875, 302.88900756836);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4875.2739257813, -3791.5642089844, 304.22897338867);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4891.521484375, -3733.0129394531, 312.10879516602);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4935.1181640625, -3690.3801269531, 312.80151367188);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4911.7890625, -3633.6701660156, 301.11437988281);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4858.0854492188, -3606.5844726563, 306.42813110352);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4801.3159179688, -3584.1330566406, 307.31332397461);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4768.568359375, -3532.8273925781, 303.59719848633);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4771.7177734375, -3524.4565429688, 303.49710083008);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4751.4921875, -3519.64453125, 307.08779907227);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4730.1796875, -3514.5651855469, 310.24020385742);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4714.8305664063, -3498.9375, 310.24020385742);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4700.27734375, -3482.6528320313, 310.21264648438);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4686.4360351563, -3467.1403808594, 310.14178466797);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4690.6049804688, -3447.109375, 310.20501708984);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4706.16796875, -3431.841796875, 310.2239074707);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4718.2373046875, -3414.9291992188, 310.25704956055);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4738.8637695313, -3376.4548339844, 310.25704956055);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4745.9291992188, -3356.9406738281, 310.25704956055);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4751.2797851563, -3314.7944335938, 310.25704956055);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4750.1665039063, -3294.0576171875, 310.25704956055);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4742.6953125, -3253.224609375, 310.25704956055);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4732.7016601563, -3235.1110839844, 310.25704956055);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4706.0395507813, -3203.4064941406, 310.24176025391);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4691.4370117188, -3188.5107421875, 310.19476318359);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4680.77734375, -3171.33984375, 310.16644287109);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4695.4877929688, -3156.6486816406, 310.18475341797);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4709.5981445313, -3140.0051269531, 310.2409362793);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4723.6352539063, -3123.2919921875, 310.2395324707);
lochmodanGatherPaths:addLochmodanPath(self.numLochmodanPaths, -4742.12890625, -3114.880859375, 308.37368774414);
end