stranglethornGatherPaths = {

		stranglethornPaths = {},
		numStranglethornPaths = 1,

}

function stranglethornGatherPaths:addStranglethornPath(id, x, y, z)

	local randomOffset = math.random(-6.24552, 5.12525);

	self.stranglethornPaths[self.numStranglethornPaths] = {};
	self.stranglethornPaths[self.numStranglethornPaths]['id'] = id;
	self.stranglethornPaths[self.numStranglethornPaths]['pos'] = {};
	self.stranglethornPaths[self.numStranglethornPaths]['pos']['x'] = x + randomOffset;
	self.stranglethornPaths[self.numStranglethornPaths]['pos']['y'] = y + randomOffset;
	self.stranglethornPaths[self.numStranglethornPaths]['pos']['z'] = z;

	self.numStranglethornPaths = self.numStranglethornPaths + 1;

end

function stranglethornGatherPaths:setupStranglethornPaths()
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11552.3515625, -416.45977783203, 26.323509216309);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11603.203125, -448.54537963867, 14.73908996582);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11653.540039063, -481.40423583984, 20.922534942627);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11712.872070313, -499.74102783203, 20.454416275024);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11760.893554688, -537.92163085938, 18.155435562134);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11804.157226563, -579.70434570313, 15.678495407104);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11848.88671875, -620.21173095703, 15.759727478027);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11884.727539063, -670.08471679688, 17.221731185913);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11919.314453125, -720.17132568359, 18.011432647705);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11958.389648438, -765.83386230469, 20.958343505859);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12010.796875, -796.68493652344, 16.585626602173);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12066.279296875, -772.00964355469, 14.843952178955);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12125.930664063, -758.10784912109, 13.880739212036);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12182.537109375, -732.27520751953, 14.156299591064);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12212.7890625, -680.12939453125, 13.535907745361);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12173.111328125, -634.73181152344, 16.654117584229);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12188.161132813, -575.75561523438, 25.910272598267);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12246.701171875, -559.72802734375, 28.748537063599);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12302.551757813, -581.92565917969, 28.345249176025);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12363.108398438, -587.099609375, 18.387954711914);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12422.09375, -604.18371582031, 14.46586227417);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12420.046875, -664.55450439453, 15.738844871521);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12371.645507813, -701.57336425781, 16.085880279541);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12342.650390625, -754.67059326172, 21.838888168335);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12383.666992188, -799.1708984375, 30.866067886353);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12445.125976563, -790.07476806641, 39.917453765869);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12505.100585938, -793.58978271484, 39.760391235352);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12562.515625, -811.05511474609, 43.300159454346);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12622.415039063, -822.95422363281, 55.859748840332);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12681.3359375, -835.15112304688, 55.491893768311);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12731.01171875, -800.16772460938, 60.972648620605);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12747.569335938, -741.29895019531, 64.718872070313);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12719.333007813, -687.37939453125, 59.456039428711);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12700.779296875, -629.05633544922, 41.322460174561);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12663.415039063, -581.28637695313, 33.272361755371);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12627.107421875, -533.44177246094, 33.692817687988);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12590.998046875, -485.44927978516, 29.256896972656);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12578.162109375, -426.31875610352, 16.883895874023);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12621.89453125, -384.28955078125, 10.589509010315);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12681.790039063, -372.50201416016, 10.209577560425);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12743.015625, -374.03796386719, 10.12314414978);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12799.891601563, -348.69134521484, 10.292112350464);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12839.936523438, -302.46133422852, 10.197960853577);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12892.53515625, -269.24133300781, 3.3703293800354);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12947.866210938, -245.72888183594, -7.9192652702332);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13001.420898438, -218.40007019043, -11.384994506836);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13058.48828125, -197.04515075684, -9.1461553573608);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13117.400390625, -183.9507598877, -5.1444311141968);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13177.296875, -180.26145935059, 5.3929219245911);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13224.760742188, -143.54878234863, 15.43270778656);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13249.12890625, -87.672264099121, 19.803136825562);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13251.771484375, -26.064437866211, 19.794725418091);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13290.05078125, 22.56720161438, 19.957901000977);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13332.668945313, 64.959854125977, 22.722927093506);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13352.95703125, 121.86566162109, 17.183546066284);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13403.6796875, 157.09103393555, 21.261377334595);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13412.90234375, 216.65278625488, 20.939558029175);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13452.047851563, 263.22927856445, 24.728717803955);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13450.399414063, 119.29601287842, 23.430746078491);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13504.505859375, 92.277320861816, 27.836944580078);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13565.20703125, 89.472267150879, 28.60203742981);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13626.204101563, 101.18151855469, 25.328998565674);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13682.362304688, 122.56783294678, 21.841157913208);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13737.760742188, 146.7389831543, 22.229116439819);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13780.028320313, 190.78775024414, 22.207361221313);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13829.3984375, 226.64599609375, 17.71653175354);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13884.216796875, 253.61480712891, 18.124740600586);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13936.940429688, 282.38522338867, 18.496875762939);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13997.21875, 284.81335449219, 18.69154548645);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -14056, 267.62850952148, 18.596784591675);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -14115.104492188, 256.57147216797, 15.681399345398);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -14174.294921875, 245.59442138672, 15.329206466675);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13401.442382813, 82.424468994141, 24.587272644043);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -13067.420898438, -256.51272583008, -4.6969542503357);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12688.619140625, -312.69107055664, 12.232860565186);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12559.823242188, -368.9407043457, 14.113817214966);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12499.624023438, -372.65243530273, 16.116289138794);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12453.83984375, -333.39721679688, 14.187125205994);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12422.528320313, -280.396484375, 9.2113037109375);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12384.364257813, -232.29331970215, 16.32389831543);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12341.0546875, -189.29203796387, 16.423719406128);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12297.579101563, -147.45822143555, 17.970941543579);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12237.489257813, -142.96301269531, 16.155227661133);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12181.489257813, -116.08995819092, 18.263675689697);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12163.8828125, -56.763412475586, 13.52951335907);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12144.428710938, 1.3149261474609, 2.464857339859);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12102.76171875, 44.891143798828, -6.985728263855);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -12051.051757813, 75.414863586426, -4.4593510627747);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11995.388671875, 97.971870422363, 6.7338714599609);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11935.450195313, 109.52976226807, 17.211893081665);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11876.734375, 122.62618255615, 17.359382629395);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11819.930664063, 142.17793273926, 16.303504943848);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11759.749023438, 144.03900146484, 16.961469650269);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11700.276367188, 130.94523620605, 15.666881561279);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11653.12109375, 93.277534484863, 16.536811828613);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11668.315429688, 35.205150604248, 15.989575386047);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11672.935546875, -26.306427001953, 15.133191108704);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11662.537109375, -87.389266967773, 15.98690032959);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11708.58203125, -126.88368225098, 16.544271469116);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11756.341796875, -164.46594238281, 21.66389465332);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11802.685546875, -202.8824005127, 16.471216201782);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11781.400390625, -260.35864257813, 16.880586624146);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11724.430664063, -235.80744934082, 39.119804382324);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11685.9765625, -228.00752258301, 40.73210144043);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11667.6484375, -239.13293457031, 33.718242645264);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11650.07421875, -250.24131774902, 30.114339828491);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11631.630859375, -261.93734741211, 33.800868988037);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11613.129882813, -273.67083740234, 39.835643768311);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11594.87890625, -285.78964233398, 35.955467224121);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11577.702148438, -297.50155639648, 35.666049957275);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11559.875976563, -310.11471557617, 35.677471160889);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11543.418945313, -322.51965332031, 35.699035644531);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11537.065429688, -342.31494140625, 37.587707519531);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11528.0078125, -360.16284179688, 38.423118591309);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11527.966796875, -381.11743164063, 40.586715698242);
stranglethornGatherPaths:addStranglethornPath(self.numStranglethornPaths, -11533.958007813, -401.87066650391, 34.114631652832);

end

