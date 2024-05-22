

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function canApplyToUnitType(unitType)
	-- Can apply on stack leader only
	return
		unitType == Unit.Noble or
		unitType == Unit.Leader or
		unitType == Unit.Summon or
		unitType == Unit.Illusion;
end

function getNegotiate(unit, prev)
	return prev + 10
end
