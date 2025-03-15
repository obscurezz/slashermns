

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamRatio(unit, prev)
		return math.min(100, prev + (30 * (unit.impl.level - unit.baseImpl.level)))
	end
	