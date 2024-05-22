
require('mRnd')
require('game_constants')

-- Created by Norvezskaya Semga

_common_useRandom = true
function _common_set_useRandom(v)
	_common_useRandom = v
	return _common_useRandom
end
function _common_get_useRandom()
	return _common_useRandom
end

function _common_IsAddedFilter(result, target)
	local notAdded = true
	for k = 1, #result do
		if result[k] == target then
			notAdded = false
			break
		end
	end
	return notAdded
end

function _common_RemoveAddedFromPool(added, pool)
	local newpool = {}
	for k = 1, #pool do
		if _common_IsAddedFilter(added, pool[k]) then
			table.insert(newpool, pool[k])
		end
	end
	return newpool
end

function _common_AddDelta(result, selected, targets, deltaColumn, deltaLine, transfer)
	local sc = selected.column + deltaColumn
	local sl = selected.line + deltaLine
	
	if transfer == 1 then
		if sc < 0 then
			sc = sc + 3
		elseif sc > 2 then
			sc = sc - 3
		end
		if sl < 0 then
			sl = sl + 2		
		elseif sl > 1 then
			sl = sl - 2
		end
	end
	
	for i = 1, #targets do
		local add = (targets[i].unit == nil)
		if not add then
			if targets[i].unit.impl.small then
				if sc == targets[i].column and sl == targets[i].line then
					add = true
				end
			else
				if sc == targets[i].column then
					add = true
				end
			end
		end
		if add then
			add = _common_IsAddedFilter(result, targets[i])
		end
		if add then
			table.insert(result, targets[i])
		end
	end
	return result
end

function _common_AddRange(result, targets, minColumn, maxColumn, minLine, maxLine)
	for i = 1, #targets do
		local add = (targets[i].unit == nil)
		local c = targets[i].column
		local l = targets[i].line
		if not add then
			if targets[i].unit.impl.small then
				if c >= minColumn and c <= maxColumn and l >= minLine and l <= maxLine then
					add = true
				end
			else
				if c >= minColumn and c <= maxColumn then
					add = true
				end
			end
		end
		if add then
			add = _common_IsAddedFilter(result, targets[i])
		end
		if add then
			table.insert(result, targets[i])	
		end
	end
	return result
end

function _common_PickOneRandom(result, selected, targets, maxDeltaColumn, maxDeltaLine)
    local others = {}
    local add = true
    for i = 1, #targets do
    	add = true
    	if targets[i].unit ~= nil and targets[i].unit.impl.small then
    		if math.abs(targets[i].line - selected.line) > maxDeltaLine then
    			add = false
    		end
    	end
    	if add then
    		if math.abs(targets[i].column - selected.column) > maxDeltaColumn then
    			add = false
    		end
    	end
    	if add then
		add = _common_IsAddedFilter(result, targets[i])
    	end
    	if add then
        	table.insert(others, i)
        	if not targets[i].unit.impl.small and maxDeltaLine > 0 then
            		table.insert(others, i)
	        end
    	end
    end

    if #others > 0 then
        local selectedOther = _mRnd_RndNum(#others)
        local other = targets[others[selectedOther]]
        table.insert(result, other)
    end

    return result
end

function _common_PickNRandomsWithChance(result, selected, targets, maxDeltaColumn, maxDeltaLine, chance)

        -- log('chance to add: ' .. chance)
        -- log('initial added: ' .. #result)        

	local currentChance = chance
	local n = 0
	while( currentChance >= 100 )
	do
		n = n + 1
		currentChance = currentChance - 100
	end
	if currentChance > 0 then
		if _mRnd_simpleRndEvent(currentChance) then
			n = n + 1
		end
	end
	while( n > 0 )
	do
		n = n - 1
		result = _common_PickOneRandom(result, selected, targets, maxDeltaColumn, maxDeltaLine)
	end
	
        -- log('result len: ' .. #result)
        -- log('target len: ' .. #targets)

	return result
end

function _common_GetFrontline(targets)
	local nearestLine = 99
	for i = 1, #targets do
		nearestLine = math.min(nearestLine, targets[i].line)
	end
	return nearestLine
end

function _common_HasCover(targets, target)
	local result = false
	local tcolumn = target.column
	local tline   = target.line
	for i = 1, #targets do
		if targets[i].column == tcolumn then	
			if targets[i].line < tline then
				result = true
				break
			end
		end
	end
	return result
end

function _common_IsOnFrontline(unit, allies)
	local result = true
	if unit.backline then
		local uline = unit.line
		for i = 1, #allies do
			if allies[i].line < uline then
				result = false
				break
			end
		end
	end
	return result
end

function _common_getBattleInitiative(unit, battle)
	local ini = unit.impl.attack1.initiative
	local uid = unit.id
	
	if battle:getUnitStatus(uid, BattleStatus.LowerInitiative)
	or battle:getUnitStatus(uid, BattleStatus.LowerInitiativeLong) then
		ini = math.ceil(LowerInitiative_1_value * ini)
	end
	return ini
end

function _common_getUnitsInBattle(targets, battle)
	local result = {}
	if #targets > 0 then
		local targetGroup, owner, ownerType = _GroupInfo_getUnitGroup(targets[1].unit)
		local slots = targetGroup.slots
		local n = 0
		for i = 1, #slots do
			if _common_IsInBattle(slots[i].unit, battle) then
				n = n + 1
				result[n] = slots[i]
			end
		end
	end
	return result
end

function _common_IsInBattle(unit, battle)
	if unit ~= nil and unit.hp > 0 and not _GroupInfo_UnitHasModifierValue(unit, incorporeality_mod) then
		local uid = unit.id
		if  not battle:getUnitStatus(uid, BattleStatus.Retreated)
		and not battle:getUnitStatus(uid, BattleStatus.Hidden) then
			return true
		end
	end
	return false
end

