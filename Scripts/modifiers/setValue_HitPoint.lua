
local _setValue_hitPointFloatPart  = {}
function svSetHitPointFloatPart(unit, value)
	_setValue_hitPointFloatPart[unit.id.value] = value
	return 0
end
function svRoundHitPoint(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_hitPointFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_HitPoint(unit, sum)
	_setValue_hitPointFloatPart[uid] = floatPart
	return intPart
end

function svMultimplyHitPoint(unit, prev, multiplier)
	local uid = unit.id.value
	local v = _unitAura_GetBaseHitPoint(uid)
	if v == nil then
		v = unit.leveledImpl.hitPoint
	end
	return svRoundHitPoint(unit, v * multiplier, prev)
end

function svMultimplicativeEffectHitPoint(unit, prev, multiplier)
	return svRoundHitPoint(unit, prev * ( multiplier - 1 ), prev)
end

function svFlatEffectHitPoint(unit, prev, value)
	local uid = unit.id.value
	return svRoundHitPoint(unit, value, prev)
end
