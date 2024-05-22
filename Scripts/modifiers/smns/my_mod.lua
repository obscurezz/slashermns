function canApplyAsLowerSpell()
	return true
end

function getHitPoint(unit, prev)
    local mods = _GroupInfo_UnitModifiers(unit)
    if _GroupInfo_UnitModifierAmount(mods, Id.new('g070um0292').value) then
        log('my mod ')
    end
 
end