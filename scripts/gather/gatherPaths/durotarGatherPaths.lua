durotarGatherPaths = {

		durotarPaths = {},
		numDurotarPaths = 1,

}

function durotarGatherPaths:addDurotarPath(id, x, y, z)

	local randomOffset = math.random(-4.24552, 6.12525);

	self.durotarPaths[self.numDurotarPaths] = {};
	self.durotarPaths[self.numDurotarPaths]['id'] = id;
	self.durotarPaths[self.numDurotarPaths]['pos'] = {};
	self.durotarPaths[self.numDurotarPaths]['pos']['x'] = x + randomOffset;
	self.durotarPaths[self.numDurotarPaths]['pos']['y'] = y + randomOffset;
	self.durotarPaths[self.numDurotarPaths]['pos']['z'] = z;

	self.numDurotarPaths = self.numDurotarPaths + 1;

end

function durotarGatherPaths:setupDurotarPaths()

durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1355.4366455078, -4342.24609375, 27.24427986145);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1322.1545410156, -4291.8461914063, 26.448841094971);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1269.8076171875, -4260.3110351563, 24.337944030762);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1231.8743896484, -4212.7392578125, 24.860864639282);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1228.1369628906, -4151.7612304688, 24.468490600586);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1216.4136962891, -4092.2290039063, 22.02587890625);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1224.5657958984, -4032.4379882813, 19.29439163208);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1188.8306884766, -3983.5930175781, 17.340286254883);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1143.6062011719, -3943.8500976563, 18.752323150635);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1083.8009033203, -3936.2727050781, 19.944278717041);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1027.5222167969, -3958.7395019531, 17.815940856934);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 967.41918945313, -3957.0751953125, 21.946622848511);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 907.99713134766, -3942.2243652344, 22.257778167725);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 851.24261474609, -3920.3315429688, 19.782136917114);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 789.48419189453, -3919.6774902344, 19.90456199646);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 731.28265380859, -3937.1323242188, 14.622250556946);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 674.0146484375, -3955.142578125, 14.90253162384);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 615.06958007813, -3968.5844726563, 12.031028747559);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 555.36145019531, -3975.3564453125, 17.926584243774);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 495.18417358398, -3976.220703125, 18.094348907471);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 433.29846191406, -3970.75, 31.106868743896);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 373.26596069336, -3968.0983886719, 32.076778411865);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 313.29110717773, -3965.4494628906, 34.275535583496);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 254.29406738281, -3979.2829589844, 38.513343811035);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 194.46420288086, -3984.0812988281, 44.225269317627);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 135.93167114258, -3970.2993164063, 47.804931640625);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 87.957466125488, -3932.6208496094, 46.361885070801);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 29.069189071655, -3919.2114257813, 46.143547058105);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -8.7262802124023, -3966.2961425781, 55.940093994141);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -54.117580413818, -4005.8305664063, 65.415031433105);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -37.819927215576, -4063.9497070313, 66.836845397949);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -11.244193077087, -4117.8442382813, 76.261207580566);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 40.487438201904, -4148.4086914063, 66.382164001465);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 94.979927062988, -4173.880859375, 56.084320068359);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 145.53718566895, -4206.587890625, 49.598899841309);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 197.05302429199, -4237.9135742188, 45.629665374756);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 250.85488891602, -4209.615234375, 37.392333984375);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 311.38735961914, -4209.3588867188, 26.659275054932);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 370.41940307617, -4221.1596679688, 24.861137390137);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 430.82348632813, -4230.076171875, 25.090724945068);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 491.21899414063, -4235.4965820313, 22.998838424683);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 551.14190673828, -4239.7387695313, 15.743627548218);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 612.01721191406, -4242.791015625, 13.630167007446);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 647.03576660156, -4291.8461914063, 17.245273590088);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 634.87573242188, -4350.6943359375, 17.621999740601);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 620.37103271484, -4409.0400390625, 15.798367500305);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 619.42077636719, -4469.9184570313, 11.644351959229);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 630.89666748047, -4528.9853515625, 8.8307247161865);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 639.63433837891, -4588.7153320313, 4.3810715675354);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 678.67083740234, -4634.3725585938, -1.6588768959045);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 737.24761962891, -4647.9306640625, -4.7142190933228);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 774.36364746094, -4600.7744140625, 1.2226649522781);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 806.61932373047, -4550, 5.015905380249);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 861.45275878906, -4523.2524414063, 4.9806199073792);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 918.34973144531, -4504.0014648438, 7.3072724342346);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 974.06195068359, -4479.3427734375, 7.7820053100586);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1033.5073242188, -4469.0932617188, 15.175915718079);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1078.4448242188, -4509.01953125, 18.068407058716);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1127.5458984375, -4543.5185546875, 18.511947631836);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1170.8218994141, -4585.8110351563, 18.280107498169);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1206.5383300781, -4634.1840820313, 18.4869556427);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1244.4647216797, -4682.0244140625, 15.921497344971);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1296.3117675781, -4712.8969726563, 20.505168914795);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1351.4881591797, -4737.83203125, 27.01845741272);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1406.9566650391, -4761.8403320313, 27.239107131958);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1438.6208496094, -4812.8334960938, 26.570499420166);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1433.6456298828, -4873.5385742188, 12.080195426941);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1388.3410644531, -4913.5122070313, 8.2159433364868);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1344.2733154297, -4954.7880859375, 5.6294112205505);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1296.1441650391, -4990.7016601563, 1.7978738546371);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1236.5637207031, -4998.4555664063, 3.9242813587189);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1180.2894287109, -4976.1171875, 11.904124259949);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1122.9515380859, -4952.87890625, 13.463606834412);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1062.9935302734, -4941.9443359375, 12.421691894531);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1003.5916748047, -4931.4560546875, 14.137099266052);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 955.47131347656, -4967.326171875, 10.065498352051);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 908.74847412109, -5006.1079101563, 6.6247639656067);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 848.5185546875, -4997.8520507813, 9.0618171691895);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 794.51666259766, -4969.4946289063, 15.411324501038);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 743.08898925781, -4938.3803710938, 19.926441192627);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 690.10998535156, -4907.7407226563, 23.402458190918);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 638.32415771484, -4875.9150390625, 24.066080093384);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 578.47833251953, -4882.8569335938, 25.017301559448);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 522.49334716797, -4904.7900390625, 25.016674041748);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 462.5397644043, -4912.6508789063, 22.576936721802);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 402.65158081055, -4907.263671875, 24.393009185791);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 345.38320922852, -4925.7504882813, 23.846645355225);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 330.43341064453, -4984.0615234375, 20.973194122314);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 325.06109619141, -5044.3212890625, 13.163869857788);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 282.15777587891, -5086.8212890625, 8.7820777893066);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 228.55805969238, -5056.8295898438, 11.140850067139);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 184.64196777344, -5014.6513671875, 11.615725517273);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 152.83125305176, -4963.6245117188, 12.175569534302);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 112.90098571777, -4917.5419921875, 12.207302093506);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 70.637817382813, -4874.7109375, 14.338526725769);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 10.776206016541, -4868.6201171875, 20.129247665405);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -41.283672332764, -4898.654296875, 16.34557723999);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -90.300285339355, -4939.8447265625, 17.756052017212);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -84.540328979492, -5000.3452148438, 16.038402557373);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -57.310363769531, -5053.8696289063, 10.582590103149);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -86.964363098145, -5106.3051757813, 19.165227890015);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -145.48675537109, -4998.7993164063, 22.408020019531);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -202.25387573242, -5020.5336914063, 21.861263275146);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -235.46746826172, -4970.154296875, 21.511659622192);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -261.29037475586, -4915.0390625, 27.151041030884);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -308.74053955078, -4878.0302734375, 37.479354858398);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -360.54489135742, -4847.3295898438, 38.229194641113);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -420.42303466797, -4852.8520507813, 38.033660888672);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -480.12432861328, -4865.7084960938, 36.770568847656);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -538.12585449219, -4881.5654296875, 35.706104278564);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -596.00726318359, -4900.7036132813, 32.65149307251);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -647.05255126953, -4932.46484375, 29.712783813477);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -684.55926513672, -4980.470703125, 21.585609436035);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -726.45452880859, -5023.5600585938, 16.720487594604);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -786.78857421875, -5031.5756835938, 13.905396461487);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -843.92004394531, -5013.1518554688, 11.168204307556);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -887.17291259766, -4971.3544921875, 15.767137527466);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -935.02838134766, -4933.9028320313, 13.463338851929);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -972.64953613281, -4886.7006835938, 8.3651494979858);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -1016.6335449219, -4845.3149414063, 12.369398117065);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -1039.2868652344, -4789.18359375, 15.398844718933);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -1026.798828125, -4730.125, 14.063493728638);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -969.55847167969, -4709.4189453125, 20.150171279907);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -909.04040527344, -4713.8344726563, 23.33652305603);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -849.63018798828, -4723.560546875, 27.177795410156);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -821.96685791016, -4777.8037109375, 23.956205368042);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -790.70056152344, -4829.7182617188, 20.307054519653);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -734.69683837891, -4806.22265625, 25.0445728302);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -687.06927490234, -4769.5991210938, 33.696598052979);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -628.11450195313, -4754.4243164063, 25.724058151245);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -569.15673828125, -4738.3852539063, 33.350482940674);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -509.32992553711, -4729.9643554688, 36.13916015625);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -450.95434570313, -4744.1889648438, 37.268592834473);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -393.55038452148, -4725.3408203125, 40.896766662598);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -333.34234619141, -4726.8681640625, 36.490715026855);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -280.03280639648, -4755.830078125, 34.147575378418);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -220.01992797852, -4748.5004882813, 27.623109817505);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -162.13523864746, -4731.9672851563, 29.584177017212);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -102.64848327637, -4720.8452148438, 25.338916778564);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, -43.109329223633, -4728.6264648438, 25.18274307251);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 17.01132774353, -4729.8159179688, 24.916007995605);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 76.978469848633, -4725.087890625, 23.779304504395);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 137.02961730957, -4713.8754882813, 18.505975723267);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 195.7975769043, -4733.3193359375, 14.050074577332);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 256.9211730957, -4736.9760742188, 10.102234840393);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 316.96466064453, -4735.7504882813, 9.6516828536987);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 377.05578613281, -4735.26171875, 9.6746530532837);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 437.23028564453, -4733.9155273438, 7.9575753211975);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 498.05477905273, -4735.1391601563, 2.2364811897278);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 558.20336914063, -4732.6577148438, -5.4000759124756);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 617.56768798828, -4723.4340820313, -10.078842163086);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 673.71588134766, -4702.1918945313, -9.4266138076782);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1074.0543212891, -4423.69921875, 17.653762817383);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1132.8067626953, -4410.8818359375, 20.938245773315);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1192.2745361328, -4402.017578125, 22.829502105713);
durotarGatherPaths:addDurotarPath(self.numDurotarPaths, 1252.8895263672, -4393.6884765625, 27.956611633301);


end