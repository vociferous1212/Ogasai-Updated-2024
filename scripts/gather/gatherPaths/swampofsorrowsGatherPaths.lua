swampofsorrowsGatherPaths = {

	swampofsorrowsPaths = {},
	numSwampofsorrowsPaths = 1,

}


function swampofsorrowsGatherPaths:addSwampofsorrowsPath(id, x, y, z)

    local randomOffset = math.random(-6.24552, 5.12525);

    self.swampofsorrowsPaths[self.numSwampofsorrowsPaths] = {};
    self.swampofsorrowsPaths[self.numSwampofsorrowsPaths]['id'] = id;
    self.swampofsorrowsPaths[self.numSwampofsorrowsPaths]['pos'] = {};
    self.swampofsorrowsPaths[self.numSwampofsorrowsPaths]['pos']['x'] = x + randomOffset;
    self.swampofsorrowsPaths[self.numSwampofsorrowsPaths]['pos']['y'] = y + randomOffset;
    self.swampofsorrowsPaths[self.numSwampofsorrowsPaths]['pos']['z'] = z;

    self.numSwampofsorrowsPaths = self.numSwampofsorrowsPaths + 1;

end

function swampofsorrowsGatherPaths:setupSwampofsorrowsPaths()
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10203.692382813, -2579.7819824219, 28.889324188232);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10252.997070313, -2616.1196289063, 26.781080245972);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10292.8828125, -2663.1677246094, 25.537548065186);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10264.40234375, -2716.412109375, 22.508550643921);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10251.93359375, -2775.3259277344, 17.392915725708);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10247.751953125, -2835.1921386719, 22.018131256104);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10255.373046875, -2896.8447265625, 20.73687171936);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10254.021484375, -2957.3269042969, 20.809522628784);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10256.751953125, -3018.33203125, 19.73192024231);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10270.190429688, -3077.9013671875, 21.076793670654);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10266.036132813, -3138.9772949219, 21.98362159729);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10242.748046875, -3195.7326660156, 20.429136276245);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10188.20703125, -3222.0239257813, 20.383769989014);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10133.370117188, -3246.8627929688, 20.438497543335);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10082.969726563, -3281.3439941406, 20.437211990356);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10079.716796875, -3342.8630371094, 20.454914093018);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10078.58203125, -3404.0993652344, 20.437406539917);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10063.590820313, -3465.4152832031, 21.53293800354);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10025.075195313, -3512.1892089844, 21.689283370972);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10001.6484375, -3570.1203613281, 21.746597290039);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -9967.8408203125, -3621.703125, 22.208511352539);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -9935.84375, -3673.830078125, 22.176406860352);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -9899.4130859375, -3721.6552734375, 22.392930984497);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -9855.59765625, -3763.9230957031, 22.335729598999);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -9824.88671875, -3816.8937988281, 21.89510345459);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -9808.080078125, -3874.4926757813, 21.746040344238);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -9811.4248046875, -3934.5224609375, 17.873527526855);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -9854.037109375, -3979.0671386719, 22.938137054443);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -9890.2216796875, -4027.8503417969, 20.834526062012);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -9904.296875, -4087.3430175781, 21.221416473389);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -9939.4814453125, -4137.9633789063, 23.134119033813);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -9998.9560546875, -4147.7133789063, 19.473337173462);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10049.982421875, -4181.2495117188, 23.416494369507);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10101.924804688, -4213.63671875, 23.544845581055);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10158.90234375, -4238.48046875, 21.748331069946);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10215.705078125, -4257.9477539063, 23.453382492065);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10271.76171875, -4280.3720703125, 23.767995834351);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10327.793945313, -4304.4189453125, 23.097406387329);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10387.708007813, -4307.8422851563, 22.59023475647);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10447.91796875, -4308.5737304688, 22.92440032959);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10508.848632813, -4304.5073242188, 22.11828994751);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10566.140625, -4280.763671875, 23.119792938232);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10621.239257813, -4256.6791992188, 23.159420013428);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10675.755859375, -4229.0302734375, 22.920490264893);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10721.653320313, -4188.6611328125, 22.135559082031);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10765.296875, -4146.9345703125, 18.603527069092);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10791.770507813, -4093.0517578125, 22.45544052124);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10826.1328125, -4043.7355957031, 22.129371643066);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10878.872070313, -4014.6247558594, 21.915674209595);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10933.84765625, -3988.8706054688, 25.110424041748);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10926.145507813, -3928.8737792969, 23.766315460205);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10879.521484375, -3889.8369140625, 24.055709838867);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10827.232421875, -3860.1479492188, 21.709192276001);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10770.291015625, -3838.2658691406, 22.230611801147);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10715.177734375, -3812.7990722656, 21.71231842041);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10673.649414063, -3767.1896972656, 22.662546157837);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10644.118164063, -3714.8159179688, 21.69423866272);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10609.63671875, -3664.8046875, 23.110298156738);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10571.235351563, -3618.5556640625, 22.149257659912);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10540.063476563, -3566.0556640625, 21.982456207275);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10540.678710938, -3503.1813964844, 22.159482955933);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10534.470703125, -3442.7038574219, 22.482942581177);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10477.184570313, -3423.8898925781, 18.958248138428);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10433.979492188, -3465.8154296875, 23.644010543823);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10439.859375, -3527.1149902344, 23.994705200195);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10423.89453125, -3587.1057128906, 23.044509887695);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10379.6796875, -3630.0070800781, 23.907375335693);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10318.313476563, -3633.4362792969, 22.437650680542);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10262.400390625, -3655.9155273438, 22.487525939941);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10234.631835938, -3710.3041992188, 21.741731643677);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10220.83203125, -3768.7504882813, 22.37774848938);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10207.796875, -3827.3923339844, 21.842729568481);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10194.739257813, -3886.1340332031, 22.313991546631);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10183.727539063, -3945.1337890625, 23.308965682983);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10169.678710938, -4004.0888671875, 21.434999465942);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10126.866210938, -4048.1694335938, 23.540073394775);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10066.252929688, -4057.12890625, 22.653484344482);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10007.102539063, -4042.333984375, 20.022674560547);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -9954.7099609375, -4012.6752929688, 21.428499221802);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -9973.5009765625, -3955.5947265625, 22.85848236084);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10006.1640625, -3905.2563476563, 22.753257751465);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10058.426757813, -3875.2788085938, 23.738716125488);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10100.868164063, -3831.1667480469, 22.688570022583);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10107.2109375, -3770.7014160156, 17.492221832275);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10104.798828125, -3710.6684570313, 21.734121322632);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10125.997070313, -3653.4921875, 17.866352081299);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10170.106445313, -3609.8544921875, 19.638717651367);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10228.772460938, -3596.0454101563, 22.104825973511);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10304.557617188, -3574.9758300781, 17.674247741699);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10331.6328125, -3521.1928710938, 21.973239898682);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10302.1484375, -3467.5075683594, 23.756813049316);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10241.19140625, -3466.677734375, 23.713562011719);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10179.680664063, -3468.4802246094, 20.936325073242);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10139.529296875, -3401.123046875, 21.199226379395);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10185.509765625, -3361.2004394531, 22.629554748535);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10210.239257813, -3306.0495605469, 22.360172271729);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10260.404296875, -3271.2561035156, 17.374513626099);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10326.752929688, -3136.9582519531, 22.340684890747);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10380.15234375, -3109.1628417969, 21.626945495605);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10429.877929688, -3071.8876953125, 19.707880020142);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10481.970703125, -3039.2453613281, 22.002918243408);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10494.745117188, -2979.4467773438, 22.801380157471);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10519.500976563, -2924.6669921875, 21.678955078125);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10528.466796875, -2864.9245605469, 23.771268844604);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10519.693359375, -2805.4619140625, 22.668840408325);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10505.072265625, -2747.0705566406, 21.781053543091);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10454.805664063, -2780.1977539063, 22.064325332642);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10430.969726563, -2836.1716308594, 17.374536514282);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10396.44921875, -2886.5920410156, 21.177465438843);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10353.693359375, -2844.0859375, 24.200691223145);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10352.096679688, -2782.8654785156, 22.8134765625);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10371.802734375, -2724.9921875, 21.678001403809);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10412.323242188, -2680.6286621094, 23.049512863159);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10457.794921875, -2641.2700195313, 24.68736076355);
swampofsorrowsGatherPaths:addSwampofsorrowsPath(self.numSwampofsorrowsPaths, -10381.915039063, -2628.2631835938, 21.680147171021);

end
