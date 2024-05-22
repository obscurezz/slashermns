
function _smallEnthInfo_aReach(unit)
	local level = unit.impl.level
	if level < 5 then
		return 103
	elseif level < 10 then
		return 102
	-- elseif level < 15 then
	-- 	return 10
	else
		-- return 101
		return 10
	end
end

function _smallEnthInfo_aBaseDamageMultiplier(unit)
	local level = unit.impl.level
	if level < 5 then
		return 1.0
	elseif level < 10 then
		return 0.7
	else
		return 0.6
	end
end
