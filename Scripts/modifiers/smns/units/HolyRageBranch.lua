package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttack2Power(unit, prev)
	local maxHP = getScenario():getUnit(unit.id).hpMax
	local value = 50 * ( maxHP - math.min(maxHP, unit.hp) ) / maxHP
	smnsInfo_SetApplyAccuracyBuffToAttack2(true)
	local res = svFlatEffectPower2(unit, prev, value)
	smnsInfo_SetApplyAccuracyBuffToAttack2(false)
	return res
end
