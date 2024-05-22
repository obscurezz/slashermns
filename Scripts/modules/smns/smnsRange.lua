package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua"
require('smnsInfo')
require('RangeInfo')
require('GroupInfo')
require('mRnd')
require('common')
require('statscheck')
require('game_constants')

-- changes targets list
-- currentResult - who already selected as target
-- methodName - what damage range is used
-- attacker, selected, allies, targets, targetsAreAllies - see mss32 manual
function _smns_ChangeTargets(currentResult, methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle, isMarking)
	local AUnit = attacker.unit
	local nRandomTarg = 0
	_get_Group_and_Mods(AUnit)
	local mods = _GroupInfo_UnitModifiers(AUnit)
-- Ритуал огня
	local AchiDevilMod = Id.new('g070um0030').value 
	local ModeusMod = Id.new('g070um0027').value
	if _GroupInfo_stackHasModifierAmount(AchiDevilMod) > 0  
	and
	_GroupInfo_UnitModifierAmount(mods, ModeusMod) > 0 then
	
		local group = _GroupInfo_getCurrentGroup()
		local units = group.units
		local u
		for i = 1, #units do
			u = units[i]
			if u.hp > 0 then
				local modUnits = _GroupInfo_UnitModifiers(u)
				if _GroupInfo_UnitModifierAmount(modUnits, AchiDevilMod) > 0 then
					nRandomTarg = nRandomTarg + math.floor((u.impl.level - u.baseImpl.level) / 2)
				end
			end
		end		
	end
-- Ритуал огня end

--Руна тайного знания
	local scientistMod = Id.new('g070um0054').value 
	local runeMod = Id.new('g070um0051').value
	if _GroupInfo_stackHasModifierAmount(scientistMod) > 0  
	and
	_GroupInfo_UnitModifierAmount(mods, runeMod) > 0 then
	
		local group = _GroupInfo_getCurrentGroup()
		local units = group.units
		local u
		for i = 1, #units do
			u = units[i]
			if u.hp > 0 then
				local modUnits = _GroupInfo_UnitModifiers(u)
				if _GroupInfo_UnitModifierAmount(modUnits, scientistMod) > 0 then
					nRandomTarg = nRandomTarg + 1
				end
			end
		end		
	end
--Руна тайного знания END

-- Рикошет
	if _GroupInfo_UnitModifierAmount(mods, Id.new('g070um0033').value) > 0 then
		nRandomTarg = nRandomTarg + (AUnit.impl.level - AUnit.baseImpl.level)
	end
-- Рикошет end

-- Чароитовое преломление
	if _GroupInfo_UnitModifierAmount(mods, Id.new('g070um0073').value) > 0 then
		nRandomTarg = nRandomTarg + (AUnit.impl.level - AUnit.baseImpl.level)
	end
-- Чароитовое преломление END

-- Скрытая сила
	if _GroupInfo_UnitModifierAmount(mods, Id.new('g070um0067').value) > 0 then
		nRandomTarg = nRandomTarg + math.floor((AUnit.impl.level - AUnit.baseImpl.level) / 2)
	end
-- Скрытая сила END



	if nRandomTarg > 0 
		and 
		_common_get_useRandom() then
			currentResult = _common_PickNRandomsWithChance(currentResult, selected, targets, 100, 100, 100 * nRandomTarg)
	end
	return currentResult 
end

-- changes list of what player can select as primary target
-- currentResult - who already selected
-- methodName - what damage range is used
-- attacker, selected, allies, targets, targetsAreAllies - see mss32 manual
function _smns_ChangeSelect(currentResult, methodName, attacker, selected, allies, targets, targetsAreAllies, item)
	return currentResult
end

function _smns_AI_Helper(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle, isMarking)
    return targets
end

function _smns_ChangeTargetsInput(currentResult, methodName, attacker, selected, allies, targets, targetsAreAllies, item)
    local newTargets = targets
    return newTargets
end