
local _setValue_attack1SplashFloatPart  = {}
local _setValue_attack2SplashFloatPart  = {}
function svSetAttack1SplashFloatPart(unit, value)
	_setValue_attack1SplashFloatPart[unit.id.value] = value
	return 0
end
function svSetAttack2SplashFloatPart(unit, value)
	_setValue_attack2SplashFloatPart[unit.id.value] = value
	return 0
end
function svRoundAttack1Splash(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_attack1SplashFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_Splash(unit, sum)
	_setValue_attack1SplashFloatPart[uid] = floatPart
	return intPart
end
function svRoundAttack2Splash(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_attack2SplashFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_Splash(unit, sum)
	_setValue_attack2SplashFloatPart[uid] = floatPart
	return intPart
end

function svFlatEffectSplash1(unit, prev, value)
	return svRoundAttack1Splash(unit, value, prev)
end

function svFlatEffectSplash2(unit, prev, value)
	return svRoundAttack2Splash(unit, value, prev)
end

