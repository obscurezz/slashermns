package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getArmor(unit, prev)
	_get_Group_and_Mods(unit)
	local umods = _GroupInfo_UnitModifiers(unit)
	local result = prev
	local konung = Id.new('g070um0069').value
	local guardian = Id.new('g070um0055').value
	if _GroupInfo_UnitModifierAmount(umods, konung) > 0 then
	-- or _GroupInfo_UnitModifierAmount(umods, guardian) > 0 then
		local nearUnits = _GroupInfo_getLeftAndRightNearestUnits(unit, true)
		local mods
		for i = 1, #nearUnits do
			mods = _GroupInfo_UnitModifiers(nearUnits[i])
			--if _GroupInfo_UnitModifierAmount(mods, konung) > 0
			if _GroupInfo_UnitModifierAmount(mods, guardian) > 0 then
	            		result = result + 15
        	    		break
            		end
        	end	
	end
	if _GroupInfo_UnitModifierAmount(umods, guardian) > 0 then
	-- or _GroupInfo_UnitModifierAmount(umods, guardian) > 0 then
		local nearUnits = _GroupInfo_getLeftAndRightNearestUnits(unit, true)
		local mods
		for i = 1, #nearUnits do
			mods = _GroupInfo_UnitModifiers(nearUnits[i])
			--if _GroupInfo_UnitModifierAmount(mods, konung) > 0
			if _GroupInfo_UnitModifierAmount(mods, konung) > 0 then
	            		result = result + 15
        	    		break
            		end
        	end	
	end	
	return result
end


