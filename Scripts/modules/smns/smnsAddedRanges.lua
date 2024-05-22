
function _smns_AddAttackRangeInfo(meleeToRange, idToAttackScriptName, idToTargetScriptName)
	-- array of numbers {700, 701, 702, 703}
	-- your range
	local addedRange_ID = {700, 701, 702, 703}

	-- array of numbers {701, 701, 702, 702}
	-- corresponding nonmelee range id
	local addedRange_meleeToRange = {701, 701, 702, 702}
	
	-- array of strings {'_attack_Area2x2', '_attack_Area2x2', '_attack_Area2x2', '_attack_Area2x2'}
	-- attack script of your range
	local addedRange_idToAttackScriptName = {'_attack_Area2x2', '_attack_Area2x2', '_attack_SelectedTarget', '_attack_SelectedTarget'}
	
	-- array of strings {'_target_All', '_target_All', '_target_All', '_target_All'}
	-- target script of your range
	local addedRange_idToTargetScriptName = {'_target_Adjacent', '_target_All', '_target_All', '_target_Adjacent'}

	-- don't change this
	if #addedRange_ID > 0 then
		for i = 1, #addedRange_ID do
			meleeToRange[addedRange_ID[i]] = addedRange_meleeToRange[i]
			idToAttackScriptName[addedRange_ID[i]] = addedRange_idToAttackScriptName[i]
			idToTargetScriptName[addedRange_ID[i]] = addedRange_idToTargetScriptName[i]
		end
	end	
	return meleeToRange, idToAttackScriptName, idToTargetScriptName
end
