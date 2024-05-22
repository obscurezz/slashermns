package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('GroupInfo')

function _leadership_passive_info_getModifierDisplay(unit, prev, scen)
	if scen:getUnit(unit.id).leadership > 5 then
		return false
	end
	return prev
end

lpLord1ID = Id.new("x010tg1708")
lpLord2ID = Id.new("x010tg1709")
lpLord3ID = Id.new("x010tg1708")

function _leadership_passive_info_getModifierDescTxt(unit, prev, scen)
	_GroupInfo_SetScenario(scen)
	local p = _GroupInfo_getUnitPlayer(unit)
	local lord
	if p ~= nil then
		lord = p.lord
	else
		lord = 0
	end
	if lord == 0 then
		return lpLord1ID
	elseif lord == 1 then
		return lpLord2ID
	elseif lord == 2 then
		return lpLord3ID
	end
	return prev
end

-- 0 - лорд-маг
-- 1 - лорд-полководец
-- 2 - лорд-правитель

function _leadership_passive_info_getLeadership(unit, prev, scen)
	_GroupInfo_SetScenario(scen)
	local p = _GroupInfo_getUnitPlayer(unit)
	if p == nil then
		return prev
	end
	local lord = p.lord
	local bonus = 0
	local level = unit.impl.level
	if lord == 0 then
		if level >= 10 then
			bonus = 4
		elseif level >= 8 then
			bonus = 3
		elseif level >= 6 then
			bonus = 2
		elseif level >= 3 then
			bonus = 1
		end
	elseif lord == 1 then
		if level >= 10 then
			bonus = 4
		elseif level >= 8 then
			bonus = 3
		elseif level >= 6 then
			bonus = 2
		elseif level >= 3 then
			bonus = 1
		end
	elseif lord == 2 then
		if level >= 10 then
			bonus = 4
		elseif level >= 8 then
			bonus = 3
		elseif level >= 6 then
			bonus = 2
		elseif level >= 3 then
			bonus = 1
		end
	end
	return prev + bonus
end
