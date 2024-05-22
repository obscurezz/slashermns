package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"

require('smnsInfo')
require('statscheck')
require('settings')

valueCap_MaxDamage     = settings["unitMaxDamage"]
valueCap_MaxHealMulti  = 0.01 * smnsInfo_HealCap_Percent
valueCap_MaxAccuracy   = 100
valueCap_MaxArmor      = settings["unitMaxArmor"]
valueCap_MaxScout      = settings["stackMaxScoutRange"]
valueCap_MaxDrain      = 100000
valueCap_MaxMovement   = 100
valueCap_MaxInitiative = 150
valueCap_MaxHitPoint   = 100000
valueCap_MaxXpNext     = 100000
valueCap_MaxXpKilled   = 100000
valueCap_DefaultDrainValue = 0.01 * settings["drainAttackHeal"]
valueCap_DefaultDrainOverflowValue = 0.01 * settings["drainOverflowHeal"]
valueCap_MaxCrit       = 250
valueCap_MaxAdditionalCrit = valueCap_MaxCrit - smnsInfoCriticalHit_DamageCap_Percent

valueCap_UnitsWithIncreasedDamageCap = {}
valueCap_UnitsWithIncreasedDamageCap[Id.new('g000uu0019').value] = 1
valueCap_UnitsWithIncreasedDamageCap[Id.new('g000uu0044').value] = 1
valueCap_UnitsWithIncreasedDamageCap[Id.new('g000uu0070').value] = 1
valueCap_UnitsWithIncreasedDamageCap[Id.new('g000uu0096').value] = 1
valueCap_UnitsWithIncreasedDamageCap[Id.new('g000uu8009').value] = 1

function _valueCap_GetMaxCrit()
	return valueCap_MaxCrit
end
function _valueCap_GetMaxAdditionalCrit()
	return valueCap_MaxAdditionalCrit
end

function _valueCap_unitLevel(lvl)
	return math.min(76, lvl)
end

function _valueCap_Check(value, minValue, maxValue)
	local floatPart
	local intPart
	if value >= maxValue then
		intPart = maxValue
		floatPart = value - maxValue
	elseif value <= minValue then
		intPart = minValue
		floatPart = value - minValue
	else
		intPart = math.floor(value)
		floatPart = value - intPart
		if 1 - floatPart < 0.001 then
			intPart = intPart + 1
			floatPart = floatPart - 1
		end
	end
	return intPart, floatPart
end
function _valueCap_GetInt(value)
	local intPart = math.floor(value)
	local floatPart = value - intPart
	if 1 - floatPart < 0.001 then
		intPart = intPart + 1
		floatPart = floatPart - 1
	end
	return intPart
end

local vcAttack1Damage_Min = {}
local vcAttack2Damage_Min = {}
local vcAttackDamage_Max = {}
function _valueCap_Set_Attack1Damage_Cap(unit, baseDamage)
	vcAttack1Damage_Min[unit.id.value] = math.floor(smnsInfoDebuffed_Damage_LowerBound_Percent * baseDamage)
	return 0
end
function _valueCap_Set_Attack2Damage_Cap(unit, baseDamage)
	vcAttack2Damage_Min[unit.id.value] = math.floor(smnsInfoDebuffed_Damage_LowerBound_Percent * baseDamage)
	return 0
end
function _valueCap_CheckMaxDamage(unit, value)
	if value == nil then
		return value
	end
	return math.min( value, vcAttackDamage_Max[unit.id.value] )
end
function _valueCap_Attack1Damage(unit, value)
	local id = unit.id.value
	return _valueCap_Check(value, 
			       vcAttack1Damage_Min[id],
			       vcAttackDamage_Max[id])
end
function _valueCap_Attack2Damage(unit, value)
	local id = unit.id.value
	return _valueCap_Check(value, 
			       vcAttack2Damage_Min[id],
			       vcAttackDamage_Max[id])
end

