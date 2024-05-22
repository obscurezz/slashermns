function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getArmor(unit, prev)
	local maxHP = getScenario():getUnit(unit.id).hpMax
	local loseHP = ((1 - unit.hp / maxHP)*100)
	local stackPerk =  math.floor(loseHP / 10)
	return svFlatEffectArmor(unit, prev, 3 * stackPerk)
end


