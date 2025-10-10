darkshoreGatherPaths = {
        
    darkshorePaths = {},
    numDarkshorePaths = 1, -- Tracks number of paths (starts at 1 for indexing)

    }

function darkshoreGatherPaths:addDarkshorePath(id, x, y, z)

    -- don't run the same path every load - add some random offset each reload
    local randomOffset = math.random(-15.24552, 15.12525);

    self.darkshorePaths[self.numDarkshorePaths] = {};
    self.darkshorePaths[self.numDarkshorePaths]['id'] = id;
    self.darkshorePaths[self.numDarkshorePaths]['pos'] = {};
    self.darkshorePaths[self.numDarkshorePaths]['pos']['x'] = x + randomOffset;
    self.darkshorePaths[self.numDarkshorePaths]['pos']['y'] = y + randomOffset;
    self.darkshorePaths[self.numDarkshorePaths]['pos']['z'] = z;

    self.numDarkshorePaths = self.numDarkshorePaths + 1;

end

function darkshoreGatherPaths:setupDarkshorePaths()

    -- num paths increases by 1 each time they are added to the table
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 6231.716796875, 417.49295043945, 23.675724029541);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 6122.0737304688, 415.80917358398, 28.137371063232);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 5993.8276367188, 444.5739440918, 19.617740631104);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 5845.15234375, 386.43896484375, 22.024551391602);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 5736.4272460938, 327.23440551758, 22.121803283691);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 5608.4155273438, 400.30947875977, 24.277563095093);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 5467.4780273438, 443.67166137695, 19.154230117798);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 5321.201171875, 450.66741943359, 23.832008361816);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 5194.4116210938, 451.77188110352, 23.42621421814);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 4983.4575195313, 448.34506225586, 24.452314376831);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 4829.5463867188, 441.6416015625, 33.770286560059);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 4696.6772460938, 491.10632324219, 29.359775543213);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 4531.3662109375, 511.95849609375, 45.67431640625);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 4342.6967773438, 446.13830566406, 60.875385284424);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 4314.4970703125, 246.66145324707, 58.475383758545);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 4456.8740234375, 104.05452728271, 62.488544464111);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 4660.0795898438, 155.99122619629, 56.039695739746);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 5044.8828125, 232.45880126953, 30.294212341309);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 5242.744140625, 242.27919006348, 31.686084747314);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 5385.0864257813, 113.662109375, 33.989875793457);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 5546.0693359375, 101.20510864258, 30.945146560669);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 5705.158203125, 124.17246246338, 34.266162872314);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 5873.73046875, 21.020927429199, 30.431123733521);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 6021.6225585938, 69.232864379883, 34.677486419678);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 6170.984375, -19.944972991943, 43.952167510986);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 6336.716796875, -131.55807495117, 46.298164367676);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 6558.1499023438, -53.321670532227, 36.333011627197);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 6735.2890625, 23.245372772217, 43.892330169678);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 6920.5415039063, -92.790046691895, 19.931938171387);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7071.939453125, -249.49743652344, 37.750930786133);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7215.1352539063, -79.49658203125, 14.168572425842);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7311.98046875, -257.11947631836, 10.375532150269);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7306.3159179688, -362.54925537109, 1.8017842769623);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7310.8154296875, -471.2734375, 2.6954021453857);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7333.765625, -617.70068359375, 22.390844345093);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7388.5009765625, -748.60528564453, 13.33712387085);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7543.12109375, -774.44714355469, 9.2729425430298);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7719.6552734375, -903.41479492188, 19.22891998291);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7871.140625, -1039.4302978516, 30.627267837524);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7841.5229492188, -1108.23046875, 36.606067657471);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7716.158203125, -1090.4577636719, 41.7942237854);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7588.0493164063, -1081.1145019531, 40.740428924561);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7453.5776367188, -1076.2565917969, 35.789459228516);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7354.1420898438, -1053.5587158203, 36.824184417725);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7253.7934570313, -1016.5710449219, 40.809833526611);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7202.376953125, -894.41625976563, 46.417144775391);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7251.8256835938, -775.56066894531, 26.18994140625);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7211.5244140625, -669.05895996094, 39.206073760986);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7062.2211914063, -615.70471191406, 50.82287979126);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7099.6689453125, -493.69677734375, 43.050693511963);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7199.0068359375, -432.9130859375, 36.411598205566);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7252.6513671875, -402.15545654297, 25.994209289551);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7250.5766601563, -232.35806274414, 17.883962631226);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7322.6821289063, 140.34382629395, 11.756248474121);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 7185.1796875, 175.48994445801, 4.50214726030827);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 6950.2290039063, 167.72489929199, 0.7387523651123);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 6947.4638671875, 401.35391235352, 7.6955428123474);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 6775.7290039063, 516.61749267578, -0.025324732065201);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 6595.7431640625, 411.88513183594, 31.426443099976);
darkshoreGatherPaths:addDarkshorePath(self.numDarkshorePaths, 6473.6743164063, 202.2918548584, 32.374660491943);

end