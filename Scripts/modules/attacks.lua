
-- Created by Norvezskaya Semga

require('common')
require('mRnd')

function _attack_All(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	result = _common_AddRange(result, targets, 0, 2, 0, 1)
	return result
end

function _attack_AllAdjacent(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	
	local adjacentLine = selected.line
	local minC = attacker.column - 1
	local maxC = attacker.column + 1
	result = _common_AddRange(result, targets, minC, maxC, adjacentLine, adjacentLine)
	return result
end

function _attack_Area2x2(attacker, selected, allies, targets, targetsAreAllies, item, battle)	
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 0, 1, 1)
	
	if selected.column == 0 or selected.column == 1 then
		result = _common_AddDelta(result, selected, targets, 1, 0, 1)
		result = _common_AddDelta(result, selected, targets, 1, 1, 1)
	else
		result = _common_AddDelta(result, selected, targets, -1, 0, 1)
		result = _common_AddDelta(result, selected, targets, -1, 1, 1)	
	end
	return result
end

function _attack_Area2x2melee(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local r = _attack_Area2x2(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local d = {}
	local minDist = nil
	for i = 1, #r do
		d[i] = math.abs(attacker.column - r[i].column) + 100 * r[i].line
		if minDist == nil or d[i] < minDist then
			minDist = d[i]
		end
	end
	if d[1] == minDist then
		return r
	end
	if minDist >= 100 then
		for i = 1, #r do
			d[i] = d[i] - 100
		end
		minDist = minDist - 100
	end
	if d[1] < 2 then
		return r
	end
	local result = {}
	local n = 1
	for i = 1, #r do
		if d[i] == minDist then
			d[i]  = nil
			result[n] = r[i]
			break
		end
	end
	for i = 1, #r do
		if d[i] ~= nil then
			n = n + 1
			result[n] = r[i]
		end
	end
	return result
end

function _attack_Column(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 0, 1, 1)
	return result
end

function _attack_Line(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 1, 0, 1)
	result = _common_AddDelta(result, selected, targets, -1, 0, 1)
	return result
end

function _attack_SelectedTarget(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	return result
end

function _attack_SelectedTargetAndAllAdjacentToIt(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 1, 0, 0)
	result = _common_AddDelta(result, selected, targets, -1, 0, 0)
	return result
end

function _attack_SelectedTargetAndOneBehindIt(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 0, 1, 0)
	return result
end

function _attack_SelectedTargetAndOneRandom(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	if not _common_useRandom then
		return result
	end
	result = _common_PickOneRandom(result, selected, targets, 100, 100)
	return result
end

function _attack_SelectedTargetAndOneRandomAdjacentToIt(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	if not _common_useRandom then
		return result
	end
	result = _common_PickOneRandom(result, selected, targets, 1, 0)
	return result
end

function _attack_SelectedTargetAndTwoChainedRandom(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	if not _common_useRandom then
		return result
	end
	result = _common_PickOneRandom(result, result[#result], targets, 1, 1)
	result = _common_PickOneRandom(result, result[#result], targets, 1, 1)
	return result
end

function _attack_SemgaAllNearestUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle, pierceChance)
	local result = {}
	
	local targetGroup = _common_getUnitsInBattle(targets, battle)
	if not _common_HasCover(targetGroup, selected) then
		result = {selected}
	elseif _mRnd_RndEventIfRndDisabled(pierceChance, _common_useRandom) then
		result = {selected}
	end
	
	local r = math.max(2, math.abs(selected.column - attacker.column) + 1)
	for i = 1, #targets do
    		if math.abs(targets[i].column - attacker.column) < r then
			if not _common_HasCover(targetGroup, targets[i]) then
				result = _common_AddDelta(result, targets[i], targets, 0, 0, 0)
			elseif _mRnd_RndEventIfRndDisabled(pierceChance, _common_useRandom) then
				result = _common_AddDelta(result, targets[i], targets, 0, 0, 0)
			end
    		end
	end
	return result
end

function _attack_SemgaAllUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle, pierceChance)
	local result = {}
	
	local targetGroup = _common_getUnitsInBattle(targets, battle)
	if not _common_HasCover(targetGroup, selected) then
		result = {selected}
	elseif _mRnd_RndEventIfRndDisabled(pierceChance, _common_useRandom) then
		result = {selected}
	end
	
	for i = 1, #targets do
		if not _common_HasCover(targetGroup, targets[i]) then
			result = _common_AddDelta(result, targets[i], targets, 0, 0, 0)
		elseif _mRnd_RndEventIfRndDisabled(pierceChance, _common_useRandom) then
			result = _common_AddDelta(result, targets[i], targets, 0, 0, 0)
		end
	end
	return result
end

function _attack_SemgaCheckers(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	if selected.column == 0 then
		result = _common_AddDelta(result, selected, targets, 1, 1, 1)
		result = _common_AddDelta(result, selected, targets, -1, 0, 1)
	elseif selected.column == 1 then
		result = _common_AddDelta(result, selected, targets, 1, 1, 1)
		result = _common_AddDelta(result, selected, targets, -1, -1, 1)
	elseif selected.column == 2 then
		result = _common_AddDelta(result, selected, targets, -1, -1, 1)
		result = _common_AddDelta(result, selected, targets, 1, 0, 1)
	end
	return result
end

function _attack_SemgaCross(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 0, 1, 0)
	result = _common_AddDelta(result, selected, targets, 1, 0, 0)
	result = _common_AddDelta(result, selected, targets, 0, -1, 0)
	result = _common_AddDelta(result, selected, targets, -1, 0, 0)
	if #result < 2 and not selected.unit.impl.small and attacker.unit.impl.attack1.reach == 19 then
		result = _common_AddDelta(result, selected, targets, 1, 1, 0)
		result = _common_AddDelta(result, selected, targets, -1, 1, 0)
	end
	
	return result
end

function _attack_SemgaFuryMelee(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	if 100 * attacker.unit.hp / attacker.unit.hpMax < 50 then
		local minC = attacker.column - 1
		local maxC = attacker.column + 1
		local minL = selected.line
		local maxL = selected.line
		result = _common_AddRange(result, targets, minC, maxC, minL, maxL)
	end
	return result
end

function _attack_SemgaFuryRange(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	if 100 * attacker.unit.hp / attacker.unit.hpMax < 50 then
		result = _common_AddDelta(result, selected, targets, 1, 0, 1)
		result = _common_AddDelta(result, selected, targets, -1, 0, 1)
	end
	return result
end

function _attack_SemgaLineAndRandomPerLostHPxMultiplier(attacker, selected, allies, targets, targetsAreAllies, item, battle, multiplier)
	local result = {}
	local chance = 100 * multiplier * ( attacker.unit.hpMax - attacker.unit.hp ) / attacker.unit.hpMax	
	result = _attack_Line(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if not _common_useRandom then
		return result
	end
	result = _common_PickNRandomsWithChance(result, selected, targets, 100, 100, chance)
	return result
end

function _attack_SemgaNearestLineOrAll(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	if _common_IsOnFrontline(attacker, allies) then
		result = _attack_All(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	else
		local targetGroup = _common_getUnitsInBattle(targets, battle)
		local f = _common_GetFrontline(targetGroup)
		result = _common_AddRange(result, targets, 0, 2, f, f)
	end
	return result
end

function _attack_SemgaPierceHit(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
 	if _mRnd_RndEventIfRndDisabled(50, _common_useRandom) then
 		result = _common_AddDelta(result, selected, targets, 0, 1, 1)
	end
	return result
end

function _attack_SemgaPointBlank(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {}
	local selectedIsAdjusted = false
	if math.abs(attacker.column - selected.column) < 2 then
		selectedIsAdjusted = true
	end
	if _common_IsOnFrontline(attacker, allies) and selectedIsAdjusted then
		local minC = selected.column
		local maxC = selected.column
		result = _common_AddRange(result, targets, minC, maxC, 0, 0)
		result = _common_AddRange(result, targets, minC, maxC, 1, 1)
	else
		result = _common_AddDelta(result, selected, targets, 0, 0, 0)
	end
	return result
end

function _attack_SemgaSinglePlusChancePerIni(attacker, selected, allies, targets, targetsAreAllies, item, battle, amount)
	local result = {selected}
	local overlevelsBonus = math.min(50, 5 * ( attacker.unit.impl.level - attacker.unit.baseImpl.level ) )
	local deltaIni = 0
	local chance = 0
	local aIni = _common_getBattleInitiative(attacker.unit, battle)
	
	for i = 1, #targets do
		if targets[i] ~= selected then
			deltaIni = aIni - _common_getBattleInitiative(targets[i].unit, battle)
			chance = amount * ( deltaIni + overlevelsBonus )
			if _mRnd_RndEventIfRndDisabled(chance, _common_useRandom) then
				table.insert(result, targets[i])
			end
		end
	end
	return result
end

function _attack_SemgaSinglePlusNPerLevel(attacker, selected, allies, targets, targetsAreAllies, item, battle, amount)
	local result = {selected}
	if not _common_useRandom then
		return result
	end
	local overlevels = attacker.unit.impl.level - attacker.unit.baseImpl.level
	local chance = 100 * math.floor(overlevels / amount)
	result = _common_PickNRandomsWithChance(result, selected, targets, 100, 100, chance)
	return result
end

function _attack_SemgaSmallEnth(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {}
	if attacker.unit.impl.level < 5 then
		result = _attack_SelectedTarget(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif attacker.unit.impl.level < 10 then
		result = _attack_SelectedTarget(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif attacker.unit.impl.level < 15 then
		result = _attack_Line(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	else
		result = _attack_All(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	end
	return result
end

function _attack_SemgaTargetAndTwoRandomBackline(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	if not _common_useRandom then
		return result
	end
	
	local pool = {}
	local s = -1
	
	pool = _common_AddRange(pool, targets, 0, 2, 1, 1)
	pool = _common_RemoveAddedFromPool(result, pool)
	while(#result < 3 and #pool > 0)
	do
		s = _mRnd_RndNum(#pool)
		table.insert(result, pool[s])
		table.remove(pool, s)
	end
	if #result < 3 then
		pool = {}
		pool = _common_AddRange(pool, targets, 0, 2, 0, 0)
		pool = _common_RemoveAddedFromPool(result, pool)
		while(#result < 3 and #pool > 0)
		do
			s = _mRnd_RndNum(#pool)
			table.insert(result, pool[s])
			table.remove(pool, s)
		end
	end
	return result
end

function _attack_SemgaTwoAnyColumns(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 0, 1, 1)
	result = _common_AddDelta(result, selected, targets, 1, 0, 1)
	result = _common_AddDelta(result, selected, targets, 1, 1, 1)	
	return result
end

function _attack_SemgaTwoAnyInLine(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 1, 0, 1)
	if #result < 2 and not selected.unit.impl.small then
		result = _common_AddDelta(result, selected, targets, 1, 1, 1)
	end
	return result
end


