alteracGatherPaths = {

	alteracPaths = {},
	numAlteracPaths = 1,


}


function alteracGatherPaths:addAlteracPath(id, x, y, z)

    local randomOffset = math.random(-3.24552, 5.12525);

    self.alteracPaths[self.numAlteracPaths] = {};
    self.alteracPaths[self.numAlteracPaths]['id'] = id;
    self.alteracPaths[self.numAlteracPaths]['pos'] = {};
    self.alteracPaths[self.numAlteracPaths]['pos']['x'] = x + randomOffset;
    self.alteracPaths[self.numAlteracPaths]['pos']['y'] = y + randomOffset;
    self.alteracPaths[self.numAlteracPaths]['pos']['z'] = z;

    self.numAlteracPaths = self.numAlteracPaths + 1;

end

function alteracGatherPaths:setupAlteracPaths()

alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 319.80841064453, -618.583984375, 144.18681335449);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 317.39944458008, -558.52844238281, 154.68899536133);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 321.65805053711, -498.65673828125, 165.46826171875);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 294.28967285156, -445.03460693359, 155.3582611084);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 243.73173522949, -412.71954345703, 151.89385986328);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 202.36184692383, -369.16287231445, 154.30218505859);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 174.83283996582, -315.75262451172, 152.25372314453);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 233.32369995117, -300.66171264648, 151.43153381348);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 285.36663818359, -331.09689331055, 159.97889709473);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 311.99111938477, -385.01068115234, 169.63948059082);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 376.32083129883, -473.55294799805, 178.52456665039);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 418.23358154297, -517.59136962891, 172.15127563477);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 460.57211303711, -560.61999511719, 172.57038879395);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 510.19772338867, -594.58184814453, 175.95951843262);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 568.57940673828, -578.0537109375, 184.63442993164);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 613.37805175781, -537.72839355469, 180.59739685059);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 661.11383056641, -500.09478759766, 168.25915527344);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 712.80786132813, -531.4716796875, 155.2829284668);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 771.40350341797, -515.67041015625, 138.82588195801);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 809.57641601563, -468.98068237305, 132.15351867676);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 864.47534179688, -443.22741699219, 135.17517089844);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 865.70593261719, -503.32809448242, 134.4666595459);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 833.36053466797, -554.64215087891, 141.14234924316);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 808.11938476563, -609.16326904297, 144.59878540039);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 771.94183349609, -657.6005859375, 149.17758178711);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 718.79229736328, -628.54986572266, 157.13507080078);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 517.86413574219, -654.955078125, 160.62438964844);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 523.70306396484, -715.61340332031, 162.24754333496);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 565.2333984375, -759.22430419922, 165.2095489502);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 621.95928955078, -780.36889648438, 166.91032409668);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 676.38171386719, -805.92614746094, 163.93287658691);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 734.89514160156, -822.81842041016, 164.33836364746);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 733.84448242188, -883.58227539063, 166.42758178711);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 711.35491943359, -940.27642822266, 164.37664794922);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 705.96942138672, -1000.6488037109, 164.39633178711);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 657.85559082031, -1036.7327880859, 163.36282348633);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 633.19525146484, -981.36804199219, 165.28977966309);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 608.16888427734, -925.740234375, 165.63502502441);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 598.091796875, -866.06408691406, 159.49522399902);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 463.39083862305, -680.49432373047, 160.38664245605);
alteracGatherPaths:addAlteracPath(self.numAlteracPaths, 419.19284057617, -639.76574707031, 166.94932556152);

end
