require('setValue')
require('GroupInfo')
require('smnsInfo')


function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackPower(unit, prev)
	_get_Group_and_Mods(unit)
	
	local AnyMageHigherThanT4 = Id.new('g070um0093').value
	local currentBonus = 0
	
	if _GroupInfo_stackHasModifierAmount(AnyMageHigherThanT4) > 0 then
		local group = _GroupInfo_getCurrentGroup()
		local units = group.units
		local u
		for i = 1, #units do
			u = units[i]
			if u.hp > 0 then
				local modUnits = _GroupInfo_UnitModifiers(u)
				if _GroupInfo_UnitModifierAmount(modUnits, AnyMageHigherThanT4) > 0 then
					currentBonus = currentBonus + 5
				end
			end
		end
	
		return svFlatEffectPower1(unit, prev, currentBonus)
	end
	return prev
	
end