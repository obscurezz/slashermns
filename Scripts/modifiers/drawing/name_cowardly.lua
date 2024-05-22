
function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

local maleTXT   = Id.new("x012tg1025")
local femaleTXT = Id.new("x012tg1026")

function getNameTxt(unit, prev)
	if unit.impl.male then
		return maleTXT
	else
		return femaleTXT
	end
end
