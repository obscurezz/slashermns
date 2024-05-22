
local _setValue_lowerCostFloatPart  = {}
local _setValue_LowerCostSpellBuffMultiplier = {}
function svSetLowerCostFloatPart(unit, value, spellBuffMutiplier)
	local uid = unit.id.value
	_setValue_lowerCostFloatPart[uid] = value
	_setValue_LowerCostSpellBuffMultiplier[uid] = spellBuffMutiplier
	return 0
end
function svRoundLowerCost(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_lowerCostFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_LowerCost(unit, sum)
	_setValue_lowerCostFloatPart[uid] = floatPart
	return intPart
end

function svFlatEffectLowerCost(unit, prev, value)
	return svRoundLowerCost(unit, value, prev)
end

function svFlatEffectLowerCost_Spell(unit, prev, value)
	local uid = unit.id.value
	return svFlatEffectLowerCost(unit, prev, value * _setValue_LowerCostSpellBuffMultiplier[uid])
end