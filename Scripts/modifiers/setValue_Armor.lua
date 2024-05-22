
local _setValue_armorFloatPart  = {}
function svSetArmorFloatPart(unit, value)
	_setValue_armorFloatPart[unit.id.value] = value
	return 0
end
function svRoundArmor(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_armorFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_Armor(unit, sum)
	_setValue_armorFloatPart[uid] = floatPart
	return intPart
end

function svFlatEffectArmor(unit, prev, value)
	return svRoundArmor(unit, value, prev)
end
