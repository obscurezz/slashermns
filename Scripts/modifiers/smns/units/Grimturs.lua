function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function _FrostUnits(unit)
	local group = _GroupInfo_getCurrentGroup()
    local units = group.units
	local u
	local amount = 0
    for i = 1, #units do
		u = units[i]
		if u.impl.attack1.type == Attack.Frostbite or (u.impl.attack2 ~= nil and u.impl.attack2.type == Attack.Frostbite) then
			if u.id ~= unit.id then
				amount = amount + 1
			end
		end
	end
	return amount
end

function getAttackDamRatio(unit, prev)
	return prev + 15 * _FrostUnits(unit)
end
