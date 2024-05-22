package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('GroupInfo')
require('setValue')
require('named_mods')
require('unitAuraCustomDesc')

function getModifierDisplay(unit, prev)
	return _modifDisplay_SpellDebuffResistanceAura(unit, prev)
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_SpellDebuffResistanceAura(unit, prev)
end


function getHitPoint(unit, prev)
	return svFlatEffectHitPoint(unit, prev, 75)
end

function getAttackPower(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, perseverancebreastplate_mod) > 0 then
		return svMultimplyPower1(unit, prev, 0.1)
	end
	return prev
end

function getAttack2Power(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, perseverancebreastplate_mod) > 0 then
		return svMultimplyPower2(unit, prev, 0.1)
	end
	return prev
end

function getImmuneToSource(unit, source, prev)
	if source == Source.Mind then
		return svSourceImmunityClass(unit, source, prev, Immune.Once)
	elseif source == Source.Death and prev == Immune.NotImmune then 
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, divinationbox_mod) > 0 then
			return svSourceImmunityClass(unit, source, prev, Immune.Once)
		end
	end
	return prev
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.Petrify and prev == Immune.NotImmune then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, holychalice_mod) > 0 then
			return svAttackImmunityClass(unit, attack, prev, Immune.Once)
		end
	elseif attack == Attack.LowerDamage and prev == Immune.NotImmune then 
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, divinationbox_mod) > 0 then
			return svAttackImmunityClass(unit, attack, prev, Immune.Once)
		end
	end
	return prev
end
