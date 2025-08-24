package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('global_spell_effects')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function canApplyAsLowerSpell()
	return true
end

function canApplyAsBoostSpell()
	return false
end

function getAttackCritDamage(unit, prev)
	local value = 0.35
	local res = _ChangeGlobalDebuffEffect(unit, 1 - value)
    return prev * res
end

function getAttack2CritDamage(unit, prev)
	local value = 0.35
	local res = _ChangeGlobalDebuffEffect(unit, 1 - value)
    return prev * res
end

function getAttackDrain(unit, damage, prev)
	local value = -0.35
	local current_vamp = unit.impl.attack1:getDrain(damage) + damage * 0.5
	local res = _ChangeGlobalDebuffEffect(unit, value)
	return svAddDrain1(unit, prev, damage, (current_vamp / damage * res))
end

function getAttack2Drain(unit, damage, prev)
	local value = -0.35
	local current_vamp = unit.impl.attack2:getDrain(damage) + damage * 0.5
	local res = _ChangeGlobalDebuffEffect(unit, value)
	return svAddDrain2(unit, prev, damage, (current_vamp / damage * res))
end

function getAttack2Damage(unit, prev)
	local value = 0.35
	local res = _ChangeGlobalDebuffEffect(unit, 1 - value)
	if unit.impl.attack2.type == Attack.Shatter then
		return prev * res
	end
	return prev
end
