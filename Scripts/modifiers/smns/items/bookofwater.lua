package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getImmuneToSource(unit, source, prev)
	if source == Source.Water then
		return svSourceImmunityClass(unit, source, prev, Immune.Once)
	end
	return prev
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.Frostbite then
		return svAttackImmunityClass(unit, attack, prev, Immune.Once)
	end
	return prev
end

function getHitPoint(unit, prev)
    return svFlatEffectHitPoint(unit, prev, 35)
end

function getAttackInitiative(unit, prev)
    local stack = _GroupInfo_getUnitStack(unit)
	if stack ~= nil then
		local pos = stack.position
		local tile = getScenario():getTile(pos.x, pos.y)
        if tile.terrain == Terrain.Dwarf or tile.ground == Ground.Water then
	        return svFlatEffectInitiative(unit, prev, 5)
        end
    end
	return prev
end
