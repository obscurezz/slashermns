function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackReach(unit, prev)
	if (unit.hp / unit.hpMax) < 0.5 then
		return 14
	end

	return prev
end

function getAttackDamRatio(unit, prev)
	if (unit.hp / unit.hpMax) < 0.5 then
		return prev + 50
	end

	return prev
end