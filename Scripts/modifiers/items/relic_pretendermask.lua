package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"

-- ranged doppelganger
-- G000AA2079 = Id.new("g000aa2079")
-- melee doppelganger
-- G003AA0171 = Id.new("g003aa0171")

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

-- function getAttackId(unit, prev)
-- 	if unit.original ~= nil or not unit.impl.small then
-- 		return prev
-- 	else
-- 		return G000AA2079
-- 	end
-- end

-- G000000000 = Id.new("g000000000")
-- function getAttack2Id(unit, prev)
-- 	if unit.impl.attack1.type == Attack.Doppelganger then
-- 		return G000000000
-- 	else
-- 		return prev
-- 	end
-- end

function getAtckTwice(unit, prev)
	if unit.original == nil then
		return false
	end
	return prev
end
