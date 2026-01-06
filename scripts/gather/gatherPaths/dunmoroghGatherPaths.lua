dunmoroghGatherPaths = {

	dunmoroghPaths = {},
	numDunmoroghPaths = 1,

}


function dunmoroghGatherPaths:addDunmoroghPath(id, x, y, z)

    local randomOffset = math.random(-6.24552, 5.12525);

    self.dunmoroghPaths[self.numDunmoroghPaths] = {};
    self.dunmoroghPaths[self.numDunmoroghPaths]['id'] = id;
    self.dunmoroghPaths[self.numDunmoroghPaths]['pos'] = {};
    self.dunmoroghPaths[self.numDunmoroghPaths]['pos']['x'] = x + randomOffset;
    self.dunmoroghPaths[self.numDunmoroghPaths]['pos']['y'] = y + randomOffset;
    self.dunmoroghPaths[self.numDunmoroghPaths]['pos']['z'] = z;

    self.numDunmoroghPaths = self.numDunmoroghPaths + 1;

end

function dunmoroghGatherPaths:setupDunmoroghPaths()
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5258.4868164063, -490.91036987305, 386.4645690918);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5212.2827148438, -452.31893920898, 386.33499145508);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5171.2124023438, -408.17352294922, 388.06774902344);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5113.8022460938, -387.99356079102, 390.54165649414);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5053.7333984375, -385.78381347656, 392.84124755859);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -4993.9633789063, -378.666015625, 392.22158813477);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -4937.5815429688, -358.09088134766, 390.08590698242);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -4914.6943359375, -302.27423095703, 387.06982421875);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -4915.9975585938, -242.17079162598, 382.94342041016);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -4913.8178710938, -182.01806640625, 379.16461181641);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -4925.5654296875, -122.13292694092, 376.37902832031);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -4949.3857421875, -66.993560791016, 381.72399902344);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5008.33203125, -54.396270751953, 387.45782470703);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5038.5615234375, -1.0487785339355, 393.7155456543);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5039.3559570313, 59.734519958496, 393.03405761719);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5012.5556640625, 114.56743621826, 389.48104858398);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -4983.8100585938, 168.32057189941, 387.86511230469);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5031.931640625, 204.28199768066, 388.84768676758);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5068.8642578125, 252.73338317871, 390.95547485352);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5096.3134765625, 306.19961547852, 394.13925170898);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5130.0034179688, 356.61846923828, 396.74722290039);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5183.9404296875, 384.38418579102, 395.53057861328);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5233.279296875, 418.86779785156, 390.15063476563);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5291.98828125, 434.07586669922, 385.66079711914);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5351.1064453125, 444.85437011719, 385.03140258789);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5390.0004882813, 491.89151000977, 384.78146362305);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5440.5297851563, 524.62139892578, 387.31097412109);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5501.1337890625, 521.20257568359, 388.27691650391);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5550.4750976563, 486.93258666992, 384.30856323242);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5608.9116210938, 470.85552978516, 384.51400756836);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5630.5083007813, 413.67959594727, 382.70111083984);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5604.44921875, 359.61056518555, 385.68975830078);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5578.4135742188, 304.35491943359, 395.20288085938);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5544.7280273438, 253.41850280762, 396.1706237793);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5506.0966796875, 207.36932373047, 398.90393066406);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5469.4541015625, 159.71182250977, 400.20385742188);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5437.8129882813, 108.66028594971, 396.57073974609);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5404.8544921875, 58.369102478027, 395.50170898438);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5388.1030273438, 0.20155215263367, 395.94448852539);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5406.1025390625, -57.95671081543, 392.93646240234);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5411.62109375, -119.7613067627, 397.95602416992);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5420.8198242188, -179.12911987305, 402.13275146484);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5424.9272460938, -239.11715698242, 404.56771850586);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5423.7495117188, -299.22842407227, 401.0198059082);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5411.3647460938, -358.43307495117, 401.8108215332);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5455.134765625, -399.88787841797, 398.66152954102);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5507.1728515625, -430.82611083984, 404.93545532227);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5554.2866210938, -392.50674438477, 410.13848876953);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5608.7680664063, -365.66958618164, 400.34698486328);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5663.3564453125, -339.46096801758, 375.05914306641);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5689.2373046875, -284.64709472656, 365.34219360352);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5714.7939453125, -230.34870910645, 356.37033081055);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5755.61328125, -186.31039428711, 352.02484130859);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5802.5517578125, -147.69139099121, 353.47467041016);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5842.9140625, -103.06058502197, 357.14770507813);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5860.7231445313, -45.739326477051, 360.2294921875);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5881.7153320313, 12.232041358948, 358.92422485352);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5829.9858398438, 42.958824157715, 356.49047851563);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5882.1010742188, 73.21923828125, 367.47003173828);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5925.5209960938, -30.371643066406, 373.84091186523);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5941.203125, -89.131774902344, 389.29870605469);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5975.201171875, -139.49583435059, 399.21047973633);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5996.8559570313, -196.48526000977, 406.33901977539);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -6027.533203125, -248.14895629883, 416.07803344727);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -6051.5571289063, -303.75894165039, 425.21212768555);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -6036.15234375, -362.46917724609, 420.9108581543);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -6003.9013671875, -414.25775146484, 410.75436401367);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5979.0986328125, -469.03353881836, 405.27816772461);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5953.7587890625, -523.57116699219, 408.21966552734);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5905.298828125, -558.99310302734, 399.85034179688);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5845.181640625, -559.40045166016, 398.49694824219);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5785.1118164063, -561.30596923828, 399.9006652832);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5728.5278320313, -541.12054443359, 400.23608398438);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5793.9033203125, -621.48797607422, 398.19500732422);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5804.8188476563, -680.61743164063, 397.82305908203);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5810.6640625, -740.88000488281, 397.38949584961);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5797.5268554688, -799.60675048828, 397.57580566406);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5780.3056640625, -857.21783447266, 397.62838745117);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5781.0283203125, -917.67724609375, 394.71890258789);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5811.1513671875, -969.71685791016, 396.62045288086);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5828.6572265625, -1028.0155029297, 395.41235351563);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5829.1669921875, -1088.1024169922, 384.29684448242);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5829.5268554688, -1148.2998046875, 378.53045654297);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5835.1918945313, -1208.0676269531, 382.63970947266);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5835.3969726563, -1268.9016113281, 384.15460205078);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5842.1103515625, -1329.4617919922, 388.22113037109);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5851.6791992188, -1388.8093261719, 396.00628662109);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5822.859375, -1442.5693359375, 399.20388793945);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5768.6791992188, -1469.4995117188, 400.86947631836);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5712.75, -1491.5750732422, 400.16500854492);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5702.1826171875, -1551.2523193359, 386.2760925293);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5648.9345703125, -1523.3902587891, 398.84057617188);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5596.6796875, -1554.1801757813, 399.38632202148);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5598.7880859375, -1614.9271240234, 397.21917724609);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5620.8271484375, -1671.1086425781, 400.10717773438);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5664.1435546875, -1712.7453613281, 399.80902099609);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5685.6474609375, -1768.7652587891, 399.80813598633);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5697.1293945313, -1827.7888183594, 400.79263305664);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5723.7646484375, -1882.4499511719, 400.23153686523);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5766.3330078125, -1924.8863525391, 401.81402587891);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5805.6606445313, -1971.5034179688, 401.66854858398);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5816.5317382813, -2031.5618896484, 401.62588500977);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5796.9697265625, -2088.8696289063, 400.87890625);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5747.892578125, -2123.8557128906, 400.80862426758);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5687.04296875, -2121.9077148438, 400.49169921875);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5626.1000976563, -2118.6010742188, 400.49182128906);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5572.9194335938, -2090.6235351563, 399.7815246582);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5516.1469726563, -2066.2578125, 399.73504638672);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5512.3090820313, -2006.3236083984, 399.37564086914);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5509.8725585938, -1946.3332519531, 400.11862182617);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5491.3530273438, -1888.7843017578, 397.26440429688);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5497.4184570313, -1828.3605957031, 399.70361328125);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5507.4096679688, -1769.1241455078, 397.35168457031);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5518.4565429688, -1709.9725341797, 396.65518188477);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5532.03125, -1651.4683837891, 393.08258056641);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5563.6000976563, -1503.0484619141, 399.63055419922);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5545.3842773438, -1445.8352050781, 401.96087646484);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5602.978515625, -1426.7547607422, 399.83636474609);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5641.658203125, -1380.2780761719, 397.04061889648);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5654.267578125, -1320.8394775391, 395.99700927734);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5649.9326171875, -1260.9066162109, 390.38037109375);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5683.7919921875, -1210.3540039063, 387.35214233398);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5663.9077148438, -1153.6304931641, 385.13470458984);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5617.8798828125, -1114.8248291016, 391.39868164063);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5569.6015625, -1078.8138427734, 391.54696655273);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5556.861328125, -1020.1157836914, 392.79907226563);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5510.1743164063, -982.36126708984, 397.27810668945);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5452.8388671875, -964.32983398438, 394.11090087891);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5392.708984375, -966.16021728516, 390.41589355469);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5389.1791992188, -905.35974121094, 392.44534301758);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5385.2133789063, -845.31188964844, 392.37405395508);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5386.1435546875, -784.53210449219, 395.85256958008);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5362.626953125, -728.79357910156, 396.15979003906);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5387.716796875, -673.19854736328, 395.19030761719);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5370.3930664063, -615.02575683594, 393.34616088867);
dunmoroghGatherPaths:addDunmoroghPath(self.numDunmoroghPaths, -5326.4301757813, -573.89086914063, 393.58734130859);

end
