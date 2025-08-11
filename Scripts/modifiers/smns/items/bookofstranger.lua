package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')
require('unitAura')
require('named_mods')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

-- function getLowerCost(unit, prev)
-- 	return svFlatEffectLowerCost(unit, 10, 0)
-- end

function hasAbility(unit, ability, prev)
	if not unit.impl:hasAbility(Ability.TravelItemUse) and ability == Ability.TravelItemUse then
		return true
	end
	return prev
end

function _getBoots(unit)
	local stack = _GroupInfo_getUnitStack(unit)
	local boots = stack:getEquippedItem(Equipment.Boots)
    return boots
end

function getHitPoint(unit, prev)
	local bonus = 0
    if _getBoots(unit) then
		bonus = bonus + 0.15
	end
	return svMultimplyHitPoint(unit, prev, bonus)
end
