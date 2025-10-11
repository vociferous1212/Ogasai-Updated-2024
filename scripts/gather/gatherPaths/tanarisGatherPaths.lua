tanarisGatherPaths = {

		tanarisPaths = {},
		numTanarisPaths = 1,

}

function tanarisGatherPaths:addTanarisPath(id, x, y, z)

    -- don't run the same path every load - add some random offset each reload
    local randomOffset = math.random(-20.6252, 20.3255);

    self.tanarisPaths[self.numTanarisPaths] = {};
    self.tanarisPaths[self.numTanarisPaths]['id'] = id;
    self.tanarisPaths[self.numTanarisPaths]['pos'] = {};
    self.tanarisPaths[self.numTanarisPaths]['pos']['x'] = x + randomOffset;
    self.tanarisPaths[self.numTanarisPaths]['pos']['y'] = y + randomOffset;
    self.tanarisPaths[self.numTanarisPaths]['pos']['z'] = z;

    self.numTanarisPaths = self.numTanarisPaths + 1;

end

function tanarisGatherPaths:setupTanarisPaths()

tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7196.2338867188, -3611.1005859375, 12.979137420654);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7137.2456054688, -3435.2595214844, 10.183604240417);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7131.0400390625, -3217.6394042969, 11.313454627991);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7079.9794921875, -3011.6911621094, 9.3552398681641);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7057.5874023438, -2862.8627929688, 9.6799402236938);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7130.873046875, -2679.1435546875, 11.380312919617);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7281.169921875, -2675.7136230469, 12.227451324463);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7382.8256835938, -2802.2524414063, 11.500708580017);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7381.7641601563, -2966.7509765625, 11.483266830444);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7428.6166992188, -3114.865234375, 11.072269439697);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7548.3872070313, -3182.892578125, 26.788873672485);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7618.1333007813, -3044.0642089844, 20.001586914063);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7663.8837890625, -2881.8955078125, 12.440563201904);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7736.6264648438, -2870.4038085938, 25.967842102051);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7765.5810546875, -3079.0505371094, 61.427207946777);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7867.98046875, -3201.1896972656, 72.47061920166);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8031.671875, -3214.2043457031, 49.206275939941);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8136.2495117188, -3116.1025390625, 23.115940093994);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8262.3798828125, -3023.3720703125, 8.6702785491943);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8332.955078125, -2905.734375, 9.4140338897705);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8320.18359375, -2724.6613769531, 23.142227172852);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8363.404296875, -2589.6765136719, 34.684448242188);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8510.8603515625, -2463.4138183594, 41.408576965332);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8607.5869140625, -2333.0886230469, 29.835750579834);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8786.8720703125, -2266.0954589844, 8.8773164749146);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8892.2197265625, -2315.9331054688, 8.8823871612549);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8962.8505859375, -2190.5300292969, 8.8820180892944);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -9084.3525390625, -2161.12890625, 12.298704147339);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -9119.7392578125, -2268.2661132813, 9.2320184707642);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -9220.5458984375, -2456.6728515625, 12.874176025391);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -9412.7119140625, -2479.9670410156, 12.481791496277);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -9407.8837890625, -2713.01171875, 17.232309341431);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -9352.638671875, -2913.9162597656, 9.4940509796143);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -9105.251953125, -2847.9140625, 34.04940032959);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8886.7724609375, -2900.53515625, 43.433670043945);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8686.8388671875, -2913.0043945313, 15.562459945679);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8709.89453125, -3114.0285644531, 28.57124710083);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8618.4208984375, -3291.1457519531, 9.6618499755859);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8576.7255859375, -3469.1088867188, 10.800542831421);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8683.6982421875, -3635.0322265625, 20.059600830078);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8809.8876953125, -3725.2241210938, 22.351337432861);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8698.2900390625, -3856.5205078125, 41.290294647217);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8591.8017578125, -3974.595703125, 40.153476715088);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8648.841796875, -4143.1767578125, 26.940479278564);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8714.24609375, -4299.5395507813, 14.345324516296);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8702.6083984375, -4365.6806640625, 16.784646987915);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8609.1572265625, -4553.6450195313, 9.1727476119995);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8480.419921875, -4596.267578125, 9.9618730545044);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8351.6357421875, -4452.8427734375, 9.7423524856567);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8269.7568359375, -4252.5, 8.5384206771851);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8219.0419921875, -4088.5788574219, 10.961343765259);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -8139.2314453125, -3965.7282714844, 9.5204877853394);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7987.0043945313, -3917.7924804688, 14.626481056213);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7887.751953125, -3845.0083007813, 28.286499023438);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7795.326171875, -3670.2580566406, 46.190757751465);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7659.0864257813, -3613.4328613281, 27.579223632813);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7548.2783203125, -3757.4221191406, 9.1815767288208);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7518.7119140625, -3970.615234375, 8.9343032836914);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7535.3461914063, -4087.6545410156, 12.083737373352);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7734.0678710938, -4016.7163085938, 9.3880777359009);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7842.4067382813, -4156.4184570313, 10.639300346375);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7777.2080078125, -4330.9624023438, 9.0044384002686);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7589.4365234375, -4324.0083007813, 11.335885047913);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7399.8271484375, -4339.0483398438, 10.897324562073);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7241.0546875, -4289.2666015625, 10.117364883423);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7262.12109375, -4452.62890625, 9.6239748001099);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7277.1450195313, -4620.9272460938, 8.7753391265869);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7437.7133789063, -4627.9350585938, 10.881372451782);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7540.5869140625, -4562.0854492188, 9.0272397994995);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7687.67578125, -4578.41015625, 9.8721904754639);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7775.5205078125, -4716.552734375, 9.1083669662476);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7734.7661132813, -4828.5366210938, 8.9977149963379);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7585.7719726563, -4865.5, 0.74077868461609);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7461.923828125, -4819.3305664063, 9.0824565887451);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7322.9140625, -4742.5307617188, 11.918846130371);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7201.4013671875, -4822.732421875, 10.092259407043);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -6980.765625, -4789.7041015625, 9.2517623901367);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -6812.9760742188, -4768.615234375, 10.685881614685);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -6923.6704101563, -4686.8046875, 10.204975128174);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -6971.1318359375, -4520.7490234375, 10.399057388306);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7005.9379882813, -4385.1220703125, 9.9767360687256);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -6949.5947265625, -4258.9448242188, 9.0858821868896);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -6994.6752929688, -4167.384765625, 12.255258560181);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7084.333984375, -4092.6821289063, 10.201422691345);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7150.458984375, -3996.421875, 8.8541955947876);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7086.861328125, -3869.9174804688, 11.665954589844);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7086.3657226563, -3710.8566894531, 8.7329845428467);
tanarisGatherPaths:addTanarisPath(self.numTanarisPaths, -7149.8295898438, -3632.2397460938, 9.1757965087891);


end