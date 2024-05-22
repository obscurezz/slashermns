
function _Baroness_Info_getAttackClass(prev, unit)
	if unit.impl.level > 2 then
		return Attack.Paralyze
	end
	return Attack.Fear
end

function _Baroness_Info_getAttackPower(unit)
	if unit.impl.level > 2 then
		return unit.baseImpl.attack1.power * 0.875
	end
	return unit.baseImpl.attack1.power
end
