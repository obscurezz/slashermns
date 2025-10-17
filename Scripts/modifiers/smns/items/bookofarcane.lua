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

function hasAbility(unit, ability, prev)
	if not unit.impl:hasAbility(Ability.OrbUse) and ability == Ability.OrbUse then
		return true
	end
	return prev
end

function _getLeftOrb(unit)
local stack = _GroupInfo_getUnitStack(unit)
local battle_item_left = stack:getEquippedItem(Equipment.Battle1)
    if battle_item_left ~= nil then
    if battle_item_left.base.type == Item.Orb then
    return battle_item_left
        end
end

return nil
end

function _getRightOrb(unit)
local stack = _GroupInfo_getUnitStack(unit)
local battle_item_right = stack:getEquippedItem(Equipment.Battle2)
    if battle_item_right ~= nil then
    if battle_item_right.base.type == Item.Orb then
    return battle_item_right
        end
end

return nil
end

function getAttackDamage(unit, prev)
    if _getLeftOrb(unit) then
        return svFlatEffectDamage1(unit, prev, 3)
    end
    return prev
end

function getAttackInitiative(unit, prev)
    if _getRightOrb(unit) then
        return svFlatEffectInitiative(unit, prev, 3)
    end
    return prev
end