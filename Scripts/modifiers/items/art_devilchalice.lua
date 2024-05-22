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
	return svMultimplyDamage1(unit, prev, 0.15)
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, 0.15)
end

function getAttackDrain(unit, damage, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	local b = 0.2 * _GroupInfo_UnitModifierAmount(mods, overlordblood_mod)
	return svAddDrain1(unit, prev, damage, 0.1 + b)
end

function getAttack2Drain(unit, damage, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	local b = 0.2 * _GroupInfo_UnitModifierAmount(mods, overlordblood_mod)
	return svAddDrain2(unit, prev, damage, 0.1 + b)
end

function getHitPoint(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, holychalice_mod) > 0 then
		return svFlatEffectHitPoint(unit, prev, 20)
	end
	return prev
end
