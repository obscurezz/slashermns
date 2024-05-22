package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('smnsInfo')
if smnsEnabled then
	require('smnsAddedRanges')
end

local _rangeInfo_meleeToRange = {}
_rangeInfo_meleeToRange[101] = 101
_rangeInfo_meleeToRange[102] = 102
_rangeInfo_meleeToRange[103] = 102
_rangeInfo_meleeToRange[4]   = 22
_rangeInfo_meleeToRange[5]   = 23
_rangeInfo_meleeToRange[6]   = 51
_rangeInfo_meleeToRange[7]   = 10
_rangeInfo_meleeToRange[8]   = 9
_rangeInfo_meleeToRange[9]   = 9
_rangeInfo_meleeToRange[10]  = 10
_rangeInfo_meleeToRange[11]  = 11
_rangeInfo_meleeToRange[12]  = 12
_rangeInfo_meleeToRange[13]  = 13
_rangeInfo_meleeToRange[14]  = 12
_rangeInfo_meleeToRange[15]  = 15
_rangeInfo_meleeToRange[16]  = 17
_rangeInfo_meleeToRange[17]  = 17
_rangeInfo_meleeToRange[18]  = 19
_rangeInfo_meleeToRange[19]  = 19
_rangeInfo_meleeToRange[20]  = 21
_rangeInfo_meleeToRange[21]  = 21
_rangeInfo_meleeToRange[22]  = 22
_rangeInfo_meleeToRange[23]  = 23
_rangeInfo_meleeToRange[24]  = 52
_rangeInfo_meleeToRange[25]  = 25
_rangeInfo_meleeToRange[26]  = 102
_rangeInfo_meleeToRange[27]  = 102
_rangeInfo_meleeToRange[28]  = 102
_rangeInfo_meleeToRange[29]  = 30
_rangeInfo_meleeToRange[30]  = 30
_rangeInfo_meleeToRange[31]  = 31
_rangeInfo_meleeToRange[32]  = 32
_rangeInfo_meleeToRange[33]  = 53
_rangeInfo_meleeToRange[34]  = 34
_rangeInfo_meleeToRange[35]  = 35
_rangeInfo_meleeToRange[37]  = 13
_rangeInfo_meleeToRange[38]  = 39
_rangeInfo_meleeToRange[39]  = 39
_rangeInfo_meleeToRange[40]  = 41
_rangeInfo_meleeToRange[41]  = 41
_rangeInfo_meleeToRange[42]  = 43
_rangeInfo_meleeToRange[43]  = 43
_rangeInfo_meleeToRange[44]  = 45
_rangeInfo_meleeToRange[45]  = 45
_rangeInfo_meleeToRange[46]  = 47
_rangeInfo_meleeToRange[47]  = 47
_rangeInfo_meleeToRange[48]  = 31
_rangeInfo_meleeToRange[49]  = 32
_rangeInfo_meleeToRange[50]  = 102
_rangeInfo_meleeToRange[51]  = 51
_rangeInfo_meleeToRange[52]  = 52
_rangeInfo_meleeToRange[53]  = 53
_rangeInfo_meleeToRange[55]  = 101
_rangeInfo_meleeToRange[56]  = 57
_rangeInfo_meleeToRange[57]  = 57
_rangeInfo_meleeToRange[58]  = 58

function _RangeInfo_changeToRanged(RangeID)
	local result = _rangeInfo_meleeToRange[RangeID]
	if result == nil then
		error("Unexpected RangeID (change) "..RangeID)
	end
	return result
end


function _RangeInfo_isTargetScriptRanged(targetScript)
	if targetScript == "_target_All" then
		return true
	elseif targetScript == "_target_Adjacent" then
		return false
	elseif targetScript == "_target_SemgaAdjacentAndUncovered" then
		return false
	elseif targetScript == "_target_SemgaAdjacentFromAnyRow" then
		return false
	elseif targetScript == "_target_SemgaAllIfFrontline" then
		return false
	elseif targetScript == "_target_SemgaAllNearestUncovered" then
		return false
	elseif targetScript == "_target_SemgaAllUncovered" then
		return true
	elseif targetScript == "_target_SemgaCatAgility" then
		return false
	elseif targetScript == "_target_SemgaNearestLineOrAll" then
		return false
	elseif targetScript == "_target_Nobody" then
		return false
	else
		error("Unexpected target script "..targetScript)
		return false
	end
end


