package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackCritHit(unit, prev)
    return true
end

function getAttackCritDamage(unit, prev)
    return svAddCrit1Damage(unit, prev, math.min(20, 5 * (unit.impl.level - unit.baseImpl.level)))
end

function getAttack2CritHit(unit, prev)
    return true
end

function getAttack2CritDamage(unit, prev)
    return svAddCrit2Damage(unit, prev, math.min(20, 5 * (unit.impl.level - unit.baseImpl.level)))
end