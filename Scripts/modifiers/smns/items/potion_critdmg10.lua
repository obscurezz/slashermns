package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')
require('smnsConditions')

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
	local value = 10
    if smnsConditions_isBigUnit(unit) then
    	return svAddCrit1Damage(unit, prev, value * 0.75)
	end
    return svAddCrit1Damage(unit, prev, value)
end

-- function getAttack2CritHit(unit, prev)
-- 	if statsCheck_isDirectDmgType(unit.impl.attack2.type) then
-- 		return true
-- 	end
-- 	return prev
-- end

-- function getAttack2CritDamage(unit, prev)
-- 	local value = 10
-- 	if statsCheck_isDirectDmgType(unit.impl.attack2.type) then
-- 		if smnsConditions_isBigUnit(unit) then
--     		return svAddCrit2Damage(unit, prev, value * 0.75)
-- 		end
-- 		return svAddCrit2Damage(unit, prev, value)
-- 	end
-- 	return prev
-- end
