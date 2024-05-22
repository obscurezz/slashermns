package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')
require('smnsConditions')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
	local bonus = smnsConditions_getCorpseBonus(unit, 3)
	local base_damage = 5
	return svMultimplyDamage1(unit, prev, (base_damage + bonus) * 0.01)
end

function getAttackCritHit(unit, prev)
	local bonus = smnsConditions_getCorpseBonus(unit, 3)
	if bonus > 0 then
		return true
	end
	return prev
end

function getAttack2CritHit(unit, prev)
	local bonus = smnsConditions_getCorpseBonus(unit, 3)
	if bonus > 0 then
		return true
	end
	return prev
end

function getAttackCritDamage(unit, prev)
	local bonus = smnsConditions_getCorpseBonus(unit, 3)
	return svAddCrit1Damage(unit, prev, bonus)
end

function getAttack2CritDamage(unit, prev)
	local bonus = smnsConditions_getCorpseBonus(unit, 3)
	return svAddCrit2Damage(unit, prev, bonus)
end
