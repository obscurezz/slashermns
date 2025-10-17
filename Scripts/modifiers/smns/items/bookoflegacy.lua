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

function getMovement(unit, prev)
    return svFlatEffectMovement(unit, prev, 2)
end

function hasAbility(unit, ability, prev)
	if not unit.impl:hasAbility(Ability.BannerUse) and ability == Ability.BannerUse then
		return true
	end
	return prev
end

function _getBanner(unit)
	local stack = _GroupInfo_getUnitStack(unit)
	local banner = stack:getEquippedItem(Equipment.Banner)
    return banner
end

function getAttackPower(unit, prev)
    bonus = 0
    if _getBanner(unit) then
        bonus = bonus + 0.08
    end
    return svMultimplyPower1(unit, prev, bonus)

end

function getAttackInitiative(unit, prev)
    bonus = 0
    if _getBanner(unit) then
        bonus = bonus + 0.08
    end
    return svMultimplyInitiative(unit, prev, bonus)
end