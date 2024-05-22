function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getRegen(unit, prev)
	return prev + 33 * (1 - unit.hp / unit.hpMax)
end
