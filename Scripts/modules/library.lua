
-- Created by Norvezskaya Semga

library = {}
require('selector')
require('common')
require('AttackProtection')
require('smnsInfo')
require('workshop_commonlib')
if workshopEnabled then
	require('workshop_special_mechanics')
end
if smnsEnabled then
	require('smnsRange')
end
targets_filter = targets_filter or require('targets_filter')

enableExternalModifiers = true


function _getTargets(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle, isMarking)
	local result = {}
	
	local RndUseStateBak = _common_get_useRandom()
	if isMarking then
		_common_set_useRandom(false)
	end
	
	if enableExternalModifiers and not targetsAreAllies and #targets > 0 then
		externalModifiers(attacker, targets[1])
	end
	
	targets = _targets_filter_Incorporeal(attacker, item, battle, targets)
	allies = _targets_filter_Incorporeal(attacker, item, battle, allies)
	
	if smnsEnabled then
		targets = _smns_ChangeTargetsInput(currentResult, methodName, attacker, selected, allies, targets, targetsAreAllies, item)
	end
	
	-- применение модификаторов на удар в другую цель, отличную от selected
	
	-- применение модификаторов на удар в цель с "насмешкой", если достаем
	
	-- выбор целей для способности
	result = _selector_getTargets(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	
	result = _targets_filter_AttackWithStatus(methodName, attacker, selected, allies, targets, result, targetsAreAllies, item, battle)

	result = _targets_filter_AddTrargetsChance(methodName, attacker, selected, allies, targets, targetsAreAllies, result, item, battle)
	
	result = _targets_filter_BuffsAttraction(methodName, attacker, selected, allies, targets, targetsAreAllies, result, item, battle)
	
	result = _targets_filter_AttackType(methodName, attacker, selected, allies, result, targetsAreAllies, item, battle)

	if smnsEnabled then
		result = _smns_ChangeTargets(result, methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle, isMarking)
	end
	
	if not targetsAreAllies then
		-- применение модификаторов на изменение количества целей
		if not isMarking then
			result = _AttackProtection_ChangeTargets(attacker, targets, result, battle)
		end
	
		-- применение модификаторов на уворот
	end
	
	_common_set_useRandom(RndUseStateBak)
		
	return result
end

function _getChoices(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle, isMarking)
	local result = {}
	
	if enableExternalModifiers and not targetsAreAllies and #targets > 0 then
		externalModifiers(attacker, targets[1])
	end
	
	targets = _targets_filter_Incorporeal(attacker, item, battle, targets)
	allies = _targets_filter_Incorporeal(attacker, item, battle, allies)
	
	targets = _targets_filter_Cowardice(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	
	targets = _targets_filter_DoTIsMainAttack_I(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
		
	-- логика исключения из targets того, кто и так получит баф
	
	-- выбор возможных целей
	result = _selector_getChoices(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	
	result = _targets_filter_AttackType(methodName, attacker, selected, allies, result, targetsAreAllies, item, battle)
	
	if smnsEnabled then
		result = _smns_ChangeSelect(result, methodName, attacker, selected, allies, targets, targetsAreAllies, item)
	end
	
	result = _targets_filter_DoTIsMainAttack_II(methodName, attacker, selected, allies, result, targetsAreAllies, item, battle)
	
	if workshopEnabled then
		result = Workshop_Mechanics_damageUnitsRangeRestriction(scenario, methodName, attacker, selected, allies, result, targetsAreAllies, item, battle, isMarking)
		result = Workshop_Mechanics_neutralsSelectTargetsRandomly(scenario, methodName, attacker, selected, allies, result, targetsAreAllies, item, battle, isMarking)
	end
	
	-- корректируем цели в случае ИИ
	enableExternalModifiers = false
	result = _targets_filter_AI_Helper(result, methodName, attacker, allies, targets, targetsAreAllies, item, battle, isMarking)
	enableExternalModifiers = true
	
	return result
end

library.name = 'library'
return library
