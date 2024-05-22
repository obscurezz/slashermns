package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')
require('named_mods')

function getModifierDisplay(unit, prev)
    return _modifDisplay_MaxAttackCritDamage(unit, prev)
end

function getModifierDescTxt(unit, prev)
    return _modifCustomTxt_MaxAttackCritDamage(unit, prev)
end

function getAttackCritPower(unit, prev)
	return svAddCrit1Power(unit, prev, 10)
end

function getAttack2CritPower(unit, prev)
	return svAddCrit2Power(unit, prev, 10)
end

function getAttackCritHit(unit, prev)
	if prev then
		return prev
	end
	if _ExecutionersAxCritBonus(unit) > 0 then
		return true
	end
	return prev
end

function getAttackCritDamage(unit, prev)
	local bonus = _ExecutionersAxCritBonus(unit)
	if bonus > 0 then
		return svAddCrit1Damage(unit, prev, bonus)
	end
	return prev
end

function getAttack2CritHit(unit, prev)
	if prev then
		return prev
	end
	if _ExecutionersAxCritBonus(unit) > 0 then
		return true
	end
	return prev
end

function getAttack2CritDamage(unit, prev)
	local bonus = _ExecutionersAxCritBonus(unit)
	if bonus > 0 then
		return svAddCrit2Damage(unit, prev, bonus)
	end
	return prev
end

function _ExecutionersAxCritBonus(unit)
	local unitMods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(unitMods, bloodshroud_mod) > 0 then
		return 25
	end
	return 0
end
