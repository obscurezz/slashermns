

function _hag_info_paralize_infinite_chance(unit, uimpl)
	return 10 + 5 * ( uimpl.level - unit.baseImpl.level )
end