local _rangeInfo_idToAttackScriptName = {}
_rangeInfo_idToAttackScriptName[101] = "_attack_All"
_rangeInfo_idToAttackScriptName[102] = "_attack_SelectedTarget"
_rangeInfo_idToAttackScriptName[103] = "_attack_SelectedTarget"
_rangeInfo_idToAttackScriptName[4]   = "_attack_AllAdjacent"
_rangeInfo_idToAttackScriptName[5]   = "_attack_SelectedTargetAndAllAdjacentToIt"
_rangeInfo_idToAttackScriptName[6]   = "_attack_SelectedTargetAndOneRandomAdjacentToIt"
_rangeInfo_idToAttackScriptName[7]   = "_attack_Line"
_rangeInfo_idToAttackScriptName[8]   = "_attack_SelectedTargetAndOneBehindIt"
_rangeInfo_idToAttackScriptName[9]   = "_attack_SelectedTargetAndOneBehindIt"
_rangeInfo_idToAttackScriptName[10]  = "_attack_Line"
_rangeInfo_idToAttackScriptName[11]  = "_attack_Column"
_rangeInfo_idToAttackScriptName[12]  = "_attack_Area2x2"
_rangeInfo_idToAttackScriptName[13]  = "_attack_SelectedTargetAndTwoChainedRandom"
_rangeInfo_idToAttackScriptName[14]  = "_attack_Area2x2melee"
_rangeInfo_idToAttackScriptName[15]  = "_attack_SelectedTargetAndOneRandom"
_rangeInfo_idToAttackScriptName[16]  = "_attack_SemgaCheckers"
_rangeInfo_idToAttackScriptName[17]  = "_attack_SemgaCheckers"
_rangeInfo_idToAttackScriptName[18]  = "_attack_SemgaCross"
_rangeInfo_idToAttackScriptName[19]  = "_attack_SemgaCross"
_rangeInfo_idToAttackScriptName[20]  = "_attack_SemgaFuryMelee"
_rangeInfo_idToAttackScriptName[21]  = "_attack_SemgaFuryRange"
_rangeInfo_idToAttackScriptName[22]  = "_attack_AllAdjacent"
_rangeInfo_idToAttackScriptName[23]  = "_attack_SelectedTargetAndAllAdjacentToIt"
_rangeInfo_idToAttackScriptName[24]  = "_attack_SemgaTargetAndTwoRandomBackline"
_rangeInfo_idToAttackScriptName[25]  = "_attack_SemgaTwoAnyColumns"
_rangeInfo_idToAttackScriptName[26]  = "_attack_SelectedTarget"
_rangeInfo_idToAttackScriptName[27]  = "_attack_SelectedTarget"
_rangeInfo_idToAttackScriptName[28]  = "_attack_SelectedTarget"
_rangeInfo_idToAttackScriptName[29]  = "_attack_SemgaPierceHit"
_rangeInfo_idToAttackScriptName[30]  = "_attack_SemgaPierceHit"
_rangeInfo_idToAttackScriptName[31]  = "_attack_SemgaAllUncovered"
_rangeInfo_idToAttackScriptName[32]  = "_attack_SemgaAllUncoveredPierce"
_rangeInfo_idToAttackScriptName[33]  = "_attack_SemgaNearestLineOrAll"
_rangeInfo_idToAttackScriptName[34]  = "_attack_SemgaTwoAnyInLine"
_rangeInfo_idToAttackScriptName[35]  = "_attack_SemgaPointBlank"
_rangeInfo_idToAttackScriptName[37]  = "_attack_SelectedTargetAndTwoChainedRandom"
_rangeInfo_idToAttackScriptName[38]  = "_attack_SemgaLineAndRandomPerLostHPx1"
_rangeInfo_idToAttackScriptName[39]  = "_attack_SemgaLineAndRandomPerLostHPx1"
_rangeInfo_idToAttackScriptName[40]  = "_attack_SemgaLineAndRandomPerLostHPx3"
_rangeInfo_idToAttackScriptName[41]  = "_attack_SemgaLineAndRandomPerLostHPx3"
_rangeInfo_idToAttackScriptName[42]  = "_attack_SemgaSinglePlusOnePerTwoLevels"
_rangeInfo_idToAttackScriptName[43]  = "_attack_SemgaSinglePlusOnePerTwoLevels"
_rangeInfo_idToAttackScriptName[44]  = "_attack_SemgaSinglePlusOnePerThreeLevels"
_rangeInfo_idToAttackScriptName[45]  = "_attack_SemgaSinglePlusOnePerThreeLevels"
_rangeInfo_idToAttackScriptName[46]  = "_attack_SemgaSinglePlusChancePerIni"
_rangeInfo_idToAttackScriptName[47]  = "_attack_SemgaSinglePlusChancePerIni"
_rangeInfo_idToAttackScriptName[48]  = "_attack_SemgaAllNearestUncovered"
_rangeInfo_idToAttackScriptName[49]  = "_attack_SemgaAllNearestUncoveredPierce"
_rangeInfo_idToAttackScriptName[50]  = "_attack_SelectedTarget"
_rangeInfo_idToAttackScriptName[51]  = "_attack_SelectedTargetAndOneRandomAdjacentToIt"
_rangeInfo_idToAttackScriptName[52]  = "_attack_SemgaTargetAndTwoRandomBackline"
_rangeInfo_idToAttackScriptName[53]  = "_attack_SemgaNearestLineOrAll"
_rangeInfo_idToAttackScriptName[55]  = "_attack_All"
_rangeInfo_idToAttackScriptName[56]  = "_attack_SemgaSinglePlusOnePerOneLevel"
_rangeInfo_idToAttackScriptName[57]  = "_attack_SemgaSinglePlusOnePerOneLevel"
_rangeInfo_idToAttackScriptName[58]  = "_attack_SelectedTarget"

