silithusGatherPaths = {

	silithusPaths = {},
	numSilithusPaths = 1,

}


function silithusGatherPaths:addSilithusPath(id, x, y, z)

    local randomOffset = math.random(-6.24552, 5.12525);

    self.silithusPaths[self.numSilithusPaths] = {};
    self.silithusPaths[self.numSilithusPaths]['id'] = id;
    self.silithusPaths[self.numSilithusPaths]['pos'] = {};
    self.silithusPaths[self.numSilithusPaths]['pos']['x'] = x + randomOffset;
    self.silithusPaths[self.numSilithusPaths]['pos']['y'] = y + randomOffset;
    self.silithusPaths[self.numSilithusPaths]['pos']['z'] = z;

    self.numSilithusPaths = self.numSilithusPaths + 1;

end

function silithusGatherPaths:setupSilithusPaths()
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6956.5537109375, 969.08197021484, 12.735292434692);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6916.3603515625, 1015.0247802734, 3.135689496994);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6863.2158203125, 1043.7465820313, 1.6786342859268);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6802.2788085938, 1031.3775634766, -0.10673761367798);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6742.0512695313, 1034.9727783203, 2.1567935943604);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6714.6640625, 1090.4921875, 0.48908841609955);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6716.1826171875, 1151.7231445313, 2.5486669540405);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6702.3237304688, 1210.5227050781, 3.963000535965);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6654.59765625, 1248.5289306641, 5.2407779693604);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6602.6083984375, 1278.8797607422, 4.4469728469849);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6550.6796875, 1309.1951904297, 3.4320440292358);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6524.8500976563, 1363.4680175781, 2.7880539894104);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6545.0200195313, 1420.0020751953, 3.7234506607056);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6549.9360351563, 1479.9130859375, 1.1820046901703);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6568.251953125, 1537.7309570313, 0.38360857963562);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6582.2338867188, 1596.1594238281, 5.4320597648621);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6589.671875, 1655.7930908203, 5.3621649742126);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6599.669921875, 1714.9775390625, 4.1695322990417);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6630.7270507813, 1767.5458984375, 3.3649113178253);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6683.9501953125, 1795.3057861328, 3.9229338169098);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6745.2700195313, 1787.1381835938, 3.0159201622009);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6804.75390625, 1778.4262695313, 1.3922019004822);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6865.0473632813, 1775.7310791016, 1.9103436470032);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6922.7827148438, 1792.4881591797, 4.3645825386047);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6975.5966796875, 1762.6820068359, 2.1384592056274);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6995.7299804688, 1705.7315673828, -1.5544276237488);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6992.5297851563, 1645.6868896484, -1.2315250635147);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6989.2700195313, 1584.5236816406, 2.4672231674194);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6986.052734375, 1524.4833984375, 3.7848575115204);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7012.576171875, 1470.5373535156, 4.139750957489);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7049.033203125, 1422.5460205078, 5.2561149597168);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7091.9272460938, 1380.4963378906, 4.0003156661987);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7114.5126953125, 1322.8497314453, 3.2239751815796);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7114.2856445313, 1260.7153320313, 4.2610964775085);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7097.8637695313, 1202.2579345703, 5.5405902862549);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7080.6557617188, 1144.046875, 4.2658529281616);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7105.0278320313, 1088.0877685547, 5.5403552055359);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7161.8286132813, 1108.8470458984, 5.5046653747559);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7208.6459960938, 1148.3399658203, 0.005011688452214);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7254.607421875, 1187.1105957031, 1.0033967494965);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7302.7177734375, 1224.4760742188, 4.2961301803589);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7359.91015625, 1243.2468261719, -1.2294676303864);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7417.8427734375, 1259.3455810547, 1.8646240234375);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7476.8916015625, 1242.1838378906, 0.98472189903259);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7532.2583007813, 1217.78125, 1.820648431778);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7569.3032226563, 1265.2377929688, 4.4410471916199);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7566.0224609375, 1325.5712890625, 1.885525226593);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7543.8232421875, 1382.6569824219, 1.0718010663986);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7551.9624023438, 1443.0854492188, 6.1808133125305);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7590.390625, 1489.1784667969, 5.0197906494141);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7629.5903320313, 1534.7708740234, 4.4217386245728);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7658.91796875, 1587.2687988281, 3.3103308677673);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7693.9155273438, 1637.4412841797, 5.5317749977112);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7735.7866210938, 1680.5837402344, 7.1706352233887);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7779.3129882813, 1722.056640625, 2.3743121623993);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7783.1137695313, 1782.4387207031, 1.4871578216553);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7769.107421875, 1841.6700439453, 3.1029291152954);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7796.6015625, 1895.3225097656, 5.3052859306335);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7833.8935546875, 1848.1545410156, 3.1278676986694);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7886.5361328125, 1816.5919189453, 1.1547309160233);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7945.3916015625, 1800.3889160156, 0.76862156391144);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7987.1840820313, 1755.1717529297, -3.4892251491547);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7977.5673828125, 1694.693359375, -1.3132257461548);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7943.1962890625, 1645.4548339844, -4.7251930236816);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7903.111328125, 1599.46484375, 0.36243352293968);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7888.51171875, 1540.7133789063, -5.2403755187988);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7894.5854492188, 1480.1359863281, -2.5828223228455);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7937.978515625, 1436.3508300781, -3.3919222354889);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7978.1127929688, 1390.9938964844, 4.1865768432617);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7993.1284179688, 1331.1608886719, -5.1211137771606);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7983.3588867188, 1271.8298339844, -4.1079964637756);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7944.8076171875, 1225.0643310547, -3.3657205104828);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7893.8422851563, 1193.1560058594, -2.7880477905273);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7849.4345703125, 1152.1616210938, 1.6157963275909);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7871.4189453125, 1095.9345703125, 4.7285962104797);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7913.8901367188, 1053.2705078125, 2.7197208404541);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7956.6967773438, 1011.1196289063, 2.1467437744141);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7996.0947265625, 964.10375976563, -0.025393217802048);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -8013.888671875, 906.52185058594, 1.7654880285263);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7956.9145507813, 887.32354736328, 2.2193365097046);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7895.5346679688, 884.06158447266, -0.2845915555954);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7835.6098632813, 876.40386962891, -4.5462365150452);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7774.921875, 881.37139892578, -6.9667911529541);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7719.1748046875, 904.09326171875, -3.4798188209534);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7663.4921875, 926.78869628906, -1.5028166770935);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7603.373046875, 934.41619873047, 1.1604194641113);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7543.162109375, 924.01446533203, 4.0428056716919);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7486.5869140625, 903.79516601563, 4.4100580215454);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7439.6225585938, 865.15863037109, -1.2245174646378);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7418.7416992188, 808.78289794922, -4.313756942749);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7410.1264648438, 748.54150390625, -7.6887745857239);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7418.2348632813, 688.96063232422, -9.1266212463379);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7426.3427734375, 629.37982177734, -8.6827688217163);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7434.4555664063, 569.76525878906, -10.53938293457);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7442.5546875, 510.24893188477, -8.90931224823);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7449.1264648438, 450.52160644531, -3.466251373291);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7439.7817382813, 390.54092407227, -0.97711050510406);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7399.6088867188, 344.97454833984, 5.2737369537354);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7356.7216796875, 388.72772216797, 10.488315582275);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7342.9345703125, 447.31344604492, 8.1460409164429);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7327.7421875, 505.49151611328, 7.368492603302);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7287.4458007813, 550.81665039063, 1.290549993515);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7230.568359375, 531.42138671875, 5.9556818008423);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7172.76953125, 514.76605224609, 9.0788869857788);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7114.990234375, 498.11651611328, 1.4562412500381);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7066.7612304688, 461.14880371094, 4.8897275924683);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7040.771484375, 404.88656616211, 5.4898834228516);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7027.55859375, 345.70761108398, 4.6316485404968);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7041.1313476563, 287.17642211914, 4.7590546607971);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7032.9946289063, 227.28060913086, 2.495258808136);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -7005.5375976563, 173.05546569824, 1.2799861431122);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6963.1381835938, 129.93775939941, 7.6035423278809);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6904.8579101563, 144.49984741211, 3.1382598876953);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6851.4409179688, 172.259765625, 1.4525945186615);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6791.951171875, 187.44931030273, 0.041455700993538);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6734.390625, 170.27624511719, 2.9911961555481);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6674.7885742188, 180.87797546387, 2.3541417121887);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6641.388671875, 231.56227111816, 2.463894367218);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6598.6440429688, 274.25241088867, 3.0523030757904);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6538.306640625, 270.88357543945, 2.3376536369324);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6478.3408203125, 279.82318115234, 3.1978678703308);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6420.6142578125, 300.08981323242, 7.7399387359619);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6376.3305664063, 341.43817138672, 4.2216210365295);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6365.5361328125, 400.90679931641, 6.887481212616);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6377.1596679688, 459.90225219727, -0.69500011205673);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6396.7294921875, 518.31707763672, 6.2387461662292);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6445.88671875, 555.92169189453, 4.7995643615723);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6492.4340820313, 593.95245361328, 0.63332462310791);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6535.5639648438, 635.71478271484, 7.2707056999207);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6574.3779296875, 681.53796386719, 5.6508846282959);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6610.171875, 729.77838134766, 5.4658408164978);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6646.462890625, 779.03393554688, 11.048671722412);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6685.2084960938, 826.27947998047, 8.2138433456421);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6723.6596679688, 873.44317626953, -0.39912307262421);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6759.3706054688, 922.89465332031, 1.040987610817);
silithusGatherPaths:addSilithusPath(self.numSilithusPaths, -6811.5258789063, 953.04064941406, 2.254656791687);

end
