
function statsCheck_isDirectDmgUnit(unit)
	return statsCheck_isDirectDmgUnitImpl(unit.impl)
end
function statsCheck_isHealUnit(unit)
	return statsCheck_isHealUnitImpl(unit.impl)
end
function statsCheck_isCurseUnit(unit)
	return statsCheck_isCurseUnitImpl(unit.impl)
end
function statsCheck_isDoTUnit(unit)
	return statsCheck_isDoTUnitImpl(unit.impl)
end
function statsCheck_isSelfTransformUnit(unit)
	return statsCheck_isSelfTransformUnitImpl(unit.impl)
end
function statsCheck_isSummonUnit(unit)
	return statsCheck_isSummonUnitImpl(unit.impl)
end
function statsCheck_isShatterUnit(unit)
	return statsCheck_isShatterUnitImpl(unit.impl)
end
function statsCheck_isDrainUnit(unit)
	return statsCheck_isDrainUnitImpl(unit.impl)
end
function statsCheck_isDrainOverflowUnit(unit)
	return statsCheck_isDrainOverflowUnitImpl(unit.impl)
end

function statsCheck_isDirectDmgUnitImpl(unitImpl)
	if statsCheck_isDirectDmgAttack(unitImpl.attack1) then
		return true
	end
	return statsCheck_isDirectDmgAttack(unitImpl.attack2)
end
function statsCheck_isHealUnitImpl(unitImpl)
	if statsCheck_isHealAttack(unitImpl.attack1) then
		return true
	end
	return statsCheck_isHealAttack(unitImpl.attack2)
end
function statsCheck_isCurseUnitImpl(unitImpl)
	if statsCheck_isCurseAttack(unitImpl.attack1) then
		return true
	end
	return statsCheck_isCurseAttack(unitImpl.attack2)
end
function statsCheck_isDoTUnitImpl(unitImpl)
	if statsCheck_isDoTAttack(unitImpl.attack1) then
		return true
	end
	return statsCheck_isDoTAttack(unitImpl.attack2)
end
function statsCheck_isSelfTransformUnitImpl(unitImpl)
	if statsCheck_isSelfTransformAttack(unitImpl.attack1) then
		return true
	end
	return statsCheck_isSelfTransformAttack(unitImpl.attack2)
end
function statsCheck_isSummonUnitImpl(unitImpl)
	if statsCheck_isSummonAttack(unitImpl.attack1) then
		return true
	end
	return statsCheck_isSummonAttack(unitImpl.attack2)
end
function statsCheck_isShatterUnitImpl(unitImpl)
	if statsCheck_isShatterAttack(unitImpl.attack1) then
		return true
	end
	return statsCheck_isShatterAttack(unitImpl.attack2)
end
function statsCheck_isDrainUnitImpl(unitImpl)
	if statsCheck_isDrainAttack(unitImpl.attack1) then
		return true
	end
	return statsCheck_isDrainAttack(unitImpl.attack2)
end
function statsCheck_isDrainOverflowUnitImpl(unitImpl)
	if statsCheck_isDrainOverflowAttack(unitImpl.attack1) then
		return true
	end
	return statsCheck_isDrainOverflowAttack(unitImpl.attack2)
end

function statsCheck_isDirectDmgAttack(attack)
	if attack == nil then
		return false
	end
	return statsCheck_isDirectDmgType(attack.type)
end
function statsCheck_isHealAttack(attack)
	if attack == nil then
		return false
	end
	return statsCheck_isHealType(attack.type)
end
function statsCheck_isCurseAttack(attack)
	if attack == nil then
		return false
	end
	return statsCheck_isCurseType(attack.type)
end
function statsCheck_isDoTAttack(attack)
	if attack == nil then
		return false
	end
	return statsCheck_isDoTType(attack.type)
end
function statsCheck_isSelfTransformAttack(attack)
	if attack == nil then
		return false
	end
	return statsCheck_isSelfTransformType(attack.type)
end
function statsCheck_isSummonAttack(attack)
	if attack == nil then
		return false
	end
	return statsCheck_isSummonType(attack.type)
end
function statsCheck_isShatterAttack(attack)
	if attack == nil then
		return false
	end
	return statsCheck_isShatterType(attack.type)
end
function statsCheck_isDrainAttack(attack)
	if attack == nil then
		return false
	end
	return statsCheck_isDrainType(attack.type)
end
function statsCheck_isDrainOverflowAttack(attack)
	if attack == nil then
		return false
	end
	return statsCheck_isDrainOverflowType(attack.type)
end

function statsCheck_isDirectDmgType(attackType)
	return attackType == Attack.Damage
	    or attackType == Attack.Drain
	    or attackType == Attack.DrainOverflow
end
function statsCheck_isHPRestoreType(attackType)
	return attackType == Attack.Heal
	    or attackType == Attack.BestowWards
end
function statsCheck_isHealType(attackType)
	return attackType == Attack.Heal
	    or attackType == Attack.BoostDamage
	    or attackType == Attack.Revive
	    or attackType == Attack.Cure
	    or attackType == Attack.GiveAttack
	    or attackType == Attack.BestowWards
end
function statsCheck_isCurseType(attackType)
	return attackType == Attack.Paralyze
	    or attackType == Attack.Fear
	    or attackType == Attack.Petrify
	    or attackType == Attack.LowerDamage
	    or attackType == Attack.LowerInitiative
	    or attackType == Attack.DrainLevel
	    or attackType == Attack.TransformOther
end
function statsCheck_isDoTType(attackType)
	return attackType == Attack.Poison
	    or attackType == Attack.Frostbite
	    or attackType == Attack.Blister
end
function statsCheck_isSelfTransformType(attackType)
	return attackType == Attack.Doppelganger
	    or attackType == Attack.TransformSelf
end
function statsCheck_isSummonType(attackType)
	return attackType == Attack.Summon
end
function statsCheck_isShatterType(attackType)
	return attackType == Attack.Shatter
end
function statsCheck_isDrainType(attackType)
	return attackType == Attack.Drain
end
function statsCheck_isDrainOverflowType(attackType)
	return attackType == Attack.DrainOverflow
end
function statsCheck_isPowerAppliable(attackType)
	return statsCheck_isDirectDmgType(attackType)
	    or statsCheck_isCurseType(attackType)
	    or statsCheck_isDoTType(attackType)
	    or statsCheck_isShatterType(attackType)
end

