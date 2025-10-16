searinggorgeGatherPaths = {

	searinggorgePaths = {},
	numSearinggorgePaths = 1,

}


function searinggorgeGatherPaths:addSearinggorgePath(id, x, y, z)

    local randomOffset = math.random(-6.24552, 5.12525);

    self.searinggorgePaths[self.numSearinggorgePaths] = {};
    self.searinggorgePaths[self.numSearinggorgePaths]['id'] = id;
    self.searinggorgePaths[self.numSearinggorgePaths]['pos'] = {};
    self.searinggorgePaths[self.numSearinggorgePaths]['pos']['x'] = x + randomOffset;
    self.searinggorgePaths[self.numSearinggorgePaths]['pos']['y'] = y + randomOffset;
    self.searinggorgePaths[self.numSearinggorgePaths]['pos']['z'] = z;

    self.numSearinggorgePaths = self.numSearinggorgePaths + 1;

end

function searinggorgeGatherPaths:setupSearinggorgePaths()
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7191.9248046875, -1022.878112793, 243.29183959961);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7131.8256835938, -1033.4869384766, 240.05604553223);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7076.1025390625, -1057.6031494141, 241.06735229492);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7040.7963867188, -1107.4104003906, 242.6720123291);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7123.666015625, -1095.9545898438, 242.06146240234);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7178.7919921875, -1120.9764404297, 241.98016357422);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7196.0434570313, -1179.3254394531, 248.02058410645);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7190.1240234375, -1239.0935058594, 245.64126586914);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7179.4252929688, -1298.7631835938, 242.93933105469);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7143.8481445313, -1349.7004394531, 242.7080078125);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7090.2260742188, -1378.73828125, 240.34660339355);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7064.4584960938, -1432.9440917969, 242.47659301758);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7080.8588867188, -1491.6053466797, 242.30928039551);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7128.2802734375, -1531.3642578125, 241.53323364258);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7165.0541992188, -1578.8839111328, 242.81820678711);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7180.31640625, -1637.2150878906, 241.80195617676);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7132.1655273438, -1674.134765625, 242.03881835938);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7074.7514648438, -1691.8944091797, 240.30415344238);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7019.5258789063, -1666.4423828125, 241.66778564453);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6959.43359375, -1679.2341308594, 242.28948974609);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6940.3295898438, -1736.1563720703, 240.74462890625);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6907.6840820313, -1786.7360839844, 240.744140625);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6869.5717773438, -1834.2628173828, 240.67578125);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6813.5844726563, -1858.4007568359, 244.20223999023);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6755.7939453125, -1875.0104980469, 244.16175842285);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6699.7573242188, -1898.8497314453, 244.14414978027);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6642.140625, -1916.2221679688, 244.15010070801);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6615.7407226563, -1861.3403320313, 244.16886901855);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6612.6264648438, -1801.2911376953, 244.1438293457);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6602.5517578125, -1741.1997070313, 244.07466125488);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6618.0688476563, -1682.6168212891, 244.68020629883);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6630.8974609375, -1623.2242431641, 244.1897277832);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6649.7553710938, -1566.0921630859, 244.4084777832);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6661.8344726563, -1506.0482177734, 243.5994720459);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6669.7778320313, -1445.6728515625, 243.25369262695);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6660.8442382813, -1385.0803222656, 243.64779663086);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6662.2241210938, -1324.0856933594, 242.38757324219);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6686.23046875, -1268.0502929688, 241.98637390137);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6671.6098632813, -1208.8610839844, 241.41569519043);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6658.9438476563, -1149.8770751953, 244.35842895508);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6688.3330078125, -1097.5024414063, 240.93179321289);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6714.8955078125, -1043.5311279297, 240.17234802246);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6727.017578125, -984.47241210938, 242.77697753906);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6771.4516601563, -943.42663574219, 244.26539611816);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6826.3432617188, -918.71362304688, 243.07341003418);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6883.4013671875, -899.78503417969, 244.00288391113);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6920.0170898438, -949.54144287109, 240.744140625);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -6962.806640625, -993.08715820313, 241.66743469238);
searinggorgeGatherPaths:addSearinggorgePath(self.numSearinggorgePaths, -7022.1635742188, -1004.1614990234, 241.6671295166);

end