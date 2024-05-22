
local _setValue_xpNextFloatPart  = {}
function svSetXpNextFloatPart(unit, value)
	_setValue_xpNextFloatPart[unit.id.value] = value
	return 0
end
function svRoundXpNext(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_xpNextFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_XpNext(unit, sum)
	_setValue_xpNextFloatPart[uid] = floatPart
	return intPart
end

function svMultimplyXpNext(unit, prev, multiplier)
	return svRoundXpNext(unit, unit.leveledImpl.xpNext * multiplier, prev)
end

function svMultimplicativeEffectXpNext(unit, prev, multiplier)
	return svRoundXpNext(unit, prev * ( multiplier - 1 ), prev)
end

function svFlatEffectXpNext(unit, prev, value)
	return svRoundXpNext(unit, value, prev)
end
