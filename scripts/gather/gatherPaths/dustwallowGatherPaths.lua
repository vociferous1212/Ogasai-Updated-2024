dustwallowGatherPaths = {

	dustwallowPaths = {},
	numDustwallowPaths = 1,

}

function dustwallowGatherPaths:addDustwallowPath(id, x, y, z)

    local randomOffset = math.random(-6.24552, 5.12525);

    self.dustwallowPaths[self.numDustwallowPaths] = {};
    self.dustwallowPaths[self.numDustwallowPaths]['id'] = id;
    self.dustwallowPaths[self.numDustwallowPaths]['pos'] = {};
    self.dustwallowPaths[self.numDustwallowPaths]['pos']['x'] = x + randomOffset;
    self.dustwallowPaths[self.numDustwallowPaths]['pos']['y'] = y + randomOffset;
    self.dustwallowPaths[self.numDustwallowPaths]['pos']['z'] = z;

    self.numDustwallowPaths = self.numDustwallowPaths + 1;

end

function dustwallowGatherPaths:setupDustwallowPaths()

dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3654.8579101563, -2723.5546875, 33.709426879883);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3714.474609375, -2733.2685546875, 32.903217315674);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3770.4809570313, -2755.0056152344, 33.928478240967);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3829.5825195313, -2766.5678710938, 34.304489135742);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3888.8791503906, -2777.9870605469, 33.961086273193);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3948.89453125, -2774.5046386719, 33.381313323975);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4008.9982910156, -2776.2651367188, 32.850261688232);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4067.3198242188, -2756.4069824219, 33.865783691406);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4127.099609375, -2749.9916992188, 33.218658447266);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4184.3237304688, -2769.9204101563, 30.530326843262);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4236.525390625, -2799.8234863281, 27.71049118042);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4286.0297851563, -2835.5034179688, 31.547397613525);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4290.7099609375, -2896.0493164063, 38.586288452148);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4257.255859375, -2946.1008300781, 33.101165771484);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4207.3979492188, -2980.6130371094, 34.650066375732);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4169.23828125, -3027.9194335938, 31.490245819092);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4203.67578125, -3077.3544921875, 32.544425964355);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4261.5336914063, -3094.1335449219, 31.145429611206);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4320.2998046875, -3106.8647460938, 31.642078399658);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4331.6337890625, -3166.1120605469, 32.460380554199);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4363.3852539063, -3217.1147460938, 34.44987487793);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4408.2275390625, -3257.0456542969, 28.672658920288);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4468.4809570313, -3254.6599121094, 39.069606781006);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4524.76953125, -3278.2587890625, 36.055225372314);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4574.353515625, -3313.125, 33.629676818848);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4631.2583007813, -3334.4753417969, 32.202697753906);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4682.2465820313, -3367.423828125, 35.312156677246);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4705.3637695313, -3422.984375, 32.553703308105);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4678.2202148438, -3476.98046875, 29.707529067993);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4628.9541015625, -3513.0822753906, 32.145206451416);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4569.701171875, -3524.9536132813, 34.126041412354);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4520.8344726563, -3559.8012695313, 29.628122329712);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4461.0004882813, -3567.619140625, 42.920333862305);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4404.318359375, -3547.6540527344, 39.865489959717);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4348.5834960938, -3525.0808105469, 32.551475524902);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4307.2807617188, -3481.0412597656, 29.005523681641);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4278.1259765625, -3427.7192382813, 35.369846343994);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4251.0395507813, -3374.0983886719, 34.1203956604);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4226.3720703125, -3319.1845703125, 31.100727081299);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4192.3798828125, -3268.6428222656, 33.176990509033);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4146.5107421875, -3228.611328125, 28.873991012573);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4095.2165527344, -3196.22265625, 39.442867279053);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4058.3059082031, -3243.9645996094, 30.06485748291);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4067.5476074219, -3304.3325195313, 31.874921798706);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4063.3503417969, -3364.8754882813, 29.344867706299);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4057.6025390625, -3424.7141113281, 36.425148010254);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4049.9587402344, -3484.6142578125, 38.107089996338);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4041.9538574219, -3544.1274414063, 30.18705368042);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4034.9841308594, -3605.1064453125, 40.227481842041);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -4014.4079589844, -3662.638671875, 43.407829284668);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3961.2307128906, -3690.9321289063, 43.084903717041);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3901.5747070313, -3698.916015625, 30.70121383667);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3861.66015625, -3653.0339355469, 30.750768661499);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3829.5161132813, -3602.1672363281, 39.810470581055);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3798.9448242188, -3550.4770507813, 38.436340332031);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3763.9953613281, -3501.6552734375, 28.522413253784);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3720.9907226563, -3459.7321777344, 41.337535858154);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3673.4287109375, -3421.4975585938, 41.253395080566);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3655.0944824219, -3362.8706054688, 30.046772003174);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3649.2141113281, -3302.1357421875, 40.154411315918);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3621.9560546875, -3247.3139648438, 30.580333709717);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3578.3811035156, -3205.7458496094, 38.02513885498);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3525.1889648438, -3175.9248046875, 40.052104949951);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3475.0986328125, -3141.8520507813, 31.464244842529);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3432.0129394531, -3098.5659179688, 38.174121856689);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3371.8913574219, -3102.7985839844, 28.836791992188);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3313.6157226563, -3120.064453125, 35.188037872314);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3267.6892089844, -3159.6481933594, 39.22233581543);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3230.6330566406, -3207.1533203125, 33.087429046631);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3176.0549316406, -3182.1333007813, 32.999389648438);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3115.4055175781, -3188.4562988281, 33.989212036133);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3054.5908203125, -3186.5537109375, 32.846393585205);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2994.1008300781, -3182.7438964844, 32.100887298584);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2936.3947753906, -3160.9904785156, 32.392322540283);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2891.1650390625, -3119.9946289063, 32.971984863281);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2845.5146484375, -3080.4128417969, 34.923973083496);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2810.8881835938, -3031.2614746094, 32.206558227539);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2772.853515625, -2984.0551757813, 37.419628143311);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2712.6003417969, -2985.2272949219, 37.590278625488);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2652.8952636719, -2991.3200683594, 36.774642944336);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2606.630859375, -3030.7778320313, 33.3916015625);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2568.2236328125, -3078.140625, 32.47004699707);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2538.7456054688, -3130.6665039063, 30.927669525146);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2537.267578125, -3191.4382324219, 33.107654571533);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2569.08984375, -3243.1982421875, 32.926307678223);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2613.3923339844, -3284.3627929688, 34.260078430176);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2668.5874023438, -3311.9411621094, 31.535430908203);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2710.2414550781, -3355.3210449219, 29.801683425903);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2755.359375, -3398.1489257813, 30.456712722778);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2715.8657226563, -3443.9860839844, 33.858825683594);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2679.4128417969, -3492.69921875, 34.270587921143);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2663.3217773438, -3550.7177734375, 34.053089141846);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2658.181640625, -3611.2893066406, 33.805118560791);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2643.2116699219, -3670.0390625, 29.768827438354);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2693.4074707031, -3703.232421875, 30.806837081909);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2722.6594238281, -3756.1916503906, 30.310850143433);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2735.1083984375, -3815.7551269531, 36.025733947754);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2773.05859375, -3862.9379882813, 36.899028778076);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2797.2534179688, -3917.8903808594, 35.14289855957);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2832.1875, -3967.9084472656, 35.98267364502);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2879.0217285156, -4005.6059570313, 28.590587615967);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2924.4340820313, -4045.5397949219, 32.56856918335);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2966.0014648438, -4090.1142578125, 35.471321105957);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3023.4506835938, -4070.8002929688, 36.047691345215);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3084.1010742188, -4073.4851074219, 31.864114761353);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3143.3000488281, -4063.087890625, 31.249347686768);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3204.01953125, -4058.1162109375, 31.780839920044);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3266.0131835938, -4061.45703125, 24.193195343018);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3297.6118164063, -4009.5148925781, 29.041431427002);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3263.1076660156, -3959.0983886719, 27.833965301514);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3233.9252929688, -3906.3349609375, 35.754875183105);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3218.1811523438, -3848.0170898438, 41.345527648926);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3194.556640625, -3791.7619628906, 31.615379333496);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3151.5412597656, -3748.5795898438, 40.623260498047);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3103.6474609375, -3711.4323730469, 38.811283111572);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3065.3190917969, -3665.23828125, 37.621551513672);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3029.2248535156, -3616.6103515625, 28.649173736572);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2975.6474609375, -3586.388671875, 38.557239532471);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2926.3835449219, -3551.9116210938, 35.808082580566);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2881.9995117188, -3510.9797363281, 34.502552032471);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2858.6850585938, -3455.0593261719, 34.11971282959);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2826.123046875, -3403.8818359375, 32.595230102539);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2838.0510253906, -3343.6159667969, 31.740648269653);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2890.1616210938, -3312.2934570313, 31.32818031311);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2937.3122558594, -3274.5720214844, 32.664207458496);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -2998.9455566406, -3279.0534667969, 38.820018768311);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3056.6235351563, -3295.6984863281, 48.800029754639);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3102.8269042969, -3256.7133789063, 39.018356323242);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3288.3068847656, -3224.9145507813, 33.813739776611);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3337.9284667969, -3259.4523925781, 34.29468536377);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3389.0502929688, -3291.0971679688, 35.176998138428);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3428.1870117188, -3244.4636230469, 35.104755401611);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3511.8552246094, -3093.4421386719, 32.200786590576);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3530.7680664063, -3035.6569824219, 30.347412109375);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3560.5920410156, -2983.5776367188, 35.393951416016);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3586.91015625, -2928.4514160156, 38.674308776855);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3538.041015625, -2891.791015625, 29.714307785034);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3493.9055175781, -2848.4499511719, 32.792301177979);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3485.6447753906, -2788.337890625, 35.223735809326);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3486.1396484375, -2727.9760742188, 34.175796508789);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3517.1567382813, -2676.21875, 33.685317993164);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3565.5397949219, -2639.6477050781, 37.961845397949);
dustwallowGatherPaths:addDustwallowPath(self.numDustwallowPaths, -3622.2485351563, -2660.0385742188, 36.834331512451);

end

