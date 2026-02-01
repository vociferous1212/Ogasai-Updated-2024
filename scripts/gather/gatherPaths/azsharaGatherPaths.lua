azsharaGatherPaths = {

		azsharaPaths = {},
		numAzsharaPaths = 1,

}


function azsharaGatherPaths:addAzsharaPath(id, x, y, z)

	local randomOffset = math.random(-3.24552, 4.12525);

	self.azsharaPaths[self.numAzsharaPaths] = {};
	self.azsharaPaths[self.numAzsharaPaths]['id'] = id;
	self.azsharaPaths[self.numAzsharaPaths]['pos'] = {};
	self.azsharaPaths[self.numAzsharaPaths]['pos']['x'] = x + randomOffset;
	self.azsharaPaths[self.numAzsharaPaths]['pos']['y'] = y + randomOffset;
	self.azsharaPaths[self.numAzsharaPaths]['pos']['z'] = z;

	self.numAzsharaPaths = self.numAzsharaPaths + 1;

end

function azsharaGatherPaths:setupAzsharaPaths()

azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2761.9633789063, -3945.5541992188, 91.750007629395);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2802.8947753906, -4098.0180664063, 99.683547973633);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2954.1000976563, -4110.6303710938, 103.34485626221);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3113.2770996094, -4169.1572265625, 102.90670013428);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3279.9545898438, -4194.9296875, 106.83451080322);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3448.0930175781, -4203.5693359375, 98.015968322754);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3600.6108398438, -4233.3359375, 100.24926757813);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3569.3229980469, -4405.8608398438, 110.90716552734);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3578.9541015625, -4509.6967773438, 106.55309295654);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3565.7006835938, -4590.953125, 101.81998443604);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3477.3969726563, -4640.7534179688, 103.74649047852);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3351.2805175781, -4650.4829101563, 99.615104675293);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3359.89453125, -4739.8725585938, 104.46601104736);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3271.9689941406, -4925.7045898438, 118.50575256348);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3220.2438964844, -5007.9848632813, 130.6268157959);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3116.5239257813, -5048.2880859375, 142.89236450195);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3023.4348144531, -5155.2993164063, 133.01133728027);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2816.484375, -5109.5151367188, 112.00217437744);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2659.9814453125, -5005.0014648438, 128.5419921875);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2580.29296875, -5063.3081054688, 119.13075256348);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2533.8012695313, -5133.8139648438, 112.27411651611);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2518.361328125, -5282.2133789063, 111.26079559326);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2556.7043457031, -5497.2729492188, 113.77618408203);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2455.9182128906, -5689.7197265625, 105.63860321045);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2469.8820800781, -5832.0791015625, 102.53594970703);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2514.2346191406, -5935.078125, 98.083076477051);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2487.6218261719, -6075.5688476563, 99.209182739258);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2358.6650390625, -6217.1083984375, 104.62915802002);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2383.2551269531, -6181.8989257813, 101.4924697876);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2525.2504882813, -6318.5205078125, 103.92831420898);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2485.4521484375, -6426.9638671875, 102.33590698242);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2372.138671875, -6493.5161132813, 105.48535919189);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2483.2434082031, -6427.517578125, 102.3215713501);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2580.4470214844, -6288.4780273438, 100.76461029053);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2652.2434082031, -6192.6918945313, 90.792701721191);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2648.1130371094, -6068.5698242188, 99.590881347656);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2688.6904296875, -5877.654296875, 96.28067779541);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2680.5400390625, -5739.9194335938, 109.77551269531);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2766.0903320313, -5796.3759765625, 102.03695678711);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2816.7329101563, -5685.611328125, 126.14550018311);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2874.3933105469, -5580.10546875, 132.78814697266);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2914.7619628906, -5484.6728515625, 146.2608795166);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2935.8896484375, -5399.005859375, 125.24724578857);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 2930.1809082031, -5224.6625976563, 126.87088775635);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3059.9213867188, -5160.2963867188, 133.94155883789);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3144.4694824219, -5032.1333007813, 142.70608520508);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3265.8291015625, -4980.455078125, 128.44255065918);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3306.4172363281, -4810.833984375, 108.92436981201);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3499.8994140625, -4780.2329101563, 112.00438690186);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3607.6330566406, -4793.9677734375, 119.33142089844);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3673.8947753906, -4835.3286132813, 120.02661895752);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3722.3156738281, -4937.5048828125, 131.89782714844);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3798.5419921875, -4970.1772460938, 144.99528503418);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3846.4895019531, -5050.1118164063, 130.59014892578);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3964.8493652344, -5054.029296875, 134.34834289551);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3961.572265625, -5240.5478515625, 115.91775512695);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3930.6437988281, -5342.8994140625, 131.6322479248);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4055.9104003906, -5348.3286132813, 116.35057067871);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4215.763671875, -5330.9956054688, 122.07634735107);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4352.439453125, -5383.4624023438, 123.20217132568);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4510.87109375, -5508.3764648438, 111.78099060059);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4668.4731445313, -5396.4384765625, 109.14093017578);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4705.7622070313, -5522.9565429688, 111.27140808105);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4702.5263671875, -5621.919921875, 113.3044052124);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4597.4716796875, -5696.9111328125, 97.979873657227);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4459.1333007813, -5814.4106445313, 106.61309814453);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4365.435546875, -5910.3198242188, 100.26282501221);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4297.5083007813, -6034.478515625, 101.49562835693);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4480.8359375, -6066.8212890625, 94.079513549805);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4575.1284179688, -6120.7006835938, 103.18312072754);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4737.9560546875, -6111.4526367188, 95.204704284668);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4811.3330078125, -6126.3330078125, 96.15030670166);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4706.693359375, -6228.9096679688, 111.51978302002);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4627.7744140625, -6303.0161132813, 115.27111053467);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4488.2314453125, -6343.6484375, 123.84629821777);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4603.3090820313, -6410.0830078125, 118.09049987793);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4723.6157226563, -6474.591796875, 110.17762756348);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4801.1323242188, -6560.90234375, 98.585548400879);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4822.751953125, -6662.0698242188, 94.960296630859);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4785.783203125, -6719.9262695313, 97.283836364746);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4719.4365234375, -6742.0395507813, 119.16040039063);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4749.291015625, -6854.24609375, 98.875663757324);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4769.9790039063, -7043.7172851563, 98.334671020508);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4732.1596679688, -7273.5659179688, 69.408622741699);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4706.5610351563, -7428.0151367188, 74.214469909668);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4657.6884765625, -7508.9096679688, 71.438552856445);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4526.5576171875, -7392.4184570313, 87.960578918457);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4428.7958984375, -7294.4248046875, 96.766479492188);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4389.5747070313, -7175.2197265625, 116.52863311768);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4341.826171875, -7019.8115234375, 126.2299041748);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4347.771484375, -6904.2001953125, 98.462074279785);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4302.0776367188, -6821.74609375, 91.763412475586);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4417.16796875, -6778.0283203125, 97.636436462402);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4540.8486328125, -6702.6787109375, 105.78673553467);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4650.7250976563, -6598.310546875, 103.50245666504);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4751.9448242188, -6461.5805664063, 105.86458587646);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4789.2705078125, -6351.3598632813, 113.88680267334);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4772.1118164063, -6254.4682617188, 118.67121124268);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4734.2587890625, -6112.142578125, 96.26708984375);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4714.2412109375, -5982.73828125, 105.1343536377);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4632.16015625, -5858.6450195313, 114.80774688721);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4537.6245117188, -5781.3510742188, 98.977752685547);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4430.3046875, -5707.0336914063, 104.56623840332);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4311.3940429688, -5615.8725585938, 125.61203765869);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4195.2075195313, -5569.3686523438, 116.02864837646);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4105.7797851563, -5480.5771484375, 104.91303253174);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 4002.6413574219, -5366.7700195313, 118.38269805908);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3974.2729492188, -5176.7446289063, 114.04981994629);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3921.7009277344, -5027.9165039063, 137.81483459473);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3839.9223632813, -4959.3139648438, 147.47814941406);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3730.9653320313, -4850.166015625, 129.40707397461);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3636.56640625, -4758.9501953125, 115.51476287842);
azsharaGatherPaths:addAzsharaPath(self.numAzsharaPaths, 3641.4479980469, -4678.42578125, 115.38388061523);

end