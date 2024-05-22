package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')

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
    return svAddCrit1Damage(unit, prev, 20)
end

function getAttackCritPower(unit, prev)
	return svAddCrit1Power(unit, prev, 10)
end

function getAttack2CritHit(unit, prev)
	if statsCheck_isDirectDmgType(unit.impl.attack2.type) then
		return true
	end
	return prev
end

function getAttack2CritDamage(unit, prev)
	if statsCheck_isDirectDmgType(unit.impl.attack2.type) then
    return svAddCrit2Damage(unit, prev, 20)
	end
	return prev
end

function getAttack2CritPower(unit, prev)
	if statsCheck_isDirectDmgType(unit.impl.attack2.type) then
	return svAddCrit2Power(unit, prev, 10)
	end
	return prev
end
