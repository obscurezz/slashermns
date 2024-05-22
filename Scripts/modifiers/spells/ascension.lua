package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function canApplyAsLowerSpell()
	return false
end

function canApplyAsBoostSpell()
	return true
end

function getHitPoint(unit, prev)
	return svMultimplyHitPoint(unit, prev, 0.2)
end

function getArmor(unit, prev)
	return svFlatEffectArmor(unit, prev, 30)
end

function getImmuneToSource(unit, source, prev)
	if source ~= Source.Life then
		return svSourceImmunityClass(unit, source, prev, Immune.Once)
	end
	return prev
end

function getNegotiate(unit, prev)
	return prev + 40
end

function getAttackInitiative(unit, prev)
	return svMultimplyInitiative(unit, prev, 0.2)
end

function getAttackPower(unit, prev)
	return svMultimplyPower1(unit, prev, 0.2)
end

function getAttackHeal(unit, prev)
	return svMultimplyHeal1(unit, prev, 0.4)
end

function getAttack2Power(unit, prev)
	return svMultimplyPower2(unit, prev, 0.2)
end

function getAttack2Heal(unit, prev)
	return svMultimplyHeal2(unit, prev, 0.4)
end

function getAttackCritHit(unit, prev)
    return true
end

function getAttackCritDamage(unit, prev)
    return svAddCrit1Damage(unit, prev, 40)
end

function getAttack2CritHit(unit, prev)
    return true
end

function getAttack2CritDamage(unit, prev)
    return svAddCrit2Damage(unit, prev, 40)
end

