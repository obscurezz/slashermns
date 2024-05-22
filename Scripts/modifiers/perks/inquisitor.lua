package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

myModValue = Id.new('g200um0001').value
function canApplyToUnit(unitImpl)
	_GroupInfo_SetScenario(getScenario())
	return _GroupInfo_CanTakeUberperk(unitImpl, myModValue)
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, 0.15)
end

function getAttackHeal(unit, prev)
	return svMultimplyHeal1(unit, prev, 0.15)
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, 0.15)
end

function getAttack2Heal(unit, prev)
	return svMultimplyHeal2(unit, prev, 0.15)
end

function getAttackCritHit(unit, prev)
    return true
end

function getAttackCritDamage(unit, prev)
    return svAddCrit1Damage(unit, prev, 15)
end

function getAttack2CritHit(unit, prev)
    return true
end

function getAttack2CritDamage(unit, prev)
    return svAddCrit2Damage(unit, prev, 15)
end

function getImmuneToSource(unit, source, prev)
	if source == Source.Mind then
		return svSourceImmunityClass(unit, source, prev, Immune.Once)
	end
	return prev
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.Paralyze or attack == Attack.Fear or attack == Attack.TransformOther then
		return svAttackImmunityClass(unit, attack, prev, Immune.Always)
	end
	return prev
end
