

function _succubus_info_paralize_infinite_chance(unit, uimpl)
	return 25 + 5 * ( uimpl.level - unit.baseImpl.level )
end
