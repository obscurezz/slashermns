package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttack2Power(unit, prev)
	smnsInfo_SetApplyAccuracyBuffToAttack2(true)
	local result = svFlatEffectPower2(unit, prev, math.min(20, 5 * (unit.impl.level - unit.baseImpl.level)))
	smnsInfo_SetApplyAccuracyBuffToAttack2(false)
	return result
end
