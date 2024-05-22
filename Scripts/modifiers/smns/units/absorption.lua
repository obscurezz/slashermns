package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('converter')
require('GroupInfo')
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
	if prev > 0 then
		local multiplier = _getSmallBlackSpiderBonus(unit)
		return svMultimplyDamage1(unit, prev, multiplier)
	end
	return prev
end

function getAttackInitiative(unit, prev)
	if prev > 0 then
		local multiplier = _getSmallBlackSpiderBonus(unit)
		return svMultimplyInitiative(unit, prev, multiplier)
	end
	return prev
end

function _getSmallBlackSpiderBonus(unit)
	local group = _GroupInfo_getUnitGroup(unit)
	local units = group.units
	local result = 0
	for i = 1, #units do
		u = units[i]
		if u.hp == 0 then
			result = result + 0.05
		end
	end
	return result
end

function getHitPoint(unit, prev)
	local group = _GroupInfo_getUnitGroup(unit)
	local result = 0
	if group ~= nil then
		local units = group.units
		for i = 1, #units do
			u = units[i]
			if u.hp == 0 then
				result = result + 0.1
			end
		end
	end
	if result > 0 then
		return svMultimplyHitPoint(unit, prev, result)
	else
		return prev
	end
end