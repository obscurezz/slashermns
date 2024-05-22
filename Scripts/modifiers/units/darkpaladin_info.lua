
local darkPaladinFearLevelCap = 5
local darkPaladin_FearAttackId = Id.new('g012aa0001')
local darkPaladin_NoneAttackId = Id.new("g000000000")

function _Darkpaladin_Info_getModifierDisplay_Power(unit, prev)
	if unit.impl.level - unit.baseImpl.level >= darkPaladinFearLevelCap then
		return false
	else
		return prev
	end
end

function _Darkpaladin_Info_getAttack2Id(prev, unit)
	local overlevels = unit.impl.level - unit.baseImpl.level
	if overlevels > 0 then
		return darkPaladin_FearAttackId
	end
	return prev
end

function _Darkpaladin_Info_getAttack2Class(prev, unit)
	local overlevels = unit.impl.level - unit.baseImpl.level
	if overlevels > 0 then
		return Attack.Fear
	end
	return prev
end

function _Darkpaladin_Info_getAttack2Power(unit)
	local overlevels = unit.impl.level - unit.baseImpl.level
	return 10 * math.min(overlevels, darkPaladinFearLevelCap)
end
