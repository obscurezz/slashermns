package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

-- myModValue = Id.new('g070um0269').value
-- function canApplyToUnit(unitImpl)
-- 	_GroupInfo_SetScenario(getScenario())
-- 	return _GroupInfo_CanTakeEssence(unitImpl, myModValue)
-- end

function canApplyToUnit(unitImpl)
	_GroupInfo_SetScenario(getScenario())

	local HAS_MOD = unitImpl:hasModifier(Id.new('g070um0267')) or unitImpl:hasModifier(Id.new('g070um0268')) or unitImpl:hasModifier(Id.new('g070um0270')) or unitImpl:hasModifier(Id.new('g070um0271'))
	if HAS_MOD then
		return false
	end
	return true
end

function _getPlayerBank(unit)
	local player = _GroupInfo_getUnitPlayer(unit)
	if player ~= nil and player.race ~= Race.Neutral then
		return player.bank
	end
end

function getAttackSource(unit, prev)
	if unit.impl.attack1.source ~= Source.Death then
		return Source.Death
	end

	return prev
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.Poison then
		return svAttackImmunityClass(unit, attack, prev, Immune.Always)
	end
	
	return prev
end

function getImmuneToSource(unit, source, prev)
	if source == Source.Death and prev ~= Immune.Always then
		return svSourceImmunityClass(unit, source, prev, Immune.Once)
	end

	return prev
end

function getAttackDrain(unit, damage, prev)
	local mana_criteria = math.min(1000, _getPlayerBank(unit).deathMana)
	return svAddDrain1(unit, prev, damage, 0.02 * 0.01 * mana_criteria)
end

function getAttack2Drain(unit, damage, prev)
	local mana_criteria = math.min(1000, _getPlayerBank(unit).deathMana)
	return svAddDrain2(unit, prev, damage, 0.02 * 0.01 * mana_criteria)
end