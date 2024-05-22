
require('valueCap')

-- шанс от 0 до 100
function _mRnd_simpleRndEvent(chance)
	if chance > 0 then
		if chance >= 100 or chance >= _mRnd_RndNum(100) then
			return true
		end
	end
	return false
end

-- вернет целое число от 1 до maxValue (включительно)
function _mRnd_RndNum(maxValue)
	return math.random(maxValue)
end

-- вернет число от minValue до maxValue (включительно)
function _mRnd_RndRange(minValue, maxValue)
	local d = maxValue - minValue + 1
	local intPart = _valueCap_GetInt(d)
	return minValue + _mRnd_RndNum(intPart) - 1 + d - intPart
end

function _mRnd_RndEventIfRndDisabled(chance, enabled)
	if chance >= 100 or enabled then
		return _mRnd_simpleRndEvent(chance)
	end
	return false
end
