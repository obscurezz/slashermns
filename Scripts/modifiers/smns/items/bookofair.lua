package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getImmuneToSource(unit, source, prev)
	if source == Source.Air then
		return svSourceImmunityClass(unit, source, prev, Immune.Once)
	end
	return prev
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.LowerInitiative then
		return svAttackImmunityClass(unit, attack, prev, Immune.Once)
	end
	return prev
end

function getAttackCritHit(unit, prev)
	return true
end

function getAttackCritDamage(unit, prev)
	return svAddCrit1Damage(unit, prev, 5)
end

function getAttackPower(unit, prev)
    local stack = _GroupInfo_getUnitStack(unit)
	if stack ~= nil then
		local pos = stack.position
		local tile = getScenario():getTile(pos.x, pos.y)
        if tile.terrain == Terrain.Human then
	        return svMultimplyPower1(unit, prev, 0.1)
        end
    end
	return prev
end
