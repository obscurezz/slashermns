

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamRatio(unit, prev)
	if unit.impl.level - unit.baseImpl.level > 2 then
		return 70
	end
	return prev
end
	