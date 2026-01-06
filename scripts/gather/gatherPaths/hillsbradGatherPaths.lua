hillsbradGatherPaths = {

	hillsbradPaths = {},
	numHillsbradPaths = 1,

}

function hillsbradGatherPaths:addHillsbradPath(id, x, y, z)

    local randomOffset = math.random(-6.24552, 5.12525);

    self.hillsbradPaths[self.numHillsbradPaths] = {};
    self.hillsbradPaths[self.numHillsbradPaths]['id'] = id;
    self.hillsbradPaths[self.numHillsbradPaths]['pos'] = {};
    self.hillsbradPaths[self.numHillsbradPaths]['pos']['x'] = x + randomOffset;
    self.hillsbradPaths[self.numHillsbradPaths]['pos']['y'] = y + randomOffset;
    self.hillsbradPaths[self.numHillsbradPaths]['pos']['z'] = z;

    self.numHillsbradPaths = self.numHillsbradPaths + 1;

end

function hillsbradGatherPaths:setupHillsbradPaths()

hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -56.955379486084, -710.01019287109, 68.811050415039);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -117.11264801025, -710.74548339844, 65.718551635742);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -178.21397399902, -710.75537109375, 63.856983184814);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -221.92250061035, -668.05975341797, 57.293403625488);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -249.42961120605, -613.86663818359, 59.119113922119);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -264.72332763672, -554.61029052734, 59.918537139893);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -265.07275390625, -494.23794555664, 61.474418640137);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -287.9248046875, -437.89596557617, 65.713577270508);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -330.3249206543, -395.29019165039, 63.059951782227);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -364.39849853516, -345.89385986328, 58.767349243164);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -375.72143554688, -286.46496582031, 60.693199157715);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -346.91787719727, -232.61293029785, 63.343837738037);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -293.13140869141, -203.74072265625, 72.91919708252);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -232.99829101563, -192.59292602539, 86.839546203613);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -173.13618469238, -187.78645324707, 101.60102844238);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -113.11603546143, -187.01759338379, 115.44821929932);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -202.29347229004, -133.99774169922, 86.008560180664);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -250.25389099121, -97.299369812012, 69.201683044434);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -255.87152099609, -36.601470947266, 60.733570098877);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -224.5848236084, 14.654099464417, 65.80729675293);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -197.49433898926, 68.616752624512, 64.959991455078);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -214.92678833008, 126.18607330322, 64.366683959961);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -247.37055969238, 177.47964477539, 85.326164245605);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -304.63003540039, 197.84594726563, 86.87035369873);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -365.64874267578, 202.01220703125, 88.757926940918);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -421.72006225586, 223.92735290527, 84.159622192383);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -452.89944458008, 275.32702636719, 89.498725891113);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -483.2887878418, 327.17141723633, 90.080596923828);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -511.30053710938, 380.37298583984, 90.784492492676);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -553.67712402344, 425.33871459961, 85.378143310547);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -611.64715576172, 441.39883422852, 80.223289489746);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -671.43170166016, 447.83114624023, 75.96395111084);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -728.88018798828, 429.51776123047, 75.109916687012);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -765.73883056641, 382.04150390625, 67.10034942627);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -800.37377929688, 332.90606689453, 54.88028717041);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -828.60467529297, 279.80361938477, 39.465625762939);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -778.48107910156, 246.16906738281, 43.709980010986);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -722.86383056641, 223.50421142578, 50.128795623779);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -674.56164550781, 185.45161437988, 51.76050567627);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -645.91418457031, 132.52618408203, 52.540493011475);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -627.17700195313, 74.260292053223, 44.588821411133);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -588.20489501953, 26.670110702515, 48.159191131592);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -546.72717285156, -17.759342193604, 46.161075592041);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -539.35784912109, -77.700378417969, 45.916034698486);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -554.04180908203, -136.38966369629, 51.176288604736);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -529.27130126953, -191.23313903809, 52.704650878906);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -526.56500244141, -252.06938171387, 51.076343536377);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -505.21319580078, -309.03875732422, 49.792625427246);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -476.26968383789, -361.7688293457, 49.769287109375);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -456.06976318359, -420.36529541016, 48.418025970459);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -436.81146240234, -477.43615722656, 47.521690368652);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -441.44821166992, -537.27233886719, 51.166549682617);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -434.65798950195, -597.90173339844, 54.276622772217);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -416.11944580078, -655.07287597656, 54.500972747803);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -491.11413574219, -575.93365478516, 45.315872192383);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -542.47473144531, -544.68719482422, 38.204376220703);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -584.78631591797, -500.20123291016, 36.133026123047);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -608.30474853516, -444.99597167969, 35.601264953613);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -644.76287841797, -396.12564086914, 35.883144378662);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -700.38787841797, -370.8583984375, 31.496789932251);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -753.3876953125, -339.01959228516, 20.925695419312);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -813.21392822266, -326.58743286133, 20.815980911255);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -859.63220214844, -287.5016784668, 37.23498916626);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -867.89434814453, -227.99577331543, 43.194732666016);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -921.60687255859, -199.45118713379, 49.270175933838);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -880.91107177734, -154.41259765625, 31.214895248413);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -910.73272705078, -101.22613525391, 22.782669067383);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -933.45788574219, -44.653564453125, 22.291198730469);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -922.47283935547, 14.919193267822, 28.386960983276);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -866.89343261719, 39.164081573486, 31.352869033813);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -807.16516113281, 33.240154266357, 33.190700531006);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -794.41375732422, -26.981439590454, 28.672849655151);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -786.78771972656, -86.682075500488, 32.26095199585);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -772.12133789063, -145.4200592041, 34.115833282471);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -739.41278076172, -196.42724609375, 39.056442260742);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -688.87524414063, -229.70886230469, 39.720825195313);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -635.34460449219, -257.42422485352, 40.125545501709);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -618.47943115234, -315.47991943359, 44.896076202393);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -551.375, -425.28762817383, 42.786804199219);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -508.39123535156, -467.16000366211, 41.634273529053);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -485.77844238281, -635.84259033203, 44.833431243896);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -488.19528198242, -695.98248291016, 49.040885925293);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -439.01873779297, -731.46057128906, 53.323947906494);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -381.54013061523, -755.00109863281, 54.582946777344);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -403.69171142578, -812.79583740234, 54.262184143066);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -443.31140136719, -859.46862792969, 46.534671783447);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -480.48129272461, -906.69671630859, 35.252689361572);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -539.23828125, -919.56024169922, 32.291534423828);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -575.04840087891, -870.30114746094, 31.722326278687);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -617.70458984375, -828.09698486328, 21.830722808838);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -662.08093261719, -787.5693359375, 19.257019042969);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -717.44665527344, -764.08666992188, 17.620370864868);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -775.72979736328, -745.85137939453, 8.1254854202271);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -835.65203857422, -753.35955810547, 9.2287168502808);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -891.26824951172, -778.41790771484, 19.920545578003);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -943.20251464844, -809.74786376953, 25.412300109863);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -971.42077636719, -863.88439941406, 29.15619468689);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -951.5546875, -920.82879638672, 29.906141281128);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -895.97125244141, -945.12823486328, 31.139535903931);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -849.0791015625, -983.89605712891, 31.191717147827);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -805.80865478516, -1026.7453613281, 38.852046966553);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -748.50134277344, -1045.3583984375, 42.748481750488);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -691.22857666016, -1063.3634033203, 51.819450378418);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -697.37115478516, -1123.5881347656, 56.724502563477);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -752.62640380859, -1149.3099365234, 53.755893707275);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -813.06842041016, -1140.5065917969, 51.689846038818);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -872.24530029297, -1130.5792236328, 47.171829223633);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -931.85998535156, -1118.0815429688, 49.164569854736);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -990.03436279297, -1099.6186523438, 48.631328582764);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -1050.2781982422, -1108.6018066406, 44.587089538574);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -1106.8843994141, -1129.4088134766, 47.547958374023);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -1136.3619384766, -1181.9940185547, 43.722316741943);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -1108.6931152344, -1235.8131103516, 52.049465179443);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -1079.6605224609, -1288.4128417969, 56.22815322876);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -1039.5240478516, -1335.7391357422, 56.30920791626);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -998.73858642578, -1379.8326416016, 58.262775421143);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -949.95489501953, -1415.7780761719, 55.746471405029);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -892.34533691406, -1434.5295410156, 57.51388168335);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -838.63818359375, -1461.5229492188, 61.450901031494);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -785.81457519531, -1490.6225585938, 59.027549743652);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -734.35833740234, -1521.7554931641, 59.193462371826);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -710.71685791016, -1577.9555664063, 56.774242401123);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -679.75665283203, -1630.2510986328, 54.486747741699);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -637.91912841797, -1673.4150390625, 60.674160003662);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -588.61541748047, -1709.0134277344, 64.381767272949);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -530.68774414063, -1728.1881103516, 73.063804626465);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -469.94161987305, -1730.046875, 83.324310302734);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -418.28701782227, -1697.7399902344, 88.420425415039);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -385.75146484375, -1646.2977294922, 81.467613220215);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -356.24942016602, -1592.7954101563, 78.469604492188);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -326.81875610352, -1540.4799804688, 80.510772705078);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -290.30712890625, -1492.2846679688, 89.687232971191);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -270.4690246582, -1434.5075683594, 90.973068237305);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -255.73739624023, -1375.2664794922, 92.075965881348);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -271.72836303711, -1316.1318359375, 79.628326416016);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -308.95983886719, -1267.703125, 69.66877746582);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -344.2516784668, -1218.015625, 63.88724899292);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -333.20123291016, -1158.4616699219, 47.816234588623);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -281.05667114258, -1128.6324462891, 42.860511779785);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -220.31774902344, -1127.7349853516, 39.98706817627);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -161.88687133789, -1145.6730957031, 40.168914794922);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -172.73272705078, -1085.7351074219, 44.808494567871);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -180.08717346191, -1025.7806396484, 56.040050506592);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -229.82762145996, -990.82104492188, 61.06441116333);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -257.97805786133, -937.1748046875, 60.649688720703);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -318.69705200195, -943.55078125, 56.551460266113);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -343.64190673828, -888.48620605469, 56.959800720215);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -332.12265014648, -827.84619140625, 58.700248718262);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -305.68444824219, -772.80786132813, 56.610343933105);
hillsbradGatherPaths:addHillsbradPath(self.numHillsbradPaths, -254.79591369629, -739.46655273438, 57.98637008667);

end


