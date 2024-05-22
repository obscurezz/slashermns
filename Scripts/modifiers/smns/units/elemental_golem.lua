package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"

require('GroupInfo')


function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

    
function getAttackSource(unit, prev)
    local summ_xpkilled = 0
    local summ_hp = 0
    local result
	local HP = getScenario():getUnit(unit.id).hp

    local group = _GroupInfo_getUnitGroup(unit)
    local units = group.units
    local u

    for i = 1, #units do
        u = units[i]
		if u.hp > 0 then
        summ_xpkilled = summ_xpkilled + u.impl.xpKilled
		end
    end

    local total = summ_xpkilled + HP

    if math.fmod(total, 4) == 0 then
        result = Source.Fire
    elseif math.fmod(total, 4) == 1 then
        result = Source.Water
    elseif math.fmod(total, 4) == 2 then
        result = Source.Earth
    else
        result = Source.Air
    end
    return result
end
