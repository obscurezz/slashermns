package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua"
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttack2Id(unit, prev)
	_get_Group_and_Mods(unit)
	if (unit.hp / unit.hpMax) < 0.2 then 
		return Id.new('g070aa0131')
	end
	return prev
end

