package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')
require('global_spell_effects')

function canApplyAsLowerSpell()
	return true
end

function canApplyAsBoostSpell()
	return false
end

function getAttackPower(unit, prev)
    local value = -0.15
    local res = _ChangeGlobalDebuffEffect(unit, value)
	return svMultimplyPower1(unit, prev, res)
end

function getAttack2Power(unit, prev)
	local value = -0.15
    local res = _ChangeGlobalDebuffEffect(unit, value)
	smnsInfo_SetApplyAccuracyBuffToAttack2(true)
	local summary = svMultimplyPower2(unit, prev, res)
	smnsInfo_SetApplyAccuracyBuffToAttack2(false)
	return summary
end

function getAttackCritPower(unit, prev)
	local value = -15
    local res = _ChangeGlobalDebuffEffect(unit, value)
    return svAddCrit1Power(unit, prev, res)
end

function getAttack2CritPower(unit, prev)
	local value = -15
    local res = _ChangeGlobalDebuffEffect(unit, value)
    return svAddCrit2Power(unit, prev, res)
end