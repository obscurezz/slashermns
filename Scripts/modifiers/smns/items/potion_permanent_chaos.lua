package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function _getRandomSource(unit)
    local stack = _GroupInfo_getUnitStack(unit)
    local player = _GroupInfo_getUnitPlayer(unit)
    local sources = { Source.Air, Source.Weapon, Source.Water, Source.Mind, Source.Death, Source.Fire, Source.Earth }

    local random_seed = math.abs(math.fmod((player.id.value * unit.id.value + stack.id.value * unit.baseImpl.hp + unit.baseImpl.id.value), #sources)) + 1

    local random_source = sources[random_seed]
    if sources[random_seed] == unit.impl.attack1.source then
        if random_seed ~= 7 then
            random_source = sources[random_seed + 1]
        else
            random_source = sources[1]
        end
    end

    return random_source

end

function getAttackSource(unit, prev)
    return _getRandomSource(unit)
end