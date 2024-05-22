
function _Barrantor_Info_RandomTargetBonusStage(unit)
	local level = unit.impl.level - unit.baseImpl.level
	if level >= 10 then
		return 3
	elseif level >= 5 then
		return 2
	else
		return 1
	end
end

function _Barrantor_Info_RandomTargetBonusMultiplier(unit)
	local level = unit.impl.level - unit.baseImpl.level
	if level >= 10 then
		return 400.0
	elseif level >= 5 then
		return 200.0
	else
		return 100.0
	end
end

