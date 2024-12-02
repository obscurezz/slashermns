
-- Created by Norvezskaya Semga

require('attacks')
require('targets')

function _selector_getTargets(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {}
	if methodName == "_attack_All" then
		result = _attack_All(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif methodName == "_attack_AllAdjacent" then
		result = _attack_AllAdjacent(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif methodName == "_attack_Area2x2" then
		result = _attack_Area2x2(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif methodName == "_attack_Area2x2melee" then
		result = _attack_Area2x2melee(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_Column" then
		result = _attack_Column(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_Line" then
		result = _attack_Line(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SelectedTarget" then
		result = _attack_SelectedTarget(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SelectedTargetAndAllAdjacentToIt" then
		result = _attack_SelectedTargetAndAllAdjacentToIt(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SelectedTargetAndOneBehindIt" then
		result = _attack_SelectedTargetAndOneBehindIt(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SelectedTargetAndOneRandom" then
		result = _attack_SelectedTargetAndOneRandom(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SelectedTargetAndOneRandomAdjacentToIt" then
		result = _attack_SelectedTargetAndOneRandomAdjacentToIt(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SelectedTargetAndTwoChainedRandom" then
		result = _attack_SelectedTargetAndTwoChainedRandom(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SemgaAllNearestUncovered" then
		result = _attack_SemgaAllNearestUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle, 0)
	elseif  methodName == "_attack_SemgaAllNearestUncoveredPierce" then
		result = _attack_SemgaAllNearestUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle, 50)
	elseif  methodName == "_attack_SemgaAllUncovered" then
		result = _attack_SemgaAllUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle, 0)
	elseif  methodName == "_attack_SemgaAllUncoveredPierce" then
		result = _attack_SemgaAllUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle, 50)
	elseif  methodName == "_attack_SemgaCheckers" then
		result = _attack_SemgaCheckers(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SemgaCross" then
		result = _attack_SemgaCross(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SemgaFuryMelee" then
		result = _attack_SemgaFuryMelee(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SemgaFuryRange" then
		result = _attack_SemgaFuryRange(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SemgaLineAndRandomPerLostHPx1" then
		result = _attack_SemgaLineAndRandomPerLostHPxMultiplier(attacker, selected, allies, targets, targetsAreAllies, item, battle, 1)
	elseif  methodName == "_attack_SemgaLineAndRandomPerLostHPx3" then
		result = _attack_SemgaLineAndRandomPerLostHPxMultiplier(attacker, selected, allies, targets, targetsAreAllies, item, battle, 3)
	elseif  methodName == "_attack_SemgaNearestLineOrAll" then
		result = _attack_SemgaNearestLineOrAll(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SemgaPierceHit" then
		result = _attack_SemgaPierceHit(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SemgaPointBlank" then
		result = _attack_SemgaPointBlank(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SemgaSacrifice" then
	elseif  methodName == "_attack_SemgaSinglePlusChancePerIni" then
		result = _attack_SemgaSinglePlusChancePerIni(attacker, selected, allies, targets, targetsAreAllies, item, battle, 1)
	elseif  methodName == "_attack_SemgaSinglePlusOnePerThreeLevels" then
		result = _attack_SemgaSinglePlusNPerLevel(attacker, selected, allies, targets, targetsAreAllies, item, battle, 3)
	elseif  methodName == "_attack_SemgaSinglePlusOnePerTwoLevels" then
		result = _attack_SemgaSinglePlusNPerLevel(attacker, selected, allies, targets, targetsAreAllies, item, battle, 2)
	elseif  methodName == "_attack_SemgaSinglePlusOnePerOneLevel" then
		result = _attack_SemgaSinglePlusNPerLevel(attacker, selected, allies, targets, targetsAreAllies, item, battle, 1)
	elseif  methodName == "_attack_SemgaSmallEnth" then
		result = _attack_SemgaSmallEnth(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SemgaTargetAndTwoRandomBackline" then
		result = _attack_SemgaTargetAndTwoRandomBackline(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SemgaTwoAnyColumns" then
		result = _attack_SemgaTwoAnyColumns(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_SemgaTwoAnyInLine" then
		result = _attack_SemgaTwoAnyInLine(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_attack_smnsAdjacentPlusRandomPlusOnePerTwoLevels" then
		result = _attack_smnsAdjacentPlusRandomPlusOnePerTwoLevels(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	end
	return result
end

function _selector_getChoices(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local result = {}
	if  methodName == "_target_Adjacent" then
		result = _target_Adjacent(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_target_All" then
		result = _target_All(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_target_SemgaAdjacentAndUncovered" then
		result = _target_SemgaAdjacentAndUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_target_SemgaAdjacentInAnyLineFromAnyRow" then
		result = _target_SemgaAdjacentInAnyLineFromAnyRow(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_target_SemgaAdjacentFromAnyRow" then
		result = _target_SemgaAdjacentFromAnyRow(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_target_SemgaAllIfFrontline" then
		result = _target_SemgaAllIfFrontline(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_target_SemgaAllNearestUncovered" then
		result = _target_SemgaAllNearestUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_target_SemgaAllUncovered" then
		result = _target_SemgaAllUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_target_SemgaCatAgility" then
		result = _target_SemgaCatAgility(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_target_SemgaNearestLineOrAll" then
		result = _target_SemgaNearestLineOrAll(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_target_SemgaSemiarcher" then
		result = _target_SemgaSemiarcher(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_target_SemgaSmallEnth" then
		result = _target_SemgaSmallEnth(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif  methodName == "_target_Nobody" then
		result = _target_Nobody(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif methodName == "_target_AllSummoned" then
		result = _target_AllSummoned(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif methodName == "_target_AdjacentAndWerewolf" then
		result = _target_AdjacentAndWerewolf(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif methodName == "_target_AnyWolf" then
		result = _target_AnyWolf(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif methodName == "_target_AnyNecroUnit" then
		result = _target_AnyNecroUnit(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif methodName == "_target_PhoenixSwordAdjacent" then
		result = _target_PhoenixSwordAdjacent(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif methodName == "_target_PhoenixSwordAdjacentAndUncovered" then
		result = _target_PhoenixSwordAdjacentAndUncovered(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	elseif methodName == "_target_SphereControl" then
		result = _target_SphereControl(attacker, selected, allies, targets, targetsAreAllies, item, battle)
	end
	return result
end
