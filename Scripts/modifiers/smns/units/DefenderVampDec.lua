package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

-- function getAttackDrain(unit, damage, prev)
-- 	return svAddDrain1(unit, prev, damage, -0.40)
-- end

-- function getAttack2Drain(unit, damage, prev)
-- 	return svAddDrain2(unit, prev, damage, -0.4)
-- end