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
 	if unit.impl.level - unit.baseImpl.level >= 2 then
		return Id.new('g070aa0194')
 	end
	return prev
end

