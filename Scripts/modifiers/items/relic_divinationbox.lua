package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')
require('GroupInfo')
require('named_mods')
require('unitAuraCustomDesc')

function getModifierDisplay(unit, prev)
	return _modifDisplay_FearResist(unit, prev)
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_FearResist(unit, prev)
end

function getAttackInitiative(unit, prev)
	return svMultimplyInitiative(unit, prev, 0.15)
end

function getAttackPower(unit, prev)
	return svMultimplyPower1(unit, prev, 0.15)
end

function getAttack2Power(unit, prev)
	return svMultimplyPower2(unit, prev, 0.15)
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, 0.20)
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, 0.20)
end

function getImmuneToAttack(unit, attack, prev)
	if prev ~= Immune.Always and ( attack == Attack.Doppelganger or attack == Attack.TransformOther ) then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, cursedash_mod) > 0 then
			return svAttackImmunityClass(unit, attack, prev, Immune.Always)
		end
	end
	return prev
end

