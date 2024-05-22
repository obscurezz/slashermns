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

function getHitPoint(unit, prev)
	return svFlatEffectHitPoint(unit, prev, 30)
end

function getImmuneToAttack(unit, attack, prev)
	if prev == Immune.NotImmune and (attack == Attack.Paralyze or attack == Attack.Petrify) then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, khanflail_mod) > 0 then
			return svAttackImmunityClass(unit, attack, prev, Immune.Once)
		end
	end
	return prev
end

function getImmuneToSource(unit, source, prev)
	if prev == Immune.NotImmune and source == Source.Weapon then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, orcishshield_mod) > 0 then
			return svSourceImmunityClass(unit, source, prev, Immune.Once)
		end
	end
	return prev
end
