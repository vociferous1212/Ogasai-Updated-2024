thousandneedlesGatherPaths = {

	thousandneedlesPaths = {},
	numThousandneedlesPaths = 1,

}

function thousandneedlesGatherPaths:addThousandneedlesPath(id, x, y, z)

	local randomOffset = math.random(-6.24552, 5.12525);

	self.thousandneedlesPaths[self.numThousandneedlesPaths] = {};
	self.thousandneedlesPaths[self.numThousandneedlesPaths]['id'] = id;
	self.thousandneedlesPaths[self.numThousandneedlesPaths]['pos'] = {};
	self.thousandneedlesPaths[self.numThousandneedlesPaths]['pos']['x'] = x + randomOffset;
	self.thousandneedlesPaths[self.numThousandneedlesPaths]['pos']['y'] = y + randomOffset;
	self.thousandneedlesPaths[self.numThousandneedlesPaths]['pos']['z'] = z;

	self.numThousandneedlesPaths = self.numThousandneedlesPaths + 1;

end

function thousandneedlesGatherPaths:setupThousandneedlesPaths()
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4323.7563476563, -1005.7952880859, -54.402153015137);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4377.16015625, -976.46112060547, -55.848781585693);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4417.197265625, -931.29168701172, -57.296955108643);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4431.1684570313, -872.27673339844, -55.847675323486);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4469.388671875, -961.724609375, -55.888473510742);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4523.56640625, -988.42535400391, -55.53258895874);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4552.8369140625, -1040.9152832031, -56.215454101563);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4601.9404296875, -1076.9462890625, -48.183898925781);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4654.6713867188, -1106.6599121094, -53.66109085083);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4714.80078125, -1114.1019287109, -52.334678649902);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4746.8500976563, -1165.7888183594, -41.743186950684);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4753.173828125, -1225.5969238281, -54.861000061035);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4757.9482421875, -1286.0122070313, -49.173046112061);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4789.1025390625, -1338.24609375, -51.364715576172);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4828.5903320313, -1384.3453369141, -51.500431060791);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4887.0849609375, -1398.0397949219, -53.039623260498);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4907.4516601563, -1341.5056152344, -48.701446533203);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4938.279296875, -1289.8336181641, -46.405822753906);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4980.296875, -1243.0797119141, -46.787525177002);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5031.798828125, -1210.6845703125, -54.105895996094);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5086.5908203125, -1236.1040039063, -50.639457702637);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5113.2485351563, -1289.9041748047, -49.587539672852);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5138.0390625, -1344.6845703125, -50.331939697266);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5183.3569335938, -1384.2697753906, -52.258327484131);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5223.337890625, -1429.1854248047, -53.759578704834);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5236.9741210938, -1487.8988037109, -54.215805053711);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5209.8530273438, -1541.4390869141, -53.584785461426);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5176.8168945313, -1591.7012939453, -54.899028778076);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5173.8559570313, -1651.8238525391, -58.662601470947);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5164.4799804688, -1711.1889648438, -61.444400787354);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5117.7529296875, -1749.0847167969, -65.98900604248);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5057.5512695313, -1758.4183349609, -66.408271789551);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4997.4389648438, -1758.6413574219, -64.643577575684);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4936.9970703125, -1764.7960205078, -53.677528381348);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4888.2827148438, -1801.0388183594, -37.088661193848);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4857.8920898438, -1853.2155761719, -52.129188537598);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4891.78125, -1903.2110595703, -50.692901611328);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4951.10546875, -1894.107421875, -41.517917633057);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -4994.6865234375, -1851.8583984375, -44.759654998779);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5143.7036132813, -1803.537109375, -57.324073791504);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5180.57421875, -1851.0870361328, -58.061939239502);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5209.849609375, -1903.6085205078, -61.820735931396);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5228.357421875, -1960.9813232422, -62.6611328125);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5238.4301757813, -2021.0341796875, -63.107429504395);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5271.1015625, -2071.4067382813, -61.366271972656);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5328.7309570313, -2054.1723632813, -61.001094818115);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5386.6645507813, -2035.970703125, -62.373344421387);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5440.91796875, -2062.8195800781, -64.647239685059);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5459.2934570313, -2120.5520019531, -61.828979492188);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5461.373046875, -2180.5771484375, -57.353031158447);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5418.3217773438, -2224.4575195313, -56.729049682617);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5358.2514648438, -2221.4440917969, -54.846412658691);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5297.7109375, -2212.5063476563, -54.565601348877);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5237.1005859375, -2211.8002929688, -41.354846954346);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5180.0395507813, -2233.6877441406, -45.148639678955);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5145.6176757813, -2283.6416015625, -54.898223876953);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5137.4819335938, -2343.7014160156, -51.530712127686);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5154.6108398438, -2401.3029785156, -50.240047454834);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5161.7924804688, -2460.9072265625, -52.654884338379);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5165.7065429688, -2520.9094238281, -51.027088165283);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5178.0278320313, -2580.8349609375, -50.701652526855);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5200.2661132813, -2636.6105957031, -50.001308441162);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5229.8979492188, -2689.0114746094, -49.445316314697);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5259.7719726563, -2741.1953125, -45.284240722656);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5293.3481445313, -2791.1635742188, -51.074905395508);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5351.681640625, -2776.150390625, -42.801048278809);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5383.4697265625, -2725.0415039063, -29.692390441895);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5435.2241210938, -2693.8125, -38.061267852783);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5493.5537109375, -2676.7419433594, -46.788673400879);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5541.2729492188, -2713.400390625, -51.737781524658);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5550.2788085938, -2773.0827636719, -53.36784362793);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5531.5322265625, -2830.3974609375, -48.800422668457);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5490.7802734375, -2875.0161132813, -50.096195220947);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5437.7739257813, -2904.7121582031, -54.861835479736);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5434.8881835938, -2964.81640625, -49.72008895874);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5468.7626953125, -3015.1584472656, -46.972537994385);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5528.7392578125, -3030.4484863281, -47.015872955322);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5588.5654296875, -3040.3500976563, -50.895130157471);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5613.5522460938, -3095.4750976563, -50.378211975098);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5585.8950195313, -3148.9223632813, -41.556579589844);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5565.6069335938, -3207.3193359375, -38.889587402344);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5521.0454101563, -3248.7009277344, -35.777633666992);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5460.8325195313, -3255.3134765625, -33.399658203125);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5400.3813476563, -3251.4829101563, -36.10627746582);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5416.1870117188, -3310.3391113281, -37.919490814209);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5447.59765625, -3361.5297851563, -39.446895599365);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5477.6533203125, -3414.70703125, -41.255588531494);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5513.1591796875, -3463.2028808594, -46.236045837402);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5556.6323242188, -3506.0759277344, -56.13207244873);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5581.5190429688, -3561.7863769531, -58.366283416748);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5600.4624023438, -3618.8371582031, -58.748390197754);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5596.6533203125, -3679.4797363281, -58.749805450439);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5561.9794921875, -3729.123046875, -58.749805450439);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5523.6489257813, -3775.4709472656, -58.749805450439);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5494.3383789063, -3828.7612304688, -58.749805450439);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5483.9965820313, -3888.9396972656, -58.749805450439);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5502.5864257813, -3946.6000976563, -58.749656677246);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5526.6928710938, -4002.6215820313, -58.736022949219);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5543.333984375, -4060.4030761719, -58.706443786621);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5575.3471679688, -4111.8564453125, -58.739887237549);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5612.3208007813, -4159.306640625, -58.592212677002);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5657.0336914063, -4199.5073242188, -58.144729614258);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5705.4145507813, -4236.7192382813, -58.537006378174);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5760.2651367188, -4263.6474609375, -58.749294281006);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5816.1342773438, -4285.7548828125, -58.749294281006);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5876.6997070313, -4294.7490234375, -58.749294281006);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5933.837890625, -4313.7329101563, -58.749294281006);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5990.7294921875, -4293.1704101563, -58.749294281006);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6050.5961914063, -4297.9262695313, -58.749294281006);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6109.7958984375, -4308.3295898438, -58.749294281006);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6168.9721679688, -4318.6826171875, -58.749294281006);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6229, -4318.482421875, -58.749294281006);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6287.4443359375, -4304.828125, -58.749294281006);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6342.4326171875, -4278.1762695313, -58.749294281006);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6391.884765625, -4244.1459960938, -58.749294281006);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6437.015625, -4202.7763671875, -58.599620819092);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6477.400390625, -4158.259765625, -58.750026702881);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6516.4077148438, -4112.4072265625, -58.740039825439);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6552.17578125, -4062.8215332031, -58.723373413086);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6575.0541992188, -4007.2221679688, -58.749282836914);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6581.7626953125, -3947.4465332031, -58.7497215271);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6607.451171875, -3892.1518554688, -57.939800262451);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6625.0029296875, -3834.5979003906, -58.748268127441);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6628.115234375, -3773.8388671875, -58.749713897705);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6624.7944335938, -3713.84765625, -59.094947814941);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6622.9350585938, -3653.75, -58.749691009521);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6618.783203125, -3592.6560058594, -58.749691009521);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6582.3154296875, -3544.353515625, -58.749691009521);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6558.513671875, -3601.619140625, -58.749691009521);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6520.8432617188, -3648.97265625, -58.749691009521);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6480.5151367188, -3693.57421875, -58.884922027588);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6435.7114257813, -3734.7373046875, -58.80118560791);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6376.7412109375, -3746.6203613281, -58.749851226807);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6322.1123046875, -3720.0583496094, -58.96257019043);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6277.0385742188, -3680.2590332031, -58.84619140625);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6231.9125976563, -3640.4135742188, -58.7516746521);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6194.0859375, -3593.4321289063, -58.7516746521);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6144.880859375, -3558.2932128906, -58.7516746521);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6086.322265625, -3541.748046875, -58.7516746521);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -6026.0346679688, -3530.9343261719, -58.745365142822);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5966.6381835938, -3521.5895996094, -58.571739196777);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5906.4985351563, -3511.0935058594, -58.576301574707);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5859.5703125, -3473.5285644531, -57.231925964355);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5799.1420898438, -3475.6486816406, -56.699394226074);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5738.0908203125, -3475.4736328125, -56.0944480896);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5680.0908203125, -3457.9738769531, -50.977256774902);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5642.6513671875, -3410.2697753906, -44.683094024658);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5606.1967773438, -3360.0900878906, -39.025592803955);
thousandneedlesGatherPaths:addThousandneedlesPath(self.numThousandneedlesPaths, -5576.6083984375, -3307.830078125, -41.917953491211);

end