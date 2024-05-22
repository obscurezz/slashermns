package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackReach(unit, prev)
	_get_Group_and_Mods(unit)
	local coveringUnit = _GroupInfo_getCoveringUnit(unit, nil)
	
	if coveringUnit == nil or coveringUnit.hp == 0 then
		return 11
	end
	
	return prev
end

function getAttackCritDamage(unit, prev)
	_get_Group_and_Mods(unit)
	local coveringUnit = _GroupInfo_getCoveringUnit(unit, nil)

	if coveringUnit ~= nil and coveringUnit.hp > 0 then
		return svAddCrit1Damage(unit, prev, 10)
	end

	return prev
end