local vcAttack1Heal_Min = {}
local vcAttack2Heal_Min = {}
local vcAttackHeal_Max = {}
function _valueCap_Set_Attack1Heal_Cap(unit, baseHeal)
	vcAttack1Heal_Min[unit.id.value] = math.floor(smnsInfoDebuffed_Heal_LowerBound_Percent * baseHeal)
	return 0
end
function _valueCap_Set_Attack2Heal_Cap(unit, baseHeal)
	vcAttack2Heal_Min[unit.id.value] = math.floor(smnsInfoDebuffed_Heal_LowerBound_Percent * baseHeal)
	return 0
end
function _valueCap_CheckMaxHeal(unit, value)
	if value == nil then
		return value
	end
	return math.min( value, vcAttackHeal_Max[unit.id.value] )
end
function _valueCap_Attack1Heal(unit, value)
	local id = unit.id.value
	return _valueCap_Check(value, 
			       vcAttack1Heal_Min[id],
			       vcAttackHeal_Max[id])
end
function _valueCap_Attack2Heal(unit, value)
	local id = unit.id.value
	return _valueCap_Check(value, 
			       vcAttack2Heal_Min[id],
			       vcAttackHeal_Max[id])
end

function _valueCap_SetUnitAttackDamageHealMax(unit)
	local idValue = unit.id.value
	if valueCap_UnitsWithIncreasedDamageCap[unit.baseImpl.id.value] == nil then
		vcAttackDamage_Max[idValue] = valueCap_MaxDamage
		vcAttackHeal_Max[idValue] = valueCap_MaxHealMulti * valueCap_MaxDamage
	else
		vcAttackDamage_Max[idValue] = valueCap_MaxDamage + 100
		vcAttackHeal_Max[idValue] = valueCap_MaxHealMulti * (valueCap_MaxDamage + 100)
	end
	return 0
end

local vcAttack1Accuracy_Min = {}
local vcAttack2Accuracy_Min = {}
function _valueCap_Set_Attack1Accuracy_Cap(unit, baseAccuracy)
	vcAttack1Accuracy_Min[unit.id.value] = math.floor(smnsInfoDebuffed_Accuracy_LowerBound_Percent * baseAccuracy)
	return 0
end
function _valueCap_Set_Attack2Accuracy_Cap(unit, baseAccuracy)
	vcAttack2Accuracy_Min[unit.id.value] = math.floor(smnsInfoDebuffed_Accuracy_LowerBound_Percent * baseAccuracy)
	return 0
end
function _valueCap_CheckMaxAccuracy(unit, value)
	if value == nil then
		return value
	end
	return math.min( value, valueCap_MaxAccuracy )
end
function _valueCap_Attack1Accuracy(unit, value)
	return _valueCap_Check(value, 
			       vcAttack1Accuracy_Min[unit.id.value],
			       valueCap_MaxAccuracy)
end
function _valueCap_Attack2Accuracy(unit, value)
	return _valueCap_Check(value, 
			       vcAttack2Accuracy_Min[unit.id.value],
			       valueCap_MaxAccuracy)
end

local vcAttackCriticalHitDamage_Percent_Bonus = {}
function _valueCap_Set_AttackCriticalHitDamage_Percent_Bonus(unit, value)
	vcAttackCriticalHitDamage_Percent_Bonus[unit.id.value] = value
	return 0
end
function _valueCap_attackCriticalHitDamage_Percent(unit, value)
	if value ~= nil then
		local id = unit.id.value
		local cap = smnsInfoCriticalHit_DamageCap_Percent
		if vcAttackCriticalHitDamage_Percent_Bonus[id] ~= nil then
			cap = cap + vcAttackCriticalHitDamage_Percent_Bonus[id]
		end
		return math.max(0, math.min(cap, value)), value
	else
		return value, value
	end
end

