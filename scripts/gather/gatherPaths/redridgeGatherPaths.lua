redridgeGatherPaths = {

	redridgePaths = {},
	numRedridgePaths = 1,

}

function redridgeGatherPaths:addRedridgePath(id, x, y, z)

	local randomOffset = math.random(-6.24552, 5.12525);

	self.redridgePaths[self.numRedridgePaths] = {};
	self.redridgePaths[self.numRedridgePaths]['id'] = id;
	self.redridgePaths[self.numRedridgePaths]['pos'] = {};
	self.redridgePaths[self.numRedridgePaths]['pos']['x'] = x + randomOffset;
	self.redridgePaths[self.numRedridgePaths]['pos']['y'] = y + randomOffset;
	self.redridgePaths[self.numRedridgePaths]['pos']['z'] = z;

	self.numRedridgePaths = self.numRedridgePaths + 1;

end

function redridgeGatherPaths:setupRedridgePaths()
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9693.2080078125, -1794.0021972656, 57.16854095459);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9639.80078125, -1825.7863769531, 52.271144866943);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9591.4580078125, -1861.435546875, 59.748966217041);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9547.384765625, -1903.0411376953, 71.459938049316);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9592.6259765625, -1943.5319824219, 64.462005615234);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9619.4111328125, -1997.2474365234, 62.091373443604);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9603.4013671875, -2055.4621582031, 64.93913269043);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9659.3505859375, -2077.3486328125, 60.217796325684);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9702.5986328125, -2119.0439453125, 59.659816741943);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9734.287109375, -2170.9289550781, 59.703411102295);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9738.0478515625, -2231.0063476563, 60.145908355713);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9684.9345703125, -2259.1447753906, 62.542289733887);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9661.9580078125, -2315.1474609375, 70.626365661621);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9670.69140625, -2374.5361328125, 62.000411987305);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9672.3330078125, -2435.7551269531, 57.606845855713);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9671.4306640625, -2496.9294433594, 59.117504119873);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9667.912109375, -2557.71484375, 58.448291778564);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9681.91796875, -2616.1574707031, 63.595497131348);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9638.1943359375, -2658.1130371094, 57.269073486328);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9609.2041015625, -2710.7485351563, 58.91178894043);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9615.572265625, -2770.5393066406, 58.755004882813);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9658.345703125, -2812.7741699219, 54.729740142822);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9681.24609375, -2873.4978027344, 51.618370056152);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9688.22265625, -2934.2397460938, 51.96174621582);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9675.2080078125, -2993.6613769531, 51.692321777344);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9679.0693359375, -3054.4113769531, 52.945236206055);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9722.3583984375, -3098.32421875, 58.67325592041);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9703.1298828125, -3156.0773925781, 58.609569549561);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9665.0419921875, -3203.5080566406, 50.842323303223);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9625.3837890625, -3248.7028808594, 49.108531951904);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9591.576171875, -3298.7006835938, 49.070697784424);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9589.4267578125, -3327.0393066406, 50.696865081787);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9586.6005859375, -3340.9145507813, 57.240451812744);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9576.3623046875, -3344.9089355469, 63.023731231689);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9566.189453125, -3348.8776855469, 69.848243713379);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9556.04296875, -3352.9135742188, 77.439392089844);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9546.1865234375, -3357.5783691406, 84.474060058594);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9537.3955078125, -3364.0498046875, 88.636001586914);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9530.5634765625, -3372.5625, 92.270111083984);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9524.6953125, -3381.767578125, 95.906394958496);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9518.9794921875, -3391.154296875, 99.455223083496);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9513.30078125, -3400.4812011719, 103.20404815674);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9507.62109375, -3409.8083496094, 106.8391418457);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9501.826171875, -3419.0629882813, 110.20142364502);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9495.5439453125, -3428.0778808594, 112.88617706299);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9489.1923828125, -3436.9606933594, 114.98550415039);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9483.171875, -3446.0588378906, 117.41146087646);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9477.341796875, -3455.29296875, 119.35124206543);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9467.9638671875, -3459.2351074219, 117.28874206543);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9457.169921875, -3460.8894042969, 112.06021118164);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9446.3291015625, -3462.1984863281, 108.28189849854);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9435.4462890625, -3463.0949707031, 105.23919677734);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9424.48046875, -3463.8205566406, 102.6157913208);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9413.583984375, -3464.537109375, 100.035987854);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9402.78125, -3403.9914550781, 87.596687316895);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9351.427734375, -3371.8754882813, 87.640884399414);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9289.9541015625, -3380.138671875, 97.468307495117);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9229.37109375, -3373.6020507813, 101.00367736816);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9175.03515625, -3346.1701660156, 102.57255554199);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9130.8701171875, -3305.4377441406, 103.4469909668);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9138.923828125, -3245.7875976563, 100.74503326416);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9178.31640625, -3199.8957519531, 101.66789245605);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9228.0986328125, -3164.9709472656, 108.27264404297);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9227.3359375, -3104.5224609375, 107.89984893799);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9210.345703125, -3045.3869628906, 97.150764465332);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9252.9169921875, -3002.0422363281, 109.31805419922);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9195.5810546875, -2981.3139648438, 95.446586608887);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9157.29296875, -2934.1357421875, 93.467376708984);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9159.5341796875, -2872.44921875, 93.499519348145);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9172.310546875, -2811.6435546875, 93.115142822266);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9176.755859375, -2750.9797363281, 88.836143493652);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9153.4140625, -2695.23046875, 90.72248840332);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9173.7939453125, -2636.6345214844, 103.72254943848);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9114.076171875, -2625.8425292969, 117.07823944092);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9053.3525390625, -2624.3645019531, 126.40739440918);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -8995.1279296875, -2609.6330566406, 130.30879211426);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9051.228515625, -2563.2927246094, 124.82943725586);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9093.0927734375, -2520.0805664063, 117.89919281006);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9060.88671875, -2468.7307128906, 125.35678100586);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9023.181640625, -2420.6147460938, 130.92353820801);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -8989.80078125, -2370.7260742188, 133.34916687012);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -8959.5439453125, -2318.845703125, 132.47711181641);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -8921.810546875, -2272.1467285156, 132.60871887207);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -8915.5439453125, -2212.0056152344, 134.90563964844);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -8894.9228515625, -2154.9873046875, 132.52137756348);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -8933.4287109375, -2108.8195800781, 133.10627746582);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -8990.296875, -2085.1467285156, 132.48837280273);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9051.94140625, -2092.6687011719, 130.45524597168);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9102.8466796875, -2058.7580566406, 128.65182495117);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9153.6982421875, -2026.5150146484, 120.31143188477);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9190.4140625, -1977.8421630859, 112.97933197021);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9241.0185546875, -1945.3918457031, 85.046653747559);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9295.4453125, -1920.0202636719, 71.517890930176);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9353.9697265625, -1906.1610107422, 67.308540344238);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9392.796875, -1952.5526123047, 59.99825668335);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9415.814453125, -2008.7131347656, 59.813381195068);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9426.998046875, -2068.3913574219, 60.204448699951);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9486.5029296875, -2081.1865234375, 98.259559631348);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9545.6875, -2093.8781738281, 81.158065795898);
redridgeGatherPaths:addRedridgePath(self.numRedridgePaths, -9549.5859375, -2028.2316894531, 69.849472045898);

end