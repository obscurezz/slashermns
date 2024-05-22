package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
	_get_Group_and_Mods(unit)
	local result = 0
	if _GroupInfo_stackHasModifierAmount(Id.new('g070um0064').value) > 1 then
		local nearUnits = _GroupInfo_getLeftAndRightNearestUnits(unit, true)
		for i = 1, #nearUnits do
            mods = _GroupInfo_UnitModifiers(nearUnits[i])
            result = result + _GroupInfo_UnitModifierAmount(mods, Id.new('g070um0064').value)
        end	
	end	
	return svMultimplyDamage1(unit, prev, result * 0.1)
end


