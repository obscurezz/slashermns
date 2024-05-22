
local _setValue_attack1HealFloatPart = {}
local _setValue_attack2HealFloatPart = {}
local _setValue_attack1HealAddedValuesMultiplier = {}
local _setValue_attack2HealAddedValuesMultiplier = {}
function svSetAttack1HealInit(unit, floatPart, addedValuesMultiplier)
	local uid = unit.id.value
	_setValue_attack1HealFloatPart[uid] = floatPart
	_setValue_attack1HealAddedValuesMultiplier[uid] = addedValuesMultiplier
	return 0
end
function svSetAttack2HealInit(unit, floatPart, addedValuesMultiplier)
	local uid = unit.id.value
	_setValue_attack2HealFloatPart[uid] = floatPart
	_setValue_attack2HealAddedValuesMultiplier[uid] = addedValuesMultiplier
	return 0
end
function svRoundAttack1Heal(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_attack1HealFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_Attack1Heal(unit, sum)
	_setValue_attack1HealFloatPart[uid] = floatPart
	return intPart
end
function svRoundAttack2Heal(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_attack2HealFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_Attack2Heal(unit, sum)
	_setValue_attack2HealFloatPart[uid] = floatPart
	return intPart
end

function svMultimplyHeal1(unit, prev, multiplier)
	if not smnsInfoApplyDmgBuffToHeal then
		return prev
	end
	local uid = unit.id.value
	local v = _unitAura_GetBaseHeal1(uid)
	if v ~= nil then
		return svRoundAttack1Heal(unit, v * multiplier * _setValue_attack1HealAddedValuesMultiplier[uid], prev)
	end
	return prev
end

function svMultimplyHeal2(unit, prev, multiplier)
	if not smnsInfoApplyDmgBuffToHeal then
		return prev
	end
	local uid = unit.id.value
	local v = _unitAura_GetBaseHeal2(uid)
	if v ~= nil then
		return svRoundAttack2Heal(unit, v * multiplier * _setValue_attack2HealAddedValuesMultiplier[uid], prev)
	end
	return prev
end

function svMultimplicativeEffectHeal1(unit, prev, multiplier)
	if not smnsInfoApplyDmgBuffToHeal then
		return prev
	end
	return svRoundAttack1Heal(unit, prev * ( multiplier - 1 ), prev)
end

function svMultimplicativeEffectHeal2(unit, prev, multiplier)
	if not smnsInfoApplyDmgBuffToHeal then
		return prev
	end
	return svRoundAttack2Heal(unit, prev * ( multiplier - 1 ), prev)
end

function svFlatEffectHeal1(unit, prev, value)
	if not smnsInfoApplyDmgBuffToHeal then
		return prev
	end
	local uid = unit.id.value
	return svRoundAttack1Heal(unit, value * _setValue_attack1HealAddedValuesMultiplier[uid], prev)
end

function svFlatEffectHeal2(unit, prev, value)
	if not smnsInfoApplyDmgBuffToHeal then
		return prev
	end
	local uid = unit.id.value
	return svRoundAttack2Heal(unit, value * _setValue_attack2HealAddedValuesMultiplier[uid], prev)
end
