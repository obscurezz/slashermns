package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')
require('smnsConditions')
require('potion_effects')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
	value = _ChangePotionEffect(unit, 0.35)
	if smnsConditions_isBigUnit(unit) then
    	return svMultimplyDamage1(unit, prev, value * 0.75)
	end
	return svMultimplyDamage1(unit, prev, value)
end

function getAttackHeal(unit, prev)
	value = _ChangePotionEffect(unit, 0.35)
	if smnsConditions_isBigUnit(unit) then
    	return svMultimplyHeal1(unit, prev, value * 0.75)
	end
	return svMultimplyHeal1(unit, prev, value)
end

-- function getAttack2Damage(unit, prev)
-- 	value = 0.35
-- 	if statsCheck_isDirectDmgType(unit.impl.attack2.type) then
-- 		if smnsConditions_isBigUnit(unit) then
-- 			return svMultimplyDamage2(unit, prev, value * 0.75)
-- 		end
-- 		return svMultimplyDamage2(unit, prev, value)
-- 	end
-- 	return prev
-- end

-- function getAttack2Heal(unit, prev)
-- 	value = 0.35
-- 	if smnsConditions_isBigUnit(unit) then
--     	return svMultimplyHeal2(unit, prev, value * 0.75)
-- 	end
-- 	return svMultimplyHeal2(unit, prev, value)
-- end
