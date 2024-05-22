
local _svCurrentCrit1Value = {}
local _svCurrentCrit2Value = {}
local _svCurrentCrit1Ratio = {}
local _svCurrentCrit2Ratio = {}
local _svCurrentCrit1TotalDamage = {}
local _svCurrentCrit2TotalDamage = {}
function svSetCrit1InitialDamage(unit, value, ratio, totalDmg)
	local id = unit.id.value
	_svCurrentCrit1Value[id] = value
	_svCurrentCrit1Ratio[id] = ratio
	_svCurrentCrit1TotalDamage[id] = totalDmg
end
function svSetCrit2InitialDamage(unit, value, ratio, totalDmg)
	local id = unit.id.value
	_svCurrentCrit2Value[id] = value
	_svCurrentCrit2Ratio[id] = ratio
	_svCurrentCrit2TotalDamage[id] = totalDmg
end
function svAddCrit1Damage(unit, prev, value)
	local id = unit.id.value
	local capped, uncapped = _valueCap_attackCriticalHitDamage_Percent(unit, _svCurrentCrit1Value[id] + value)
	_svCurrentCrit1Value[id] = uncapped
	if smnsInfoCriticalHit_ClassicalIncrease then
		return math.min(_valueCap_GetMaxCrit(), capped)
	else
		return math.min(_valueCap_GetMaxCrit(), svCorrectCritDamage( _unitAura_GetBaseDamage1(id), 
									     _svCurrentCrit1TotalDamage[id], 
									     capped, 
									     _svCurrentCrit1Ratio[id] ))
	end
end
function svAddCrit2Damage(unit, prev, value)
	local id = unit.id.value
	local capped, uncapped = _valueCap_attackCriticalHitDamage_Percent(unit, _svCurrentCrit2Value[id] + value)
	_svCurrentCrit2Value[id] = uncapped
	if smnsInfoCriticalHit_ClassicalIncrease then
		return math.min(_valueCap_GetMaxCrit(), capped)
	else
		return math.min(_valueCap_GetMaxCrit(), svCorrectCritDamage( _unitAura_GetBaseDamage2(id), 
									     _svCurrentCrit2TotalDamage[id], 
									     capped, 
									     _svCurrentCrit2Ratio[id] ))
	end
end

function svCorrectCritDamage(baseDmg, totalDmg, critValue, ratio)
	local result =  math.floor( critValue * ratio )
	if baseDmg == nil or baseDmg == 0 or totalDmg == nil or totalDmg == 0 then
		return result
	end
	local expectedDmg = math.floor( 0.01 * baseDmg  * critValue )
	local actualDmg   = math.floor( 0.01 * totalDmg * result )
	if actualDmg > expectedDmg then
		while( math.floor( 0.01 * totalDmg * ( result - 1) ) >= expectedDmg )
		do
   			result = result - 1
		end
		if math.abs( math.floor( 0.01 * totalDmg * ( result ) ) - expectedDmg ) > math.abs( math.floor( 0.01 * totalDmg * ( result - 1 ) ) - expectedDmg ) then
			result = result - 1
		end
	elseif actualDmg < expectedDmg then
		while( math.floor( 0.01 * totalDmg * ( result + 1) ) <= expectedDmg )
		do
			result = result + 1
		end
		if math.abs( math.floor( 0.01 * totalDmg * ( result ) ) - expectedDmg ) > math.abs( math.floor( 0.01 * totalDmg * ( result + 1 ) ) - expectedDmg ) then
			result = result + 1
		end
	end
	if expectedDmg > 0 and result == 0 then
		result = 1
	end
	return result
end
