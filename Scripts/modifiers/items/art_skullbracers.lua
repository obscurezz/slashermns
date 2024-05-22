package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('GroupInfo')
require('setValue')
require('named_mods')
require('unitAuraCustomDesc')

function getModifierDisplay(unit, prev)
	local r = _modifDisplay_AttackDamageHeal_Percent(unit, prev)
	if unit.hp > 0 then
		return r
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_AttackDamageHeal_Percent(unit, prev)
end

function getArmor(unit, prev)
	return svFlatEffectArmor(unit, prev, 20)
end

function getRegen(unit, prev)
	return prev + 10
end

function getImmuneToAttack(unit, attack, prev)
	if (attack == Attack.LowerDamage or attack == Attack.LowerInitiative) and prev == Immune.NotImmune then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, holychalice_mod) > 0 then
			return svAttackImmunityClass(unit, attack, prev, Immune.Once)
		end
	end
	return prev
end

function getImmuneToSource(unit, source, prev)
	if (source == Source.Mind or source == Source.Death) and prev == Immune.NotImmune then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, holychalice_mod) > 0 then
			return svSourceImmunityClass(unit, source, prev, Immune.Once)
		end
	end
	return prev
end
