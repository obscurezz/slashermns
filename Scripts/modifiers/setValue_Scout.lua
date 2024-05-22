
local _setValue_scoutFloatPart  = {}
function svSetScoutFloatPart(unit, value)
	_setValue_scoutFloatPart[unit.id.value] = value
	return 0
end
function svRoundScout(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_scoutFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_Scout(unit, sum)
	_setValue_scoutFloatPart[uid] = floatPart
	return intPart
end

function svFlatEffectScout(unit, prev, value)
	return svRoundScout(unit, value, prev)
end
