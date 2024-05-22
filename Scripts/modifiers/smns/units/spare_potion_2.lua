package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua"
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end


-- function getAttack2Id(unit, prev)
-- 	_get_Group_and_Mods(unit)
-- 	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0210').value) > 0 then
-- 		return Id.new('g070aa0173')
-- 	end
-- 	return prev
-- end