local vcAttack1Drain_Min = {}
local vcAttack2Drain_Min = {}
function _valueCap_Set_Attack1Drain_Cap(unit, damage)
	local minVal
	local attack = unit.impl.attack1
	if statsCheck_isDrainAttack(attack) then
		minVal = valueCap_DefaultDrainValue
	elseif statsCheck_isDrainOverflowAttack(attack) then
		minVal = valueCap_DefaultDrainOverflowValue
	else
		minVal = 0
	end
	vcAttack1Drain_Min[unit.id.value] = -math.floor(minVal * damage)
	return 0
end
function _valueCap_Set_Attack2Drain_Cap(unit, damage)
	local minVal
	local attack = unit.impl.attack2
	if statsCheck_isDrainAttack(attack) then
		minVal = valueCap_DefaultDrainValue		
	elseif statsCheck_isDrainOverflowAttack(attack) then
		minVal = valueCap_DefaultDrainOverflowValue
	else
		minVal = 0
	end
	vcAttack2Drain_Min[unit.id.value] = -math.floor(minVal * damage)
	return 0
end
function _valueCap_Attack1Drain(unit, value)
	return _valueCap_Check(value, 
			       vcAttack1Drain_Min[unit.id.value],
			       valueCap_MaxDrain)
end
function _valueCap_Attack2Drain(unit, value)
	return _valueCap_Check(value, 
			       vcAttack2Drain_Min[unit.id.value],
			       valueCap_MaxDrain)
end

function _valueCap_CheckMaxXpKilled(unit, value)
	if value == nil then
		return value
	end
	return math.min( value, valueCap_MaxXpKilled )
end
function _valueCap_XpKilled(unit, value)
	return _valueCap_Check(value, 
			       0,
			       valueCap_MaxXpKilled)
end

function _valueCap_CheckMaxXpNext(unit, value)
	if value == nil then
		return value
	end
	return math.min( value, valueCap_MaxXpNext )
end
function _valueCap_XpNext(unit, value)
	return _valueCap_Check(value, 
			       1,
			       valueCap_MaxXpNext)
end

function _valueCap_CheckMaxHitPoint(unit, value)
	if value == nil then
		return value
	end
	return math.min( value, valueCap_MaxHitPoint )
end
function _valueCap_HitPoint(unit, value)
	return _valueCap_Check(value, 
			       1,
			       valueCap_MaxHitPoint)
end

function _valueCap_CheckMaxInitiative(unit, value)
	if value == nil then
		return value
	end
	return math.min( value, valueCap_MaxInitiative )
end
function _valueCap_Initiative(unit, value)
	return _valueCap_Check(value, 
			       1,
			       valueCap_MaxInitiative)
end

function _valueCap_CheckMaxMovement(unit, value)
	if value == nil then
		return value
	end
	return math.min( value, valueCap_MaxMovement )
end
function _valueCap_Movement(unit, value)
	return _valueCap_Check(value, 
			       0,
			       valueCap_MaxMovement)
end

function _valueCap_CheckMaxScout(unit, value)
	if value == nil then
		return value
	end
	return math.min( value, valueCap_MaxScout )
end
function _valueCap_Scout(unit, value)
	return _valueCap_Check(value, 
			       1,
			       valueCap_MaxScout)
end

local vcArmor_Max = {}
function _valueCap_SetArmorMax(unit, addValue)
	vcArmor_Max[unit.id.value] = math.max( valueCap_MaxArmor + math.min( addValue, 0 ), 0 )
	return 0
end
function _valueCap_CheckMaxArmor(unit, value)
	if value == nil then
		return value
	end
	return math.min( value, vcArmor_Max[unit.id.value] )
end
function _valueCap_Armor(unit, value)
	return _valueCap_Check(value, 
			       0,
			       vcArmor_Max[unit.id.value])
end

function _valueCap_LowerCost(unit, value)
	return _valueCap_Check(value, 
			       -10000000,
			       smnsInfo_LowerCostCap_Percent)
end

function _valueCap_Splash(unit, value)
	return _valueCap_Check(value, 
			       0,
			       250)
end

