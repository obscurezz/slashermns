
local _setValue_attack1PowerFloatPart = {}
local _setValue_attack2PowerFloatPart = {}
local _setValue_attack1PowerAddedValuesMultiplier = {}
local _setValue_attack2PowerAddedValuesMultiplier = {}

local _setValue_ApplyDamageSpreadChanceShift1 = {}
local _setValue_ApplyDamageSpreadChanceShift2 = {}
local _setValue_attack1DamageSpreadChanceShift = {}
local _setValue_attack2DamageSpreadChanceShift = {}

function svSetApplyDamageSpreadChanceShift1(unit, value)
	local uid = unit.id.value
	_setValue_ApplyDamageSpreadChanceShift1[uid] = value
	return 0
end
function svSetApplyDamageSpreadChanceShift2(unit, value)
	local uid = unit.id.value
	_setValue_ApplyDamageSpreadChanceShift2[uid] = value
	return 0
end
function svGetApplyDamageSpreadChanceShift1(unit)
	return _setValue_ApplyDamageSpreadChanceShift1[unit.id.value]
end
function svGetApplyDamageSpreadChanceShift2(unit)
	return _setValue_ApplyDamageSpreadChanceShift2[unit.id.value]
end
function svGetAttackDamageSpreadChanceShift(unit, attackN, scen)
	local r
	if attackN == 1 then
		r = _setValue_attack1DamageSpreadChanceShift[unit.id.value]
	else
		r = _setValue_attack2DamageSpreadChanceShift[unit.id.value]
	end
	if r == nil then
		local uimpl = scen:getUnit(unit.id).impl
		if attackN == 1 then
			_setValue_attack1DamageSpreadChanceShift[unit.id.value] = 100
			if uimpl.attack1 ~= nil then
				local acc = uimpl.attack1.power
			end
			r = _setValue_attack1DamageSpreadChanceShift[unit.id.value]
		else
			_setValue_attack2DamageSpreadChanceShift[unit.id.value] = 100
			if uimpl.attack2 ~= nil then
				local acc = uimpl.attack2.power
			end
			r = _setValue_attack2DamageSpreadChanceShift[unit.id.value]
		end
		if r == nil then
			r = 100
		end
	end
	return r
end

function svSetAttack1PowerInit(unit, floatPart, addedValuesMultiplier)
	local uid = unit.id.value
	_setValue_attack1PowerFloatPart[uid] = floatPart
	_setValue_attack1PowerAddedValuesMultiplier[uid] = addedValuesMultiplier
	_setValue_attack1DamageSpreadChanceShift[uid] = 100
	return 0
end
function svSetAttack2PowerInit(unit, floatPart, addedValuesMultiplier)
	local uid = unit.id.value
	_setValue_attack2PowerFloatPart[uid] = floatPart
	_setValue_attack2PowerAddedValuesMultiplier[uid] = addedValuesMultiplier
	_setValue_attack2DamageSpreadChanceShift[uid] = 100
	return 0
end
function svRoundAttack1Power(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_attack1PowerFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_Attack1Accuracy(unit, sum)
	_setValue_attack1PowerFloatPart[uid] = floatPart
	return intPart
end
function svRoundAttack2Power(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_attack2PowerFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_Attack2Accuracy(unit, sum)
	_setValue_attack2PowerFloatPart[uid] = floatPart
	return intPart
end

function svMultimplyPower1(unit, prev, multiplier)
	local uid = unit.id.value
	if not _setValue_ApplyDamageSpreadChanceShift1[uid] then
		local v = _unitAura_GetBasePower1(uid)
		if v ~= nil then
			return svRoundAttack1Power(unit, v * multiplier * _setValue_attack1PowerAddedValuesMultiplier[uid], prev)
		end
		return prev
	else
		_setValue_attack1DamageSpreadChanceShift[uid] = _setValue_attack1DamageSpreadChanceShift[uid] + 10 * multiplier * _setValue_attack1PowerAddedValuesMultiplier[uid]
		return prev
	end
end

function svMultimplyPower2(unit, prev, multiplier)
	if not smnsInfoApplyAccuracyBuffToAttack2 then
		return prev
	end
	local uid = unit.id.value
	if not _setValue_ApplyDamageSpreadChanceShift2[uid] then
		local v = _unitAura_GetBasePower2(uid)
		if v ~= nil then
			return svRoundAttack2Power(unit, v * multiplier * _setValue_attack2PowerAddedValuesMultiplier[uid], prev)
		end
		return prev
	else
		_setValue_attack2DamageSpreadChanceShift[uid] = _setValue_attack2DamageSpreadChanceShift[uid] + 10 * multiplier * _setValue_attack2PowerAddedValuesMultiplier[uid]
		return prev
	end
end

function svMultimplicativeEffectPower1(unit, prev, multiplier)
	local uid = unit.id.value
	if not _setValue_ApplyDamageSpreadChanceShift1[uid] then
		return svRoundAttack1Power(unit, prev * ( multiplier - 1 ), prev)
	else
		_setValue_attack1DamageSpreadChanceShift[uid] = _setValue_attack1DamageSpreadChanceShift[uid] * multiplier
		return prev
	end
end

function svMultimplicativeEffectPower2(unit, prev, multiplier)
	if not smnsInfoApplyAccuracyBuffToAttack2 then
		return prev
	end
	local uid = unit.id.value
	if not _setValue_ApplyDamageSpreadChanceShift2[uid] then
		return svRoundAttack2Power(unit, prev * ( multiplier - 1 ), prev)
	else
		_setValue_attack2DamageSpreadChanceShift[uid] = _setValue_attack2DamageSpreadChanceShift[uid] * multiplier
		return prev
	end
end

function svFlatEffectPower1(unit, prev, value)
	local uid = unit.id.value
	if not _setValue_ApplyDamageSpreadChanceShift1[uid] then
		return svRoundAttack1Power(unit, value * _setValue_attack1PowerAddedValuesMultiplier[uid], prev)
	else
		_setValue_attack1DamageSpreadChanceShift[uid] = _setValue_attack1DamageSpreadChanceShift[uid] + value * _setValue_attack1PowerAddedValuesMultiplier[uid]
		return prev
	end
end

function svFlatEffectPower2(unit, prev, value)
	if not smnsInfoApplyAccuracyBuffToAttack2 then
		return prev
	end
	local uid = unit.id.value
	if not _setValue_ApplyDamageSpreadChanceShift2[uid] then
		return svRoundAttack2Power(unit, value * _setValue_attack2PowerAddedValuesMultiplier[uid], prev)
	else
		_setValue_attack2DamageSpreadChanceShift[uid] = _setValue_attack2DamageSpreadChanceShift[uid] + value * _setValue_attack2PowerAddedValuesMultiplier[uid]
		return prev
	end
end
