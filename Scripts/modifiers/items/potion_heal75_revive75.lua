

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getReviveCost(unit, prev)
	local cost = Currency.new(prev)
	cost.gold = math.max(0.25 * cost.gold, 1)
	return cost
end

function getHealCost(unit, prev)
	local cost = Currency.new(prev)
	cost.gold = math.max(0.25 * cost.gold, 1)
	return cost
end
