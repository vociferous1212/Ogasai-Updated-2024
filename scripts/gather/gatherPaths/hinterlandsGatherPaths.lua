hinterlandsGatherPaths = {

	hinterlandsPaths = {},
	numHinterlandsPaths = 1,

}


function hinterlandsGatherPaths:addHinterlandsPath(id, x, y, z)

    local randomOffset = math.random(-6.24552, 5.12525);

    self.hinterlandsPaths[self.numHinterlandsPaths] = {};
    self.hinterlandsPaths[self.numHinterlandsPaths]['id'] = id;
    self.hinterlandsPaths[self.numHinterlandsPaths]['pos'] = {};
    self.hinterlandsPaths[self.numHinterlandsPaths]['pos']['x'] = x + randomOffset;
    self.hinterlandsPaths[self.numHinterlandsPaths]['pos']['y'] = y + randomOffset;
    self.hinterlandsPaths[self.numHinterlandsPaths]['pos']['z'] = z;

    self.numHinterlandsPaths = self.numHinterlandsPaths + 1;

end

function hinterlandsGatherPaths:setupHinterlandsPaths()

hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 114.98539733887, -2505.953125, 119.21479034424);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 68.262153625488, -2467.4724121094, 123.25888824463);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 12.436427116394, -2490.9382324219, 123.49962615967);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -37.019702911377, -2527.0366210938, 120.81872558594);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -94.97216796875, -2543.33203125, 118.43703460693);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -147.97644042969, -2575.1311035156, 118.34609985352);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -200.54881286621, -2604.2810058594, 118.2074432373);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -192.41389465332, -2664.4116210938, 119.54365539551);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -157.5139465332, -2715.2390136719, 121.69805908203);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -148.09094238281, -2775.3586425781, 120.20449829102);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -118.42835235596, -2827.9741210938, 120.14273071289);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -61.130332946777, -2849.0559082031, 119.79176330566);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -1.0964076519012, -2846.0815429688, 121.59552001953);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 39.793891906738, -2800.9392089844, 121.02857971191);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 74.990745544434, -2751.9958496094, 121.54599761963);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 82.629005432129, -2692.3386230469, 109.50366210938);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 134.35482788086, -2722.7568359375, 112.20948028564);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 162.34259033203, -2776.6669921875, 111.10785675049);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 185.44413757324, -2832.185546875, 108.08529663086);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 230.45837402344, -2871.9868164063, 110.120262146);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 286.39196777344, -2895.9616699219, 107.90337371826);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 346.29364013672, -2888.9272460938, 117.97452545166);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 336.42428588867, -2948.251953125, 115.82214355469);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 325.22891235352, -3007.4018554688, 118.39449310303);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 278.28750610352, -3045.625, 118.40051269531);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 220.85707092285, -3027.5803222656, 125.56312561035);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 163.35885620117, -3007.1218261719, 126.33585357666);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 104.72689819336, -2993.7834472656, 122.5393371582);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 46.244892120361, -2976.6320800781, 123.35604095459);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 1.2681946754456, -2935.5212402344, 118.51600646973);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -66.406326293945, -2908.8720703125, 120.8377456665);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -117.85666656494, -2941.5732421875, 119.08338928223);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -148.39527893066, -2993.5656738281, 119.42379760742);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -162.83540344238, -3052.2416992188, 121.36282348633);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -162.8115234375, -3113.5405273438, 119.85694885254);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -160.2359161377, -3173.6154785156, 117.40191650391);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -163.84127807617, -3233.6096191406, 117.47515869141);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -169.52439880371, -3293.3659667969, 122.782371521);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -183.0686340332, -3353.4064941406, 133.80596923828);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -170.4019317627, -3412.23828125, 131.13177490234);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -137.67498779297, -3463.6057128906, 128.45794677734);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -96.080757141113, -3507.6672363281, 121.83215332031);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -48.629085540771, -3545.9836425781, 120.38917541504);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -4.2838306427002, -3586.5166015625, 120.82139587402);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 49.298458099365, -3613.5974121094, 123.88787841797);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 109.57552337646, -3612.7685546875, 129.26817321777);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 116.19948577881, -3553.1064453125, 120.70170593262);

hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 164.80834960938, -3555.8244628906, 128.57902526855);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 225.2529296875, -3554.171875, 130.48072814941);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 281.52969360352, -3533.1428222656, 131.8706817627);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 315.42794799805, -3483.083984375, 129.8981628418);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 325.95269775391, -3423.5153808594, 116.53136444092);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 283.22387695313, -3379.9250488281, 112.88906860352);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 264.275390625, -3322.4013671875, 113.04471588135);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 253.0064239502, -3263.1784667969, 111.47264099121);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 240.2109375, -3203.7126464844, 115.85732269287);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 299.37579345703, -3191.5612792969, 118.73160552979);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 330.81271362305, -3243.1352539063, 117.55514526367);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 324.578125, -3325.349609375, 115.35216522217);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 386.41738891602, -3430.4140625, 117.47785949707);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 414.77874755859, -3483.8347167969, 123.8003616333);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 424.23022460938, -3543.2055664063, 120.56191253662);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 429.73895263672, -3603.3115234375, 119.06271362305);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 420.81942749023, -3662.9521484375, 123.32028198242);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 360.52545166016, -3664.9892578125, 128.75192260742);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 301.22708129883, -3650.3432617188, 124.06103515625);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 241.1000213623, -3650.6103515625, 130.74774169922);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 181.01750183105, -3652.6901855469, 133.11293029785);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 125.39448547363, -3677.025390625, 130.92750549316);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 117.55352783203, -3737.2482910156, 128.50637817383);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 90.353553771973, -3790.7780761719, 123.85897827148);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 87.017036437988, -3851.1262207031, 134.3031463623);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 48.631965637207, -3897.3515625, 141.05632019043);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 13.412576675415, -3946.017578125, 139.16691589355);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -15.90318775177, -3999.5966796875, 130.66983032227);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -54.600921630859, -4046.4396972656, 118.52011108398);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -103.85565185547, -4082.3435058594, 122.28966522217);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -145.87359619141, -4126.3198242188, 117.28863525391);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -140.51347351074, -4186.8740234375, 119.37055206299);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -119.59049224854, -4243.3422851563, 117.51766204834);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -69.786964416504, -4277.6567382813, 122.00249481201);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, -11.982921600342, -4294.2001953125, 121.07341003418);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 35.730110168457, -4256.8071289063, 118.77321624756);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 87.205101013184, -4225.9282226563, 117.12077331543);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 141.07559204102, -4197.8071289063, 121.00937652588);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 163.04052734375, -4254.2817382813, 121.76741027832);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 180.86734008789, -4311.6796875, 120.27015686035);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 191.5984954834, -4370.826171875, 118.4278793335);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 249.28674316406, -4388.2270507813, 119.60255432129);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 279.7197265625, -4336.4296875, 119.97158050537);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 307.50872802734, -4283.1396484375, 119.16749572754);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 335.18307495117, -4229.787109375, 117.98704528809);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 347.29196166992, -4170.0815429688, 120.14305877686);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 356.40234375, -4110.6118164063, 121.5816192627);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 369.5090637207, -4051.9438476563, 118.33103942871);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 383.29095458984, -3993.3801269531, 125.93714141846);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 340.9030456543, -3950.2475585938, 127.26621246338);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 290.1637878418, -3916.7919921875, 132.02449035645);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 237.46311950684, -3887.0773925781, 135.7428894043);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 219.9382019043, -3829.3850097656, 137.77714538574);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 207.45477294922, -3769.9406738281, 130.92878723145);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 235.5244140625, -3714.7019042969, 131.67663574219);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 332.89147949219, -3597.7531738281, 118.33975982666);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 192.99458312988, -3258.2221679688, 112.49415588379);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 148.06565856934, -3216.5935058594, 115.79315185547);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 104.17617034912, -3175.3937988281, 119.37728118896);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 63.661720275879, -3131.1066894531, 126.86557006836);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 34.73120880127, -3078.3642578125, 132.78517150879);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 12.907564163208, -3021.6032714844, 129.00985717773);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 0.66434007883072, -2962.0065917969, 121.28076171875);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 15.291687011719, -2903.4755859375, 118.6145401001);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 55.203269958496, -2858.5366210938, 108.68143463135);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 92.909126281738, -2811.63671875, 115.36920166016);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 117.20567321777, -2756.0861816406, 105.34630584717);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 99.083129882813, -2698.8735351563, 108.49755096436);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 77.221504211426, -2642.1892089844, 112.13121795654);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 66.470809936523, -2582.4096679688, 112.4133605957);
hinterlandsGatherPaths:addHinterlandsPath(self.numHinterlandsPaths, 97.328453063965, -2530.5715332031, 116.14658355713);

end

