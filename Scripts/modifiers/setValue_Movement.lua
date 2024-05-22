
local _setValue_movementFloatPart  = {}
local _setValue_movementMultiplier = {}
function svSetMovementFloatPart(unit, value)
	_setValue_movementFloatPart[unit.id.value] = value
	return 0
end
function svSetMovementMultiplier(unit, value)
	_setValue_movementMultiplier[unit.id.value] = value
	return 0
end
function svRoundMovement(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_movementFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_Movement(unit, sum)
	_setValue_movementFloatPart[uid] = floatPart
	return intPart
end

function svFlatEffectMovement(unit, prev, value)
	return svRoundMovement(unit, value * _setValue_movementMultiplier[unit.id.value], prev)
end
