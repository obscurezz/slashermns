
local _setValue_attack1DamageFloatPart = {}
local _setValue_attack2DamageFloatPart = {}
local _setValue_attack1DamageAddedValuesMultiplier = {}
local _setValue_attack2DamageAddedValuesMultiplier = {}
function svSetAttack1DamageInit(unit, floatPart, addedValuesMultiplier)
	local uid = unit.id.value
	_setValue_attack1DamageFloatPart[uid] = floatPart
	_setValue_attack1DamageAddedValuesMultiplier[uid] = addedValuesMultiplier
	return 0
end
function svSetAttack2DamageInit(unit, floatPart, addedValuesMultiplier)
	local uid = unit.id.value
	_setValue_attack2DamageFloatPart[uid] = floatPart
	_setValue_attack2DamageAddedValuesMultiplier[uid] = addedValuesMultiplier
	return 0
end
function svRoundAttack1Damage(unit, value, prev)
	if _unitAura_getUaAttackType1(unit) ~= Attack.Shatter then
		local uid = unit.id.value
		local sum = _setValue_attack1DamageFloatPart[uid] + prev + value
		local intPart, floatPart = _valueCap_Attack1Damage(unit, sum)
		_setValue_attack1DamageFloatPart[uid] = floatPart
		return intPart
	else
		return prev
	end
end
function svRoundAttack2Damage(unit, value, prev)
	if _unitAura_getUaAttackType2(unit) ~= Attack.Shatter then
		local uid = unit.id.value
		local sum = _setValue_attack2DamageFloatPart[uid] + prev + value
		local intPart, floatPart = _valueCap_Attack2Damage(unit, sum)
		_setValue_attack2DamageFloatPart[uid] = floatPart
		return intPart
	else
		return prev
	end
end

function svMultimplyDamage1(unit, prev, multiplier)
	local uid = unit.id.value
	local v = _unitAura_GetBaseDamage1(uid)
	if v ~= nil and v > 0 then
		return svRoundAttack1Damage(unit, v * multiplier * _setValue_attack1DamageAddedValuesMultiplier[uid], prev)
	end
	return prev
end

function svMultimplyDamage2(unit, prev, multiplier)
	local uid = unit.id.value
	local v = _unitAura_GetBaseDamage2(uid)
	if v ~= nil and v > 0 then
		return svRoundAttack2Damage(unit, v * multiplier * _setValue_attack2DamageAddedValuesMultiplier[uid], prev)
	end
	return prev
end

function svMultimplicativeEffectDamage1(unit, prev, multiplier)
	return svRoundAttack1Damage(unit, prev * ( multiplier - 1 ), prev)
end

function svMultimplicativeEffectDamage2(unit, prev, multiplier)
	return svRoundAttack2Damage(unit, prev * ( multiplier - 1 ), prev)
end

function svFlatEffectDamage1(unit, prev, value)
	local uid = unit.id.value
	return svRoundAttack1Damage(unit, value * _setValue_attack1DamageAddedValuesMultiplier[uid], prev)
end

function svFlatEffectDamage2(unit, prev, value)
	local uid = unit.id.value
	return svRoundAttack2Damage(unit, value * _setValue_attack2DamageAddedValuesMultiplier[uid], prev)
end

function svFlatEffectShatter1(unit, prev, value)
	if _unitAura_getUaAttackType1(unit) == Attack.Shatter then
		return prev + value
	end
	return prev
end

function svFlatEffectShatter2(unit, prev, value)
	if _unitAura_getUaAttackType2(unit) == Attack.Shatter then
		return prev + value
	end
	return prev
end
