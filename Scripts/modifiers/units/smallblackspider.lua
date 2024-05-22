package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('converter')
require('GroupInfo')
require('setValue')

function getModifierDisplay(unit, prev)
	return _modifDisplay_Cannibalism(unit, prev)
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_Cannibalism(unit, prev)
end

function getAttackDamage(unit, prev)
	if prev > 0 then
		local multiplier = _getSmallBlackSpiderBonus(unit)
		return svMultimplyDamage1(unit, prev, multiplier)
	end
	return prev
end

function getAttackHeal(unit, prev)
	if prev > 0 then
		local multiplier = _getSmallBlackSpiderBonus(unit)
		return svMultimplyHeal1(unit, prev, multiplier)
	end
	return prev
end

function getAttack2Damage(unit, prev)
	if prev > 0 then
		local multiplier = _getSmallBlackSpiderBonus(unit)
		return svMultimplyDamage2(unit, prev, multiplier)
	end
	return prev
end

function getAttack2Heal(unit, prev)
	if prev > 0 then
		local multiplier = _getSmallBlackSpiderBonus(unit)
		return svMultimplyHeal2(unit, prev, multiplier)
	end
	return prev
end

function getAttackInitiative(unit, prev)
	local multiplier = _getSmallBlackSpiderBonus(unit)
	return svMultimplyInitiative(unit, prev, multiplier)
end

function _getSmallBlackSpiderBonus(unit)
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
