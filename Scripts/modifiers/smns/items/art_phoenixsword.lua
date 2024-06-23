package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require "unitAuraCustomDesc"
require "GroupInfo"
require "unitAura"
require "setValue"

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end
-- function getAttackDamRatio(unit, prev)
-- 		return 60
-- 	end

-- function getAttackDamRatio(unit, prev)
-- 	local check_range
-- 	if unit.impl.altAttack ~= nil then
-- 		check_range = unit.impl.altAttack.reach
-- 	else
-- 		check_range = unit.impl.attack1.reach
-- 	end
-- 	if check_range == 102 or check_range == 27 or check_range == 103 then
-- 		return 60
-- 	end
-- 	return prev
-- end

function getAttackReach(unit, prev)
	local check_range = unit.impl.attack1.reach
	-- if unit.impl.altAttack ~= nil then
	-- 	check_range = unit.impl.altAttack.reach
	-- else
	-- 	check_range = unit.impl.attack1.reach
	-- end

	if check_range == 103 then
		return 805
	end

	if check_range == 27 then
		return 806
	end

	return prev
end