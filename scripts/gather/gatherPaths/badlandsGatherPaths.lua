badlandsGatherPaths = {

	badlandsPaths = {},
	numBadlandsPaths = 1,

}

function badlandsGatherPaths:addBadlandsPath(id, x, y, z)

    local randomOffset = math.random(-15.24552, 15.12525);

    self.badlandsPaths[self.numBadlandsPaths] = {};
    self.badlandsPaths[self.numBadlandsPaths]['id'] = id;
    self.badlandsPaths[self.numBadlandsPaths]['pos'] = {};
    self.badlandsPaths[self.numBadlandsPaths]['pos']['x'] = x + randomOffset;
    self.badlandsPaths[self.numBadlandsPaths]['pos']['y'] = y + randomOffset;
    self.badlandsPaths[self.numBadlandsPaths]['pos']['z'] = z;

    self.numBadlandsPaths = self.numBadlandsPaths + 1;

end

function badlandsGatherPaths:setupBadlandsPaths()

badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6134.2705078125, -3363.0659179688, 249.16899108887);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6171.5346679688, -3410.6708984375, 239.53987121582);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6224.1611328125, -3439.6691894531, 237.84420776367);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6276.9287109375, -3409.1359863281, 239.15812683105);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6327.9692382813, -3377.5456542969, 241.43278503418);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6380.9296875, -3349.2048339844, 241.66767883301);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6433.4506835938, -3319.8571777344, 241.66767883301);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6492.59375, -3305.7182617188, 241.75187683105);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6553.6962890625, -3307.2641601563, 244.79586791992);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6601.3002929688, -3269.681640625, 241.33253479004);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6571.9423828125, -3217.2995605469, 247.61331176758);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6554.2348632813, -3159.96875, 257.12463378906);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6544.6923828125, -3100.6713867188, 267.04736328125);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6553.6401367188, -3040.4116210938, 266.16122436523);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6562.4936523438, -2980.85546875, 249.04322814941);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6610.6767578125, -2944.9125976563, 241.8643951416);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6658.9145507813, -2907.6911621094, 241.58331298828);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6672.3505859375, -2848.0537109375, 242.6238861084);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6660.787109375, -2788.2517089844, 241.97752380371);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6665.1748046875, -2728.3542480469, 243.13664245605);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6675.6137695313, -2668.2680664063, 241.66665649414);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6695.3969726563, -2611.5856933594, 242.17767333984);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6676.3901367188, -2552.42578125, 241.88456726074);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6726.4770507813, -2517.8522949219, 243.28694152832);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6785.146484375, -2504.7309570313, 243.30364990234);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6846.0786132813, -2503.310546875, 240.9686126709);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6906.0302734375, -2507.3393554688, 241.85343933105);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6944.3779296875, -2460.3830566406, 240.7438659668);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6956.0971679688, -2401.4716796875, 242.00581359863);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7004.5434570313, -2364.330078125, 242.72222900391);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7060.2690429688, -2340.1384277344, 243.12850952148);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7120.1708984375, -2335.0651855469, 243.24984741211);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7179.1982421875, -2348.95703125, 242.80262756348);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7205.875, -2402.8205566406, 242.61259460449);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7191.05859375, -2463.0122070313, 244.68232727051);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7180.4184570313, -2522.1520996094, 251.06559753418);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7178.7026367188, -2582.2119140625, 247.57733154297);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7177.8305664063, -2642.3920898438, 244.19360351563);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7130.4287109375, -2679.5759277344, 241.74383544922);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7087.4555664063, -2722.3605957031, 242.72459411621);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7037.2802734375, -2756.4624023438, 242.47395324707);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6980.19921875, -2778.0910644531, 241.89921569824);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6926.4829101563, -2804.9448242188, 241.66691589355);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6898.2202148438, -2857.9880371094, 241.76005554199);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6878.720703125, -2915.8044433594, 242.73469543457);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6891.9497070313, -2974.8952636719, 242.67863464355);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6948.240234375, -2999.2280273438, 242.02900695801);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7008.2734375, -2996.1315917969, 241.77563476563);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7066.943359375, -3009.318359375, 241.68446350098);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7081.517578125, -3068.3195800781, 241.67524719238);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7091.0268554688, -3127.6684570313, 242.14677429199);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7096.0283203125, -3187.5090332031, 241.86103820801);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7092.5034179688, -3247.470703125, 242.7884979248);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7117.626953125, -3302.9418945313, 244.23902893066);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7140.17578125, -3359.3442382813, 243.70985412598);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7138.21484375, -3420.087890625, 243.94618225098);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7116.7280273438, -3476.224609375, 242.53463745117);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7096.7739257813, -3532.8740234375, 242.3136138916);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7087.4360351563, -3593.4548339844, 241.67137145996);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -7027.71484375, -3602.7712402344, 241.98715209961);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6975.64453125, -3572.5603027344, 241.66735839844);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6936.7900390625, -3526.0207519531, 241.96244812012);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6902.0288085938, -3477.0209960938, 243.16452026367);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6867.2368164063, -3427.978515625, 242.75482177734);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6832.4677734375, -3378.8344726563, 241.66690063477);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6773.0458984375, -3369.6313476563, 244.67942810059);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6720.1596679688, -3399.9057617188, 241.66670227051);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6705.1259765625, -3458.0417480469, 242.4665222168);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6716.5986328125, -3517.8684082031, 243.87414550781);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6768.3525390625, -3549.9821777344, 245.61454772949);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6826.2978515625, -3566.3037109375, 241.98933410645);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6785.3686523438, -3610.2233886719, 243.25422668457);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6758.9809570313, -3664.42578125, 243.11517333984);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6755.2094726563, -3724.4389648438, 242.33013916016);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6758.3920898438, -3784.5009765625, 259.76623535156);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6702.6577148438, -3640.736328125, 241.74397277832);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6643.5688476563, -3626.0334472656, 241.7176361084);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6583.5942382813, -3630.3432617188, 242.09567260742);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6524.4711914063, -3644.9467773438, 244.47389221191);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6466.7485351563, -3664.5791015625, 247.21253967285);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6405.7983398438, -3668.9638671875, 243.91789245605);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6359.037109375, -3628.9074707031, 241.91044616699);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6336.7211914063, -3572.990234375, 241.72143554688);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6335.7890625, -3512.9169921875, 242.24114990234);
badlandsGatherPaths:addBadlandsPath(self.numBadlandsPaths, -6281.4780273438, -3486.7556152344, 252.30508422852);

end