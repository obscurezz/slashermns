
function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

local maleTXT   = Id.new("x010tg2030")
local femaleTXT = Id.new("x010tg2031")

function getNameTxt(unit, prev)
	if unit.impl.male then
		return maleTXT
	else
		return femaleTXT
	end
end
