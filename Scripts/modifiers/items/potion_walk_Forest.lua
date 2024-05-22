

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function hasMovementBonus(unit, ground, prev)
	if ground == Ground.Forest then
		return true
	end	
	return prev
end
