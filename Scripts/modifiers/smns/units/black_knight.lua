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
	local umods = _GroupInfo_UnitModifiers(unit)
	local result = prev
	local black_knight = Id.new('g070um0217').value
	local death_knight = Id.new('g070um0218').value
	if _GroupInfo_UnitModifierAmount(umods, black_knight) > 0
	or _GroupInfo_UnitModifierAmount(umods, death_knight) > 0 then
		local nearUnits = _GroupInfo_getLeftAndRightNearestUnits(unit, true)
		local mods
		for i = 1, #nearUnits do
			mods = _GroupInfo_UnitModifiers(nearUnits[i])
			if _GroupInfo_UnitModifierAmount(mods, black_knight) > 0
			or _GroupInfo_UnitModifierAmount(mods, death_knight) > 0 then
	            		result = svMultimplyDamage1(unit, prev, 0.15)
        	    		break
            		end
        	end	
	end	
	return result
end


