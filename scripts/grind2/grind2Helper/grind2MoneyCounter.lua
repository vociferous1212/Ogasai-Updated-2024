grind2MoneyCounter = {

}

-- get silver amount from copper
-- we have more than 100 copper and want only the silver amount
function grind2MoneyCounter:silverFromCopper()

	local silver = math.floor(grind2.totalGainedMoney / 100);

return silver;
end

-- get copper amount when we have silver
-- we have more than 100 copper and want only the copper amount
function grind2MoneyCounter:copperFromSilver()

	local silverCount = grind2MoneyCounter:silverFromCopper();
	local copper = math.floor(grind2.totalGainedMoney - (silverCount * 100));

return copper;
end

-- get gold amount from copper
-- we have more than 10000 copper and want only the gold amount
function grind2MoneyCounter:goldFromCopper()

	local gold = math.floor(grind2.totalGainedMoney / 10000);

return gold;
end

function grind2MoneyCounter:silverFromGold()

	local silver = math.floor((grind2.totalGainedMoney - (grind2MoneyCounter:goldFromCopper() * 10000)) / 100);

return silver;
end

function grind2MoneyCounter:copperFromGold()

	local copper = math.floor((grind2.totalGainedMoney - (grind2MoneyCounter:goldFromCopper() * 10000) - (grind2MoneyCounter:silverFromGold())) / 10);

return copper;
end

-- get silver count when we have gold
-- we have more than 10000 copper and want only the silver amount
function grind2MoneyCounter:goldFromSilver()

	local silverCount = grind2MoneyCounter:silverFromCopper();
	local silver = math.floor(grind2.totalGainedMoney - (silverCount * 100));

return silver;
end

-- get copper amount when we have gold




function grind2MoneyCounter:calculateMoneyObtained()

	local money = grind2.totalGainedMoney;

	if grind2.totalGainedMoney >= 10000 then

		money = grind2MoneyCounter:goldFromCopper();
	elseif grind2.totalGainedMoney >= 100 and grind2.totalGainedMoney < 10000 then

		money = grind2MoneyCounter:silverFromCopper();
	end

return money;
end