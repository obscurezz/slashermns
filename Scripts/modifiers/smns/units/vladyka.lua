package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua"
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamRatio(unit, prev)
	_get_Group_and_Mods(unit)
    local currentSplash = prev

    local group = _GroupInfo_getUnitGroup(unit)
	local units = group.units
	for i = 1, #units do
		u = units[i]
		if u.hp == 0 then
			currentSplash = currentSplash + 20
		end
	end
	return currentSplash
end
