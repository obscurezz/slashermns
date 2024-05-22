package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')
require('smns_new_mods_id')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackReach(unit, prev)
	_get_Group_and_Mods(unit)
	local coveringUnit = _GroupInfo_getCoveringUnit(unit, nil)
	
	if coveringUnit ~= nil and coveringUnit.hp > 0 and _GroupInfo_UnitHasModifierValue(coveringUnit, Horseman) then
		return 50
	end
	
	return prev
end
