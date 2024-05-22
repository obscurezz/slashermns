function expToLevelSlow(expToConvertion, baseLevel, dynLevel, baseExp, expNext1, expNext2)
	local e = expToConvertion
	local bar = baseExp
	local level = baseLevel

	while (e >= bar) do
		e = e - bar
		level = level + 1

		if (level <= dynLevel) then
			bar = bar + expNext1
		else
			bar = bar + expNext2
		end
	end

	return level
end

function levelToExpFast(baseLevel, currentLevel, dynLevel, baseExp, expNext1, expNext2)
	local overlevel1 = 0
	local overlevel2 = 0

	if (currentLevel > dynLevel) then
		overlevel1 = dynLevel - baseLevel
		overlevel2 = currentLevel - dynLevel
	elseif (currentLevel > baseLevel) then
		overlevel1 = currentLevel - baseLevel
		overlevel2 = 0
	else
		overlevel1 = 0
		overlevel2 = 0
	end

	local e1 = 0
	if (overlevel1 > 0) then
		e1 = baseExp * overlevel1 + (overlevel1 - 1) * overlevel1 * expNext1 * 0.5
	else
		e1 = 0
	end

	local e2 = 0
	if (overlevel2 > 0) then
		local dynExp = baseExp + overlevel1 * expNext1
		e2 = dynExp * overlevel2 + (overlevel2 - 1) * overlevel2 * expNext2 * 0.5
	end

	return e1 + e2
end

function levelToExpSlow(baseLevel, currLevel, dynLevel, baseExp, expNext1, expNext2)
	local e = 0
	local bar = baseExp

	for i = baseLevel, currLevel - 1, 1 do
		e = e + bar

		if (i < dynLevel) then
			bar = bar + expNext1
		else
			bar = bar + expNext2
		end
	end

	return e
end

function _getUnitExp(unit)
	local baseImpl = unit.baseImpl
	local baseLevel = baseImpl.level
	local currLevel = unit.impl.level
	local dynLevel = baseImpl.dynUpgLvl
	local baseExp = baseImpl.xpNext
	local expNext1 = baseImpl.dynUpg1.xpNext
	local expNext2 = baseImpl.dynUpg2.xpNext
	local expToNextLevel = unit.xp

	return levelToExpSlow(baseLevel, currLevel, dynLevel, 
			      baseExp, expNext1, expNext2)
	     + expToNextLevel	
end

function _getUnitImplLevel(baseImpl, exp, bonusLevel)

	local baseLevel = baseImpl.level
	local dynLevel = baseImpl.dynUpgLvl
	local baseExp = baseImpl.xpNext
	local expNext1 = baseImpl.dynUpg1.xpNext
	local expNext2 = baseImpl.dynUpg2.xpNext
	
	if bonusLevel ~= 0 then
		exp = exp
	        + levelToExpSlow(baseLevel, baseLevel + bonusLevel,
	        		 dynLevel, baseExp, expNext1, expNext2)
	end

	local lvl = expToLevelSlow(exp, baseLevel, dynLevel,
				   baseExp, expNext1, expNext2)
	return lvl
end


