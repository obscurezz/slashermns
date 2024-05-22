
local _setValue_drain1FloatPart = {}
local _setValue_drain2FloatPart = {}
function svSetDrain1FloatPart(unit, value)
	_setValue_drain1FloatPart[unit.id.value] = value
	return 0
end
function svSetDrain2FloatPart(unit, value)
	_setValue_drain1FloatPart[unit.id.value] = value
	return 0
end

function svAddDrain1(unit, prev, damage, multiplier)
	local uid = unit.id.value
	if _setValue_drain1FloatPart[uid] == nil then
		_setValue_drain1FloatPart[uid] = 0
	end
	local sum = _setValue_drain1FloatPart[uid] + prev + damage * multiplier
	local intPart, floatPart = _valueCap_Attack1Drain(unit, sum)
	_setValue_drain1FloatPart[uid] = floatPart
	return intPart
end

function svAddDrain2(unit, prev, damage, multiplier)
	local uid = unit.id.value
	if _setValue_drain2FloatPart[uid] == nil then
		_setValue_drain2FloatPart[uid] = 0
	end
	local sum = _setValue_drain2FloatPart[uid] + prev + damage * multiplier
	local intPart, floatPart = _valueCap_Attack2Drain(unit, sum)
	_setValue_drain2FloatPart[uid] = floatPart
	return intPart
end
