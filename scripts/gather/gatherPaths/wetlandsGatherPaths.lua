wetlandsGatherPaths = {

		wetlandsPaths = {},
		numWetlandsPaths = 1,

}


function wetlandsGatherPaths:addWetlandsPath(id, x, y, z)

	local randomOffset = math.random(-11.24552, 11.12525);

	self.wetlandsPaths[self.numWetlandsPaths] = {};
	self.wetlandsPaths[self.numWetlandsPaths]['id'] = id;
	self.wetlandsPaths[self.numWetlandsPaths]['pos'] = {};
	self.wetlandsPaths[self.numWetlandsPaths]['pos']['x'] = x + randomOffset;
	self.wetlandsPaths[self.numWetlandsPaths]['pos']['y'] = y + randomOffset;
	self.wetlandsPaths[self.numWetlandsPaths]['pos']['z'] = z;

	self.numWetlandsPaths = self.numWetlandsPaths + 1;

end

function wetlandsGatherPaths:setupWetlandsPaths()

wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3452.9992675781, -925.84851074219, 9.1800336837769);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3345.3046875, -1049.8497314453, 10.407446861267);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3241.1437988281, -964.18542480469, 10.284741401672);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3170.630859375, -996.60284423828, 10.902216911316);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3077.9516601563, -1038.5013427734, 9.2015562057495);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2956.2666015625, -1093.5126953125, 10.4480676651);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2876.5661621094, -1129.5437011719, 9.1462326049805);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2726.8273925781, -1295.669921875, 11.758465766907);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2748.6186523438, -1429.5959472656, 8.753680229187);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2780.8935546875, -1523.7205810547, 10.266162872314);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2811.3862304688, -1612.6479492188, 6.5738835334778);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2791.4897460938, -1710.7053222656, 6.9017777442932);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2633.7751464844, -1764.8770751953, 9.1952991485596);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2509.0141601563, -1755.1154785156, 9.895167350769);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2695.1572265625, -1799.3872070313, 9.147289276123);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2722.6748046875, -1939.0059814453, 18.088665008545);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2882.0910644531, -1809.7401123047, 6.835422039032);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3009.91015625, -1740.3071289063, 9.6410160064697);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3081.2941894531, -1735.0021972656, 9.7531108856201);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3174.8034667969, -1622.6242675781, 9.3738269805908);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3215.4643554688, -1536.6383056641, 9.6334810256958);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3298.6999511719, -1424.1822509766, 9.9432010650635);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3437.4877929688, -1369.3074951172, 9.1463270187378);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3567.2258300781, -1333.4202880859, 9.3580751419067);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3555.6994628906, -1405.1518554688, 9.212944984436);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3426.4291992188, -1505.1773681641, 12.532947540283);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3342.5676269531, -1605.5837402344, 10.065130233765);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3232.6103515625, -1746.3653564453, 8.3683061599731);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3150.9946289063, -1896.9471435547, 8.8562440872192);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3167.3078613281, -2120.7878417969, 12.618012428284);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3172.3693847656, -2257.7143554688, 8.9442539215088);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3235.6958007813, -2387.3752441406, 16.101106643677);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3265.5158691406, -2488.7370605469, 18.831769943237);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3359.4428710938, -2590.3508300781, 15.815860748291);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3462.4489746094, -2626.35546875, 15.952874183655);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3557.611328125, -2672.6101074219, 16.006101608276);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3629.2495117188, -2736.01171875, 20.167274475098);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3725.8110351563, -2765.2038574219, 18.162952423096);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3838.0541992188, -2755.4470214844, 19.324069976807);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3962.3513183594, -2693.8803710938, 30.735540390015);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -4074.4245605469, -2683.1884765625, 25.997047424316);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -4175.5893554688, -2707.2490234375, 35.940052032471);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -4141.0620117188, -2839.8383789063, 15.731872558594);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -4080.8781738281, -2997.9592285156, 13.028157234192);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3974.4072265625, -3077.9387207031, 12.31799697876);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3865.5073242188, -3098.0466308594, 12.439125061035);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3737.90234375, -3114.1079101563, 13.479552268982);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3630.1203613281, -3171.7846679688, 20.282405853271);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3520.2705078125, -3233.0314941406, 26.769313812256);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3393.1296386719, -3285.857421875, 23.497550964355);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3358.0310058594, -3198.6022949219, 22.695468902588);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3353.6000976563, -3097.1955566406, 25.217653274536);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3297.2495117188, -3008.2536621094, 23.230743408203);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3297.9377441406, -2890.1796875, 15.10033416748);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3363.0405273438, -2758.9631347656, 24.945304870605);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3283.6235351563, -2597.638671875, 10.734441757202);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3209.22265625, -2579.2443847656, 8.9787092208862);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3145.7810058594, -2521.3386230469, 9.8869466781616);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3082.0085449219, -2621.6931152344, 15.057497024536);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3166.7270507813, -2800.5712890625, 20.550317764282);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3208.0236816406, -2941.1850585938, 21.07391166687);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3085.3862304688, -3018.8215332031, 32.758880615234);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2955.6418457031, -2932.8068847656, 33.351406097412);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2908.5349121094, -2767.1103515625, 28.556661605835);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2831.2875976563, -2595.8388671875, 51.663475036621);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -2852.337890625, -2462.5036621094, 47.391750335693);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3035.1557617188, -2422.8403320313, 10.891046524048);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3153.3215332031, -2442.3200683594, 9.1329975128174);
wetlandsGatherPaths:addWetlandsPath(self.numWetlandsPaths, -3240.0581054688, -2461.1030273438, 15.623755455017);

end


