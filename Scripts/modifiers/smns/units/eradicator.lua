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



function _getSmallBlackSpiderBonus(unit)
	local group = _GroupInfo_getUnitGroup(unit)
	local units = group.units
	local result = 0
	for i = 1, #units do
		u = units[i]
		if u.hp == 0 then
			result = result + 0.15
		end
	end
	return result
end
