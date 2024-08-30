_questDBTargets = {targetKilledTable = {}, targetKilledTableNum = 0,}

function _questDBTargets:addTargetToKilledTable(target)
	if target ~= nil and target ~= 0 and target ~= "" then
		self.targetKilledTable[self.targetKilledTableNum] = target;
		self.targetKilledTableNum = self.targetKilledTableNum + 1;
	end
	
end
	
function _questDBTargets:isTargetAddedToKilledTable(target)
	for i=0, self.targetKilledTableNum do
		if target ~= nil and target ~= 0 and target ~= "" then
			if target == self.targetKilledTable[i] then
				return true;
			end
		end
	end
return false;
end