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

	if _GroupInfo_stackHasModifierAmount(VassalLeader) > 0 then
		currentSplash = currentSplash + 15
	end
	return currentSplash
end