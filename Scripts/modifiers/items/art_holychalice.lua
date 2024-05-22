package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('GroupInfo')
require('setValue')
require('named_mods')
require('unitAuraCustomDesc')

function getModifierDisplay(unit, prev)
	local r = _modifDisplay_Armor_Flat(unit, prev)
	if unit.hp > 0 then
		return r
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_Armor_Flat(unit, prev)
end

function getArmor(unit, prev)
	return svFlatEffectArmor(unit, prev, 15)
end

function getRegen(unit, prev)
	return prev + 10
end

function hasAbility(unit, ability, prev)
	if not prev and ability == Ability.OrbUse then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, devilchalice_mod) > 0 then
			return true
		end
	end
	return prev
end
