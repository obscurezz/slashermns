package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('converter')
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getHitPoint(unit, prev)
	return svMultimplyHitPoint(unit, prev, potion_stats_bonus(unit))
end

function getArmor(unit, prev)
	return svFlatEffectArmor(unit, prev, potion_stats_bonus_additive(unit))
end

function getAttackInitiative(unit, prev)
	return svMultimplyInitiative(unit, prev, potion_stats_bonus(unit))
end

function getAttackPower(unit, prev)
	return svMultimplyPower1(unit, prev, potion_stats_bonus(unit))
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, potion_stats_bonus(unit))
end

function getAttackHeal(unit, prev)
	return svMultimplyHeal1(unit, prev, potion_stats_bonus(unit))
end

function getAttack2Power(unit, prev)
	return svMultimplyPower2(unit, prev, potion_stats_bonus(unit))
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, potion_stats_bonus(unit))
end

function getAttack2Heal(unit, prev)
	return svMultimplyHeal2(unit, prev, potion_stats_bonus(unit))
end

function potion_stats_bonus(unit)
	return 0.01 * potion_stats_bonus_additive(unit)
end

function potion_stats_bonus_additive(unit)
	return math.min(math.floor(_getUnitExp(unit) / 2000), 15)
end

