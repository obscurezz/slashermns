package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('mRnd')
require('torhothInfo')

function getModifierDisplay(unit, prev)
	local chance = 10 * ( unit.impl.level - unit.baseImpl.level )
	if chance >= 100 then
		return false
	end
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAtckTwice(unit, prev)
	local chance = 10 * ( unit.impl.level - unit.baseImpl.level )
	return _mRnd_simpleRndEvent(chance)
end

-- function getAttackWards(unit, prev)
-- 	local result = {}
-- 	local level = unit.impl.level - unit.baseImpl.level + 1
-- 	table.insert(result, torhoth_Mods[level])
-- 	return result
-- end
