package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('GroupInfo')
require('setValue')
require('named_mods')
require('unitAuraCustomDesc')

function getModifierDisplay(unit, prev)
	local r = _modifDisplay_HitPoint_Percent(unit, prev)
	if unit.hp > 0 then
		return r
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_HitPoint_Percent(unit, prev)
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, math.min(0.35 + 0.01 * (unit.impl.level - 1), 0.5))
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, math.min(0.35 + 0.01 * (unit.impl.level - 1), 0.5))
end

function getNegotiate(unit, prev)
	local stack = _GroupInfo_getUnitStack(unit)
	if stack:getEquippedItem(Equipment.Banner) ~= nil then
		return prev + 10
	end
	return prev
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.Paralyze and prev ~= Immune.Always then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, runeoflife_mod) > 0 then
			return svAttackImmunityClass(unit, attack, prev, Immune.Always )
		end
	end
	return prev
end
