
-- Created by Norvezskaya Semga
require('GroupInfo')
require('common')

function _target_Adjacent(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if targetsAreAllies then
		return targets
	end
	
	local result = {}
	if not targetsAreAllies and not _common_IsOnFrontline(attacker, allies) then
		return result
	end

	local targetGroup = _common_getUnitsInBattle(targets, battle)
	local adjacentLine = _common_GetFrontline(targetGroup)
	local minC = attacker.column - 1
	local maxC = minC            + 2
	result = _common_AddRange(result, targets, minC, maxC, adjacentLine, adjacentLine)
	if #result == 0 then
		minC = minC - 1
		maxC = maxC + 1
		result = _common_AddRange(result, targets, minC, maxC, adjacentLine, adjacentLine)
	end
	return result
end

function _target_All(attacker, selected, allies, targets, targetsAreAllies, item, battle)
  return targets
end

function _target_SemgaAdjacentAndUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if targetsAreAllies then
		return targets
	end
	
	local result = {}
	if not targetsAreAllies and not _common_IsOnFrontline(attacker, allies) then
		return result
	end
	
	local targetGroup = _common_getUnitsInBattle(targets, battle)	
	local aCol = attacker.column
	local minC = aCol            - 1
	local maxC = minC            + 2
	result = _common_AddRange(result, targets, minC, maxC, 0, 0)
	if #result == 0 then
		minC = minC - 1
		maxC = maxC + 1
		result = _common_AddRange(result, targets, minC, maxC, 0, 0)
	end
	
	minC = aCol            - 1
	maxC = minC            + 2
	pool = {}
	pool = _common_AddRange(pool, targets, minC, maxC, 1, 1)
	for i = 1, #pool do
		if not _common_HasCover(targetGroup, pool[i]) then
			result = _common_AddDelta(result, pool[i], targets, 0, 0, 0)
		end
	end
	if #result == 0 then
		minC = minC - 1
		maxC = maxC + 1
		result = _common_AddRange(result, targets, minC, maxC, 1, 1)
	end
	return result
end

function _target_SemgaAdjacentInAnyLineFromAnyRow(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if targetsAreAllies then
		return targets
	end
	
	local result = {}
	local minC = attacker.column - 1
	local maxC = minC            + 2
	result = _common_AddRange(result, targets, minC, maxC, 0, 1)
	if #result == 0 then
		minC = minC - 1
		maxC = maxC + 1
		result = _common_AddRange(result, targets, minC, maxC, 0, 1)
	end
	return result
end

function _target_SemgaAdjacentFromAnyRow(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if targetsAreAllies then
		return targets
	end
	
	local result = {}
	local targetGroup = _common_getUnitsInBattle(targets, battle)
	local adjacentLine = _common_GetFrontline(targetGroup)
	local minC = attacker.column - 1
	local maxC = minC            + 2
	result = _common_AddRange(result, targets, minC, maxC, adjacentLine, adjacentLine)
	if #result == 0 then
		minC = minC - 1
		maxC = maxC + 1
		result = _common_AddRange(result, targets, minC, maxC, adjacentLine, adjacentLine)
	end
	return result
end

function _target_SemgaAllIfFrontline(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if targetsAreAllies then
		return targets
	end
	
	if not targetsAreAllies and not _common_IsOnFrontline(attacker, allies) then
		return {}
	end
	return targets
end

function _target_SemgaAllNearestUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if targetsAreAllies then
		return targets
	end
	
	local result = {}
	if not targetsAreAllies and not _common_IsOnFrontline(attacker, allies) then
		return result
	end
	
	local targetGroup = _common_getUnitsInBattle(targets, battle)
	
	local aCol = attacker.column
	for r = 2, 3 do
		for i = 1, #targets do
    			if math.abs(targets[i].column - aCol) < r then
				if not _common_HasCover(targetGroup, targets[i]) then
					result = _common_AddDelta(result, targets[i], targets, 0, 0, 0)
				end
			end
		end
		if #result > 0 then
			break
		end
	end
	return result
end

function _target_SemgaAllUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if targetsAreAllies then
		return targets
	end
	
	local targetGroup = _common_getUnitsInBattle(targets, battle)
	
	local result = {}
	for i = 1, #targets do
		if not _common_HasCover(targetGroup, targets[i]) then
			result = _common_AddDelta(result, targets[i], targets, 0, 0, 0)
		end
	end
	return result
end

function _target_SemgaCatAgility(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if targetsAreAllies then
		return targets
	end
	
	local result = {}
	if not targetsAreAllies and not _common_IsOnFrontline(attacker, allies) then
		return result
	end
	
	local targetGroup = _common_getUnitsInBattle(targets, battle)
	
	local nearestLine = _common_GetFrontline(targetGroup)
	result = _target_Adjacent(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if nearestLine == 0 then
		local frontlineTargets = {}
		frontlineTargets = _common_AddRange(frontlineTargets, targets, 0, 2, nearestLine, nearestLine)
		local maxEnemyIni = 0
		for i = 1, #frontlineTargets do
			maxEnemyIni = math.max(maxEnemyIni, _common_getBattleInitiative(frontlineTargets[i].unit, battle))
		end
	        -- log('ini: '..attacker.unit.impl.attack1.initiative)
	        -- log('max ini: '..maxEnemyIni)
	        -- log('nearestLine: '..nearestLine)
		if _common_getBattleInitiative(attacker.unit, battle) > maxEnemyIni then
			local aC   = attacker.column
			local minC = aC - 1
			local maxC = aC + 1
			local line2Result = {}
			line2Result = _common_AddRange(line2Result, targets, minC, maxC, 1, 1)
			if #line2Result == 0 then
				local dC = 1
				for i = 1, #result do
					dC = math.max(dC, math.abs(aC - result[i].column))
				end
				if dC > 1 then
					minC = aC - dC
					maxC = aC + dC
				end
			end
			result = _common_AddRange(result, targets, minC, maxC, 1, 1)
		end
	end
	return result
end

function _target_SemgaNearestLineOrAll(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if targetsAreAllies then
		return targets
	end
	if _common_IsOnFrontline(attacker, allies) then
		return targets
	else
		local result = {}
		local targetGroup = _common_getUnitsInBattle(targets, battle)
		local adjacentLine = _common_GetFrontline(targetGroup)
		result = _common_AddRange(result, targets, 0, 2, adjacentLine, adjacentLine)
		return result
	end
end

function _target_SemgaSmallEnth(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if targetsAreAllies then
		return targets
	end
	if attacker.unit.impl.level < 5 then
		return _target_Adjacent(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	else
		return _target_All(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	end
end

function _target_Nobody(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	return {}
end

function _target_AllSummoned(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {}
	for i = 1, #targets do
		local u = targets[i].unit
		if battle:getUnitStatus(u.id, BattleStatus.Summon) then
			table.insert(result, targets[i])
		end
	end
	return result
end

function _target_AdjacentAndWerewolf(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if targetsAreAllies then
		return targets
	end
	local result = _target_Adjacent(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	for i = 1, #targets do
		local u = targets[i].unit
		if u.hp/u.hpMax <= 0.33 then
			table.insert(result, targets[i])
		end
	end
	return result
end

function _target_AnyWolf(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {}
	for i = 1, #targets do
		local u = targets[i].unit
		if _GroupInfo_UnitHasModifierValue(u, Id.new('g070um0046').value) then
			table.insert(result, targets[i])
		end
	end
	return result
end

function _target_AnyNecroUnit(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {}
	for i = 1, #targets do
		local u = targets[i].unit
		if _GroupInfo_UnitHasModifierValue(u, Id.new('g070um0013').value) then
			table.insert(result, targets[i])
		end
	end
	return result
end

function _target_PhoenixSwordAdjacent(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = _target_Adjacent(attacker, selected, allies, targets, targetsAreAllies, item, battle)

	local g070um0312 = Id.new('g070um0312').value
	local attackerMods = _GroupInfo_UnitModifiers(attacker.unit)
	
	if _GroupInfo_UnitModifierAmount(attackerMods, g070um0312) > 0 then
		for i = 1, #targets do
			local u = targets[i].unit
			if _common_IsInBattle(u, battle) then
				uid = u.id
				if battle:getUnitStatus(uid, BattleStatus.Blister) or battle:getUnitStatus(uid, BattleStatus.BlisterLong) then
					table.insert(result, targets[i])
				end
			end
		end
	end

	return result
end

function _target_PhoenixSwordAdjacentAndUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = _target_SemgaAdjacentAndUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle)

	local g070um0312 = Id.new('g070um0312').value
	local attackerMods = _GroupInfo_UnitModifiers(attacker.unit)
	
	if _GroupInfo_UnitModifierAmount(attackerMods, g070um0312) > 0 then
		for i = 1, #targets do
			local u = targets[i].unit
			if _common_IsInBattle(u, battle) then
				uid = u.id
				if battle:getUnitStatus(uid, BattleStatus.Blister) or battle:getUnitStatus(uid, BattleStatus.BlisterLong) then
					table.insert(result, targets[i])
				end
			end
		end
	end

	return result
end