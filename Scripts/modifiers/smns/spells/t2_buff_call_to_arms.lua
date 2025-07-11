package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')
require('global_spell_effects')

function canApplyAsLowerSpell()
	return false
end

function canApplyAsBoostSpell()
	return true
end

function getImmuneToAttack(unit, attack, prev)
    if attack == Attack.LowerDamage then
        return svAttackImmunityClass(unit, attack, prev, Immune.Once)
    end
    return prev
 end

function getAttackPower(unit, prev)
    local value = 0.1
    local res = _ChangeGlobalBuffEffect(unit, value)
	return svMultimplyPower1(unit, prev, res)
end

function getAttack2Power(unit, prev)
    local value = 0.1
    local res = _ChangeGlobalBuffEffect(unit, value)
    smnsInfo_SetApplyAccuracyBuffToAttack2(true)
    result = svMultimplyPower2(unit, prev, res)
    smnsInfo_SetApplyAccuracyBuffToAttack2(false)
    return result
 end