desolaceGatherPaths = {

		desolacePaths = {},
		numDesolacePaths = 1,

}

function desolaceGatherPaths:addDesolacePath(id, x, y, z)

    local randomOffset = math.random(-8.24552, 8.12525);

    self.desolacePaths[self.numDesolacePaths] = {};
    self.desolacePaths[self.numDesolacePaths]['id'] = id;
    self.desolacePaths[self.numDesolacePaths]['pos'] = {};
    self.desolacePaths[self.numDesolacePaths]['pos']['x'] = x + randomOffset;
    self.desolacePaths[self.numDesolacePaths]['pos']['y'] = y + randomOffset;
    self.desolacePaths[self.numDesolacePaths]['pos']['z'] = z;

    self.numDesolacePaths = self.numDesolacePaths + 1;

end

function desolaceGatherPaths:setupDesolacePaths()

desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, 187.57313537598, 1813.6436767578, 86.316131591797);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, 133.12730407715, 1787.9633789063, 86.22917175293);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, 77.854011535645, 1764.2889404297, 90.75365447998);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, 28.049530029297, 1729.7236328125, 104.59463500977);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -26.992839813232, 1705.5570068359, 98.401786804199);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -75.347946166992, 1669.6474609375, 89.691909790039);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -133.98480224609, 1656.4870605469, 89.595085144043);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -186.75720214844, 1626.341796875, 90.827423095703);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -246.4220123291, 1613.4039306641, 97.862083435059);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -303.69714355469, 1592.6716308594, 91.122123718262);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -351.74176025391, 1555.5561523438, 91.957595825195);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -412.21899414063, 1551.3791503906, 91.156829833984);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -470.16375732422, 1532.2796630859, 91.45484161377);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -530.53845214844, 1538.5842285156, 89.693099975586);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -572.08978271484, 1584.75, 89.644599914551);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -601.37884521484, 1638.0834960938, 89.608436584473);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -568.36138916016, 1688.6752929688, 90.897346496582);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -556.38842773438, 1748.2255859375, 88.939682006836);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -564.13092041016, 1807.7686767578, 94.542404174805);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -564.16540527344, 1868.7288818359, 96.007026672363);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -562.64733886719, 1929.0301513672, 96.851417541504);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -568.10101318359, 1989.5765380859, 89.704116821289);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -546.85095214844, 2046.6823730469, 89.352493286133);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -492.52975463867, 2073.6423339844, 90.053092956543);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -441.7366027832, 2106.5935058594, 90.68968963623);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -422.60119628906, 2164.4443359375, 89.225547790527);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -435.06481933594, 2223.9020996094, 89.353141784668);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -487.15567016602, 2253.8305664063, 89.637977600098);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -545.46337890625, 2271.6948242188, 90.576362609863);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -591.10589599609, 2311.3005371094, 89.796577453613);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -640.16589355469, 2346.7529296875, 90.823829650879);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -696.00695800781, 2368.8583984375, 89.963287353516);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -751.08447265625, 2392.9428710938, 91.905456542969);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -811.00750732422, 2388.1931152344, 93.219650268555);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -833.0263671875, 2331.3972167969, 92.591781616211);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -844.6611328125, 2272.1403808594, 91.257820129395);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -836.34545898438, 2212.2592773438, 88.244346618652);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -839.12042236328, 2151.0734863281, 84.833343505859);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -842.42541503906, 2091.0344238281, 76.629867553711);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -899.24359130859, 2071.0231933594, 64.334869384766);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -933.45617675781, 2021.1015625, 63.035327911377);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -960.16766357422, 1966.2882080078, 63.416572570801);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -966.73352050781, 1905.7940673828, 58.628761291504);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -949.12585449219, 1847.5594482422, 61.058368682861);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -931.07281494141, 1789.2852783203, 59.883850097656);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -947.60504150391, 1731.3323974609, 61.123352050781);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -945.00939941406, 1671.2490234375, 61.69189453125);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -939.89807128906, 1611.3436279297, 61.748805999756);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -942.84954833984, 1550.5692138672, 61.111114501953);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -974.83642578125, 1497.9739990234, 61.895957946777);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1031.4600830078, 1519.0848388672, 62.46361541748);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1088.6346435547, 1540.2072753906, 60.188087463379);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1146.7554931641, 1555.3031005859, 60.188194274902);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1199.7593994141, 1525.7504882813, 60.957759857178);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1227.9146728516, 1472.1704101563, 61.111324310303);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1256.0919189453, 1418.7860107422, 61.174011230469);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1313.9605712891, 1402.4603271484, 61.113605499268);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1373.2293701172, 1389.4328613281, 61.798461914063);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1427.7315673828, 1414.9892578125, 60.211360931396);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1439.4031982422, 1474.0374755859, 59.16418838501);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1449.2313232422, 1533.3553466797, 58.942314147949);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1459.1745605469, 1592.6531982422, 59.010883331299);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1477.6507568359, 1649.880859375, 58.925468444824);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1503.2377929688, 1704.6883544922, 62.247669219971);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1542.4545898438, 1751.5085449219, 61.024761199951);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1566.8978271484, 1806.5255126953, 61.88111114502);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1555.3442382813, 1865.53515625, 62.012538909912);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1543.7906494141, 1924.5446777344, 62.283157348633);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1529.6124267578, 1982.9534912109, 60.85472869873);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1557.9079589844, 2036.2033691406, 61.162643432617);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1614.3693847656, 2015.6756591797, 60.990810394287);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1658.6684570313, 1975.0538330078, 60.854808807373);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1702.1561279297, 1932.2880859375, 61.668739318848);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1762.3148193359, 1923.1778564453, 58.947891235352);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1811.1237792969, 1959.4453125, 59.983814239502);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1837.8197021484, 2013.20703125, 60.40478515625);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1897.7880859375, 2010.2023925781, 64.969375610352);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1879.1931152344, 1952.8776855469, 61.086544036865);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1844.4171142578, 1903.9554443359, 55.086093902588);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1851.84765625, 1844.3123779297, 58.466892242432);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1907.4694824219, 1820.9924316406, 65.159576416016);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1965.6177978516, 1838.0660400391, 64.330421447754);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -2023.2576904297, 1819.7924804688, 64.780578613281);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -2072.7641601563, 1785.2077636719, 60.853515625);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -2102.3828125, 1732.2133789063, 57.039600372314);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -2086.6042480469, 1673.5338134766, 60.767028808594);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -2046.6634521484, 1627.3596191406, 60.399780273438);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -2022.5999755859, 1571.5617675781, 63.519462585449);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1972.9805908203, 1537.7596435547, 61.794788360596);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1915.4842529297, 1520.2199707031, 61.202568054199);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1896.3264160156, 1462.9992675781, 60.336284637451);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1900.9803466797, 1402.6781005859, 61.323043823242);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1870.5913085938, 1349.9699707031, 71.393112182617);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1881.2825927734, 1290.265625, 89.687149047852);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1910.6638183594, 1237.4372558594, 91.115104675293);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1962.4799804688, 1206.9655761719, 90.023834228516);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1980.9935302734, 1149.3590087891, 94.330581665039);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1920.7628173828, 1163.1733398438, 90.917686462402);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1869.2352294922, 1132.4210205078, 91.696502685547);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1817.4467773438, 1101.7290039063, 91.531044006348);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1773.1715087891, 1060.4288330078, 91.914093017578);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1714.9449462891, 1078.0640869141, 90.990692138672);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1657.1287841797, 1095.3627929688, 91.12899017334);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1606.5628662109, 1061.8322753906, 92.289260864258);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1570.1569824219, 1013.5290527344, 91.019233703613);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1554.4079589844, 953.80303955078, 89.561134338379);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1496.4920654297, 937.84820556641, 90.293739318848);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1438.1614990234, 955.26843261719, 91.642471313477);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1391.2249755859, 993.82678222656, 90.006118774414);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1354.7269287109, 1041.5816650391, 91.67406463623);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1312.8580322266, 1084.5941162109, 93.542861938477);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1262.4110107422, 1118.6929931641, 91.253540039063);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1204.5690917969, 1134.6628417969, 92.928649902344);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1148.4020996094, 1158.1671142578, 93.778038024902);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1088.5466308594, 1145.6877441406, 90.017463684082);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1054.4708251953, 1095.1701660156, 88.657905578613);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1036.2869873047, 1035.9631347656, 89.577514648438);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -1020.9509887695, 977.24719238281, 91.094108581543);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -993.98724365234, 923.40270996094, 91.470893859863);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -933.88385009766, 921.62652587891, 91.398963928223);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -877.32147216797, 941.66644287109, 92.645698547363);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -852.55993652344, 997.43206787109, 93.23747253418);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -822.96649169922, 1049.775390625, 90.541343688965);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -784.24267578125, 1096.6383056641, 89.465423583984);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -730.24047851563, 1124.9210205078, 89.706687927246);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -699.09869384766, 1176.7919921875, 92.086692810059);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -672.29516601563, 1231.0052490234, 89.170051574707);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -620.56201171875, 1263.4670410156, 89.168479919434);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -561.28393554688, 1253.7930908203, 92.073593139648);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -515.12261962891, 1214.4064941406, 93.311988830566);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -516.86370849609, 1153.6188964844, 92.003028869629);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -543.29473876953, 1099.0753173828, 90.945442199707);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -576.30419921875, 1048.8114013672, 90.541435241699);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -596.23364257813, 991.21264648438, 91.078308105469);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -605.83209228516, 931.85955810547, 92.223899841309);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -608.55340576172, 871.31005859375, 90.541633605957);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -565.9443359375, 827.87359619141, 90.69213104248);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -505.30603027344, 827.24475097656, 90.84464263916);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -446.3742980957, 842.88861083984, 92.781776428223);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -388.35592651367, 859.51666259766, 90.933158874512);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -328.65368652344, 866.32550048828, 92.045036315918);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -276.63137817383, 834.95318603516, 90.715782165527);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -222.09687805176, 860.5634765625, 91.556823730469);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -209.92965698242, 919.37524414063, 91.283348083496);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -230.23123168945, 975.86651611328, 91.1923828125);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -268.76913452148, 1023.1983642578, 90.56819152832);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -301.09939575195, 1073.7543945313, 90.930793762207);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -323.79257202148, 1129.4024658203, 89.463134765625);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -315.29190063477, 1189.3637695313, 92.391555786133);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -292.00177001953, 1244.8726806641, 90.623733520508);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -244.39695739746, 1284.1246337891, 89.787933349609);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -188.5450592041, 1308.0251464844, 89.129661560059);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -127.62173461914, 1308.0157470703, 89.110427856445);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -84.653114318848, 1350.8666992188, 89.433647155762);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -47.473361968994, 1397.9631347656, 88.922004699707);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, -10.65708732605, 1445.4254150391, 92.640785217285);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, 12.108386039734, 1501.30078125, 97.824577331543);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, 14.375294685364, 1561.8979492188, 101.70127868652);
desolaceGatherPaths:addDesolacePath(self.numDesolacePaths, 27.835401535034, 1621.1479492188, 100.94205474854);

end