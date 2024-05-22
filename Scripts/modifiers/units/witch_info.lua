

function _witch_info_paralize_infinite_chance(unit, uimpl)
	return 5 * ( uimpl.level - unit.baseImpl.level )
end
