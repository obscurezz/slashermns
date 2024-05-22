package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDrain(unit, damage, prev)
	local bonus = math.min(0.5, 0.05 * (unit.impl.level - unit.baseImpl.level))
	return svAddDrain1(unit, prev, damage, bonus)
end

function getAttack2Drain(unit, damage, prev)
	local bonus = math.min(0.5, 0.05 * (unit.impl.level - unit.baseImpl.level))
	return svAddDrain1(unit, prev, damage, bonus)
end