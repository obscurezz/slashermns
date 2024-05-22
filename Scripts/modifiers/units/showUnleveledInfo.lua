
function getModifierDisplay(unit, prev)
	if unit.impl.level > unit.baseImpl.level then
		return false
	else
		return true
	end
end

function getModifierDescTxt(unit, prev)
	return prev
end
