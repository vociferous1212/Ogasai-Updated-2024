silverpineGatherPaths = {

		silverpinePaths = {},
		numSilverpinePaths = 1,

}

function silverpineGatherPaths:addSilverpinePath(id, x, y, z)

	local randomOffset = math.random(-6.24552, 5.12525);

	self.silverpinePaths[self.numSilverpinePaths] = {};
	self.silverpinePaths[self.numSilverpinePaths]['id'] = id;
	self.silverpinePaths[self.numSilverpinePaths]['pos'] = {};
	self.silverpinePaths[self.numSilverpinePaths]['pos']['x'] = x + randomOffset;
	self.silverpinePaths[self.numSilverpinePaths]['pos']['y'] = y + randomOffset;
	self.silverpinePaths[self.numSilverpinePaths]['pos']['z'] = z;

	self.numSilverpinePaths = self.numSilverpinePaths + 1;

end

function silverpineGatherPaths:setupSilverpinePaths()
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1456.5144042969, 663.09552001953, 46.284637451172);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1429.3441162109, 716.81530761719, 44.764820098877);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1402.2080078125, 770.46765136719, 47.474487304688);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1376.4833984375, 825.42199707031, 49.995853424072);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1367.7271728516, 886.95544433594, 52.673915863037);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1366.1086425781, 947.04614257813, 50.590919494629);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1343.9174804688, 1004.5698852539, 53.125396728516);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1340.5993652344, 1066.3358154297, 52.824363708496);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1316.7224121094, 1122.4880371094, 51.825622558594);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1264.8083496094, 1153.71875, 51.871273040771);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1212.4891357422, 1121.3255615234, 45.319190979004);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1169.5303955078, 1078.2291259766, 36.759429931641);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1110.4306640625, 1091.8129882813, 40.701309204102);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1051.3614501953, 1108.4770507813, 41.744606018066);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1062.8012695313, 1169.1175537109, 45.29838180542);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1084.810546875, 1226.2109375, 45.755859375);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1108.4691162109, 1283.6629638672, 39.938117980957);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1140.8781738281, 1335.6176757813, 33.385456085205);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1163.7429199219, 1391.2104492188, 37.320503234863);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1175.2110595703, 1450.8432617188, 34.249256134033);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1181.3526611328, 1510.6755371094, 34.781749725342);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1186.0444335938, 1571.7447509766, 28.222574234009);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1191.9591064453, 1631.5461425781, 24.002586364746);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1188.6052246094, 1692.3770751953, 16.547306060791);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1189.4401855469, 1752.9468994141, 11.346826553345);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1215.8408203125, 1808.0936279297, 15.069369316101);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1240.4427490234, 1862.9024658203, 10.497079849243);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1253.6644287109, 1921.4676513672, 13.925866127014);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1218.8052978516, 1970.3654785156, 10.509791374207);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1164.6993408203, 1997.4685058594, 17.485559463501);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1193.6922607422, 1915.3557128906, 10.133615493774);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1133.9383544922, 1727.7969970703, 22.660882949829);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1086.9300537109, 1687.2816162109, 32.895851135254);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 1025.1049804688, 1692.44140625, 20.876770019531);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 974.01739501953, 1725.3646240234, 13.954407691956);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 944.82379150391, 1777.9293212891, 12.995717048645);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 908.52630615234, 1826.6427001953, 6.6790499687195);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 848.08770751953, 1819.0838623047, 5.2407236099243);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 829.99914550781, 1760.9992675781, 17.237447738647);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 816.95172119141, 1701.8775634766, 26.581787109375);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 793.54486083984, 1645.6673583984, 28.150804519653);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 777.25512695313, 1585.9212646484, 30.918041229248);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 781.55590820313, 1525.1563720703, 31.852214813232);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 811.93206787109, 1473.3911132813, 32.941993713379);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 868.29534912109, 1449.6142578125, 31.223838806152);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 929.46221923828, 1455.5065917969, 37.913612365723);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 945.57843017578, 1397.6274414063, 42.181915283203);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 915.31286621094, 1345.3702392578, 45.408740997314);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 856.04040527344, 1359.7017822266, 53.013252258301);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 794.86029052734, 1362.5974121094, 65.370101928711);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 733.92864990234, 1360.3088378906, 74.834014892578);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 698.02648925781, 1311.8741455078, 76.761611938477);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 736.52990722656, 1263.1558837891, 62.706878662109);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 758.56658935547, 1206.6079101563, 57.01460647583);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 723.26672363281, 1157.3818359375, 54.111877441406);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 680.18176269531, 1199.7814941406, 67.450325012207);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 654.12176513672, 1254.5028076172, 78.265731811523);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 596.02862548828, 1270.8680419922, 87.212882995605);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 546.64343261719, 1236.703125, 87.139930725098);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 485.61956787109, 1226.0632324219, 88.660499572754);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 447.24600219727, 1178.7208251953, 92.442359924316);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 386.8039855957, 1180.5871582031, 83.475059509277);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 327.02160644531, 1186.8974609375, 79.425582885742);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 296.05795288086, 1133.6741943359, 79.507049560547);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 236.06855773926, 1127.0797119141, 70.429847717285);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 186.10185241699, 1161.0660400391, 71.061317443848);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 142.62048339844, 1202.6361083984, 66.967140197754);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 100.00970458984, 1246.3304443359, 67.883377075195);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 67.568466186523, 1296.9288330078, 65.403816223145);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 11.834558486938, 1323.0506591797, 61.613014221191);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -48.091163635254, 1331.4317626953, 60.454536437988);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -106.83451080322, 1318.2723388672, 57.310810089111);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -167.42790222168, 1318.3685302734, 44.155590057373);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -205.92515563965, 1365.3218994141, 34.444988250732);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -253.34403991699, 1405.3605957031, 37.831348419189);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -306.48385620117, 1434.1009521484, 31.963048934937);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -361.92501831055, 1410.9320068359, 28.545156478882);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -422.88803100586, 1414.1499023438, 31.314685821533);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -445.06817626953, 1470.9832763672, 17.466611862183);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -483.15982055664, 1518.2750244141, 17.47896194458);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -533.10186767578, 1552.1589355469, 10.18098449707);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -587.84643554688, 1578.0274658203, 10.102093696594);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -644.65710449219, 1558.4283447266, 8.4799842834473);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -683.99108886719, 1511.7008056641, 6.8986177444458);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -700.04876708984, 1453.5668945313, 8.8972787857056);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -680.55114746094, 1396.2200927734, 22.772750854492);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -629.84619140625, 1362.9755859375, 33.812602996826);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -568.96331787109, 1354.6229248047, 38.599697113037);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -527.45611572266, 1310.3907470703, 49.609691619873);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -491.91058349609, 1262.052734375, 46.458652496338);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -484.2265625, 1201.6547851563, 55.164253234863);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -497.11434936523, 1142.9475097656, 67.317680358887);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -509.41467285156, 1084.0952148438, 86.838806152344);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -517.27813720703, 1024.5708007813, 93.712173461914);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -524.98480224609, 963.91723632813, 92.842308044434);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -541.29010009766, 906.05163574219, 90.280517578125);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -558.72100830078, 848.43420410156, 88.75471496582);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -559.32977294922, 787.81268310547, 88.923530578613);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -556.92041015625, 727.69683837891, 90.450332641602);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -497.51913452148, 744.45397949219, 90.459716796875);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -436.24700927734, 751.58642578125, 97.486061096191);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -382.37490844727, 778.92254638672, 90.962661743164);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -334.11471557617, 814.60235595703, 88.963333129883);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -274.57955932617, 823.16094970703, 78.665458679199);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -223.96377563477, 856.59240722656, 72.765380859375);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -164.89651489258, 867.81964111328, 63.432285308838);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -104.98317718506, 857.69964599609, 61.24755859375);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -51.942302703857, 829.55029296875, 64.751892089844);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, -9.97141456604, 785.37780761719, 66.327781677246);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 35.275344848633, 744.93182373047, 63.677574157715);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 91.195777893066, 720.86761474609, 60.211521148682);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 143.46696472168, 690.19219970703, 54.674667358398);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 195.09759521484, 657.65521240234, 42.540309906006);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 253.75897216797, 640.22467041016, 41.209815979004);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 313.81637573242, 636.31359863281, 41.500965118408);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 364.40731811523, 670.97412109375, 40.831302642822);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 413.90396118164, 708.26184082031, 40.655662536621);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 468.79013061523, 732.7783203125, 37.36803817749);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 528.59448242188, 739.72521972656, 30.60622215271);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 584.91540527344, 762.16064453125, 31.259305953979);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 615.43975830078, 814.08837890625, 31.259305953979);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 639.48919677734, 870.41644287109, 31.259305953979);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 655.28369140625, 928.46875, 31.408653259277);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 660.41082763672, 988.69750976563, 38.057392120361);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 682.45275878906, 1044.9821777344, 49.115112304688);
silverpineGatherPaths:addSilverpinePath(self.numSilverpinePaths, 723.95452880859, 1089.8697509766, 48.337066650391);


end

