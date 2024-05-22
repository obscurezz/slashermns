package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua"
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamRatio(unit, prev)
	local Ingenier = Id.new('g070um0031').value
	_get_Group_and_Mods(unit)
	
	
	if _GroupInfo_stackHasModifierAmount(Ingenier) > 0 then
	local group = _GroupInfo_getCurrentGroup()
		local units = group.units
		local u
		for i = 1, #units do
			u = units[i]
			if u.hp > 0 then
				local modUnits = _GroupInfo_UnitModifiers(u)
				if _GroupInfo_UnitModifierAmount(modUnits, Ingenier) > 0 then
					return 75
				end
			end
		end
		
	end
	return prev
	
end