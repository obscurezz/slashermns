
local _setValue_xpKilledFloatPart  = {}
local _setValue_xpKilledMultiplier = {}
function svSetXpKilledFloatPart(unit, value)
	_setValue_xpKilledFloatPart[unit.id.value] = value
	return 0
end
function svSetXpKilledMultiplier(unit, value)
	_setValue_xpKilledMultiplier[unit.id.value] = value
	return 0
end
function svRoundXpKilled(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_xpKilledFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_XpKilled(unit, sum)
	_setValue_xpKilledFloatPart[uid] = floatPart
	return intPart
end

function svMultimplyXpKilled(unit, prev, multiplier)
	local uid = unit.id.value
	local v = _unitAura_GetBaseXpKilled(uid)
	if v == nil then
		v = unit.leveledImpl.xpKilled
	end
	return svRoundXpKilled(unit, v * multiplier * _setValue_xpKilledMultiplier[uid], prev)
end

function svMultimplicativeEffectXpKilled(unit, prev, multiplier)
	return svRoundXpKilled(unit, prev * ( multiplier - 1 ), prev)
end

function svFlatEffectXpKilled(unit, prev, value)
	local uid = unit.id.value
	return svRoundXpKilled(unit, value * _setValue_xpKilledMultiplier[uid], prev)
end
