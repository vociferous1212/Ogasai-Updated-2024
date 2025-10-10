felwoodGatherPaths = {

	felwoodPaths = {},
	numFelwoodPaths = 1,

}

function felwoodGatherPaths:addFelwoodPath(id, x, y, z)

    local randomOffset = math.random(-4.24552, 6.12525);

    self.felwoodPaths[self.numFelwoodPaths] = {};
    self.felwoodPaths[self.numFelwoodPaths]['id'] = id;
    self.felwoodPaths[self.numFelwoodPaths]['pos'] = {};
    self.felwoodPaths[self.numFelwoodPaths]['pos']['x'] = x + randomOffset;
    self.felwoodPaths[self.numFelwoodPaths]['pos']['y'] = y + randomOffset;
    self.felwoodPaths[self.numFelwoodPaths]['pos']['z'] = z;

    self.numFelwoodPaths = self.numFelwoodPaths + 1;

end

function felwoodGatherPaths:setupFelwoodPaths()

felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 3635.2380371094, -1525.7196044922, 178.84135437012);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 3742.4987792969, -1502.8764648438, 199.513671875);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 3783.8637695313, -1670.0570068359, 246.90504455566);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 3904.283203125, -1616.4290771484, 260.16754150391);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 3842.5322265625, -1511.5341796875, 223.81283569336);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 3798.3732910156, -1337.3953857422, 202.86637878418);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 3949.4313964844, -1289.4869384766, 230.43367004395);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 3959.0539550781, -1077.4348144531, 256.15628051758);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 4076.48828125, -1102.4761962891, 273.13458251953);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 4200.6450195313, -1127.1322021484, 314.9479675293);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 4289.1201171875, -1062.7426757813, 320.57888793945);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 4217.7924804688, -915.82690429688, 285.1354675293);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 4305.1948242188, -849.90032958984, 286.50411987305);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 4377.9799804688, -852.13201904297, 290.99429321289);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 4504.5278320313, -850.99871826172, 296.63684082031);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 4672.1357421875, -794.79016113281, 301.51901245117);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 4833.470703125, -739.71649169922, 300.69296264648);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 4980.2451171875, -743.81890869141, 312.05715942383);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 5186.916015625, -744.34069824219, 340.91854858398);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 5352.8901367188, -698.28601074219, 347.6608581543);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 5484.140625, -877.05255126953, 362.79333496094);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 5388.7807617188, -926.55291748047, 373.50152587891);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 5568.2783203125, -1019.7125854492, 377.06423950195);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 5686.3134765625, -1147.5551757813, 392.1608581543);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 5816.1494140625, -1221.9097900391, 402.5563659668);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 5913.9448242188, -1339.8444824219, 418.06372070313);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 5959.6010742188, -1169.5190429688, 384.53439331055);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6127.3349609375, -1136.1535644531, 373.66897583008);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6185.3833007813, -1035.6584472656, 387.28964233398);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6290.9208984375, -1138.5133056641, 373.40567016602);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6376.3315429688, -1247.4223632813, 378.33901977539);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6529.9135742188, -1213.7521972656, 433.3928527832);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6657.1401367188, -1303.7706298828, 460.76831054688);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6688.9169921875, -1438.0180664063, 477.94281005859);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6771.6987304688, -1591.0476074219, 482.07376098633);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6572.0932617188, -1623.4412841797, 495.03570556641);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6421.6796875, -1673.8936767578, 494.97100830078);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6388.8911132813, -1509.7856445313, 440.63345336914);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6198.669921875, -1632.9283447266, 483.16372680664);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6356.892578125, -1641.8375244141, 474.47619628906);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6510.0434570313, -1756.1423339844, 512.220703125);
felwoodGatherPaths:addFelwoodPath(felwoodGatherPaths.numFelwoodPaths, 6389.814453125, -2042.8798828125, 570.53894042969);


end