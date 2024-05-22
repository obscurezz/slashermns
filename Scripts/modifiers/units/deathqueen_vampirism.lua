package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require "unitAuraCustomDesc"
require "setValue"

function getModifierDisplay(unit, prev)
	return _modifDisplay_VampirismPerCorpse(unit, prev)
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_VampirismPerCorpse(unit, prev)
end

function getAttackDrain(unit, damage, prev)
	return svAddDrain1(unit, prev, damage, _getDeathQueenBonus_Vampirism(unit))
end

function getAttack2Drain(unit, damage, prev)
	return svAddDrain2(unit, prev, damage, _getDeathQueenBonus_Vampirism(unit))
end

function _getDeathQueenBonus_Vampirism(unit)
	local group = _GroupInfo_getUnitGroup(unit)
	local units = group.units
	local result = 0
	for i = 1, #units do
		u = units[i]
		if u.hp == 0 then
			result = result + 0.1
		end
	end
	return result
end
