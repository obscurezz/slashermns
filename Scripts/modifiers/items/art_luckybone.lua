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

function getAttackPower(unit, prev)
	return svMultimplyPower1(unit, prev, 0.15)
end

function getAttack2Power(unit, prev)
	return svMultimplyPower2(unit, prev, 0.15)
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, 0.1)
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, 0.1)
end

function getAttackCritHit(unit, prev)
	if not prev then
		if luckyboneCritDmg(unit, prev) > 0 then
			return true
		end
	end
	return prev
end

function getAttackCritDamage(unit, prev)
	local b = luckyboneCritDmg(unit, prev)
	if b > 0 then
		return svAddCrit1Damage(unit, prev, b)
	end
	return prev
end

function getAttack2CritHit(unit, prev)
	if not prev then
		if luckyboneCritDmg(unit, prev) > 0 then
			return true
		end
	end
	return prev
end

function getAttack2CritDamage(unit, prev)
	local b = luckyboneCritDmg(unit, prev)
	if b > 0 then
		return svAddCrit2Damage(unit, prev, b)
	end
	return prev
end

function luckyboneCritDmg(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, ringofstrenght_mod) > 0
	or _GroupInfo_UnitModifierAmount(mods, hornofcourage_mod) > 0
	or _GroupInfo_UnitModifierAmount(mods, gnomebracers_mod) > 0 then
		return 10
	end
	return 0
end

