package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function _getImpl(unit)
	if unit.original == nil then
		return unit.impl
	else
		return unit.original.impl
	end
end

function getAttackInitiative(unit, prev)
    local Leader = _GroupInfo_getCurrentGroupLeader()
    local impl = _getImpl(Leader)
    local lship = impl.leadership
	return svMultimplyInitiative(unit, prev, 0.02 * (lship - 1))
end

function getAttackDamage(unit, prev)
    local Leader = _GroupInfo_getCurrentGroupLeader()
    local impl = _getImpl(Leader)
    local lship = impl.leadership
	return svMultimplyDamage1(unit, prev, 0.02 * (lship - 1))
end
