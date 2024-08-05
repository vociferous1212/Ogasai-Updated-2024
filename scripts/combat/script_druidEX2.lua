script_druidEX2 = {}

function script_druidEX2:menuOne()

	Text("Claw Energy Cost");
	script_druid.clawEnergy = SliderInt("Claw Energy", 40, 45, script_druid.clawEnergy);
	if (HasSpell("Rake")) then
		Text("Rake Energy Cost");
		script_druid.rakeEnergy = SliderInt("Rake Energy", 35, 40, script_druid.rakeEnergy);
	end
end

function script_druidEX2:menuTwo()
end

function script_druidEX2:menuThree()
end