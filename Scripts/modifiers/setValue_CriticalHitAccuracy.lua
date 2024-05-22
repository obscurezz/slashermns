
local _svCurrentCrit1Power = {}
local _svCurrentCrit2Power = {}
local _svCurrentCrit1Ratio = {}
local _svCurrentCrit2Ratio = {}
local _svCurrentCrit1TotalDamage = {}
local _svCurrentCrit2TotalDamage = {}

function svSetCrit1Power(unit, value)
	_svCurrentCrit1Power[unit.id.value] = value
end
function svSetCrit2Power(unit, value)
	_svCurrentCrit2Power[unit.id.value] = value
end

function svAddCrit1Power(unit, prev, value)
	local id = unit.id.value
	_svCurrentCrit1Power[id] = _svCurrentCrit1Power[id] + value
	return math.max( 0, math.min( _svCurrentCrit1Power[id], 100))
end

function svAddCrit2Power(unit, prev, value)
	local id = unit.id.value
	_svCurrentCrit2Power[id] = _svCurrentCrit2Power[id] + value
	return math.max( 0, math.min( _svCurrentCrit2Power[id], 100))
end

