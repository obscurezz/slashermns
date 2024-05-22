package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('GroupInfo')
require('setValue')
require('named_mods')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, 0.2)
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, 0.2)
end

function getAttackCritHit(unit, prev)
	if not prev then
		if ringorstrenghtCritDmg(unit, prev) > 0 then
			return true
		end
	end
	return prev
end

function getAttackCritDamage(unit, prev)
	local b = ringorstrenghtCritDmg(unit, prev)
	if b > 0 then
		return svAddCrit1Damage(unit, prev, b)
	end
	return prev
end

function getAttackCritPower(unit, prev)
	local b = ringorstrenghtCritDmg(unit, prev)
	if b > 0 then
		return svAddCrit1Power(unit, prev, b)
	end
	return prev
end

function getAttack2CritHit(unit, prev)
	if not prev then
		if ringorstrenghtCritDmg(unit, prev) > 0 then
			return true
		end
	end
	return prev
end

function getAttack2CritDamage(unit, prev)
	local b = ringorstrenghtCritDmg(unit, prev)
	if b > 0 then
		return svAddCrit2Damage(unit, prev, b)
	end
	return prev
end

function getAttack2CritPower(unit, prev)
	local b = ringorstrenghtCritDmg(unit, prev)
	if b > 0 then
		return svAddCrit2Power(unit, prev, b)
	end
	return prev
end

function ringorstrenghtCritDmg(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, luckybone_mod) > 0 then
		return 10
	end
	return 0
end
