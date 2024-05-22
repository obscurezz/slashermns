package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('RangeInfo')
require('smallEnthInfo')

X010TG1769 = Id.new('x010tg1769')
X010TG1770 = Id.new('x010tg1770')
X010TG1771 = Id.new('x010tg1771')

function getModifierDisplay(unit, prev)
	-- if unit.impl.level < 15 then
	if unit.impl.level < 10 then
		return prev
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	local level = unit.impl.level
	if level < 5 then
		return X010TG1769
	elseif level < 10 then
		return X010TG1770
	-- elseif level < 15 then
	-- 	return X010TG1771
	else
		return prev
	end
end

function getAttackReach(unit, prev)
	local r = _smallEnthInfo_aReach(unit)
	if prev == _RangeInfo_changeToRanged(prev) then
		r = _RangeInfo_changeToRanged(r)
	end
	return r
end
