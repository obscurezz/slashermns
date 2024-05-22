package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')

function getModifierDescTxt(unit, prev)
	if perk_stats_bonus_additive(unit) > 0 then
		return prev
	end
	return Id.new('x012tg'..tostring(1125 + unit.impl.level))
end

function getModifierDisplay(unit, prev)
	if perk_stats_bonus_additive(unit) > 0 then
		return false
	end
	return prev
end

function getLeadership(unit, prev)
	return prev + 1
end

function getMovement(unit, prev)
	if perk_stats_bonus_additive(unit) == 0 then
		return svFlatEffectMovement(unit, prev, -3 - 2 * unit.impl.level)
	else
		return prev
	end
end

function getRegen(unit, prev)
	return prev + perk_stats_bonus_additive(unit)
end

function getHitPoint(unit, prev)
	return svMultimplyHitPoint(unit, prev, perk_stats_bonus(unit))
end

function getAttackInitiative(unit, prev)
	return svMultimplyInitiative(unit, prev, perk_stats_bonus(unit))
end

function getAttackPower(unit, prev)
	return svMultimplyPower1(unit, prev, perk_stats_bonus(unit))
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, perk_stats_bonus(unit))
end

function getAttackHeal(unit, prev)
	return svMultimplyHeal1(unit, prev, perk_stats_bonus(unit))
end

function getAttack2Power(unit, prev)
	return svMultimplyPower2(unit, prev, perk_stats_bonus(unit))
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, perk_stats_bonus(unit))
end

function getAttack2Heal(unit, prev)
	return svMultimplyHeal2(unit, prev, perk_stats_bonus(unit))
end

function perk_stats_bonus(unit)
	return 0.01 * perk_stats_bonus_additive(unit)
end

function perk_stats_bonus_additive(unit)
	if unit.impl.level < 5 then
		return 0
	else
		return 5
	end
end