function _RangeInfo_getAttackScriptName(RangeID)
	local result = _rangeInfo_idToAttackScriptName[RangeID]
	if result == nil then
		error("Unexpected RangeID (attacks) "..RangeID)
	end
	return result
end


local _rangeInfo_idToTargetScriptName = {}
_rangeInfo_idToTargetScriptName[101] = "_target_All"
_rangeInfo_idToTargetScriptName[102] = "_target_All"
_rangeInfo_idToTargetScriptName[103] = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[4]   = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[5]   = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[6]   = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[7]   = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[8]   = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[9]   = "_target_All"
_rangeInfo_idToTargetScriptName[10]  = "_target_All"
_rangeInfo_idToTargetScriptName[11]  = "_target_All"
_rangeInfo_idToTargetScriptName[12]  = "_target_All"
_rangeInfo_idToTargetScriptName[13]  = "_target_All"
_rangeInfo_idToTargetScriptName[14]  = "_target_SemgaAllIfFrontline"
_rangeInfo_idToTargetScriptName[15]  = "_target_All"
_rangeInfo_idToTargetScriptName[16]  = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[17]  = "_target_All"
_rangeInfo_idToTargetScriptName[18]  = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[19]  = "_target_All"
_rangeInfo_idToTargetScriptName[20]  = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[21]  = "_target_All"
_rangeInfo_idToTargetScriptName[22]  = "_target_SemgaAdjacentInAnyLineFromAnyRow"
_rangeInfo_idToTargetScriptName[23]  = "_target_All"
_rangeInfo_idToTargetScriptName[24]  = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[25]  = "_target_All"
_rangeInfo_idToTargetScriptName[26]  = "_target_SemgaNearestLineOrAll"
_rangeInfo_idToTargetScriptName[27]  = "_target_SemgaAdjacentAndUncovered"
_rangeInfo_idToTargetScriptName[28]  = "_target_SemgaCatAgility"
_rangeInfo_idToTargetScriptName[29]  = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[30]  = "_target_All"
_rangeInfo_idToTargetScriptName[31]  = "_target_SemgaAllUncovered"
_rangeInfo_idToTargetScriptName[32]  = "_target_SemgaAllUncovered"
_rangeInfo_idToTargetScriptName[33]  = "_target_SemgaNearestLineOrAll"
_rangeInfo_idToTargetScriptName[34]  = "_target_All"
_rangeInfo_idToTargetScriptName[35]  = "_target_All"
_rangeInfo_idToTargetScriptName[37]  = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[38]  = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[39]  = "_target_All"
_rangeInfo_idToTargetScriptName[40]  = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[41]  = "_target_All"
_rangeInfo_idToTargetScriptName[42]  = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[43]  = "_target_All"
_rangeInfo_idToTargetScriptName[44]  = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[45]  = "_target_All"
_rangeInfo_idToTargetScriptName[46]  = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[47]  = "_target_All"
_rangeInfo_idToTargetScriptName[48]  = "_target_SemgaAllNearestUncovered"
_rangeInfo_idToTargetScriptName[49]  = "_target_SemgaAllNearestUncovered"
_rangeInfo_idToTargetScriptName[50]  = "_target_SemgaAdjacentFromAnyRow"
_rangeInfo_idToTargetScriptName[51]  = "_target_All"
_rangeInfo_idToTargetScriptName[52]  = "_target_All"
_rangeInfo_idToTargetScriptName[53]  = "_target_All"
_rangeInfo_idToTargetScriptName[55]  = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[56]  = "_target_Adjacent"
_rangeInfo_idToTargetScriptName[57]  = "_target_All"
_rangeInfo_idToTargetScriptName[58]  = "_target_Nobody"

function _RangeInfo_getTargetScriptName(RangeID)
	local result = _rangeInfo_idToTargetScriptName[RangeID]
	if result == nil then
		error("Unexpected RangeID (targets) "..RangeID)
	end
	return result
end

if smnsEnabled then
	_rangeInfo_meleeToRange, _rangeInfo_idToAttackScriptName, _rangeInfo_idToTargetScriptName = _smns_AddAttackRangeInfo(_rangeInfo_meleeToRange, _rangeInfo_idToAttackScriptName, _rangeInfo_idToTargetScriptName)
end
